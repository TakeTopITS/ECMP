using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Linq;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using LumiSoft.Net.MIME;
using LumiSoft.Net.POP3.Client;
using LumiSoft.Net.Mail;


public partial class LeftTree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {            ///初始化操作树
                InitOperationTree();

                string strUserCode = Session["UserCode"].ToString();
                int intFolderID = GetUserNewMailFolderID(strUserCode, "New");

                BT_SendRecive.Attributes.Add("onclick", "JavaScript:parent.Desktop.location.href='TTViewMail.aspx?FolderID=" + intFolderID.ToString() + "';");
            }
            catch
            {

            }
        }
    }

    protected int GetUserNewMailFolderID(string strUserCode, string strKeyWord)
    {
        string strHQL;
        IList lst;

        strHQL = "FROM Folders as folders where folders.OwnerCode = " + "'" + strUserCode + "'" + " and folders.KeyWord = " + "'" + strKeyWord + "'";
        FoldersBLL foldersBLL = new FoldersBLL();
        lst = foldersBLL.GetAllFolderss(strHQL);

        Folders folders = new Folders();

        folders = (Folders)lst[0];

        return folders.FolderID;

    }

    private void InitOperationTree()
    {
        string strHQL;
        IList lst;

        string strFolderID;

        string strUserCode = Session["UserCode"].ToString();

        ///找到“邮件文件夹”节点
        TreeNode mailFolderNode = OperationView.FindNode("-1/0");
        if (mailFolderNode == null)
        {
            return;
        }

        CreateMailFolder(strUserCode, "New", Resources.lang.ZZNewMail);
        CreateMailFolder(strUserCode, "Read", Resources.lang.ZZReadMail);
        CreateMailFolder(strUserCode, "Waiting", Resources.lang.ZZWaitingMail);
        CreateMailFolder(strUserCode, "Send", Resources.lang.ZZSendMail);
        CreateMailFolder(strUserCode, "Draft", Resources.lang.ZZDraftBox);
        CreateMailFolder(strUserCode, "Rubbish", Resources.lang.ZZRubbishBox);

        strHQL = "FROM Folders as folders where folders.OwnerCode = " + "'" + strUserCode + "'" + " order by folders.FolderID ASC";
        FoldersBLL foldersBLL = new FoldersBLL();
        lst = foldersBLL.GetAllFolderss(strHQL);

        Folders folders = new Folders();

        for (int i = 0; i < lst.Count; i++)
        {
            folders = (Folders)lst[i];

            strFolderID = folders.FolderID.ToString();

            TreeNode node = new TreeNode();
            node.NavigateUrl = "~/TTViewMail.aspx?FolderID=" + strFolderID;
            node.Target = "Desktop";
            node.Text = folders.Name;

            node.Value = strFolderID;

            mailFolderNode.ChildNodes.Add(node);
        }
    }

    protected void BT_SendRecive_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strPassword;
        string strPop3Server, strAliasName;
        string strEnablePOP3SSL;
        int intPort, intMailCount;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);

        try
        {
            if (lst.Count > 0)
            {
                MailProfile mailProfile = (MailProfile)lst[0];

                strAliasName = mailProfile.AliasName.Trim();
                strPassword = mailProfile.Password.Trim();
                strPop3Server = mailProfile.Pop3ServerIP.Trim();
                intPort = mailProfile.Pop3ServerPort;

                strEnablePOP3SSL = mailProfile.EnablePOP3SSL.Trim();

                POP3_Client _POP3Client = new POP3_Client();
                if (_POP3Client.IsConnected == false)
                {
                    _POP3Client.Connect(strPop3Server, intPort);
                    _POP3Client.Authenticate(strAliasName, strPassword, true);                

                    intMailCount = _POP3Client.Messages.Count;
                    _POP3Client.Disconnect();
                    _POP3Client.Dispose();

                    for (int i = 1; i <= intMailCount; i++)
                    {
                        //strAliasName:登录名 strPassword:密码 
                        ReceiveMail(strPop3Server, strUserCode, strAliasName, strPassword, intPort, strEnablePOP3SSL);
                    }
                }
            }

            Folder folder = new Folder();
            strHQL = "From Mails as mails where mails.UserCode = " + "'" + strUserCode + "'" + " and mails.FolderID = " + folder.GetFolderID("Waiting", strUserCode).ToString();
            MailsBLL mailsBLL = new MailsBLL();
            lst = mailsBLL.GetAllMailss(strHQL);

            Mails mails = new Mails();

            if (lst.Count > 0)
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    mails = (Mails)lst[i];
                    SendMail(strUserCode, mails);
                }
            }
        }
        catch
        {
            Response.Write(Resources.lang.ZZJGYXCSPZYWTBNSVYJQJC);
        }
    }

    public void ReceiveMail(string POP3Server, string strUserCode, string strLoginName, string strPassword, int intPort,string strEnablePOP3SSL)
    {
        string file1, file2;
        Stream decodedDataStream;
        IMail imail = new Mail();
        int nMailID;
        int n = 0;
        int intMailContain = 0;
        int intMailAttachmentContain = 0;
        string strDocSavePath;


        strDocSavePath = Server.MapPath("Doc");

        Folder folder = new Folder();

        POP3_Client _POP3Client = new POP3_Client();
        Mail_Message mime;

        //POP3_ClientMessage message;
        try
        {
            _POP3Client.Connect(POP3Server, intPort);
            _POP3Client.Authenticate(strLoginName, strPassword, true);

            if (strEnablePOP3SSL == "YES")
            {
                //启用SSL
                _POP3Client.StartTLS();
            }


            var q = (from POP3_ClientMessage x in _POP3Client.Messages select x).OrderBy(x => -x.SequenceNumber);
            foreach (POP3_ClientMessage message in q)//倒序对于新邮件比较快 
            {
                try
                {
                    mime = Mail_Message.ParseFromByte(message.HeaderToByte());
                }
                catch
                {
                    continue;
                }

                //try
                //{
                ///保存收取邮件的附件
                mime = Mail_Message.ParseFromByte(message.MessageToByte());

                if (mime.BodyHtmlText != null)
                {
                    intMailContain = mime.BodyHtmlText.Length;

                    nMailID = imail.SaveAsMail(mime.Subject, mime.BodyHtmlText, mime.From.ToString(), mime.To.ToString(), mime.Cc == null ? "" : mime.Cc.ToString(), 1,
                    intMailContain, mime.Attachments.Length > 0 ? 1 : 0, 0, folder.GetFolderID("New", strUserCode), strUserCode);
                }
                else
                {
                    if (mime.BodyText != null)
                    {
                        intMailContain = mime.BodyText.Length;

                        nMailID = imail.SaveAsMail(mime.Subject, mime.BodyText, mime.From.ToString().Trim(), mime.To.ToString(), mime.Cc == null ? "" : mime.Cc.ToString(), 1,
                        intMailContain, mime.Attachments.Length > 0 ? 1 : 0, 0, folder.GetFolderID("New", strUserCode), strUserCode);
                    }
                    else
                    {
                        intMailContain = 0;

                        nMailID = imail.SaveAsMail(mime.Subject, "--Null--", mime.From.ToString().Trim(), mime.To.ToString(), mime.Cc == null ? "" : mime.Cc.ToString(), 1,
                        intMailContain, mime.Attachments.Length > 0 ? 1 : 0, 0, folder.GetFolderID("New", strUserCode), strUserCode);
                    }
                }


                //收取邮件
                if (nMailID > 0)
                {
                    for (n = 0; n < mime.Attachments.Length; n++)
                    {
                        ///添加单个附件  
                        ///    
                        try
                        {
                            //下面是接收附件的方法
                            decodedDataStream = ((MIME_b_SinglepartBase)mime.Attachments[n].Body).GetDataStream();
                            file1 = mime.Attachments[n].ContentType.Param_Name;

                            file1 = Path.GetFileNameWithoutExtension(file1) + DateTime.Now.ToString("MMss") + n.ToString() + Path.GetExtension(file1);

                            file2 = strDocSavePath + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\MailAttachments\\" + file1;
                            using (FileStream fs = File.Create(file2))
                            {
                                LumiSoft.Net.Net_Utils.StreamCopy(decodedDataStream, fs, 4000);
                                intMailAttachmentContain = int.Parse(fs.Length.ToString());
                            }

                            ///保存收取邮件的附件  
                            imail.SaveAsMailAttachment(
                                file1,
                                "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\MailAttachments\\" + file1,
                                mime.Attachments[n].ContentType.Name,
                                intMailAttachmentContain,
                                nMailID);
                        }
                        catch
                        {
                        }
                    }
                }


                //删除已收取的邮件
                message.MarkForDeletion();

                //}
                //catch (Exception ex)
                //{   ///跳转到异常错误处理页面
                //    Response.Redirect("TTErrorPage.aspx?ErrorMsg=" + ex.Message.Replace("<br>", "").Replace("\n", "")
                //        + "&ErrorUrl=" + Request.Url.ToString().Replace("<br>", "").Replace("\n", ""));
                //}

                _POP3Client.Disconnect();
                _POP3Client.Dispose();
                _POP3Client = null;
            }
        }
        catch (Exception x)
        {
            //MessageBox.Show("接收邮件时发生异常： " + x.Message, "接收邮件", MessageBoxButtons.OK, MessageBoxIcon.Hand);
        }
    }


    protected void SendMail(string strUserCode, Mails mails)
    {
        int nContain = 0;
        string strHQL;
        IList lst;

        string from;

        string strURL;
        int intMailID;
        int intSendFoldID;
        int intWaitingFoldID;

        string strEnableSMTPSSL;

        Folder folder = new Folder();
        intSendFoldID = folder.GetFolderID("Send", strUserCode);
        intWaitingFoldID = folder.GetFolderID("Waiting", strUserCode);

        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);
        MailProfile mailProfile = (MailProfile)lst[0];

        strEnableSMTPSSL = mailProfile.EnableSMTPSSL.Trim();

        ///添加发件人地址
        from = mailProfile.Email.Trim();

        intMailID = mails.MailID;

        MailMessage mailMsg = new MailMessage();

        mailMsg.From = new MailAddress(from);
        mailMsg.To.Add(mails.ToAddress.Trim());
        nContain += mails.ToAddress.Trim().Length;

        if (mails.CCAddress.Trim() != "")
        {
            mailMsg.CC.Add(mails.CCAddress.Trim());
        }
        else
        {
            mailMsg.CC.Add(mails.ToAddress.Trim());
        }
        nContain += mails.CCAddress.Trim().Length;

        ///添加邮件主题
        mailMsg.Subject = mails.Title.Trim();
        mailMsg.Subject = mailMsg.Subject.Replace("审批通知", Resources.lang.ZZShengPiTongZhi);

        nContain += mails.Title.Trim().Length;

        ///添加邮件内容
        mailMsg.Body = mails.Body.Trim();

        mailMsg.Body = mailMsg.Body.Replace("通知：你好，你有审批工作，内容：自审 ，请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZTZNHNYSPGZNRZSQJSDLGLPTJXCLZXXLZXTGLY);
        mailMsg.Body = mailMsg.Body.Replace("通知：你好，你有审批工作，内容：", Resources.lang.ZZTZNHNYSPGZNR);
        mailMsg.Body = mailMsg.Body.Replace("请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZQJSDLGLPTJXCLZXXLZXTGLY);

        mailMsg.BodyEncoding = Encoding.UTF8;
        mailMsg.IsBodyHtml = true;

        nContain += mails.Body.Trim().Length;

        //加邮件附件
        strHQL = "FROM Attachments as attachments where ";
        strHQL += " attachments.MailID in ( select mails.MailID FROM Mails as mails where mails.FolderID = " + intWaitingFoldID.ToString() + ")";
        AttachmentsBLL attachmentsBLL = new AttachmentsBLL();
        lst = attachmentsBLL.GetAllAttachmentss(strHQL);

        ProjectMgt.Model.Attachments attachments = new ProjectMgt.Model.Attachments();

        for (int i = 0; i < lst.Count; i++)
        {
            ///添加单个附件
            attachments = (ProjectMgt.Model.Attachments)lst[i];
            strURL = Server.MapPath(attachments.Url);

            mailMsg.Attachments.Add(new Attachment(strURL));

            nContain += attachments.Contain;
        }

        nContain += 100;

        try
        {
            Mail mail = new Mail();

            SmtpClient smtpClient = new SmtpClient(mailProfile.SmtpServerIP, mailProfile.SmtpServerPort);
            if (strEnableSMTPSSL == "YES")
            {
                //启用SSL
                smtpClient.EnableSsl = true;
            }
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(mailProfile.AliasName.Trim(), mailProfile.Password.Trim());
            /*指定如何处理待发的邮件*/
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

           

            try
            {
                smtpClient.Send(mailMsg);

                mail.MoveMail(intMailID, intSendFoldID);
            }
            catch
            {

            }
        }
        catch (Exception ex)
        {   ///跳转到异常错误处理页面
            Response.Redirect("TTErrorPage.aspx?ErrorMsg=" + ex.Message.Replace("<br>", "").Replace("\n", "")
                + "&ErrorUrl=" + Request.Url.ToString().Replace("<br>", "").Replace("\n", ""));
        }

        //esponse.Redirect("~/TTMailDesktop.aspx,target=Desktop");
    }

    protected void CreateMailFolder(string strUserCode, string strKeyWord, string strFolderName)
    {
        string strHQL;
        IList lst;

        FoldersBLL foldersBLL = new FoldersBLL();
        Folders folders = new Folders();
        strHQL = "FROM Folders as folders where folders.KeyWord =" + "'" + strKeyWord + "'" + " and folders.OwnerCode = " + "'" + strUserCode + "'";
        lst = foldersBLL.GetAllFolderss(strHQL);

        if (lst.Count == 0)
        {
            folders.Name = strFolderName;
            folders.Total = 0;
            folders.NoReader = 0;
            folders.Contain = 0;
            folders.CreateDate = DateTime.Now;
            folders.Flag = 0;
            folders.OwnerCode = strUserCode;
            folders.KeyWord = strKeyWord;

            try
            {
                foldersBLL.AddFolders(folders);
            }
            catch
            {
            }
        }
        else
        {
            try
            {
                strHQL = "Update T_MailFolder Set Name = " + "'" + strFolderName + "'" + " Where OwnerCode =" + "'" + strUserCode + "'" + " and KeyWord = " + "'" + strKeyWord + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }
        }
    }

    protected string GetMailFolderID(string strUserCode, string strKeyWord)
    {
        string strHQL;
        IList lst;

        strHQL = "from Folder as folder where folder.UserCode = " + "'" + strUserCode + "'" + " and folder.KeyWord = " + "'" + strKeyWord + "'";
        FoldersBLL folderBLL = new FoldersBLL();
        lst = folderBLL.GetAllFolderss(strHQL);

        Folders folder = (Folders)lst[0];

        return folder.FolderID.ToString();
    }
}

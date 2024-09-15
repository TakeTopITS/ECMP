using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Npgsql;
using NpgsqlTypes;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTViewMail : System.Web.UI.Page
{
    int nFolderID = -1;
    protected string AliasName = "AliasName";
    protected string Email = "Email";


    protected void Page_Load(object sender, EventArgs e)
    {
        string strDeleteOperate;
        string strUserCode = Session["UserCode"].ToString().Trim();

        ///获取参数nFolderID的值
        if (Request.Params["FolderID"] != null)
        {
            if (Int32.TryParse(Request.Params["FolderID"].ToString(), out nFolderID) == false)
            {
                return;
            }
        }
        if (!Page.IsPostBack)
        {
            if (nFolderID > -1)
            {
                BindMailData(nFolderID);
                BindFolderData();

                LB_Folder.Text = GetFolderName(nFolderID.ToString());
            }

            strDeleteOperate = GetMailBoxAuthorityDelete(strUserCode);
            if (strDeleteOperate == "NO")
            {
                DeleteBtn.Enabled = false;
            }
        }
        DeleteBtn.Attributes.Add("onclick", "return confirm(" + Resources.lang.ZZNQDYSCSXYJM + ");");
    }

    private void BindFolderData()
    {
        string strUserCode = Session["UserCode"].ToString();

        ///获取数据
        IFolder folder = new Folder();
        NpgsqlDataReader dr = folder.GetFolders(strUserCode);
        ///绑定数据
        FolderList.DataSource = dr;
        FolderList.DataTextField = "Name";
        FolderList.DataValueField = "FolderID";
        FolderList.DataBind();
        dr.Close();

        MoveBtn.Enabled = FolderList.Items.Count > 0 ? true : false;
    }
    private void BindMailData(int nFolderID)
    {	///获取数据
        IMail mail = new Mail();
        NpgsqlDataReader dr = mail.GetMailsByFloder(nFolderID);
        ///绑定数据
        MailView.DataSource = dr;
        MailView.DataBind();

        DeleteBtn.Enabled = MailView.Rows.Count > 0 ? true : false;

        string strUserCode = Session["UserCode"].ToString();
        string strDeleteOperate = GetMailBoxAuthorityDelete(strUserCode);
        if (strDeleteOperate == "NO")
        {
            DeleteBtn.Enabled = false;
        }

        dr.Close();
    }

    protected void CheckMail_CheckedChanged(object sender, EventArgs e)
    {
        int i = 0;
        if (CheckMail.Checked == true)
        {
            for (i = 0; i < MailView.Rows.Count; i++)
            {
                ((CheckBox)MailView.Rows[i].FindControl("CheckMail")).Checked = true;
            }
        }
        else
        {
            for (i = 0; i < MailView.Rows.Count; i++)
            {
                ((CheckBox)MailView.Rows[i].FindControl("CheckMail")).Checked = false;
            }
        }
    }

    protected void MoveBtn_Click(object sender, EventArgs e)
    {
        ///定义对象
        IMail mail = new Mail();
        try
        {
            foreach (GridViewRow row in MailView.Rows)
            {   ///获取控件
                CheckBox checkMail = (CheckBox)row.FindControl("CheckMail");
                if (checkMail != null)
                {
                    if (checkMail.Checked == true)
                    {
                        ///执行数据库操作
                        mail.MoveMail(Int32.Parse(MailView.DataKeys[row.RowIndex].Value.ToString()),
                            Int32.Parse(FolderList.SelectedValue));
                    }
                }
            }
            ///重新绑定控件的数据
            BindMailData(nFolderID);
        }
        catch (Exception ex)
        {   ///跳转到异常错误处理页面
            Response.Redirect("TTTTErrorPage.aspx?ErrorMsg=" + ex.Message.Replace("<br>", "").Replace("\n", "")
                + "&ErrorUrl=" + Request.Url.ToString().Replace("<br>", "").Replace("\n", ""));
        }
    }
    protected void DeleteBtn_Click(object sender, EventArgs e)
    {
        ///定义对象
        IMail mail = new Mail();
        try
        {
            foreach (GridViewRow row in MailView.Rows)
            {   ///获取控件
                CheckBox checkMail = (CheckBox)row.FindControl("CheckMail");
                if (checkMail != null)
                {
                    if (checkMail.Checked == true)
                    {
                        ///执行数据库操作
                        mail.DeleteMail(Int32.Parse(MailView.DataKeys[row.RowIndex].Value.ToString()));
                    }
                }
            }
            ///重新绑定控件的数据
            BindMailData(nFolderID);
        }
        catch (Exception ex)
        {   ///跳转到异常错误处理页面
            Response.Redirect("TTTTErrorPage.aspx?ErrorMsg=" + ex.Message.Replace("<br>", "").Replace("\n", "")
                + "&ErrorUrl=" + Request.Url.ToString().Replace("<br>", "").Replace("\n", ""));
        }
    }


    protected string GetFolderName(string strFolderID)
    {
        string strHQL;
        IList lst;

        strHQL = "FROM Folders as folders where folders.FolderID = " + strFolderID;
        FoldersBLL foldersBLL = new FoldersBLL();
        lst = foldersBLL.GetAllFolderss(strHQL);
        Folders folders = (Folders)lst[0];

        string strFolderName = folders.Name.Trim();

        string strFolderKeyWord = folders.KeyWord.Trim();
        if (strFolderKeyWord == "New")
        {
            strFolderName = Resources.lang.ZZNewMail;
        }
        if (strFolderKeyWord == "Read")
        {
            strFolderName = Resources.lang.ZZReadMail;
        }
        if (strFolderKeyWord == "Waiting")
        {
            strFolderName = Resources.lang.ZZWaitingMail;
        }
        if (strFolderKeyWord == "Send")
        {
            strFolderName = Resources.lang.ZZSendMail;
        }
        if (strFolderKeyWord == "Draft")
        {
            strFolderName = Resources.lang.ZZDraftBox;
        }
        if (strFolderKeyWord == "Rubbish")
        {
            strFolderName = Resources.lang.ZZRubbishBox;
        }

        return strFolderName;
    }

    protected string GetMailBoxAuthorityDelete(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From MailBoxAuthority as mailBoxAuthority where mailBoxAuthority.UserCode = " + "'" + strUserCode + "'";
        MailBoxAuthorityBLL mailBoxAuthorityBLL = new MailBoxAuthorityBLL();
        lst = mailBoxAuthorityBLL.GetAllMailBoxAuthoritys(strHQL);

        MailBoxAuthority mailBoxAuthority = (MailBoxAuthority)lst[0];

        return mailBoxAuthority.DeleteOperate.Trim();
    }
}

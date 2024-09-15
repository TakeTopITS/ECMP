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

public partial class TTMailReader : System.Web.UI.Page
{
    int nMailID = -1;
    int nFolderID = -1;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ///获取参数nFolderID的值
        if (Request.Params["FolderID"] != null)
        {
            if (Int32.TryParse(Request.Params["FolderID"].ToString(), out nFolderID) == false)
            {
                return;
            }
        }
        ///获取参数nMailID的值
        if (Request.Params["MailID"] != null)
        {
            if (Int32.TryParse(Request.Params["MailID"].ToString(), out nMailID) == false)
            {
                return;
            }
        }
        if (!Page.IsPostBack)
        {   ///显示邮件内容
            if (nMailID > -1)
            {

                Folder folder = new Folder();
                int intFolderID = GetMailFolderID(nMailID);

                if (folder.GetFolderID("Draft", strUserCode) == intFolderID)
                {
                    Response.Redirect("TTMailSenderFromDraft.aspx?FolderID=" + intFolderID.ToString() + "&MailID=" + nMailID.ToString());
                }

                try
                {
                    LoadMail(nMailID);
                    BindMailData(nMailID);
                    UpdateReadStatus(nMailID.ToString());
                }
                catch
                {
                }
            }
        }
    }

    private int GetMailFolderID(int nMailID)
    {
        int intFolderID;

        IMail mail = new Mail();
        NpgsqlDataReader dr = mail.GetSingleMail(nMailID);
        if (dr.Read())
        {
            intFolderID = int.Parse(dr["FolderID"].ToString());
        }
        else
        {
            intFolderID = 0;
        }

        dr.Close();

        return intFolderID;
    }

    private void LoadMail(int nMailID)
    {
        string strHQL;

        strHQL = "Select Body From T_Mail Where MailID = " + nMailID.ToString();
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Mail");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

    private void BindMailData(int nMailID)
    {
        IMail mail = new Mail();
        NpgsqlDataReader dr = mail.GetSingleMail(nMailID);
        if (dr.Read())
        {
            Title.Text = dr["Title"].ToString();
            From.Text = dr["FromAddress"].ToString();
            CC.Text = dr["CCAddress"].ToString();
            To.Text = dr["ToAddress"].ToString();
            HtmlCB.Checked = bool.Parse(dr["HTMLFormat"].ToString().ToLower());

            NpgsqlDataReader drAttach = mail.GetAttachmentsByMail(nMailID);
            AttachView.DataSource = drAttach;
            AttachView.DataBind();
            drAttach.Close();

            if (AttachView.Rows.Count > 0)
            {
                Panel_Attachment.Visible = true;
            }
        }

        dr.Close();
    }
    protected void ReturnBtn_Click(object sender, EventArgs e)
    {
        ///返回到邮件列表页面
        Response.Redirect("~/TTViewMail.aspx?FolderID=" + nFolderID.ToString());
    }
    protected void RecieverBtn_Click(object sender, EventArgs e)
    {	///回复邮件
        Response.Redirect("~/TTMailReply.aspx?MailID=" + nMailID.ToString());
    }

    protected void TransferBtn_Click(object sender, EventArgs e)
    {
        ///转发邮件

        Response.Redirect("~/TTMailTransfer.aspx?MailID=" + nMailID.ToString());


    }

    protected void UpdateReadStatus(string strMailID)
    {
        string strHQL;

        string strReaderFlag;
        int intFolderID, intNewFolderID;
        string strKeyWord;

        strHQL = "Select ReaderFlag,FolderID From T_Mail Where MailID = " + strMailID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Mail");

        strReaderFlag = ds.Tables[0].Rows[0][0].ToString();

        intFolderID = int.Parse(ds.Tables[0].Rows[0][1].ToString());

        strKeyWord = GetMailFolderKeyWord(strUserCode, intFolderID.ToString());


        //新邮件，打开代表阅读，自动转入“已阅邮件”
        if (strKeyWord == "New")
        {
            intNewFolderID = GetMailFolderID(strUserCode, "Read");

            strHQL = "Update T_Mail Set FolderID = " + intNewFolderID.ToString() + " Where MailID = " + strMailID;
            ShareClass.RunSqlCommand(strHQL);
        }

        strHQL = "Update T_Mail Set ReaderFlag = 'True' Where MailID = " + strMailID;
        ShareClass.RunSqlCommand(strHQL);

        if (strKeyWord == "New")
        {
            strHQL = "Update T_MailFolder Set NoReader = NoReader - 1 Where FolderID = " + intFolderID.ToString();
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected int GetMailFolderID(string strUserCode, string strKeyWord)
    {
        string strHQL;


        strHQL = "Select FolderID From T_MailFolder Where OwnerCode = " + "'" + strUserCode + "'" + " And KeyWord = " + "'" + strKeyWord + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MailFolderID");

        return int.Parse(ds.Tables[0].Rows[0][0].ToString().Trim());
    }

    protected string GetMailFolderKeyWord(string strUserCode, string strFoldID)
    {
        string strHQL;


        strHQL = "Select KeyWord From T_MailFolder Where FolderID = " + strFoldID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MailFolderID");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

}

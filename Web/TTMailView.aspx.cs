using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using Npgsql;

public partial class TTMailView : System.Web.UI.Page
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
                try
                {
                    LoadMail(nMailID);
                    BindMailData(nMailID);                   
                }
                catch
                {
                }
            }

            string strDocSavePath = "~\\Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Images\\";
            Session["FCKeditor:UserFilesPath"] = strDocSavePath;
        }
    }

    private void LoadMail(int nMailID)
    {
        string strHQL;
        IList lst;

        strHQL = "From Mails as mail Where mail.MailID = " + nMailID.ToString();
        MailsBLL mailsBLL = new MailsBLL();
        lst = mailsBLL.GetAllMailss(strHQL);

        DataList1.DataSource = lst;
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

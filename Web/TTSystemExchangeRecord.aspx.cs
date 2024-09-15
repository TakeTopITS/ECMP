using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTSystemExchangeRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "数据交换执行记录", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadSystemExchangeDBServer();
        }
    }

    protected void LLB_DBServerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strDBServerName;

        strDBServerName = LLB_DBServerName.SelectedValue.Trim();

        strHQL = "Select ID,SqlOrderString,RunTime,IdentifyString,ExportDataFile From T_SystemExchangeRecord where DBServerName = " + "'" + strDBServerName + "'" + " Order By ID DESC limit 100";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SystemExchangeRecord");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

    protected void LoadSystemExchangeDBServer()
    {
        string strHQL;

        strHQL = "Select DBServerName From T_SystemEXchangeDBServer Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SystemExchangeDB");

        LLB_DBServerName.DataSource = ds;
        LLB_DBServerName.DataBind();
    }


}
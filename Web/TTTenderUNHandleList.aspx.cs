using System; using System.Resources;
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
using System.Data.SqlClient;
using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;
using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using System.IO;

public partial class TTTenderUNHandleList : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "投标预警", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadTenderInfo();
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadTenderInfo();
    }

    protected void LoadTenderInfo()
    {
        string strHQL;
        DataSet ds;


        //if (strWarningType == "标书购买")
        strHQL = "Select *  From T_Tender_HYYQ Where  IsTender <> 0 and rtrim(TenderBuyTime) <= to_char(now()+(TenderBuyDay+1)*'1 day'::interval,'yyyymmdd') "; 
        strHQL += " and (CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or ID in (Select TenderID from T_TenderRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
        strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";
        strHQL += " Order By ID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender");
        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;


        //if (strWarningType == "交保证金")
        strHQL = "Select *  From T_Tender_HYYQ Where  IsMargin <> 0 and rtrim(MarginTime) <= to_char(now()+(MarginDay+1)*'1 day'::interval,'yyyymmdd') "; 
        strHQL += " and (CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or ID in (Select TenderID from T_TenderRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
        strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";
        strHQL += " Order By ID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender");
        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        LB_Sql2.Text = strHQL;


        //if (strWarningType == "退保证金")
        strHQL = "Select *  From T_Tender_HYYQ Where  IsReceiveMargin <> 0 and rtrim(ReceiveMarginTime) <= to_char(now()+ReceiveMarginDay*'1 day'::interval,'yyyymmdd') "; 
        strHQL += " and (CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or ID in (Select TenderID from T_TenderRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
        strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";
        strHQL += " Order By ID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender");
        DataGrid3.CurrentPageIndex = 0;
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;


        //if (strWarningType == "开标")
        strHQL = "Select *  From T_Tender_HYYQ Where  IsBidOpening <> 0 and rtrim(BidOpeningDate) <= to_char(now()+(BidOpeningDay+1)*'1 day'::interval,'yyyymmdd') "; 
        strHQL += " and (CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or ID in (Select TenderID from T_TenderRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
        strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";
        strHQL += " Order By ID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender");
        DataGrid4.CurrentPageIndex = 0;
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;


        //if (strWarningType == "交中标费")
        strHQL = "Select *  From T_Tender_HYYQ Where  IsWinningFee <> 0 and rtrim(WinningFeeDate) <= to_char(now()+(WinningFeeDay+1)*'1 day'::interval,'yyyymmdd') "; 
        strHQL += " and (CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or ID in (Select TenderID from T_TenderRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
        strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";
        strHQL += " Order By ID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender_HYYQ");
        DataGrid5.CurrentPageIndex = 0;
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
        LB_Sql5.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }
}
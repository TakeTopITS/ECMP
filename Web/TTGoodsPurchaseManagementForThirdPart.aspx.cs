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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsPurchaseManagementForThirdPart : System.Web.UI.Page
{
    string strDepartString;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strUserName;
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "甲方物资采购", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ShareClass.LoadSytemChart(strUserCode, "GoodsPurchaseManagement", RP_ChartList);
        HL_SystemAnalystChartRelatedUserSet.NavigateUrl = "TTSystemAnalystChartRelatedUserSet.aspx?FormType=GoodsPurchaseManagement";

        string strChartTitle, strCmdText;
        strChartTitle = Resources.lang.CGEQST;
        strCmdText = @"Select SUBSTRING(to_char(A.PurTime,'yyyymmdd'),0,7) as XName,COALESCE(SUM(A.Amount),0) as YNumber
        From T_GoodsPurchaseOrder A Where CAST(SUBSTRING(to_char(A.PurTime,'yyyymmdd'),0,5) as int) > extract(year from now()) - 2  
        and POID in (Select RelatedID From T_Collaboration Where CoID In(Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "'))";
        strCmdText += " Group By SUBSTRING (to_char(A.PurTime,'yyyymmdd'),0,7)";
        IFrame_Chart_PurchaseTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadGoodsPurchaseOrder(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strPOID, strGPOName, strSupplier;

        strPOID = TB_POID.Text.Trim();
        strGPOName = TB_GPOName.Text.Trim();
        strSupplier = TB_Supplier.Text.Trim();

        strGPOName = "%" + strGPOName + "%";
        strSupplier = "%" + strSupplier + "%";

        try
        {
            strPOID = int.Parse(strPOID).ToString();
        }
        catch
        {
            strPOID = "";
            TB_POID.Text = "";
        }

        if (strPOID == "")
        {
            strHQL = "Select * from T_GoodsPurchaseOrder where ";
            strHQL += " POID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "'))";
            strHQL += " and GPOName Like " + "'" + strGPOName + "'";
            strHQL += " and Supplier Like " + "'" + strSupplier + "'";
        }
        else
        {
            strHQL = "Select * from T_GoodsPurchaseOrder where ";
            strHQL += " POID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "'))";
            strHQL += " and POID = " + strPOID;
        }
        strHQL += " Order by POID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadGoodsPurchaseOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select * from T_GoodsPurchaseOrder where ";
        strHQL += " POID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "'))";
        strHQL += " Order by POID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }


}

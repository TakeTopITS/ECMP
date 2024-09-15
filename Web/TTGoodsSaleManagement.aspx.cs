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

public partial class TTGoodsSaleManagement : System.Web.UI.Page
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
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "销售管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ShareClass.LoadSytemChart(strUserCode, "GoodsSaleManagement", RP_ChartList);
        HL_SystemAnalystChartRelatedUserSet.NavigateUrl = "TTSystemAnalystChartRelatedUserSet.aspx?FormType=GoodsSaleManagement";

        string strChartTitle,strCmdText;
        strChartTitle = Resources.lang.XSEQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SaleTime,'yyyymmdd'),0,7) as XName,COALESCE(SUM(A.Amount),0) as YNumber 
        From T_GoodsSaleOrder A Where CAST(SUBSTRING(to_char(A.SaleTime,'yyyymmdd'),0,5) as int) > extract(year from now()) - 2  
        And (OperatorCode = " + "'" + strUserCode + "'" + " Or OperatorCode in (Select UnderCode From T_MemberLevel Where UserCode = " + "'" + strUserCode + "')";
        strCmdText +=  " Or SOID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "')))"; 
        strCmdText +=  " Group By SUBSTRING (to_char(A.SaleTime,'yyyymmdd'),0,7)";
        IFrame_Chart_SaleTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadGoodsSaleOrder(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strSOID, strSOName, strCustomerName;

        strSOID = TB_SOID.Text.Trim();
        strSOName = TB_SOName.Text.Trim();
        strCustomerName = TB_CustomerName.Text.Trim();

        strSOName = "%" + strSOName + "%";
        strCustomerName = "%" + strCustomerName + "%";

        try
        {
            strSOID = int.Parse(strSOID).ToString();
        }
        catch
        {
            strSOID = "";
            TB_SOID.Text = "";
        }

        if (strSOID == "")
        {
            strHQL = "Select * from T_GoodsSaleOrder where (OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " or OperatorCode in (Select UnderCode From T_MemberLevel Where UserCode = " + "'" + strUserCode + "')";
            strHQL += " Or SOID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "')))";
            strHQL += " and SOName Like " + "'" + strSOName + "'";
            strHQL += " and CustomerName Like " + "'" + strCustomerName + "'";
        }
        else
        {
            strHQL = "Select * from T_GoodsSaleOrder where (OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " or OperatorCode in (Select UnderCode From T_MemberLevel Where UserCode = " + "'" + strUserCode + "')";
            strHQL += " Or SOID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "')))";
            strHQL += " and SOID = " + strSOID;
        }
        strHQL += " Order by SOID DESC";

  
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T-GoodsSaleOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T-GoodsSaleOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected void LoadGoodsSaleOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select * from T_GoodsSaleOrder where (OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " or OperatorCode in (Select UnderCode From T_MemberLevel Where UserCode = " + "'" + strOperatorCode + "')";
        strHQL += " Or SOID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strUserCode + "')))";
        strHQL += " Order by SOID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T-GoodsSaleOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }
}

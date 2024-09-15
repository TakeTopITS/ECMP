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


public partial class TTGoodsProductionManagement : System.Web.UI.Page
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
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "作业管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "销售管理---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ShareClass.LoadSytemChart(strUserCode, "GoodsProductionManagement", RP_ChartList);
        HL_SystemAnalystChartRelatedUserSet.NavigateUrl = "TTSystemAnalystChartRelatedUserSet.aspx?FormType=GoodsProductionManagement";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadGoodsProductionOrder(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPDID, strPDName;

        strPDID = TB_PDID.Text.Trim();
        strPDName = TB_PDName.Text.Trim();
     

        strPDName = "%" + strPDName + "%";
       

        try
        {
            strPDID = int.Parse(strPDID).ToString();
        }
        catch
        {
            strPDID = "";
            TB_PDID.Text = "";
        }

        if (strPDID == "")
        {
            strHQL = "from GoodsProductionOrder as goodsProductionOrder where (goodsProductionOrder.CreatorCode = " + "'" + strUserCode + "'";
            strHQL += " or goodsProductionOrder.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'))";
            strHQL += " and goodsProductionOrder.PDName Like " + "'" + strPDName + "'";
        }
        else
        {
            strHQL = "from GoodsProductionOrder as goodsProductionOrder where (goodsProductionOrder.CreatorCode = " + "'" + strUserCode + "'";
            strHQL += " or goodsProductionOrder.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'))";
            strHQL += " and goodsProductionOrder.PDID = " + strPDID;
        }
        strHQL += " Order by goodsProductionOrder.PDID DESC";

        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        IList lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadGoodsProductionOrder(string strCreatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsProductionOrder as goodsProductionOrder where (goodsProductionOrder.CreatorCode = " + "'" + strCreatorCode + "'";
        strHQL += " or goodsProductionOrder.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strCreatorCode + "'))";
        strHQL += " Order by goodsProductionOrder.PDID DESC";
        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql.Text = strHQL;
    }


}

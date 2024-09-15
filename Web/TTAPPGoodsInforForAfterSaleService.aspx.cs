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

using TakeTopCore;

public partial class TTAPPGoodsInforForAfterSaleService : System.Web.UI.Page
{
    string strDepartString;
    public SignModel signModel;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strHQL;
        IList lst;
        string strUserName;
        string strUserCode;


        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        try
        {
            //扫码功能必须
            signModel = TakeTopCore.WXHelper.GetWXInfo(Request.Url.ToString());
            if (signModel != null)
            {
                if (signModel.appId == null)
                {
                    signModel.appId = "";
                }
            }
        }
        catch
        {
            signModel = new SignModel();
            signModel.appId = "";
        }

        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;


            strHQL = "from GoodsShipmentReport as goodsShipmentReport ";
            strHQL += " Where goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by goodsShipmentReport.WarrantyEndTime DESC";

            GoodsShipmentReportBLL goodsShipmentReportBLL = new GoodsShipmentReportBLL();
            lst = goodsShipmentReportBLL.GetAllGoodsShipmentReports(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            LB_PageIndex.Text = "1";
            LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();

            //Label1.Text = signModel.appId + ":" + signModel.time + ":" + signModel.randstr + ":" + signModel.signstr;

            //WXHelper.AddAccessToken(WXHelper.GetQYHAccessToken());

            //TB_GoodsSN.Text = TakeTopCore.WXHelper.GetQYHAccessToken().Length.ToString();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strGoodsSN;
        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strGoodsSN = TB_GoodsSN.Text.Trim();
        strGoodsSN = "%" + strGoodsSN + "%";

        strHQL = "from GoodsShipmentReport as goodsShipmentReport where ";
        strHQL += " goodsShipmentReport.GoodsSN Like " + "'" + strGoodsSN + "'";
        strHQL += " and goodsShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsShipmentReport.WarrantyEndTime DESC";

        GoodsShipmentReportBLL goodsShipmentReportBLL = new GoodsShipmentReportBLL();
        lst = goodsShipmentReportBLL.GetAllGoodsShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGoodsSN = ((Button)e.Item.FindControl("BT_GoodsSN")).Text.Trim();

            LoadGoodsAfterSaleTask(strGoodsSN);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strTaskID = ((Button)e.Item.FindControl("BT_TaskID")).Text.Trim();

            LoadGoodsApplicationDetail("AfterSale", strTaskID);
        }
    }

    protected void LoadGoodsAfterSaleTask(string strGoodsSN)
    {
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectTask as projectTask where projectTask.GoodsSN = " + "'" + strGoodsSN + "'" + " Order by projectTask.TaskID ASC";
        ProjectTask projectTask = new ProjectTask();
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadGoodsApplicationDetail(string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where ";
        strHQL += " goodsApplicationDetail.AAID in (Select goodsApplication.AAID From GoodsApplication as goodsApplication Where goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID + ")";

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        GoodsShipmentReportBLL goodsShipmentReportBLL = new GoodsShipmentReportBLL();
        IList lst = goodsShipmentReportBLL.GetAllGoodsShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


}

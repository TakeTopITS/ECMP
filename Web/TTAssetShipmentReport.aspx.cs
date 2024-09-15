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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAssetShipmentReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;

        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        LB_ReportName.Text = Resources.lang.ZiChanChuKuBaoBiao;


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strStartTime, strEndTime;
        string strApplicant;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strAssetCode = TB_AssetCode.Text.Trim();
        string strAssetName = TB_AssetName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();


        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";


        if (strRelatedType == "Other")
        {
            strHQL = "from AssetShipmentReport as assetShipmentReport where ";
            strHQL += " assetShipmentReport.OperatorName like " + "'" + strApplicant + "'";
            strHQL += " and assetShipmentReport.AssetCode Like " + "'" + strAssetCode + "'";
            strHQL += " and assetShipmentReport.AssetName like " + "'" + strAssetName + "'";
            strHQL += " and assetShipmentReport.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += " and assetShipmentReport.Spec Like " + "'" + strSpec + "'";
            strHQL += " and to_char(assetShipmentReport.ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetShipmentReport.ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and assetShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by assetShipmentReport.ID DESC";
        }
        else
        {

            strHQL = "from AssetShipmentReport as assetShipmentReport where ";
            strHQL += " assetShipmentReport.OperatorName like " + "'" + strApplicant + "'";
            strHQL += " and assetShipmentReport.AssetCode Like " + "'" + strAssetCode + "'";
            strHQL += " and assetShipmentReport.AssetName like " + "'" + strAssetName + "'";
            strHQL += " and assetShipmentReport.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += " and assetShipmentReport.Spec Like " + "'" + strSpec + "'";
            strHQL += " and to_char(assetShipmentReport.ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetShipmentReport.ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and assetShipmentReport.RelatedType = " + "'" + strRelatedType + "'" + " and assetShipmentReport.RelatedID = " + strRelatedID;
            strHQL += " and assetShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by assetShipmentReport.ID DESC";
        }
        AssetShipmentReportBLL assetShipmentReportBLL = new AssetShipmentReportBLL();
        lst = assetShipmentReportBLL.GetAllAssetShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void BT_FindShipmentNO_Click(object sender, EventArgs e)
    {
        string strHQL, strShipmentNO = "0";
        IList lst;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        //strShipmentNO = NB_ShipmentNO.Amount.ToString();

        strHQL = "from  AssetShipmentReport as assetShipmentReport where assetShipmentReport.ShipmentNO = " + strShipmentNO;
        strHQL += " and assetShipmentReport.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetShipmentReport.ID DESC";
        AssetShipmentReportBLL assetShipmentReportBLL = new AssetShipmentReportBLL();
        lst = assetShipmentReportBLL.GetAllAssetShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetShipmentReportBLL assetShipmentReportBLL = new AssetShipmentReportBLL();
        IList lst = assetShipmentReportBLL.GetAllAssetShipmentReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

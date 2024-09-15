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

public partial class TTAssetApplicationReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];


        LB_ReportName.Text = Resources.lang.ZiChanLingYongBaoBiao;


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        string strStartTime, strEndTime;

        string strApplicant = TB_Applicant.Text.Trim();

        string strAssetCode = TB_AssetCode.Text.Trim();
        string strAssetName = TB_AssetName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = "%" + strApplicant + "%";
        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";


        if (strRelatedType == "Other")
        {
            strHQL = "  Select A.ID,A.AAID,A.AssetCode ,  A.AssetName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.Manufacturer,A.IP, B.AAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID ";
            strHQL += "  from T_AssetApplicationDetail A,T_AssetApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Assetcode Like " + "'" + strAssetCode + "'";
            strHQL += "  and A.AssetName like " + "'" + strAssetName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";
        }
        else
        {
            strHQL = "  Select A.ID,A.AAID,A.AssetCode ,  A.AssetName,A.ModelNumber, A.Spec,A.Number,A.Unit,A.Manufacturer,A.IP, B.AAName,B.Type,B.ApplicantCode,";
            strHQL += "  B.ApplicantName,B.ApplyTime,B.FinishTime,B.ApplyReason,B.Status,B.RelatedType,B.RelatedID ";
            strHQL += "  from T_AssetApplicationDetail A,T_AssetApplication B ";
            strHQL += "  where A.AAID = B.AAID ";
            strHQL += "  and B.ApplicantName like " + "'" + strApplicant + "'";
            strHQL += "  and A.Assetcode Like " + "'" + strAssetCode + "'";
            strHQL += "  and A.AssetName like " + "'" + strAssetName + "'";
            strHQL += "  and A.ModelNumber Like " + "'" + strModelNumber + "'";
            strHQL += "  and A.Spec  Like " + "'" + strSpec + "'";
            strHQL += " and to_char(B.ApplyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and B.RelatedType = " + "'" + strRelatedType + "'" + " and B.RelatedID = " + strRelatedID;
            strHQL += " and B.ApplicantCode  in (Select UserCode From T_ProjectMember  Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by A.ID DESC";

        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetApplicationReport");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void BT_FindAAID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString, strAAID = "0";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from  AssetApplicationReport as assetApplicationReport where assetApplicationReport.AAID = " + strAAID;
        strHQL += " and assetApplicationReport.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetApplicationReport.ID DESC";
        AssetApplicationReportBLL assetApplicationReportBLL = new AssetApplicationReportBLL();
        lst = assetApplicationReportBLL.GetAllAssetApplicationReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetApplicationReportBLL assetApplicationReportBLL = new AssetApplicationReportBLL();
        IList lst = assetApplicationReportBLL.GetAllAssetApplicationReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

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

public partial class TTAssetPurchaseReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "资产采购报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL, strStartTime, strEndTime;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strApplicant;
        string strStatus;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

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

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from AssetPurRecord as assetPurRecord where";
        strHQL += " to_char(assetPurRecord.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetPurRecord.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and assetPurRecord.ApplicantName like " + "'" + strApplicant + "'";
    
        strHQL += " and assetPurRecord.AssetCode Like " + "'" + strAssetCode + "'";
        strHQL += " and assetPurRecord.AssetName like " + "'" + strAssetName + "'";
        strHQL += " and assetPurRecord.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and assetPurRecord.Spec Like " + "'" + strSpec + "'";
        strHQL += " and assetPurRecord.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetPurRecord.ID DESC";
        AssetPurRecordBLL assetPurRecordBLL = new AssetPurRecordBLL();
        lst = assetPurRecordBLL.GetAllAssetPurRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        AssetPurRecord assetPurRecord = new AssetPurRecord();

        for (i = 0; i < lst.Count; i++)
        {
            assetPurRecord = (AssetPurRecord)lst[i];
            deTotalNumber += assetPurRecord.Number;
            deTotalAmount += assetPurRecord.Number * assetPurRecord.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void BT_FindPurID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;
        int intPurID = 0;
        string strDepartString;

        string strUserCode = LB_UserCode.Text.Trim();
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        //intPurID = int.Parse(NB_PurID.Amount.ToString());     

        strHQL = "from AssetPurRecord as assetPurRecord where  ID = " + intPurID.ToString();
        strHQL += " and assetPurRecord.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetPurRecord.ID DESC";
        AssetPurRecordBLL assetPurRecordBLL = new AssetPurRecordBLL();
        lst = assetPurRecordBLL.GetAllAssetPurRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        AssetPurRecord assetPurRecord = new AssetPurRecord();

        for (i = 0; i < lst.Count; i++)
        {
            assetPurRecord = (AssetPurRecord)lst[i];
            deTotalNumber += assetPurRecord.Number;
            deTotalAmount += assetPurRecord.Number * assetPurRecord.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetPurRecordBLL assetPurRecordBLL = new AssetPurRecordBLL();
        IList lst = assetPurRecordBLL.GetAllAssetPurRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }
}

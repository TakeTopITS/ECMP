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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectAssetPurchaseReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == "Project")
        {
            //strRelatedType = "项目";
        }

        //this.Title = strRelatedType + " " + strRelatedID + " 物料采购报表";
        LB_ReportName.Text =  Resources.lang.ZiChanCaiGouBaoBiao;

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from AssetPurRecord as assetPurRecord where assetPurRecord.RelatedType =  " + "'" +strRelatedType+ "'" + " and assetPurRecord.RelatedID = " + strRelatedID + " Order by assetPurRecord.ID DESC";
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

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL, strStartTime, strEndTime;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strHQL = "from AssetPurRecord as assetPurRecord where  to_char(assetPurRecord.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetPurRecord.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and assetPurRecord.RelatedType =  " + "'" + strRelatedType + "'" + " and assetPurRecord.RelatedID = " + strRelatedID + " Order by assetPurRecord.ID DESC";
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
    }

}

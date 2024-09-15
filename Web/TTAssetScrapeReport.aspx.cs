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

public partial class TTAssetScrapeReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal deTotalAmount = 0;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strDepartString;

        //this.Title = "资产报废报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        string strAssetCode, strAssetName, strOperatorName, strAssetType, strStartTime, strEndTime;

        decimal deTotalAmount = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strAssetType = TB_AssetType.Text.Trim();
        strOperatorName = TB_OperatorName.Text.Trim();


        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strAssetType = "%" + strAssetType + "%";
        strOperatorName = "%" + strOperatorName + "%";


        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "from AssetScrape as assetScrape where ";
        strHQL += " assetScrape.AssetCode Like " + "'" + strAssetCode + "'";
        strHQL += " and assetScrape.AssetName Like " + "'" + strAssetName + "'";
        strHQL += " and assetScrape.Type Like " + "'" + strAssetType + "'";
        strHQL += " and assetScrape.OperatorName Like " + "'" + strOperatorName + "'";

        strHQL += " and to_char(assetScrape.ScrapeTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetScrape.ScrapeTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and assetScrape.ScrapeNumber > 0 ";
        strHQL += " and assetScrape.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetScrape.ID DESC";
        AssetScrapeBLL assetScrapeBLL = new AssetScrapeBLL();
        lst = assetScrapeBLL.GetAllAssetScrapes(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        AssetScrape assetScrape = new AssetScrape();

        for (i = 0; i < lst.Count; i++)
        {
            assetScrape = (AssetScrape)lst[i];

            deTotalAmount += assetScrape.GetAmount;
        }

        LB_TotalNumber.Text = lst.Count.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetScrapeBLL assetScrapeBLL = new AssetScrapeBLL();
        IList lst = assetScrapeBLL.GetAllAssetScrapes(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }


    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }

}

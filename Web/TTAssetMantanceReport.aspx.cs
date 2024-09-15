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

public partial class TTAssetMantanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

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
        string strHQL;
        IList lst;

        int i;
        decimal deTotalAmount = 0;

        string strAssetCode, strAssetName, strMTManName, strAssetType, strStartTime, strEndTime;

        string strUserCode = LB_UserCode.Text.Trim();

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strAssetType = TB_AssetType.Text.Trim();
        strMTManName = TB_MTManName.Text.Trim();


        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strAssetType = "%" + strAssetType + "%";
        strMTManName = "%" + strMTManName + "%";

        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "from AssetMTRecord as assetMTRecord where ";
        strHQL += " assetMTRecord.AssetCode Like " + "'" + strAssetCode + "'";
        strHQL += " and assetMTRecord.AssetName Like " + "'" + strAssetName + "'";
        strHQL += " and assetMTRecord.MTManName Like " + "'" + strMTManName + "'";
        strHQL += " and to_char(assetMTRecord.MTTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(assetMTRecord.MTTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and assetMTRecord.MTManCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by assetMTRecord.ID DESC";
        AssetMTRecordBLL assetMTRecordBLL = new AssetMTRecordBLL();
        lst = assetMTRecordBLL.GetAllAssetMTRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();


        AssetMTRecord assetMTRecord = new AssetMTRecord();

        for (i = 0; i < lst.Count; i++)
        {
            assetMTRecord = (AssetMTRecord)lst[i];

            deTotalAmount += assetMTRecord.Cost;
        }


        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;

    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetMTRecordBLL assetMTRecordBLL = new AssetMTRecordBLL();
        IList lst = assetMTRecordBLL.GetAllAssetMTRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

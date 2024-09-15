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

public partial class TTAssetCheckReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "资产盘点报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadWareHouseListByAuthorityForDropDownList(strUserCode, DL_WareHouse);
        }
    }

    protected void DL_WareHouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_Position.Text = DL_WareHouse.SelectedValue.Trim();
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        DataGrid1.CurrentPageIndex = 0;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;

        string strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        string strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        string strAssetCode = TB_AssetCode.Text.Trim();
        string strAssetName = TB_AssetName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strPosition = TB_Position.Text.Trim();

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strPosition = "%" + strPosition + "%";

        strHQL = "from Asset as asset where ";
        strHQL += " asset.AssetCode Like " + "'" + strAssetCode + "'";
        strHQL += " and asset.AssetName Like " + "'" + strAssetName + "'";
        strHQL += " and asset.ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and asset.Spec Like " + "'" + strSpec + "'";
        strHQL += " and asset.Position like " + "'" + strPosition + "'";
        strHQL += " and asset.Status = '在用' ";
        strHQL += " and asset.Number > 0";
        strHQL += " and to_char(asset.BuyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(asset.BuyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and asset.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by asset.Number DESC,asset.ID DESC";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        Asset asset = new Asset();

        for (i = 0; i < lst.Count; i++)
        {
            asset = (Asset)lst[i];
            deTotalNumber += asset.Number;
            deTotalAmount += asset.Number * asset.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        AssetBLL assetBLL = new AssetBLL();
        IList lst = assetBLL.GetAllAssets(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

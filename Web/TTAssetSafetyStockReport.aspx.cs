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

public partial class TTAssetSafetyStockReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "资产安全库存报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strAssetCode, strAssetName;
        string strSpec;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetCode = "%" + strAssetCode + "%";

        strAssetName = TB_AssetName.Text.Trim();
        strAssetName = "%" + strAssetName + "%";

        strSpec = TB_Spec.Text.Trim();
        strSpec = "%" + strSpec + "%";

        strHQL = "Select AssetCode,AssetName,Type,Specification,UnitName,Sum(SafetyStock) as SafetyStock, Sum(StockNumber) as StockNumber,Sum(Banlance) as Banlance  From V_Item_SafetyStockReport ";
        strHQL += " Where AssetName Like " + "'" + strAssetName + "'";
        strHQL += " and AssetCode Like " + "'" + strAssetCode + "'";
        strHQL += " and Specification Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Group By AssetCode,AssetName,Type,Specification,UnitName";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetSafetyStockReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;


        LB_PageIndex.Text = "1";
        LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetSafetyStockReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

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

public partial class TTGoodsSafetyStockReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "物料安全库存报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料安全库存报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strGoodsCode, strGoodsName;
        string strSpec;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsCode = "%" + strGoodsCode + "%";

        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsName = "%" + strGoodsName + "%";

        strSpec = TB_Spec.Text.Trim();
        strSpec = "%" + strSpec + "%";

        strHQL = "Select GoodsCode,GoodsName,ModelNumber,Specification,UnitName,Sum(SafetyStock) as SafetyStock, Sum(StockNumber) as StockNumber,Sum(Banlance) as Banlance  From V_Item_GoodsSafetyStockReport ";
        strHQL += " Where GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and Specification Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Group By GoodsCode,GoodsName,ModelNumber,Specification,UnitName";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSafetyStockReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strGoodsCode, strGoodsName;
        string strSpec;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsCode = "%" + strGoodsCode + "%";

        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsName = "%" + strGoodsName + "%";

        strSpec = TB_Spec.Text.Trim();
        strSpec = "%" + strSpec + "%";

        strHQL = "Select GoodsCode,GoodsName,ModelNumber,Specification,UnitName,Sum(SafetyStock) as SafetyStock, Sum(StockNumber) as StockNumber,Sum(Banlance) as Banlance  From V_Item_GoodsSafetyStockReport ";
        strHQL += " Where GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and Specification Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Group By GoodsCode,GoodsName,ModelNumber,Specification,UnitName";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSafetyStockReport");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料安全库存报表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
    }

}

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


public partial class TTGoodsSummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "汇总报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料汇总报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            //strHQL = "Select GoodsCode,GoodsName,Type,ModelNumber,Spec,UnitName,TotalNumber,TotalAmount From V_GoodsCheckReport ";
            ////strHQL += " Where TotalNumber > 0 ";
            //strHQL += " where OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
            //strHQL += " Order By GoodsCode";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL,"V_GoodsCheckReport");
            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //LB_Sql.Text = strHQL;           

        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsType;

        DataGrid1.CurrentPageIndex = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsType = DL_Type.SelectedValue.Trim();
        strGoodsType = "%" + strGoodsType + "%";

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select GoodsCode,GoodsName,Type,ModelNumber,Spec,UnitName,TotalNumber,TotalAmount From V_GoodsCheckReport";
        strHQL += " Where Type Like " + "'" + strGoodsType + "'";
        strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order By GoodsCode";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsType;

        DataGrid1.CurrentPageIndex = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsType = DL_Type.SelectedValue.Trim();
        strGoodsType = "%" + strGoodsType + "%";

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select GoodsCode,GoodsName,Type,ModelNumber,Spec,UnitName,TotalNumber,TotalAmount From V_GoodsCheckReport";
        strHQL += " Where Type Like " + "'" + strGoodsType + "'";
        strHQL += " and GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order By GoodsCode";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料汇总报表.xls");

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

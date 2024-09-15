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


public partial class TTGoodsCheckInOutInventoryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "盘点报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料收发存报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            //strHQL = "Select GoodsCode,GoodsName,ModelNumber,Spec,UnitName,CheckTime,TotalCheckInNumber,TotalCheckOutNumber From V_GoodsCheckInOutInventoryByMonth";
            //strHQL += " Order By CheckTime DESC";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckInOutInventoryByMonth");

            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
       

        DataGrid1.CurrentPageIndex = 0;
     
        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strMonthly = TB_Monthly.Text.Trim();
   

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strMonthly = "%" + strMonthly + "%";
     

        strHQL = "Select GoodsCode,GoodsName,ModelNumber,Spec,UnitName,CheckTime,TotalCheckInNumber,TotalCheckOutNumber From V_GoodsCheckInOutInventoryByMonth";
        strHQL += " Where GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and CheckTime Like " + "'" + strMonthly + "'";
        strHQL += " Order By CheckTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckInOutInventoryByMonth");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        DataGrid1.CurrentPageIndex = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strMonthly = TB_Monthly.Text.Trim();


        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strMonthly = "%" + strMonthly + "%";


        strHQL = "Select GoodsCode,GoodsName,ModelNumber,Spec,UnitName,CheckTime,TotalCheckInNumber,TotalCheckOutNumber From V_GoodsCheckInOutInventoryByMonth";
        strHQL += " Where GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and CheckTime Like " + "'" + strMonthly + "'";
        strHQL += " Order By CheckTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckInOutInventoryByMonth");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料收发存报表.xls");

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

    //取得当月结余库存量
    public decimal GetInventoryNumberByMonth(string strCheckTime, string strGoodsCode,string strModelNumber,string strSpec,string strUnitName)
    {
        string strHQL;
        string strLangCode;
        decimal deInventoryNumber, deInventoryNumberByMonth;

        strLangCode = HttpContext.Current.Session["LangCode"].ToString();

        strHQL = "Select COALESCE(Sum(TotalCheckOutNumber) - Sum(TotalCheckInNumber),0) From V_GoodsCheckInOutInventoryByMonth ";
        strHQL += " Where GoodsCode = " + "'" + strGoodsCode + "'";
        strHQL += " and ModelNumber = " + "'" + strModelNumber + "'";
        strHQL += " and Spec = " + "'" + strSpec + "'";
        strHQL += " and UnitName = " + "'" + strUnitName + "'";
        strHQL += " and CheckTime > " + "'" + strCheckTime + "'";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectStatus");

        if (ds.Tables[0].Rows.Count > 0)
        {
            deInventoryNumberByMonth = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

        }
        else
        {
            deInventoryNumberByMonth = 0;
        }

        deInventoryNumber = GetInventoryNumberByGoodsCode(strGoodsCode,strModelNumber, strSpec,strUnitName);

        return deInventoryNumberByMonth + deInventoryNumber;
    }

    public decimal GetInventoryNumberByGoodsCode(string strGoodsCode,string strModelNumber, string strSpec, string strUnitName)
    {
        string strHQL;
        string strLangCode;

        strLangCode = HttpContext.Current.Session["LangCode"].ToString();

        strHQL = "Select COALESCE(Sum(Number),0) From T_Goods ";
        strHQL += " Where GoodsCode = " + "'" + strGoodsCode + "'";
        strHQL += " and ModelNumber = " + "'" + strModelNumber + "'";
        strHQL += " and Spec = " + "'" + strSpec + "'";
        strHQL += " and UnitName = " + "'" + strUnitName + "'";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectStatus");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

}

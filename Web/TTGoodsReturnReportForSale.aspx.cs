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


public partial class TTGoodsReturnReportForSale : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "物料销售报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadCustomer(DL_Customer, strUserCode);
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
        }
    }

    protected void DL_Customer_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strCustomerName = DL_Customer.SelectedItem.Text.Trim();

        TB_CustomerName.Text = strCustomerName;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;
        string strStartTime, strEndTime, strCustomerName;
        string strSalesName;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();

        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        //strSalesName = TB_SalesName.Text.Trim();
        //strSalesName = "%" + strSalesName + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select A.*,B.*,B.CurrencyType as Currency from T_GoodsReturnDetail A,T_GoodsReturnOrder B where A.ROID = B.ROID And B.Type = 'SALE' ";
        strHQL += " and to_char(B.ReturnTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ReturnTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        //strHQL += " and B.OperatorName like " + "'" + strSalesName + "'";
        strHQL += " and B.CustomerName Like " + "'" + strCustomerName + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and B.OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by A.ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalNumber += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString());
            deTotalAmount += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString()) * decimal.Parse(ds.Tables[0].Rows[i]["Price"].ToString());
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    //取得同一销售明细的退货量
    protected decimal getSaleOrderReturnNumber(string strSORecordID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsReturnDetail Where SourceType = 'GoodsSORecord' and SourceID = " + strSORecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsReturnRecord");

        try
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                return 0;
            }
        }
        catch
        {
            return 0;
        }
    }

    //取得同一销售明细的退货量
    protected decimal getSaleOrderRealReceiveNumber(string strSORecordID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(RealReceiveNumber),0) From T_GoodsDeliveryOrderDetail Where SourceType = 'GoodsSORecord' and SourceID = " + strSORecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsDeliveryOrderDetail");

        try
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                return 0;
            }
        }
        catch
        {
            return 0;
        }
    }




    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStartTime, strEndTime, strCustomerName;
        string strSalesName;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();

        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        //strSalesName = TB_SalesName.Text.Trim();
        //strSalesName = "%" + strSalesName + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = @"Select  B.ReturnName '名称' 
            ,B.OperatorName '业务员'
            ,B.CustomerName '客户'
            ,B.ReturnTime '时间'
            ,A.ID '编号'
            ,A.GoodsCode '代码'
            ,A.GoodsName '商品名称'
            ,A.Number '数量'
            ,A.ModelNumber '型号'
            ,A.Spec '规格'
            ,A.UnitName '单位'
            ,A.Price '单价'
            ,A.Amount '金额'
            ,B.CurrencyType '币别'
            ,B.CarCode '车号'
            ,B.Driver '司机'
            ,A.ReturnReason '备注'
            from T_GoodsReturnDetail A,T_GoodsReturnOrder B where A.ROID = B.ROID And B.Type = 'SALE'";

        strHQL += " and to_char(B.ReturnTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.ReturnTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        //strHQL += " and B.OperatorName like " + "'" + strSalesName + "'";
        strHQL += " and B.CustomerName Like " + "'" + strCustomerName + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and B.OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by A.ID DESC";

        LB_Sql.Text = strHQL;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");
        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "销售退货报表.xls");

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

    protected void LoadCustomer(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from Customer as customer ";
        strHQL += " Where (customer.CreatorCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Or customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode In  " + strDepartString + ")";
        strHQL += " Order by customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DL_Customer.DataSource = lst;
        DL_Customer.DataBind();

        DL_Customer.Items.Insert(0, new ListItem("--Select--", ""));
    }

}

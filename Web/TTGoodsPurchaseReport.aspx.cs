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

public partial class TTGoodsPurchaseReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "物料采购报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料采购报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            ShareClass.LoadVendorList(DL_VendorList, strUserCode);
        }
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorPhone, strClearingForm, strContacts, strFax;
        decimal deTaxRate;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(Tel1,''),TaxRate,ClearingForm ,ContactName,Fax From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(PhoneNum,''),1,'' ,TechnicalDirector,Fax From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strVendorPhone = ds.Tables[0].Rows[0][0].ToString();
            deTaxRate = decimal.Parse(ds.Tables[0].Rows[0][1].ToString());
            strClearingForm = ds.Tables[0].Rows[0][2].ToString();
            strContacts = ds.Tables[0].Rows[0][3].ToString();
            strFax = ds.Tables[0].Rows[0][4].ToString();

         
            TB_SupplierName.Text = DL_VendorList.SelectedItem.Text;
        }
        catch
        {
            TB_SupplierName.Text = "";
        }

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        int i;

        string strStartTime, strEndTime;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strApplicant;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();

        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        string strSupplierName = TB_SupplierName.Text.Trim();


        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strSupplierName = "%" + strSupplierName + "%";
        

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select * from T_GoodsPurRecord A,T_GoodsPurchaseOrder B where A.POID = B.POID";
        strHQL += " and to_char(A.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(A.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and A.ApplicantName like " + "'" + strApplicant + "'";
        strHQL += " and B.Supplier Like " + "'" + strSupplierName + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and A.ApplicantCode  in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
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


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStartTime, strEndTime, strSupplierName;
        string strApplicant;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();

        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strSupplierName = "%" + TB_SupplierName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = @"Select  B.GPOName '名称' 
            ,B.PurManName '业务员'
            ,B.Supplier '供应商'

            ,A.ID '编号'
            ,A.GoodsCode '代码'
            ,A.GoodsName '商品名称'
            ,A.ModelNumber '型号'
            ,A.Spec '规格'
            ,A.Number '数量'
            ,A.Unit '单位'
            ,A.Price '单价'
            ,A.SupplyNumber '供货量'
            ,A.ReturnNumber '退货量'
            ,A.Amount '金额'
            ,B.CurrencyType '币别'
            ,B.PurTime '时间'
            from T_GoodsPurRecord A,T_GoodsPurchaseOrder B where A.POID = B.POID";

        strHQL += " and to_char(A.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(A.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and A.ApplicantName like " + "'" + strApplicant + "'";
        strHQL += " and B.Supplier Like " + "'" + strSupplierName + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and A.ApplicantCode  in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by A.ID DESC";

        LB_Sql.Text = strHQL;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "采购订单报表.xls");

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

        strHQL = "from GoodsPurRecord as goodsPurRecord where  ID = " + intPurID.ToString();
        strHQL += " and goodsPurRecord.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsPurRecord.ID DESC";
        GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
        lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        GoodsPurRecord goodsPurRecord = new GoodsPurRecord();

        for (i = 0; i < lst.Count; i++)
        {
            goodsPurRecord = (GoodsPurRecord)lst[i];
            deTotalNumber += goodsPurRecord.Number;
            deTotalAmount += goodsPurRecord.Number * goodsPurRecord.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }
    
}

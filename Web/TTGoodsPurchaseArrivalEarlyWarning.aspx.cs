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

public partial class TTGoodsPurchaseArrivalEarlyWarning : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;

        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandler();", true); 
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            strHQL = "Select * From T_GoodsPurRecord A,T_GoodsPurchaseOrder B ";
            strHQL += " Where A.POID = B.POID";
            strHQL += " and A.ApplicantCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " and B.ArrivalTime < now()";
            strHQL += " and A.Number > A.CheckInNumber";
            strHQL += " Order By B.ArrivalTime DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            //LB_PageIndex.Text = "1";
            //LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        }
    }


    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorName;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select VendorName From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select Name From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strVendorName = ds.Tables[0].Rows[0][0].ToString();

            TB_VendorName.Text = strVendorName;
        }
        catch
        {
            TB_VendorName.Text = "";
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStartTime, strEndTime;
        string strApplicant;

        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();
        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strGPOName = TB_GPOName.Text.Trim();
        string strVendorName = TB_VendorName.Text.Trim();


        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strApplicant = TB_Applicant.Text.Trim();
        strApplicant = "%" + strApplicant + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strGPOName = "%" + strGPOName + "%";
        strVendorName = "%" + strVendorName + "%";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select * From T_GoodsPurRecord A,T_GoodsPurchaseOrder B ";
        strHQL += " Where A.POID = B.POID";
        strHQL += " and A.ApplicantCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " and to_char(A.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(A.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and B.GPOName Like " + "'" + strGPOName + "'";
        strHQL += " and A.ApplicantName like " + "'" + strApplicant + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and B.Supplier Like " + "'" + strVendorName + "'";
        strHQL += " and A.Number > A.CheckInNumber";
        strHQL += " and B.ArrivalTime < now()";
        strHQL += " Order By B.ArrivalTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }
}

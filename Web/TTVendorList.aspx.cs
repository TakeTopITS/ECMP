using System;
using System.Resources;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Xml.Linq;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTVendorList : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "供应商列表", strUserCode);

        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadVendorList(strUserCode);

            LoadIndustryType();
        }
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strVendorCode, strVendorName;
        string strIndustryType, strDeviceName;

        strVendorCode = "%" + TB_VenCode.Text.Trim() + "%";
        strVendorName = "%" + TB_VenName.Text.Trim() + "%";
        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";
        strDeviceName = "%" + TB_DeviceNameFind.Text.Trim() + "%";

        strHQL = "from Vendor as vendor where 1 = 1";
        strHQL += " and vendor.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and vendor.VendorCode like " + "'" + strVendorCode + "'";
        strHQL += " and vendor.VendorName like  " + "'" + strVendorName + "'";
        strHQL += " and vendor.DeviceName like " + "'" + strDeviceName + "'";
        strHQL += " and (vendor.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or vendor.VendorCode in (Select vendorRelatedUser.VendorCode from VendorRelatedUser as vendorRelatedUser where vendorRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order by vendor.VendorCode DESC";
        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void BT_SortByAreaAddress_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strSortName = LB_UpDown.Text.Trim();
        strHQL = "from Vendor as vendor where vendor.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or vendor.VendorCode in (Select vendorRelatedUser.VendorCode from VendorRelatedUser as vendorRelatedUser where vendorRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
    

        if (strSortName == "UP")
        {
            strHQL += " Order by vendor.AreaAddress DESC";

            LB_UpDown.Text = "DOWN";
        }
        else
        {
            strHQL += " Order by vendor.AreaAddress ASC";

            LB_UpDown.Text = "UP";
        }

        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DL_IndustryTypeFind_SelectedIndexChanged(object sender, EventArgs e)
    {

        string strType = DL_IndustryTypeFind.SelectedValue.Trim();

        TB_IndustryTypeFind.Text = strType;
    }

    protected void LoadIndustryType()
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Order By industryType.SortNumber ASC";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        DL_IndustryTypeFind.DataSource = lst;
        DL_IndustryTypeFind.DataBind();
    }

    protected void LoadVendorList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Vendor as vendor where vendor.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or vendor.VendorCode in (Select vendorRelatedUser.VendorCode from VendorRelatedUser as vendorRelatedUser where vendorRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order by vendor.VendorCode DESC";

        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

}

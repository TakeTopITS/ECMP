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

public partial class TTVendorInfoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName;
        string strVendorCode;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strVendorCode = Request.QueryString["VendorCode"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strHQL = "from Vendor as vendor where vendor.VendorCode = " + "'" + strVendorCode + "'";
            VendorBLL vendorBLL = new VendorBLL();
            lst = vendorBLL.GetAllVendors(strHQL);
            DataList2.DataSource = lst;
            DataList2.DataBind();

            Vendor vendor = (Vendor)lst[0];

            HL_RelatedContactInfor.Enabled = true;
            HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Vendor&RelatedID=" + strVendorCode;

            LoadVendorRelatedProject(strVendorCode);
            LoadVendorRelatedGoodsPurchaseOrder(vendor.VendorName.Trim());
            LoadVendorRelatedAssetPurchaseOrder(vendor.VendorName.Trim());
            LoadRelatedConstract(strVendorCode);
            LoadVendorRelatedGoodsList(strVendorCode);

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strProductType != "ERP" & strProductType != "CRM" & strProductType != "SIMP" & strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "DEMO")
                {
                    TabPanel5.Visible = false;
                }
            }
            catch
            {

            }
        }
    }

    protected void LoadVendorRelatedGoodsList(string strVendorCode)
    {
        string strHQL;
        IList lst;


        VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
        strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor where vendorRelatedGoodsInfor.VendorCode = " + "'" + strVendorCode + "'";
        lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }


    protected void LoadRelatedConstract(string strVendorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.Status <> '归档'";
        strHQL += " and constract.RelatedVendorCode = " + "'" + strVendorCode + "'";
        strHQL += " Order by constract.SignDate DESC";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadVendorRelatedProject(string strVendorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID in (select projectVendor.ProjectID from ProjectVendor as projectVendor where projectVendor.VendorCode = " + "'" + strVendorCode + "'" + ")";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadVendorRelatedGoodsPurchaseOrder(string strVendorName)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsPurchaseOrder as goodsPurchaseOrder Where goodsPurchaseOrder.Supplier = " + "'" + strVendorName + "'";
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        DataGrid8.DataSource = lst;
        DataGrid8.DataBind();
    }

    protected void LoadVendorRelatedAssetPurchaseOrder(string strVendorName)
    {
        string strHQL;
        IList lst;

        strHQL = "From AssetPurchaseOrder as assetPurchaseOrder Where assetPurchaseOrder.POID in (Select assetPurRecord.POID From AssetPurRecord as assetPurRecord Where assetPurRecord.Supplier = " + "'" + strVendorName + "'" + ")";
        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        DataGrid10.DataSource = lst;
        DataGrid10.DataBind();
    }

}

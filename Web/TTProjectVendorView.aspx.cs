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

public partial class TTProjectVendorView : System.Web.UI.Page
{
    string strProjectID;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strProjectID = Request.QueryString["ProjectID"].Trim();

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadVendorList(strProjectID);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strVendorCode;

        if (e.CommandName != "Page")
        {
            strVendorCode = ((Button)e.Item.FindControl("BT_VendorCode")).Text;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from Vendor as vendor where vendor.VendorCode = " + "'" + strVendorCode + "'";
            VendorBLL vendorBLL = new VendorBLL();
            lst = vendorBLL.GetAllVendors(strHQL);

            DataList2.DataSource = lst;
            DataList2.DataBind();

            HL_RelatedContactInfor.Enabled = true;
            HL_RelatedContactInfor.NavigateUrl = "TTContactListView.aspx?RelatedType=Vendor&RelatedID=" + strVendorCode;
        }
    }

    protected void LoadVendorList(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Vendor as vendor where vendor.VendorCode in (select projectVendor.VendorCode from ProjectVendor as projectVendor where projectVendor.ProjectID = " + strProjectID + ")";

        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

}

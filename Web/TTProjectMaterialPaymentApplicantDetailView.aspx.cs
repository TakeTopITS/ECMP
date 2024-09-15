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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectMaterialPaymentApplicantDetailView : System.Web.UI.Page
{
    string strAOID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strAOID = Request.QueryString["AOID"];

        //this.Title = "物料入库单";


        if (Page.IsPostBack != true)
        {
            LoadProjectMaterialPaymentApplicantDetail(strAOID);
        }
    }

    protected void LoadProjectMaterialPaymentApplicantDetail(string strAOID)
    {
        string strXMLFileURL = Request.QueryString["DetailXMLFile"];
        if (strXMLFileURL != null & strXMLFileURL != "")
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath(strXMLFileURL));

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
        else
        {
            string strHQL = "Select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID + " Order by ID ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}



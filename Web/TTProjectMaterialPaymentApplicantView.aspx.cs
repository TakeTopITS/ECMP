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

public partial class TTProjectMaterialPaymentApplicantView : System.Web.UI.Page
{
    string strAOID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strAOID = Request.QueryString["AOID"];

        //this.Title = "物料入库单";


        if (Page.IsPostBack != true)
        {
            LoadProjectMaterialPaymentApplicant(strAOID);

            LoadProjectMaterialPaymentApplicantDetail(strAOID);
        }
    }

    protected void LoadProjectMaterialPaymentApplicant(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where projectMaterialPaymentApplicant.AOID= " + strAOID;

        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];

        LB_CurrentTotalPaymentAmount.Text = projectMaterialPaymentApplicant.CurrentTotalPaymentAmount.ToString();

        LB_CurrentTotalPaymentAmountLarge.Text = ShareClass.RMBCapitalization.RMBAmount(double.Parse(projectMaterialPaymentApplicant.CurrentTotalPaymentAmount.ToString()));

    }

    protected void LoadProjectMaterialPaymentApplicantDetail(string strAOID)
    {
        string strHQL = "Select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID + " Order by ID ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}



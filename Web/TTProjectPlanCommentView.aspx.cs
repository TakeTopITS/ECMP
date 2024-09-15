using System;
using System.Resources;
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

public partial class TTProjectPlanCommentView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode = Session["UserCode"].ToString();
        string strPlanID = Request.QueryString["PlanID"];

        if (Page.IsPostBack != true)
        {
            strHQL = "Select * From T_ImplePlan Where ID = " + strPlanID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}

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

public partial class TTProjectDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            ProjectBLL projectBLL = new ProjectBLL();
            lst = projectBLL.GetAllProjects(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            if (lst.Count > 0)
            {
                Project project = (Project)lst[0];

                HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Project", strProjectID));
                //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
                if (ShareClass.getRelatedBusinessFormTemName("Project", strProjectID) == "")
                {
                    HL_BusinessForm.Visible = false;
                }

            }
            else
            {
                string strErrorMsg = Resources.lang.ZZGLZLBCZKNYBSCQJC;

                Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg=" + strErrorMsg);
            }
        }
    }
}

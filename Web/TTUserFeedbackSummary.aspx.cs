using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserFeedbackSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strProjectID;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
       

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        //this.Title = Resources.lang.Project + strProjectID + project.ProjectName + "反馈汇总";

       
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

     
        if (Page.IsPostBack == false)
        {
            strHQL = "from ProFeedback as proFeedback where proFeedback.ProjectID = " + strProjectID + " Order by proFeedback.ID DESC";
            ProFeedbackBLL proFeedbackBLL = new ProFeedbackBLL();
            lst = proFeedbackBLL.GetAllProFeedbacks(strHQL);

            DataList1.DataSource = lst;
            DataList1.DataBind();
        }

    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}

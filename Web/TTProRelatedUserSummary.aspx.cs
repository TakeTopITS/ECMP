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

public partial class TTProRelatedUserSummary : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();      
        string strUserName;

        string strHQL;
        IList lst;
      

        strProjectID = Request.QueryString["ProjectID"]; 

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        //this.Title = Resources.lang.Project + strProjectID + " " + project.ProjectName + "的项目成员";


       if (Page.IsPostBack != true)
        {
            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
            RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
            lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();          
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName, strTarget;
        int intDepth = TreeView1.SelectedNode.Depth;

        strTarget = TreeView1.SelectedNode.Target.Trim();
       

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;

        try
        {
            if (intDepth == 0)
            {
                strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
            }

            if (intDepth == 1)
            {
                strHQL = "from RelatedUser as relatedUser where relatedUser.Actor = " + "'" + strTarget + "'" + " and relatedUser.ProjectID = " + strProjectID;
            }

            if (intDepth == 2)
            {
                strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strTarget;
                ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
                lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();
                

                strHQL = "from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + " and relatedUser.ProjectID = " + strProjectID;
            }

            RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
            lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind(); 
        }      
        catch
        {
        }
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        if (lst.Count > 0)
        {
            strUserName = projectMember.UserName;
            return strUserName.Trim();
        }
        else
        {
            return "";
        }
    }

    
}

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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectDailyWorkBonusReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
       
        int i;
        decimal deTotalAmount = 0;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];

        //this.Title = Resources.lang.Project + strProjectID + " " + GetProjectName(strProjectID) + " 工作奖金报表";
        LB_Project.Text = strProjectID + " " + GetProjectName(strProjectID);

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;      

         if (Page.IsPostBack != true)
        {
            strHQL = "select UserCode,UserName,Bonus From V_ProjectDailyWorkBonusSummary Where ProjectID = " + strProjectID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL,"ProjectDailyWorkBonusSummary");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;       

            for (i = 0; i < ds.Tables [0].Rows.Count; i++)
            {
                deTotalAmount += decimal.Parse(ds.Tables[0].Rows[i][2].ToString());
            }

      
            LB_TotalAmount.Text = deTotalAmount.ToString();

            LB_PageIndex.Text = "1";
            LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();            
        }
    }

   
    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "ProjectDailyWorkBonus");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();


        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();

    }


    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        string strProjectName = project.ProjectName.Trim();
        return strProjectName;
    }


    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }


}

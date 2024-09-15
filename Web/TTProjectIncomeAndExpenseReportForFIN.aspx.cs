using System; using System.Resources;
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

public partial class TTProjectIncomeAndExpenseReportForFIN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;
        IList lst;
        decimal deTotalExpense = 0, deTotalSalary = 0, deTotalIncome = 0;

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        //this.Title = Resources.lang.Project + strProjectName + " 成员收入和支出列表！";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;


            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "from ProjectIncomeAndExpense as projectIncomeAndExpense where projectIncomeAndExpense.ProjectID = " + strProjectID;
            ProjectIncomeAndExpenseBLL projectIncomeAndExpenseBLL = new ProjectIncomeAndExpenseBLL();
            lst = projectIncomeAndExpenseBLL.GetAllProjectIncomeAndExpenses(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            ProjectIncomeAndExpense projectIncomeAndExpense = new ProjectIncomeAndExpense();
            for (int i = 0; i < lst.Count; i++)
            {
                projectIncomeAndExpense = (ProjectIncomeAndExpense)lst[i];
                deTotalExpense += projectIncomeAndExpense.TotalExpense;
                deTotalSalary += projectIncomeAndExpense.TotalSalary;
            }

            deTotalIncome = deTotalSalary - deTotalExpense;

            LB_TotalExpense.Text = deTotalExpense.ToString();
            LB_TotalSalary.Text = deTotalSalary.ToString();
            LB_TotalIncome.Text = deTotalIncome.ToString();

            LB_QueryScope.Text = Resources.lang.ZZXMCYSY;
            LB_Sql.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID = LB_ProjectID.Text.Trim();
        decimal deTotalExpense = 0, deTotalSalary = 0, deTotalIncome = 0;

        string strID;
        string strUserCode, strUserName;

        strProjectID = LB_ProjectID.Text.Trim();
        strID = TreeView1.SelectedNode.Target.Trim();

        try
        {
            strID = int.Parse(strID).ToString();

            strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strID;
            ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
            lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();

                strHQL = "from ProjectIncomeAndExpense as projectIncomeAndExpense where ";
                strHQL += " projectIncomeAndExpense.ProjectID = " + strProjectID;
                strHQL += " and projectIncomeAndExpense.UserCode = " + "'" + strUserCode + "'";

                ProjectIncomeAndExpenseBLL projectIncomeAndExpenseBLL = new ProjectIncomeAndExpenseBLL();
                lst = projectIncomeAndExpenseBLL.GetAllProjectIncomeAndExpenses(strHQL);
                DataGrid2.DataSource = lst;
                DataGrid2.DataBind();

                ProjectIncomeAndExpense projectIncomeAndExpense = new ProjectIncomeAndExpense();
                for (int i = 0; i < lst.Count; i++)
                {
                    projectIncomeAndExpense = (ProjectIncomeAndExpense)lst[i];
                    deTotalExpense += projectIncomeAndExpense.TotalExpense;
                    deTotalSalary += projectIncomeAndExpense.TotalSalary;
                }

                deTotalIncome = deTotalSalary - deTotalExpense;

                LB_TotalExpense.Text = deTotalExpense.ToString();
                LB_TotalSalary.Text = deTotalSalary.ToString();
                LB_TotalIncome.Text = deTotalIncome.ToString();

                LB_QueryScope.Text = Resources.lang.ZZXMCY + ":" + strUserCode + strUserName;
                LB_Sql.Text = strHQL;
            }
        }
        catch
        {
        }
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deTotalExpense = 0, deTotalSalary = 0, deTotalIncome = 0;
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectIncomeAndExpense as projectIncomeAndExpense where projectIncomeAndExpense.ProjectID = " + strProjectID;
        ProjectIncomeAndExpenseBLL projectIncomeAndExpenseBLL = new ProjectIncomeAndExpenseBLL();
        IList lst = projectIncomeAndExpenseBLL.GetAllProjectIncomeAndExpenses(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        ProjectIncomeAndExpense projectIncomeAndExpense = new ProjectIncomeAndExpense();
        for (int i = 0; i < lst.Count; i++)
        {
            projectIncomeAndExpense = (ProjectIncomeAndExpense)lst[i];
            deTotalExpense += projectIncomeAndExpense.TotalExpense;
            deTotalSalary += projectIncomeAndExpense.TotalSalary;
        }

        deTotalIncome = deTotalSalary - deTotalExpense;

        LB_TotalExpense.Text = deTotalExpense.ToString();
        LB_TotalSalary.Text = deTotalSalary.ToString();
        LB_TotalIncome.Text = deTotalIncome.ToString();

        LB_QueryScope.Text = Resources.lang.ZZXMCYSY;
        LB_Sql.Text = strHQL;
    }
    
    protected string GetProjectName(string strProjectID)
    {
        string strHQL, strProjectName;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        LB_ProBudget.Text = project.Budget.ToString();

        strProjectName = project.ProjectName.Trim();
        return strProjectName;
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

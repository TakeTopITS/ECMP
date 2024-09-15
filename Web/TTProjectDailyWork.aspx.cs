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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectDailyWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        IList lst;

        strProjectID = Request.QueryString["ProjectID"];
        Project project = GetProject(strProjectID);

        strProjectName = project.ProjectName.Trim();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_ReportName.Text = Resources.lang.XiangMu + Resources.lang.GongZuoRiZhi;
       

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;
            LB_ProjectName.Text = strProjectName;
            LB_PMName.Text = project.PMName;

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID + " order by projectDailyWork.WorkDate DESC";
            ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
            lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            ProjectDailyWork projectDailyWork = new ProjectDailyWork();

            for (int i = 0; i < lst.Count; i++)
            {
                projectDailyWork = (ProjectDailyWork)lst[i];
                deExpense += projectDailyWork.Charge;
                deManHour += projectDailyWork.ManHour;
                deSalary += projectDailyWork.DailySalary;
                deConfirmManHour += projectDailyWork.ConfirmManHour;
                deConfirmSalary += projectDailyWork.ConfirmDailySalary;
            }

            LB_Amount.Text = deExpense.ToString();
            LB_ManHour.Text = deManHour.ToString();
            LB_Income.Text = deSalary.ToString();
            LB_ConfirmManHour.Text = deConfirmManHour.ToString();
            LB_ConfirmIncome.Text = deConfirmSalary.ToString();

            LB_Member.Text = "ALL Member";

            LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;
            LB_Sql.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID, strID;
        string strUserCode, strUserName;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;

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

                strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID + " and projectDailyWork.UserCode = " + "'" + strUserCode + "'" + " order by projectDailyWork.WorkID DESC";
                ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
                lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);

                DataList1.DataSource = lst;
                DataList1.DataBind();

                ProjectDailyWork projectDailyWork = new ProjectDailyWork();

                for (int i = 0; i < lst.Count; i++)
                {
                    projectDailyWork = (ProjectDailyWork)lst[i];
                    deExpense += projectDailyWork.Charge;
                    deManHour += projectDailyWork.ManHour;
                    deSalary += projectDailyWork.DailySalary;
                    deConfirmManHour += projectDailyWork.ConfirmManHour;
                    deConfirmSalary += projectDailyWork.ConfirmDailySalary;
                }

                LB_Amount.Text = deExpense.ToString();
                LB_ManHour.Text = deManHour.ToString();
                LB_Income.Text = deSalary.ToString();
                LB_ConfirmManHour.Text = deConfirmManHour.ToString();
                LB_ConfirmIncome.Text = deConfirmSalary.ToString();

                LB_MemberCode.Text = strUserCode;
                LB_MemberName.Text = strUserName;
                LB_Member.Text = strUserCode + " " + strUserName;

                LB_QueryScope.Text = Resources.lang.ZZZhiXingZhe + strUserCode + strUserName;
                LB_Sql.Text = strHQL;
            }
        }
        catch
        {
            LB_MemberCode.Text = "";
            LB_MemberName.Text = "";

            LB_Member.Text = "All Member";
        }
    }


    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID + " order by projectDailyWork.WorkDate DESC";
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        IList lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProjectDailyWork projectDailyWork = new ProjectDailyWork();

        for (int i = 0; i < lst.Count; i++)
        {
            projectDailyWork = (ProjectDailyWork)lst[i];
            deExpense += projectDailyWork.Charge;
            deManHour += projectDailyWork.ManHour;
            deSalary += projectDailyWork.DailySalary;
            deConfirmManHour += projectDailyWork.ConfirmManHour;
            deConfirmSalary += projectDailyWork.ConfirmDailySalary;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();
        LB_Income.Text = deSalary.ToString();
        LB_ConfirmManHour.Text = deConfirmManHour.ToString();
        LB_ConfirmIncome.Text = deConfirmSalary.ToString();

        LB_MemberCode.Text = "";
        LB_MemberName.Text = "";
        LB_Member.Text = "All Member";

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;
    }

    protected void BT_DateFind_Click(object sender, EventArgs e)
    {
        string strHQL, strProjectID, strStartDate, strEndDate;
        string strMemberCode, strMemberName;
        IList lst;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;

        strStartDate = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strEndDate = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        strMemberCode = LB_MemberCode.Text.Trim();
        strMemberName = LB_MemberName.Text.Trim();

        strProjectID = LB_ProjectID.Text.Trim();
        if (strMemberCode == "")
        {
            LB_Member.Text = "ALL Member";
            strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID;
            strHQL += " and to_char( projectDailyWork.WorkDate,'yyyymmdd') >= " + "'" + strStartDate + "'" + " and to_char( projectDailyWork.WorkDate,'yyyymmdd') <= " + "'" + strEndDate + "'";
        }
        else
        {
            LB_Member.Text = strMemberCode + " " + strMemberName;

            strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID;
            strHQL += " and to_char( projectDailyWork.WorkDate,'yyyymmdd') >= " + "'" + strStartDate + "'" + " and to_char( projectDailyWork.WorkDate,'yyyymmdd') <= " + "'" + strEndDate + "'";
            strHQL += " and projectDailyWork.UserCode = " + "'" + strMemberCode + "'";
        }
        strHQL += " order by projectDailyWork.WorkDate DESC";
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProjectDailyWork projectDailyWork = new ProjectDailyWork();

        for (int i = 0; i < lst.Count; i++)
        {
            projectDailyWork = (ProjectDailyWork)lst[i];
            deExpense += projectDailyWork.Charge;
            deManHour += projectDailyWork.ManHour;
            deSalary += projectDailyWork.DailySalary;
            deConfirmManHour += projectDailyWork.ConfirmManHour;
            deConfirmSalary += projectDailyWork.ConfirmDailySalary;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();
        LB_Income.Text = deSalary.ToString();
        LB_ConfirmManHour.Text = deConfirmManHour.ToString();
        LB_ConfirmIncome.Text = deConfirmSalary.ToString();

        LB_QueryScope.Text = Resources.lang.KaiShiRiQi + ":" + strStartDate + Resources.lang.JieShuRiQi + ":" + strEndDate;

        LB_TimeScope.Text = strStartDate + "-" + strEndDate;
    }

    protected void LoadDailyWork()
    {
        string strHQL;
        IList lst;

        strHQL = LB_Sql.Text.Trim();
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();
    }


    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];
        string strProjectName = project.ProjectName.Trim();

        LB_ProExpense.Text = project.Budget.ToString();
        LB_ProManHour.Text = project.ManHour.ToString();

        return strProjectName;
    }

    protected Project GetProject(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project;
    }

}

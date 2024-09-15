using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;


public partial class TTProjectExpenseReport : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;


        decimal deExpense = 0, deConfirmExpense = 0;

        strLangCode = Session["LangCode"].ToString();

        strProjectID = Request.QueryString["ProjectID"];

        Project project = GetProject(strProjectID);
        strProjectName = project.ProjectName.Trim();
        LB_ProBudget.Text = project.Budget.ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        //this.Title = Resources.lang.Project + strProjectName + " 支出费用汇总！";

        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "Select UserName,sum(ConfirmAmount) as AccountAmount from T_ProExpense ";
            strHQL += " where ProjectID = " + strProjectID + " Group By UserName";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");
            DataList1.DataSource = ds;
            DataList1.DataBind();


            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                deConfirmExpense += decimal.Parse(ds.Tables[0].Rows[i][1].ToString());
            }

            LB_Member.Text = Resources.lang.SuoYouChenYuan;

            LB_ConfirmAmount.Text = deConfirmExpense.ToString();

            LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;


            LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + Resources.lang.YSYFYBB;
            string strChartTitle = Resources.lang.XMFYYSFBT;
            strHQL = @"Select A.ProjectID, A.Account as XName,SUM(A.ConfirmAmount) as YNumber,COALESCE(B.Amount,0) as ZNumber
                  From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account 
                      WHERE  A.ProjectID = " + strProjectID + " Group By A.ProjectID ,A.Account,B.Amount ";

            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

            LoadProjectBudget(strProjectID);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID, strID;
        string strUserCode, strUserName;
        decimal deConfirmExpense = 0;

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

                strHQL = "Select UserName,sum(ConfirmAmount) as AccountAmount from T_ProExpense ";
                strHQL += " where ProjectID = " + strProjectID + " and UserName = " + "'" + strUserName + "'";
                strHQL += " Group By UserName";

                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");
                DataList1.DataSource = ds;
                DataList1.DataBind();

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    deConfirmExpense += decimal.Parse(ds.Tables[0].Rows[i][1].ToString());
                }

                LB_Member.Text = strUserName;
                LB_ConfirmAmount.Text = deConfirmExpense.ToString();

                LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll + strUserCode + strUserName;
                LB_Sql.Text = strHQL;

                LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + Resources.lang.XMFYFBT;

                strHQL = @"Select A.ProjectID, A.Account as XName,SUM(A.ConfirmAmount) as YNumber,COALESCE(B.Amount,0) as ZNumber
                  From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account 
                      WHERE  A.ProjectID = " + strProjectID + " and A.UserCode = '" + strUserCode  + "' Group By A.ProjectID ,A.Account,B.Amount ";

                string strChartTitle = "ReportView";

                IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);
            }
        }
        catch
        {
        }
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deConfirmExpense = 0;
        string strHQL;

        string strProjectID = LB_ProjectID.Text.Trim();
        strHQL = "Select UserName,sum(ConfirmAmount) as AccountAmount from T_ProExpense ";
        strHQL += " where ProjectID = " + strProjectID + " Group By UserName";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");
        DataList1.DataSource = ds;
        DataList1.DataBind();


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deConfirmExpense += decimal.Parse(ds.Tables[0].Rows[i][1].ToString());
        }

        LB_Member.Text = Resources.lang.SuoYouChenYuan;

        LB_ConfirmAmount.Text = deConfirmExpense.ToString();

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;

        string strChartTitle = Resources.lang.XMFYYSFBT;
        strHQL = @"Select A.ProjectID, A.Account as XName,SUM(A.ConfirmAmount) as YNumber,COALESCE(B.Amount,0) as ZNumber
                  From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account 
                      WHERE  A.ProjectID = " + strProjectID + " Group By A.ProjectID ,A.Account,B.Amount ";

        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);
       
    }


    protected void LoadProjectBudget(string strProjectID)
    {
        string strHQL;
        IList lst;

        decimal deBudget = 0;

        strHQL = "From ProjectBudget as projectBudget Where projectBudget.ProjectID = " + strProjectID;
        ProjectBudgetBLL projectBudgetBLL = new ProjectBudgetBLL();
        lst = projectBudgetBLL.GetAllProjectBudgets(strHQL);

        ProjectBudget projectBudget = new ProjectBudget();

        for (int i = 0; i < lst.Count; i++)
        {
            projectBudget = (ProjectBudget)lst[i];
            deBudget += projectBudget.Amount;
        }

        LB_ProBudget.Text = deBudget.ToString();
    }



    protected decimal GetProjectAccountTotalAmount(string strProjectID, string strAccount)
    {
        string strHQL;

        strHQL = "Select Sum(ConfirmAmount) From T_ProExpense Where ProjectID = " + strProjectID + " and Account = " + "'" + strAccount + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
    }
    protected string GetProjectExpense(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(ConfirmAmount),0) From T_ProExpense Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");


        try
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch
        {
            return "0";
        }
    }

    protected Project GetProject(string strProjectID)
    {
        string strHQL;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project;
    }

}

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

using System.Text;
using System.IO;
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectExpenseApplyReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;
        IList lst;
        decimal deExpense = 0;

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        //this.Title = Resources.lang.Project + strProjectID + " " + strProjectName + " 经费申请汇总！";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedType = '项目'  and expenseApplyWL.RelatedID = " + strProjectID + " and expenseApplyWL.ApplicantCode = " + "'" + strUserCode + "'" + " Order by expenseApplyWL.ID DESC";
            ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
            lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            ExpenseApplyWL expenseApplyWL = new ExpenseApplyWL();
            for (int i = 0; i < lst.Count; i++)
            {
                expenseApplyWL = (ExpenseApplyWL)lst[i];
                deExpense += expenseApplyWL.Amount;
            }

            LB_Member.Text = Resources.lang.SuoYouChenYuan;
            LB_Amount.Text = deExpense.ToString();

            LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll + strUserCode + strUserName;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID, strID;
        string strUserCode, strUserName;
        decimal deExpense = 0;

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


                strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedType = '项目'  and expenseApplyWL.RelatedID = " + strProjectID + " and expenseApplyWL.ApplicantCode = " + "'" + strUserCode + "'" + " Order by expenseApplyWL.ID DESC";
                ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
                lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

                DataGrid2.DataSource = lst;
                DataGrid2.DataBind();

                ExpenseApplyWL expenseApplyWL = new ExpenseApplyWL();
                for (int i = 0; i < lst.Count; i++)
                {
                    expenseApplyWL = (ExpenseApplyWL)lst[i];
                    deExpense += expenseApplyWL.Amount;
                }

                LB_Member.Text = Resources.lang.SuoYouChenYuan;
                LB_Amount.Text = deExpense.ToString();

                LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll + strUserCode + strUserName;
                LB_Sql.Text = strHQL;

                LoadRelatedWL("费用申请", "项目", 0);
            }
        }
        catch
        {
        }
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;


            LoadRelatedWL("费用申请", "项目", int.Parse(strID));
        }
    }

    protected void LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deExpense = 0;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strHQL;
        IList lst;

        strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedType =  '项目'" + " and expenseApplyWL.RelatedID = " + strProjectID + "  Order by expenseApplyWL.ID DESC";
        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        ExpenseApplyWL expenseApplyWL = new ExpenseApplyWL();
        for (int i = 0; i < lst.Count; i++)
        {
            expenseApplyWL = (ExpenseApplyWL)lst[i];
            deExpense += expenseApplyWL.Amount;
        }

        LB_Member.Text = Resources.lang.SuoYouChenYuan;
        LB_Amount.Text = deExpense.ToString();

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;

        LoadRelatedWL("费用申请", "项目", 0);
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        LB_ProBudget.Text = project.Budget.ToString();
        string strProjectName = project.ProjectName.Trim();
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

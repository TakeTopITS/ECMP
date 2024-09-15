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

public partial class TTAllExpenseClaimSummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strHQL;
        IList lst;
        decimal deExpense = 0;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有费用报销", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from ExpenseClaim as expenseClaim where  expenseClaim.ApplicantCode = " + "'" + strUserCode + "'";
            strHQL += " and expenseClaim.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by expenseClaim.ECID DESC";
            ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
            lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql2.Text = strHQL;

            ExpenseClaim expenseClaim = new ExpenseClaim();
            for (int i = 0; i < lst.Count; i++)
            {
                expenseClaim = (ExpenseClaim)lst[i];
                deExpense += expenseClaim.Amount;
            }

            LB_Amount.Text = deExpense.ToString();

            LB_QueryScope.Text = Resources.lang.ZZZhiXingZhe + strUserCode + strUserName;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strHQL;
        IList lst;

        decimal deExpense = 0;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = GetDepartName(strDepartCode);

            LB_QueryScope.Text = Resources.lang.ZZZBuMen + strDepartName;

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);

            strHQL = "from ExpenseClaim as expenseClaim where expenseClaim.ApplicantCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ") Order by expenseClaim.ECID DESC";
            ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
            lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql2.Text = strHQL;

            ExpenseClaim expenseClaim = new ExpenseClaim();
            for (int i = 0; i < lst.Count; i++)
            {
                expenseClaim = (ExpenseClaim)lst[i];
                deExpense += expenseClaim.Amount;
            }

            LB_Amount.Text = deExpense.ToString();


            LB_QueryScope.Text = Resources.lang.ZZZBuMen + strDepartName;
            LB_Sql.Text = strHQL;

            LB_OperatorCode.Text = "";
            LB_OperatorName.Text = "";
            LB_Status.Text = "";

            LoadRelatedWL("费用报销", -1);
            LoadRelatedExpenseClaimDetail("-1");
        }


    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strUserName = GetUserName(strUserCode);

        decimal deExpense = 0;

        strHQL = "from ExpenseClaim as expenseClaim where  expenseClaim.ApplicantCode = " + "'" + strUserCode + "'" + " Order by expenseClaim.ECID DESC";
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;

        ExpenseClaim expenseClaim = new ExpenseClaim();
        for (int i = 0; i < lst.Count; i++)
        {
            expenseClaim = (ExpenseClaim)lst[i];
            deExpense += expenseClaim.Amount;
        }

        LB_Amount.Text = deExpense.ToString();

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZhe + strUserCode + " " + strUserName;
        LB_Sql.Text = strHQL;

        LoadRelatedWL("费用报销", -1);
        LoadRelatedExpenseClaimDetail("-1");
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[0].Text.Trim();

            for (int i = 0; i < DataGrid5.Items.Count; i++)
            {
                DataGrid5.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;


            LoadRelatedWL("费用报销", int.Parse(strID));
            LoadRelatedExpenseClaimDetail(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }



    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        IList lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deExpense = 0;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        string strDepartString = LB_DepartString.Text.Trim();
        strHQL = "from ExpenseClaim as expenseClaim where  expenseClaim.ApplicantCode = " + "'" + strUserCode + "'";
        strHQL += " and expenseClaim.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by expenseClaim.ECID DESC";
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;

        ExpenseClaim expenseClaim = new ExpenseClaim();
        for (int i = 0; i < lst.Count; i++)
        {
            expenseClaim = (ExpenseClaim)lst[i];
            deExpense += expenseClaim.Amount;
        }

        LB_Amount.Text = deExpense.ToString();

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;

        LoadRelatedWL("费用报销", -1);
        LoadRelatedExpenseClaimDetail("-1");
    }

    protected void LoadRelatedWL(string strWLType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadRelatedExpenseClaimDetail(string strECID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseClaimDetail as expenseClaimDetail where  expenseClaimDetail.ECID = " + strECID;
        ExpenseClaimDetailBLL expenseClaimDetailBLL = new ExpenseClaimDetailBLL();
        lst = expenseClaimDetailBLL.GetAllExpenseClaimDetails(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected string GetDepartName(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);

        Department department = (Department)lst[0];

        return department.DepartName.Trim();
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

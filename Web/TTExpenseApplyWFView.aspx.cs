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

public partial class TTExpenseApplyWFView : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strRelatedTitle = "";

        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == null | strRelatedID == null)
        {
            strRelatedType = "Other";
            strRelatedID = "0";
        }

        if (strRelatedType == "Other")
        {
            strRelatedType = "其它";
            strRelatedID = "0";
        }

        if (strRelatedType == "Project")
        {
            strRelatedType = "项目";
            strRelatedTitle = GetProjectName(strRelatedID);
        }

        if (strRelatedType == "Requirement")
        {
            strRelatedType = "需求";
            strRelatedTitle = GetRequirementName(strRelatedID);
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LoadExpenseApply(strUserCode);
        }
    }

    protected void BT_FindAOCode_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        decimal deExpense = 0;

        strHQL = "from ExpenseApplyWL as expenseApplyWL where ";
        strHQL += " expenseApplyWL.ApplicantCode = '" + strUserCode + "'";
        strHQL += " and expenseApplyWL.ID = " + TB_AOCode.Text.Trim();

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

        LB_Amount.Text = deExpense.ToString();
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        decimal deExpense = 0;

        string strAOName, strProjectName, strStatus;
        string strStartTime, strEndTime;

        strAOName = TB_ExpenseName.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        strProjectName = TB_ProjectName.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strHQL = "from ExpenseApplyWL as expenseApplyWL where ";
        strHQL += " expenseApplyWL.ExpenseName Like " + "'%" + strAOName + "%'";
        if (strProjectName != "")
        {
            strHQL += "And expenseApplyWL.RelatedType = '项目' and expenseApplyWL.RelatedID in (Select project.ProjectID From Project as project Where project.ProjectName Like " + "'%" + strProjectName + "%')";
        }

        strHQL += " And to_char( expenseApplyWL.ApplyTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char( expenseApplyWL.ApplyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and expenseApplyWL.Status Like " + "'%" + strStatus + "%'";
        strHQL += " And expenseApplyWL.ApplicantCode = '" + strUserCode + "'";
        strHQL += " Order by expenseApplyWL.ID DESC";

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

        LB_Amount.Text = deExpense.ToString();
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[0].Text.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LoadRelatedWL("费用申请", int.Parse(strID));

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void LoadRelatedWL(string strWLType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString();
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadExpenseApply(string strApplicantCode)
    {
        string strHQL;
        IList lst;
        decimal deExpense = 0;

        strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ApplicantCode = " + "'" + strApplicantCode + "'";
        strHQL += " Order by expenseApplyWL.ID DESC";
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


        LB_Amount.Text = deExpense.ToString();
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

    protected string GetRequirementName(string strReqID)
    {
        string strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();

        IList lst = requirementBLL.GetAllRequirements(strHQL);

        Requirement requirement = (Requirement)lst[0];

        return requirement.ReqName.Trim();
    }

}

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web.UI;

public partial class TTProExpenseView : System.Web.UI.Page
{
    string strProjectID, strTaskID, strRecordID, strQuestionID, strPlanID, strWorkflowID, strWorkflowStepDetailID, strTaskStatus, strProjectStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL = "";
        IList lst;

        string strUserCode, strUserName;

        Project project = new Project();

        strProjectID = Request.QueryString["ProjectID"];

        strTaskID = Request.QueryString["TaskID"];
        strRecordID = Request.QueryString["RecordID"];

        strQuestionID = Request.QueryString["QuestionID"];
        if (strQuestionID == null)
        {
            strQuestionID = "0";
        }

        strPlanID = Request.QueryString["PlanID"];
        if (strPlanID == null)
        {
            strPlanID = "0";
        }

        strWorkflowID = Request.QueryString["WorkflowID"];
        if (strWorkflowID == null)
        {
            strWorkflowID = "0";
        }

        strWorkflowStepDetailID = Request.QueryString["WorkflowStepDetailID"];
        if (strWorkflowStepDetailID == null)
        {
            strWorkflowStepDetailID = "0";
        }

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        if (Page.IsPostBack == false)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            if (strProjectID == null)
            {
                if (strTaskID != "0")
                {
                    strHQL = "from ProExpense as proExpense where  proExpense.TaskID = " + "'" + strTaskID + "'" + " order by proExpense.ID DESC";
                }

                if (strQuestionID != "0")
                {
                    strHQL = "from ProExpense as proExpense where  QuestionID = " + strQuestionID + " order by proExpense.ID DESC";
                }

                if (strWorkflowID != "0")
                {
                    strHQL = "from ProExpense as proExpense where  proExpense.WorkflowID in (Select workFlowStepDetail.ID From WorkFlowStepDetail as workFlowStepDetail Where workFlowStepDetail.WLID = " + strWorkflowID + ")";
                    strHQL += " order by proExpense.ID DESC";
                }

                if (strWorkflowStepDetailID != "0")
                {
                    strHQL = "from ProExpense as proExpense where  proExpense.WorkflowID = " + strWorkflowStepDetailID + " order by proExpense.ID DESC";
                }

                if (strPlanID != "0")
                {
                    strHQL = "from ProExpense as proExpense where  proExpense.PlanID = " + strPlanID + " order by proExpense.ID DESC";

                    if (ShareClass.CheckUserCanViewProjectPlan(strPlanID, strUserCode) == false)
                    {
                        Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZJHFZRCNJXZCZQJC + "'");
                    }
                }
            }
            else
            {
                strHQL = "from ProExpense as proExpense where  proExpense.ProjectID = " + "'" + strProjectID + "'" + " order by proExpense.ID DESC";
            }

            if (strHQL != "")
            {
                try
                {
                    ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
                    lst = proExpenseBLL.GetAllProExpenses(strHQL);

                    DataGrid1.DataSource = lst;
                    DataGrid1.DataBind();

                    decimal deTotalAmount = 0;
                    ProExpense proExpense;

                    for (int i = 0; i < lst.Count; i++)
                    {
                        proExpense = (ProExpense)lst[i];
                        deTotalAmount += proExpense.Amount;
                    }

                    LB_TotalAmount.Text = deTotalAmount.ToString();
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }
            }

        }
    }


}

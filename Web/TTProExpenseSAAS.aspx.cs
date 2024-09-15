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
using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProExpenseSAAS : System.Web.UI.Page
{
    string strProjectID, strTaskID, strRecordID, strQuestionID, strPlanID, strWorkflowStepDetailID, strTaskStatus, strProjectStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName, strProjectName;
        string strReviewType;
        decimal deExpense = 0, deConfirmExpense = 0;

        Project project = new Project();

        strProjectID = Request.QueryString["ProjectID"];
        if (strProjectID == null)
        {
            strProjectID = "1";
        }

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

        strWorkflowStepDetailID = Request.QueryString["WorkflowStepDetailID"];
        if (strWorkflowStepDetailID == null)
        {
            strWorkflowStepDetailID = "0";
        }

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        project = GetProject(strProjectID);
        strProjectName = project.ProjectName.Trim();
        strProjectStatus = project.Status.Trim();
        LB_ProBudget.Text = project.Budget.ToString();
        LB_CurrencyType.Text = project.CurrencyType.Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        if (Page.IsPostBack == false)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            DLC_EffectDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strReviewType = "费用报销";
            strReviewType = "%" + strReviewType + "%";
          

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);

            if (strTaskID != "0")
            {
                strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.TaskID = " + "'" + strTaskID + "'" + " and proExpense.UserCode = " + "'" + strUserCode + "'" + " order by proExpense.ID DESC";
            }
            else
            {
                if (strQuestionID != "0")
                {
                    strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'" + " and QuestionID = " + strQuestionID + " order by proExpense.ID DESC";
                }
                else
                {
                    if (strWorkflowStepDetailID != "0")
                    {
                        strHQL = "from ProExpense as proExpense where  proExpense.UserCode = " + "'" + strUserCode + "'" + " and proExpense.WorkflowID = " + strWorkflowStepDetailID + " order by proExpense.ID DESC";
                    }
                    else
                    {
                        if (strPlanID != "0")
                        {
                            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'" + " and proExpense.PlanID = " + strPlanID + " order by proExpense.ID DESC";
                        }
                        else
                        {
                            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'" + " order by proExpense.ID DESC";
                        }
                    }
                }
            }


            ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
            lst = proExpenseBLL.GetAllProExpenses(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            ProExpense proExpense = new ProExpense();
            for (int i = 0; i < lst.Count; i++)
            {
                proExpense = (ProExpense)lst[i];
                deExpense += proExpense.Amount;
                deConfirmExpense += proExpense.ConfirmAmount;
            }

            LB_Amount.Text = deExpense.ToString();
            LB_ConfirmAmount.Text = deConfirmExpense.ToString();

            LB_ProjectID.Text = strProjectID;
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;

            //把已在报销清单的记录表现为蓝色
            ColorClaimedExpenseRecord(-1);

            if (strTaskID != "0" & strTaskID != null)
            {
                strTaskStatus = GetProjectTaskStatus(strTaskID);
                if (strTaskStatus == "关闭")
                {
                    BT_New.Enabled = false;
                }
            }

            if (strProjectStatus == "结案" || strProjectStatus == "挂起" || strProjectStatus == "取消")
            {
                BT_New.Enabled = false;
            }

            LB_Sql.Text = strHQL;
            LoadProExpense(strHQL);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strRegisterDate;
            string strUserCode = LB_UserCode.Text.Trim();
            decimal deAmount;
            string strECID, strProjectTaskID, strFinancialStaffCode;
            string strStatus;
            int intWLNumber;

            string strID = e.Item.Cells[2].Text.Trim();

            strHQL = "from ProExpense as proExpense where proExpense.ID = " + strID;
            ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
            IList lst = proExpenseBLL.GetAllProExpenses(strHQL);
            ProExpense proExpense = (ProExpense)lst[0];

            if (e.CommandName == "Update")
            {
                LB_ID.Text = proExpense.ID.ToString();
                LB_ExpenseID.Text = proExpense.ID.ToString();
                lbl_AccountCode.Text = proExpense.AccountCode.Trim();
                TB_Account.Text = proExpense.Account.Trim();
                TB_Description.Text = proExpense.Description.Trim();
                DLC_EffectDate.Text = proExpense.EffectDate.ToString("yyyy-MM-dd");
                NB_Amount.Amount = proExpense.Amount;
                LB_CurrencyType.Text = proExpense.CurrencyType.Trim();
                strFinancialStaffCode = proExpense.FinancialStaffCode.Trim();

                //判断是否为任务费用     
                if (strTaskID != "0")
                {
                    strProjectTaskID = e.Item.Cells[8].Text.Trim();

                    try
                    {
                        strTaskStatus = GetProjectTaskStatus(strProjectTaskID);
                        if (strTaskStatus == "关闭")
                        {
                            //BT_New.Enabled = false;
                            //BT_Update.Enabled = false;
                            //BT_Delete.Enabled = false;
                        }
                    }
                    catch
                    {

                    }
                }
                else
                {
                    strProjectTaskID = e.Item.Cells[10].Text.Trim();
                    if (strProjectTaskID != "0")
                    {
                        strTaskStatus = GetProjectTaskStatus(strProjectTaskID);
                        if (strTaskStatus == "关闭")
                        {
                            BT_New.Enabled = false;

                            //BT_Update.Enabled = false;
                            //BT_Delete.Enabled = false;
                        }
                    }
                }

                if (strProjectStatus == "结案" || strProjectStatus == "挂起" || strProjectStatus == "取消")
                {
                    BT_New.Enabled = false;
                    //BT_Update.Enabled = false;
                    //BT_Delete.Enabled = false;

                    if (e.CommandName == "Claim")
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCXMYJAHGHXBNBXFYL + "')", true);
                    }
                }
                else
                {
                }

                if (GetExpenseClaimRecordCount(strID) > 0)
                {
                    //BT_Delete.Enabled = false;
                    //BT_Update.Enabled = false;
                }
                else
                {
                    //BT_Update.Enabled = true;
                    //BT_Delete.Enabled = true;
                }

                strRegisterDate = proExpense.RegisterDate.ToString("yyyyMMdd");
                if (strRegisterDate == DateTime.Now.ToString("yyyyMMdd") || strFinancialStaffCode == "")
                {
                    //BT_Update.Enabled = true;
                    //BT_Delete.Enabled = true;
                }
                else
                {
                    //BT_Update.Enabled = false;
                    //BT_Delete.Enabled = false;
                }


                //把已在报销清单的记录表现为蓝色
                ColorClaimedExpenseRecord(e.Item.ItemIndex);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strProjectID;

                strUserCode = proExpense.UserCode;
                strProjectID = proExpense.ProjectID.ToString();

                try
                {
                    proExpenseBLL.DeleteProExpense(proExpense);

                    LoadAndUpdateProExpense(LB_Sql.Text.Trim());

                    //BT_Delete.Enabled = false;
                    //BT_Update.Enabled = false;

                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ExpenseID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strExpenseID;

        strExpenseID = LB_ExpenseID.Text.Trim();

        if (strExpenseID == "")
        {
            AddExpense();
        }
        else
        {
            UpdateExpense();
        }
    }


    protected void AddExpense()
    {
        string strID;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_UserCode.Text.Trim();
        string strUserName = LB_UserName.Text.Trim();
        string strAccount = TB_Account.Text.Trim();
        string strDescription = TB_Description.Text.Trim();
        string strCurrencyType = LB_CurrencyType.Text.Trim();
        decimal deAmount = NB_Amount.Amount;

        DateTime dtEffectDate = DateTime.Parse(DLC_EffectDate.Text);

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        ProExpense proExpense = new ProExpense();

        proExpense.ProjectID = int.Parse(strProjectID);
        proExpense.TaskID = int.Parse(strTaskID);
        proExpense.RecordID = int.Parse(strRecordID);
        proExpense.QuestionID = int.Parse(strQuestionID);
        proExpense.PlanID = int.Parse(strPlanID);
        proExpense.WorkflowID = int.Parse(strWorkflowStepDetailID);

        proExpense.UserCode = strUserCode;
        proExpense.UserName = strUserName;
        proExpense.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
        proExpense.Account = strAccount;
        proExpense.Description = strDescription;
        proExpense.Amount = deAmount;

        proExpense.ConfirmAmount = deAmount;
        proExpense.CurrencyType = LB_CurrencyType.Text.Trim();
        proExpense.FinancialStaffCode = "";
        proExpense.FinancialStaffName = "";

        proExpense.EffectDate = dtEffectDate;
        proExpense.RegisterDate = DateTime.Now;

        if (strProjectID == "1" & strQuestionID == "0")
        {
            try
            {
                proExpenseBLL.AddProExpense(proExpense);
                strID = ShareClass.GetMyCreatedMaxProExpenseID(strProjectID, strUserCode);
                LB_ExpenseID.Text = strID;
                LB_ID.Text = strID;

                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;

                LoadAndUpdateProExpense(LB_Sql.Text.Trim());
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
            if (ShareClass.CheckProjectExpenseBudget(strProjectID, strAccount, deAmount) == false)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                return;
            }

            try
            {
                proExpenseBLL.AddProExpense(proExpense);
                strID = ShareClass.GetMyCreatedMaxProExpenseID(strProjectID, strUserCode);
                LB_ExpenseID.Text = strID;
                LB_ID.Text = strID;

                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;

                LoadAndUpdateProExpense(LB_Sql.Text.Trim());
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void UpdateExpense()
    {
        string strID, strHQL;
        IList lst;

        string strUserCode;
        string strProjectID, strAccount, strDescription;
        decimal deAmount;

        strID = LB_ID.Text;
        strAccount = TB_Account.Text.Trim();
        strDescription = TB_Description.Text.Trim();
        deAmount = NB_Amount.Amount;

        strHQL = "from ProExpense as proExpense where proExpense.ID = " + strID;
        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        lst = proExpenseBLL.GetAllProExpenses(strHQL);
        ProExpense proExpense = (ProExpense)lst[0];

        proExpense.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
        proExpense.Account = strAccount;
        proExpense.Description = strDescription;
        proExpense.Amount = deAmount;

        proExpense.ConfirmAmount = deAmount;
        proExpense.CurrencyType = LB_CurrencyType.Text.Trim();

        proExpense.EffectDate = DateTime.Parse(DLC_EffectDate.Text);
        strUserCode = proExpense.UserCode;
        strProjectID = proExpense.ProjectID.ToString();

        if (strProjectID == "1" & strQuestionID == "0")
        {
            try
            {
                proExpenseBLL.UpdateProExpense(proExpense, int.Parse(strID));
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGXCG + "')", true);

                LoadAndUpdateProExpense(LB_Sql.Text.Trim());

                strUserCode = proExpense.UserCode;
                strProjectID = proExpense.ProjectID.ToString();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGXSBJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
            if (ShareClass.CheckProjectExpenseBudget(strProjectID, strAccount, deAmount) == false)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                return;
            }

            try
            {
                proExpenseBLL.UpdateProExpense(proExpense, int.Parse(strID));
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                LoadAndUpdateProExpense(LB_Sql.Text.Trim());

                strUserCode = proExpense.UserCode;
                strProjectID = proExpense.ProjectID.ToString();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

 
    protected decimal getNewClaimAmount()
    {
        string strID;
        decimal deAmount = 0;
        ProExpense proExpense = new ProExpense();

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            if (((CheckBox)(DataGrid1.Items[i].FindControl("CB_IsClaimed"))).Checked == true & ((CheckBox)(DataGrid1.Items[i].FindControl("CB_IsClaimed"))).Enabled == true)
            {
                strID = DataGrid1.Items[i].Cells[2].Text.Trim();

                proExpense = GetProExpense(strID);

                if (GetExpenseClaimRecordCount(strID) == 0)
                {
                    deAmount += proExpense.Amount;
                }
            }
        }

        return deAmount;
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        IList lst = proExpenseBLL.GetAllProExpenses(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        //把已在报销清单的记录表现为蓝色
        ColorClaimedExpenseRecord(-1);
    }


    protected void LoadAndUpdateProExpense(string strHQL)
    {
        decimal deExpense = 0, deConfirmExpense = 0, deCurrentDayExpense = 0, deCurrentDayConfirmExpense = 0;
        decimal deTaskAssignRecordExpense = 0, deWorkFlowExpense = 0, dePlanExpense = 0;
        string strRegisterDate;
        string strUserCode = LB_UserCode.Text.Trim();

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        IList lst = proExpenseBLL.GetAllProExpenses(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ProExpense proExpense = new ProExpense();

        for (int i = 0; i < lst.Count; i++)
        {
            proExpense = (ProExpense)lst[i];
            deExpense += proExpense.Amount;
            deConfirmExpense += proExpense.ConfirmAmount;
            strRegisterDate = proExpense.RegisterDate.ToString("yyyy/MM/dd");

            if (strRegisterDate == DateTime.Now.ToString("yyyy/MM/dd"))
            {
                deCurrentDayExpense += proExpense.Amount;
                deCurrentDayConfirmExpense += proExpense.ConfirmAmount;
            }

            if (strRecordID != "0")
            {
                if (strRecordID == proExpense.RecordID.ToString())
                {
                    deTaskAssignRecordExpense += proExpense.ConfirmAmount;
                }
            }

            if (strPlanID != "0")
            {
                if (strPlanID == proExpense.PlanID.ToString())
                {
                    dePlanExpense += proExpense.ConfirmAmount;
                }
            }

            if (strWorkflowStepDetailID != "0")
            {
                if (strWorkflowStepDetailID == proExpense.WorkflowID.ToString())
                {
                    deWorkFlowExpense += proExpense.ConfirmAmount;
                }
            }
        }

        LB_CurrentDayAmount.Text = deCurrentDayExpense.ToString();
        LB_Amount.Text = deExpense.ToString();
        LB_ConfirmAmount.Text = deConfirmExpense.ToString();

        UpdateDailyExpense(strUserCode, strProjectID, deCurrentDayExpense, deCurrentDayConfirmExpense);

        if (strRecordID != "0")
        {
            UpdatedTaskAssignRecordCharge(strRecordID, deTaskAssignRecordExpense);
        }

        if (strTaskID != "0")
        {
            UpdateProjectTaskCharge(strTaskID);
        }

        if (strWorkflowStepDetailID != "0")
        {
            UpdateWorkFlowCharge(strWorkflowStepDetailID, deWorkFlowExpense);
        }

        if (strPlanID != "0")
        {
            strHQL = "Update T_ImplePlan Set Expense = " + (decimal.Parse(ShareClass.GetTotalRealExpenseByPlan(strPlanID)).ToString());
            strHQL += " Where PlanID = " + strPlanID;
            ShareClass.RunSqlCommand(strHQL);
        }

        //把已在报销清单的记录表现为蓝色
        ColorClaimedExpenseRecord(-1);
    }

    protected void UpdateDailyExpense(string strUserCode, string strProjectID, decimal DeCurrentDayAmount, decimal DeCurrentDayConfirmAmount)
    {
        string strHQL;
        IList lst;
        int intID;

        strHQL = "from DailyWork as dailyWork where dailyWork.UserCode = " + "'" + strUserCode + "'" + " and dailyWork.ProjectID = " + strProjectID + " and to_char(dailyWork.WorkDate,'yyyymmdd') = to_char(now(),'yyyymmdd')";
        DailyWorkBLL dailyWorkBLL = new DailyWorkBLL();
        lst = dailyWorkBLL.GetAllDailyWorks(strHQL);
        DailyWork dailyWork = new DailyWork();

        if (lst.Count == 0)
        {
            if (strUserCode == ShareClass.GetProjectPMCode(strProjectID))
            {
                dailyWork.Type = "主导";
            }
            else
            {
                dailyWork.Type = "参与";
            }
            dailyWork.UserCode = strUserCode;
            dailyWork.UserName = ShareClass.GetUserName(strUserCode);
            dailyWork.WorkDate = DateTime.Now;
            dailyWork.RecordTime = DateTime.Now;
            dailyWork.Address = "";
            dailyWork.ProjectID = int.Parse(strProjectID);
            dailyWork.ProjectName = ShareClass.GetProjectName(strProjectID);
            dailyWork.DailySummary = "输入项目相关费用";
            dailyWork.Achievement = "";
            dailyWork.Charge = DeCurrentDayAmount;
            dailyWork.ConfirmCharge = DeCurrentDayConfirmAmount;
            dailyWork.ManHour = 0;
            dailyWork.ConfirmManHour = 0;
            dailyWork.Salary = 0;
            dailyWork.FinishPercent = 0;
            dailyWork.Bonus = 0;
            dailyWork.ConfirmBonus = 0;
            dailyWork.Authority = "NO";

            try
            {
                dailyWorkBLL.AddDailyWork(dailyWork);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
        else
        {
            dailyWork = (DailyWork)lst[0];
            intID = dailyWork.WorkID;

            dailyWork.Charge = DeCurrentDayAmount;
            dailyWork.ConfirmCharge = DeCurrentDayConfirmAmount;

            try
            {
                dailyWorkBLL.UpdateDailyWork(dailyWork, intID);
            }
            catch
            {
            }
        }
    }

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        TB_Account.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

  

    protected void UpdateProjectPlanCharge(string strPlanID, decimal deExpense)
    {
        string strHQL;

        strHQL = "Update T_ImplePlan Set Expense = " + deExpense;
        strHQL += " Where PlanID = " + strPlanID;

        ShareClass.RunSqlCommand(strHQL);
    }

    protected void UpdateWorkFlowCharge(string strWLDetailID, decimal deExpense)
    {
        string strHQL;

        strHQL = "Update T_WorkFlowStepDetail Set Expense = " + deExpense.ToString();
        strHQL += " Where ID = " + strWLDetailID;
        ShareClass.RunSqlCommand(strHQL);

        strHQL = "Update T_WorkFlow Set Expense = " + getWorkFlowTotalCharge(strWLDetailID);
        strHQL += " Where WLID = " + getWorkFlowID(strWLDetailID);
        ShareClass.RunSqlCommand(strHQL);
    }

    protected string getWorkFlowTotalCharge(string strWLDetailID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Expense),0) From T_WorkFlowStepDetail Where WLID = " + getWorkFlowID(strWLDetailID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepdetail");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string getWorkFlowID(string strWLDetailID)
    {
        string strHQL;

        strHQL = "Select WLID From T_WorkFlowStepDetail Where ID = " + strWLDetailID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepdetail");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected void UpdatedTaskAssignRecordCharge(string strID, decimal deTaskAssignRecordExpense)
    {
        string strHQL;
        IList lst;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];

        taskAssignRecord.Expense = deTaskAssignRecordExpense;

        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));

            UpdateProjectTaskCharge(taskAssignRecord.TaskID.ToString());
        }
        catch
        {
        }
    }

    protected void UpdateProjectTaskCharge(string strTaskID)
    {
        string strHQL;

        string strTotalTaskExpense;

        strHQL = "Select COALESCE(Sum(Expense),0) From T_TaskAssignRecord Where TaskID = " + strTaskID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");

        strTotalTaskExpense = ds.Tables[0].Rows[0][0].ToString();

        strHQL = "Update T_ProjectTask Set Expense = " + strTotalTaskExpense + " Where TaskID = " + strTaskID;
        ShareClass.RunSqlCommand(strHQL);
    }

    protected void UPdateExpenseClaimStatus(string strECID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseClaim as expenseClaim where expenseClaim.ECID = " + strECID;
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);
        ExpenseClaim expenseClaim = (ExpenseClaim)lst[0];

        expenseClaim.Status = strStatus;

        try
        {
            expenseClaimBLL.UpdateExpenseClaim(expenseClaim, int.Parse(strECID));
        }
        catch
        {
        }
    }


    protected void LoadProExpense(string strHQL)
    {
        decimal deExpense = 0, deCurrentDayExpense = 0, deTaskAssignRecordExpense = 0;
        string strRegisterDate, strID;
        string strUserCode = LB_UserCode.Text.Trim();

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        IList lst = proExpenseBLL.GetAllProExpenses(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ProExpense proExpense = new ProExpense();

        for (int i = 0; i < lst.Count; i++)
        {
            proExpense = (ProExpense)lst[i];
            deExpense += proExpense.Amount;
            strRegisterDate = proExpense.RegisterDate.ToString("yyyy/MM/dd");
            strID = proExpense.RecordID.ToString();

            if (strRegisterDate == DateTime.Now.ToString("yyyy/MM/dd"))
            {
                deCurrentDayExpense += proExpense.ConfirmAmount;
            }

            if (strRecordID != "0" & strRecordID != null)
            {
                if (strRecordID == strID)
                {
                    deTaskAssignRecordExpense += proExpense.ConfirmAmount;
                }
            }
        }

        LB_CurrentDayAmount.Text = deCurrentDayExpense.ToString();
        LB_Amount.Text = deExpense.ToString();

        //UpdateDailyExpense(strUserCode, strProjectID, deCurrentDayExpense);

        if (strRecordID != "0" & strRecordID != null)
        {
            UpdatedTaskAssignRecordCharge(strRecordID, deTaskAssignRecordExpense);
        }

        //把已在报销清单的记录表现为蓝色
        ColorClaimedExpenseRecord(-1);
    }


    protected int GetExpenseClaimRecordCount(string strExpenseID)
    {
        string strHQL = "from ExpenseClaimDetail as expenseClaimDetail where expenseClaimDetail.RelatedType='项目' and expenseClaimDetail.RelatedExpenseID = " + strExpenseID;
        ExpenseClaimDetailBLL expenseClaimDetailBLL = new ExpenseClaimDetailBLL();
        IList lst = expenseClaimDetailBLL.GetAllExpenseClaimDetails(strHQL);

        return lst.Count;
    }

    protected void UPdateExpenseClaimAmount(string strECID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseClaim as expenseClaim where expenseClaim.ECID = " + strECID;
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);
        ExpenseClaim expenseClaim = (ExpenseClaim)lst[0];

        expenseClaim.Amount = deAmount;

        try
        {
            expenseClaimBLL.UpdateExpenseClaim(expenseClaim, int.Parse(strECID));
        }
        catch
        {
        }
    }

    protected decimal CountExpenseClaimAmount(string strECID)
    {
        string strHQL;
        IList lst;
        Decimal deAmount = 0, deTotalAmount = 0;

        strHQL = "from ExpenseClaimDetail as expenseClaimDetail where  expenseClaimDetail.ECID = " + strECID;
        ExpenseClaimDetailBLL expenseClaimDetailBLL = new ExpenseClaimDetailBLL();
        lst = expenseClaimDetailBLL.GetAllExpenseClaimDetails(strHQL);
        ExpenseClaimDetail expenseClaimDetail = new ExpenseClaimDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            expenseClaimDetail = (ExpenseClaimDetail)lst[i];
            deAmount = expenseClaimDetail.Amount;

            deTotalAmount += deAmount;
        }

        return deTotalAmount;
    }
    

    protected void ColorClaimedExpenseRecord(int intItemIndex)
    {
        string strID;

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            strID = DataGrid1.Items[i].Cells[2].Text.Trim();

            if (GetExpenseClaimRecordCount(strID) > 0)
            {
                DataGrid1.Items[i].ForeColor = Color.Green;

                ((CheckBox)(DataGrid1.Items[i].FindControl("CB_IsClaimed"))).Checked = true;
                ((CheckBox)(DataGrid1.Items[i].FindControl("CB_IsClaimed"))).Enabled = false;
            }
            else
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
        }

        if (intItemIndex > -1)
        {
            DataGrid1.Items[intItemIndex].ForeColor = Color.Red;
        }
    }

    protected int GetRelatedWorkFlowNumber(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }

    protected string GetWorkFlowStatus(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        WorkFlow workFlow = (WorkFlow)lst[0];

        return workFlow.Status.Trim();
    }

    protected Project GetProject(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project;
    }

    protected ProExpense GetProExpense(string strID)
    {
        string strHQL;

        strHQL = "from ProExpense as proExpense where proExpense.ID = " + strID;
        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        IList lst = proExpenseBLL.GetAllProExpenses(strHQL);
        ProExpense proExpense = (ProExpense)lst[0];

        return proExpense;
    }

    protected string GetProjectTaskStatus(string strTaskID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID= " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        ProjectTask projectTask = (ProjectTask)lst[0];

        return projectTask.Status.Trim();
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.Status.Trim();
    }

    protected string GetProjectTaskName(string strTaskId)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID= " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        ProjectTask projectTask = (ProjectTask)lst[0];

        return projectTask.Task.Trim();
    }

    protected string GetCustomerQuestionName(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        return customerQuestion.Question.Trim();
    }


}

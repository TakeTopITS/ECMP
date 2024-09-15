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

public partial class TTAPPExpenseApplyWF : System.Web.UI.Page
{
    string strUserCode;
    string strRelatedType, strRelatedID;

    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == null)
        {
            strRelatedType = "其它";
            strRelatedID = "0";
        }

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_PayBackTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);
            ShareClass.LoadCurrencyType(DL_CurrencyType);

            LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);

            ShareClass.LoadWFTemplate(strUserCode, "费用申请", DL_TemName);

            LB_RelatedType.Text = strRelatedType;
            LB_RelatedID.Text = strRelatedID;

            BT_SubmitApply.Enabled = false;
        }
    }

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        TB_Account.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        BT_New.Visible = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddEpense();
        }
        else
        {
            UpdateExpense();
        }
    }

    protected void AddEpense()
    {
        string strExpenseID, strExpenseName, strPurpose;
        DateTime dtPayBackTime;
        decimal deAmount, deBalanceAmount;

        strExpenseName = TB_ExpenseName.Text.Trim();
        strPurpose = TB_Purpose.Text.Trim();
        dtPayBackTime = DateTime.Parse(DLC_PayBackTime.Text);
        deAmount = NB_Amount.Amount;

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        string strAccountName = TB_Account.Text.Trim();
        deAmount = NB_Amount.Amount;

        //存在部门预算的话，判断预算是否足够
        if (ShareClass.IsBMBaseDataExits("", strDepartCode, strAccountName, DateTime.Now.Year, DateTime.Now.Month, strUserCode))
        {
            deBalanceAmount = ShareClass.GetBMBaseDataMoneyNum(strDepartCode, strAccountName, DateTime.Now.Year, DateTime.Now.Month, "基础") - deAmount;
            if (deBalanceAmount < 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGBMGNFYFYSBZQJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                return;
            }
        }


        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        ExpenseApplyWL expenseApplyWL = new ExpenseApplyWL();

        expenseApplyWL.RelatedType = strRelatedType;
        expenseApplyWL.RelatedID = int.Parse(strRelatedID);
        expenseApplyWL.ExpenseName = strExpenseName;
        expenseApplyWL.Purpose = strPurpose;
        expenseApplyWL.Amount = deAmount;
        expenseApplyWL.AccountCode = lbl_AccountCode.Text.Trim();
        expenseApplyWL.Account = TB_Account.Text.Trim();
        expenseApplyWL.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        expenseApplyWL.ApplyTime = DateTime.Now;
        expenseApplyWL.PayBackTime = dtPayBackTime;
        expenseApplyWL.ApplicantCode = strUserCode;
        expenseApplyWL.ApplicantName = ShareClass.GetUserName(strUserCode);
        expenseApplyWL.Status = "新建";

        try
        {
            expenseApplyWLBLL.AddExpenseApplyWL(expenseApplyWL);

            strExpenseID = ShareClass.GetMyCreatedMaxExpenseApplyWLID(strUserCode);
            LB_ID.Text = strExpenseID;

            LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);
            LoadRelatedWL("费用申请", "其它", int.Parse(strExpenseID));
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJSBKNFYMCHYTZSGDJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateExpense()
    {
        string strExpenseName, strPurpose;
        DateTime dtPayBackTime;
        decimal deAmount, deBalanceAmount;
        string strID;
        string strHQL;
        string strSatus;

        strID = LB_ID.Text.Trim();
        strExpenseName = TB_ExpenseName.Text.Trim();
        strPurpose = TB_Purpose.Text.Trim();
        dtPayBackTime = DateTime.Parse(DLC_PayBackTime.Text);
        deAmount = NB_Amount.Amount;
        strSatus = LB_Status.Text;

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        string strAccountName = TB_Account.Text.Trim();
        deAmount = NB_Amount.Amount;

        //存在部门预算的话，判断预算是否足够
        if (ShareClass.IsBMBaseDataExits("", strDepartCode, strAccountName, DateTime.Now.Year, DateTime.Now.Month, strUserCode))
        {
            deBalanceAmount = ShareClass.GetBMBaseDataMoneyNum(strDepartCode, strAccountName, DateTime.Now.Year, DateTime.Now.Month, "基础") - deAmount;
            if (deBalanceAmount < 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGBMGNFYFYSBZQJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                return;
            }
        }

        strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        IList lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

        ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];

        expenseApplyWL.ExpenseName = strExpenseName;
        expenseApplyWL.Purpose = strPurpose;
        expenseApplyWL.AccountCode = lbl_AccountCode.Text.Trim();
        expenseApplyWL.Account = TB_Account.Text.Trim();
        expenseApplyWL.Amount = deAmount;
        expenseApplyWL.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        expenseApplyWL.PayBackTime = dtPayBackTime;
        expenseApplyWL.Status = strSatus;

        try
        {
            expenseApplyWLBLL.UpdateExpenseApplyWL(expenseApplyWL, int.Parse(strID));
            LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("费用申请", "其它", strID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select * from T_ExpenseApplyWL where ID = " + strID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("费用申请", "其它", strID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }


    protected string SubmitApply()
    {
        string strExpenseName, strPurpose, strCmdText;
        DateTime dtPayBackTime;
        decimal deAmount;
        string strID, strXMLFileName, strXMLFile2;
        string strWLID, strTemName;

        strWLID = "0";

        strID = LB_ID.Text.Trim();
        strExpenseName = TB_ExpenseName.Text.Trim();
        strPurpose = TB_Purpose.Text.Trim();
        dtPayBackTime = DateTime.Parse(DLC_PayBackTime.Text);
        deAmount = NB_Amount.Amount;
        strTemName = DL_TemName.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
            return "0";
        }


        XMLProcess xmlProcess = new XMLProcess();

        string strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        IList lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

        ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];
        expenseApplyWL.ExpenseName = strExpenseName;
        expenseApplyWL.Purpose = strPurpose;
        expenseApplyWL.Amount = deAmount;
        expenseApplyWL.PayBackTime = dtPayBackTime;
        expenseApplyWL.Status = "处理中";

        try
        {
            expenseApplyWLBLL.UpdateExpenseApplyWL(expenseApplyWL, int.Parse(strID));

            strXMLFileName = "费用申请" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = strExpenseName;
            workFlow.WLType = "费用申请";
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
            workFlow.Description = expenseApplyWL.Purpose;
            workFlow.XMLFile = strXMLFile2;
            workFlow.RelatedType = "其它";
            workFlow.RelatedID = int.Parse(strID);
            workFlow.DIYNextStep = "Yes"; workFlow.IsPlanMainWorkflow = "NO";

            if (CB_SMS.Checked == true)
            {
                workFlow.ReceiveSMS = "Yes";
            }
            else
            {
                workFlow.ReceiveSMS = "No";
            }

            if (CB_Mail.Checked == true)
            {
                workFlow.ReceiveEMail = "Yes";
            }
            else
            {
                workFlow.ReceiveEMail = "No";
            }

            try
            {
                workFlowBLL.AddWorkFlow(workFlow);

                strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

                strCmdText = "select * from T_ExpenseApplyWL where ID = " + strID;

                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "T_ExpenseApplyWL", strXMLFile2);

                LoadRelatedWL("费用申请", "其它", int.Parse(strID));

                LB_Status.Text = "处理中";

                BT_SubmitApply.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFYSSCCG + "')", true);
            }
            catch
            {
                strWLID = "0";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFYSSCSBKNFYMCZSGDJC + "')", true);
            }

            LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);
        }
        catch
        {
            strWLID = "0";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location)", true);
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            string strID = e.Item.Cells[3].Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("费用申请", strRelatedType, strID);
            if (intWLNumber > 0)
            {
                BT_New.Visible = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_New.Visible = true;
                BT_SubmitApply.Enabled = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("费用申请", strRelatedType, strID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_New.Visible = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
                ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
                lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);
                ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];

                LB_ID.Text = strID;
                TB_ExpenseName.Text = expenseApplyWL.ExpenseName;
                TB_Purpose.Text = expenseApplyWL.Purpose;
                TB_Account.Text = expenseApplyWL.Account;
                lbl_AccountCode.Text = expenseApplyWL.AccountCode;
                NB_Amount.Amount = expenseApplyWL.Amount;
                DL_CurrencyType.SelectedValue = expenseApplyWL.CurrencyType;
                DLC_PayBackTime.Text = expenseApplyWL.PayBackTime.ToString("yyyy-MM-dd");
                LB_Status.Text = expenseApplyWL.Status.Trim();

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                }

                if (e.CommandName == "Assign")
                {
                    intWLNumber = GetRelatedWorkFlowNumber("费用申请", "其它", strID);
                    if (intWLNumber > 0)
                    {
                        BT_SubmitApply.Enabled = false;
                    }
                    else
                    {
                        BT_SubmitApply.Enabled = true;
                    }

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

                }
            }

            if (e.CommandName == "Delete")
            {

                intWLNumber = GetRelatedWorkFlowNumber("费用申请", "其它", strID);
                if (intWLNumber > 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCZGLDGZLJLBNSCJC + "')", true);
                    return;
                }

                strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
                ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
                lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

                ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];

                try
                {
                    expenseApplyWLBLL.DeleteExpenseApplyWL(expenseApplyWL);

                    LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);
                    LoadRelatedWL("费用申请", "其它", int.Parse(strID));
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        IList lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '费用申请'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strSatus;
        string strID;

        strID = LB_ID.Text.Trim();
        strSatus = LB_Status.Text;

        if (strID != "")
        {
            strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
            ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
            IList lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

            ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];

            expenseApplyWL.Status = strSatus;

            try
            {
                expenseApplyWLBLL.UpdateExpenseApplyWL(expenseApplyWL, int.Parse(strID));
                LoadExpenseApply(strUserCode, strRelatedType, strRelatedID);
            }
            catch
            {
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void LoadExpenseApply(string strApplicantCode, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedType = " + "'" + strRelatedType + "'" + " and expenseApplyWL.RelatedID = " + strRelatedID + " and expenseApplyWL.ApplicantCode = " + "'" + strApplicantCode + "'" + " Order by expenseApplyWL.ID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strWLBusinessID;
        }
        ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
        lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
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

    protected int GetRelatedWorkFlowNumber(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }
}

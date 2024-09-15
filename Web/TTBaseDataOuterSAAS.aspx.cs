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

public partial class TTBaseDataOuterSAAS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "基础数据(外置)", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadBarType();

            LoadTaskOperation();

            LoadUnit();
            LoadActorGroupType();

            LoadTaskType();
            LoadTaskRecordType();

            LoadSMSInterface();

            LoadCurrencyType();

            LoadDayHourNum();//一天工作时间设置

            LoadReceivePayWay();

            LoadBank();

            LoadCodeRule();

            NB_ScheduleLimitedDays.Amount = GetScheduleLimitedDays();

            NB_WeekendFirstDay.Amount = decimal.Parse(ShareClass.GetWeekendFirstDay());
            NB_WeekendSecondDay.Amount = decimal.Parse(ShareClass.GetWeekendSecondDay());
            DL_WeekendsAreWorkdays.SelectedValue = ShareClass.GetWeekendsAreWorkdays();
        }
    }

    protected void DL_BarType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strBarType;

        strBarType = DL_BarType.SelectedValue.Trim();

        try
        {
            strHQL = "Update T_BarType Set Type = '" + strBarType + "'";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJC + "')", true);
        }
    }
  
    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperation = ((Button)e.Item.FindControl("BT_Operation")).Text;
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_TaskOperation.Text = strOperation;
        TB_OperationSortNumber.Text = strSortNumber;
    }

    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUnitName = ((Button)e.Item.FindControl("BT_UnitName")).Text.Trim();
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_UnitName.Text = strUnitName;
        TB_UnitSort.Text = strSortNumber;
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strActorGroupType = ((Button)e.Item.FindControl("BT_ActorGroupType")).Text.Trim();
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_ActorGroupType.Text = strActorGroupType;
        TB_ActorGroupTypeSort.Text = strSortNumber;
    }

    protected void DataGrid18_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strType = ((Button)e.Item.FindControl("BT_TaskType")).Text;
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_TaskType.Text = strType;
        TB_TaskTypeSort.Text = strSortNumber;
    }

    protected void DataGrid19_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strType = ((Button)e.Item.FindControl("BT_TaskRecordType")).Text;
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_TaskRecordType.Text = strType;
        TB_TaskRecordTypeSort.Text = strSortNumber;
    }

    protected void DataGrid20_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
        string strSPName = e.Item.Cells[1].Text.Trim();
        string strSPInterface = e.Item.Cells[2].Text.Trim();
        string strStatus = e.Item.Cells[3].Text.Trim();

        LB_SMSInterfaceID.Text = strID;
        TB_SPName.Text = strSPName;
        TB_SPInterface.Text = strSPInterface;
        DL_SPInterfaceSTatus.SelectedValue = strStatus;
    }

    protected void DataGrid38_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strType = ((Button)e.Item.FindControl("BT_ReceivePayType")).Text.Trim();
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_ReceivePayType.Text = strType;
        TB_ReceivePayTypeSort.Text = strSortNumber;
    }

    protected void DataGrid39_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strBankName = ((Button)e.Item.FindControl("BT_BankName")).Text;
        string strSortNumber = e.Item.Cells[1].Text.Trim();

        TB_BankName.Text = strBankName;
        TB_BankSort.Text = strSortNumber;
    }

    protected void DataGrid44_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = ((Button)e.Item.FindControl("BT_CodeRuleID")).Text.Trim();

        string strHQL;

        strHQL = "Select CodeType,HeadChar,FieldName,FlowIDWidth,IsStartup From T_CodeRule Where ID = " + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CodeRule");

        LB_CodeRuleID.Text = strID;
        DL_CodeType.SelectedValue = ds.Tables[0].Rows[0][0].ToString().Trim();
        TB_HeadChar.Text = ds.Tables[0].Rows[0][1].ToString();
        DL_FieldRule.SelectedValue = ds.Tables[0].Rows[0][2].ToString().Trim();
        TB_FlowIDWidth.Text = ds.Tables[0].Rows[0][3].ToString();
        DL_IsStartup.SelectedValue = ds.Tables[0].Rows[0][4].ToString().Trim();
    }

    protected void LoadBarType()
    {
        string strHQL = "Select Type From T_BarType";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BarType");

        if (ds.Tables[0].Rows.Count > 0)
        {
            try
            {
                DL_BarType.SelectedValue = ds.Tables[0].Rows[0][0].ToString().Trim();
            }
            catch
            {

            }
        }

    }

    protected void LoadTaskOperation()
    {
        string strHQL = "from TaskOperation as taskOperation order by taskOperation.SortNumber ASC";
        TaskOperationBLL taskOperationBLL = new TaskOperationBLL();
        IList lst = taskOperationBLL.GetAllTaskOperations(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
    }

    protected void LoadUnit()
    {
        string strHQL = "from JNUnit as jnUnit Order by jnUnit.SortNumber ASC";
        JNUnitBLL jnUnitBLl = new JNUnitBLL();
        IList lst = jnUnitBLl.GetAllJNUnits(strHQL);

        DataGrid14.DataSource = lst;
        DataGrid14.DataBind();
    }

    protected void LoadActorGroupType()
    {
        string strHQL = "from ActorGroupType as actorGroupType Order by actorGroupType.SortNumber ASC";
        ActorGroupTypeBLL actorGroupTypeBLL = new ActorGroupTypeBLL();
        IList lst = actorGroupTypeBLL.GetAllActorGroupTypes(strHQL);

        DataGrid15.DataSource = lst;
        DataGrid15.DataBind();
    }

    protected void LoadTaskType()
    {
        string strHQl = "from TaskType as taskType order by taskType.SortNumber ASC";
        TaskTypeBLL taskTypeBLL = new TaskTypeBLL();
        IList lst = taskTypeBLL.GetAllTaskTypes(strHQl);

        DataGrid18.DataSource = lst;
        DataGrid18.DataBind();
    }

    protected void LoadTaskRecordType()
    {
        string strHQL = "from TaskRecordType as taskRecordType order by taskRecordType.SortNumber ASC";
        TaskRecordTypeBLL taskRecordTypeBLL = new TaskRecordTypeBLL();
        IList lst = taskRecordTypeBLL.GetAllTaskRecordTypes(strHQL);

        DataGrid19.DataSource = lst;
        DataGrid19.DataBind();
    }

    protected void LoadSMSInterface()
    {
        string strHQL;
        IList lst;

        strHQL = "From SMSInterface as smsInterface Order By smsInterface.ID ASC";
        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        lst = smsInterfaceBLL.GetAllSMSInterfaces(strHQL);

        DataGrid20.DataSource = lst;
        DataGrid20.DataBind();
    }


    protected void LoadCurrencyType()
    {
        string strHQL;
        IList lst;

        strHQL = "from CurrencyType as currencyType Order By currencyType.SortNo ASC";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        DataGrid35.DataSource = lst;
        DataGrid35.DataBind();
    }

    protected void BT_OperationNew_Click(object sender, EventArgs e)
    {
        string strOperation = TB_TaskOperation.Text.Trim();
        string strSortNumber = TB_OperationSortNumber.Text.Trim();

        TaskOperationBLL taskOperationBLL = new TaskOperationBLL();
        TaskOperation taskOperation = new TaskOperation();

        try
        {
            taskOperation.Operation = strOperation;
            taskOperation.SortNumber = int.Parse(strSortNumber);

            taskOperationBLL.AddTaskOperation(taskOperation);

            LoadTaskOperation();
        }
        catch
        {
        }

    }
    protected void BT_OperationDelete_Click(object sender, EventArgs e)
    {
        string strOperation = TB_TaskOperation.Text.Trim();
        string strSortNumber = TB_OperationSortNumber.Text.Trim();

        TaskOperationBLL taskOperationBLL = new TaskOperationBLL();
        TaskOperation taskOperation = new TaskOperation();

        try
        {
            taskOperation.Operation = strOperation;
            taskOperation.SortNumber = int.Parse(strSortNumber);

            taskOperationBLL.DeleteTaskOperation(taskOperation);

            LoadTaskOperation();
        }
        catch
        {
        }
    }

    protected void BT_UnitNew_Click(object sender, EventArgs e)
    {
        string strUnitName, strSortNumber;

        strUnitName = TB_UnitName.Text.Trim();
        strSortNumber = TB_UnitSort.Text.Trim();

        JNUnitBLL jnUnitBLL = new JNUnitBLL();
        JNUnit jnUnit = new JNUnit();

        try
        {
            jnUnit.UnitName = strUnitName;
            jnUnit.SortNumber = int.Parse(strSortNumber);

            jnUnitBLL.AddJNUnit(jnUnit);

            LoadUnit();
        }
        catch
        {
        }
    }

    protected void BT_UnitDelete_Click(object sender, EventArgs e)
    {
        string strUnitName, strSortNumber;

        strUnitName = TB_UnitName.Text.Trim();
        strSortNumber = TB_UnitSort.Text.Trim();

        JNUnitBLL jnUnitBLL = new JNUnitBLL();
        JNUnit jnUnit = new JNUnit();

        try
        {
            jnUnit.UnitName = strUnitName;
            jnUnit.SortNumber = int.Parse(strSortNumber);

            jnUnitBLL.DeleteJNUnit(jnUnit);

            LoadUnit();
        }
        catch
        {
        }

    }
    protected void BT_ActorGroupNew_Click(object sender, EventArgs e)
    {

        string strType, strSortNumber;

        strType = TB_ActorGroupType.Text.Trim();
        strSortNumber = TB_ActorGroupTypeSort.Text.Trim();

        ActorGroupType actorGroupType = new ActorGroupType();
        actorGroupType.Type = strType;
        actorGroupType.SortNumber = int.Parse(strSortNumber);

        try
        {
            ActorGroupTypeBLL actorGroupTypeBLL = new ActorGroupTypeBLL();
            actorGroupTypeBLL.AddActorGroupType(actorGroupType);

            LoadActorGroupType();
        }
        catch
        {
        }
    }
    protected void BT_ActorGroupDelete_Click(object sender, EventArgs e)
    {
        string strType, strSortNumber;

        strType = TB_ActorGroupType.Text.Trim();
        strSortNumber = TB_ActorGroupTypeSort.Text.Trim();

        ActorGroupType actorGroupType = new ActorGroupType();
        actorGroupType.Type = strType;
        actorGroupType.SortNumber = int.Parse(strSortNumber);

        try
        {
            ActorGroupTypeBLL actorGroupTypeBLL = new ActorGroupTypeBLL();
            actorGroupTypeBLL.DeleteActorGroupType(actorGroupType);

            LoadActorGroupType();
        }
        catch
        {
        }
    }

    protected void BT_TaskTypeNew_Click(object sender, EventArgs e)
    {
        string strType = TB_TaskType.Text.Trim();
        string strSortNumber = TB_TaskTypeSort.Text.Trim();

        TaskTypeBLL taskTypeBLL = new TaskTypeBLL();
        TaskType taskType = new TaskType();

        taskType.Type = strType;
        taskType.SortNumber = int.Parse(strSortNumber);

        try
        {

            taskTypeBLL.AddTaskType(taskType);
            LoadTaskType();
        }
        catch
        {
        }
    }
    protected void BT_TaskTypeDelete_Click(object sender, EventArgs e)
    {
        string strType = TB_TaskType.Text.Trim();
        string strSortNumber = TB_TaskTypeSort.Text.Trim();

        TaskTypeBLL taskTypeBLL = new TaskTypeBLL();
        TaskType taskType = new TaskType();

        taskType.Type = strType;
        taskType.SortNumber = int.Parse(strSortNumber);

        try
        {
            taskTypeBLL.DeleteTaskType(taskType);
            LoadTaskType();
        }
        catch
        {
        }
    }
    protected void BT_TaskRecordNew_Click(object sender, EventArgs e)
    {
        string strType = TB_TaskRecordType.Text.Trim();
        string strSortNumber = TB_TaskRecordTypeSort.Text.Trim();

        TaskRecordTypeBLL taskRecordTypeBLL = new TaskRecordTypeBLL();
        TaskRecordType taskRecordType = new TaskRecordType();

        taskRecordType.Type = strType;
        taskRecordType.SortNumber = int.Parse(strSortNumber);

        try
        {
            taskRecordTypeBLL.AddTaskRecordType(taskRecordType);
            LoadTaskRecordType();
        }
        catch
        {
        }
    }

    protected void BT_TaskRecordDelete_Click(object sender, EventArgs e)
    {
        string strType = TB_TaskRecordType.Text.Trim();
        string strSortNumber = TB_TaskRecordTypeSort.Text.Trim();

        TaskRecordTypeBLL taskRecordTypeBLL = new TaskRecordTypeBLL();
        TaskRecordType taskRecordType = new TaskRecordType();

        taskRecordType.Type = strType;
        taskRecordType.SortNumber = int.Parse(strSortNumber);

        try
        {
            taskRecordTypeBLL.DeleteTaskRecordType(taskRecordType);
            LoadTaskRecordType();
        }
        catch
        {
        }
    }

    protected void BT_AddSPInterface_Click(object sender, EventArgs e)
    {
        string strSPName, strSPInterface, strStatus;

        strSPName = TB_SPName.Text.Trim();
        strSPInterface = TB_SPInterface.Text.Trim();
        strStatus = DL_SPInterfaceSTatus.SelectedValue.Trim();

        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        SMSInterface smsInterface = new SMSInterface();

        smsInterface.SPName = strSPName;
        smsInterface.SPInterface = strSPInterface;
        smsInterface.Status = strStatus;

        try
        {
            smsInterfaceBLL.AddSMSInterface(smsInterface);

            LoadSMSInterface();
        }
        catch
        {
        }
    }

    protected void BT_DeleteSPInterface_Click(object sender, EventArgs e)
    {
        string strID, strSPName, strSPInterface, strStatus;

        strID = LB_SMSInterfaceID.Text.Trim();
        strSPName = TB_SPName.Text.Trim();
        strSPInterface = TB_SPInterface.Text.Trim();
        strStatus = DL_SPInterfaceSTatus.SelectedValue.Trim();

        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        SMSInterface smsInterface = new SMSInterface();

        smsInterface.ID = int.Parse(strID);
        smsInterface.SPName = strSPName;
        smsInterface.SPInterface = strSPInterface;
        smsInterface.Status = strStatus;

        try
        {
            smsInterfaceBLL.DeleteSMSInterface(smsInterface);

            LoadSMSInterface();
        }
        catch
        {
        }
    }

    protected void BT_ScheduleLimitedDaysUpdate_Click(object sender, EventArgs e)
    {
        string strHQL;
        int intLimitedDays;

        intLimitedDays = int.Parse(NB_ScheduleLimitedDays.Amount.ToString());


        try
        {
            strHQL = "Delete From T_ScheduleLimitedDays ";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_ScheduleLimitedDays(LimitedDays) Values(" + intLimitedDays.ToString() + ")";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void BT_WorkingDayRuleUpdate_Click(object sender, EventArgs e)
    {
        string strHQL;
        int intWeekendFirstDay, intWeekendSecondDay;
        string strWeekendsAreWorkdays;

        intWeekendFirstDay = int.Parse(NB_WeekendFirstDay.Amount.ToString());
        intWeekendSecondDay = int.Parse(NB_WeekendSecondDay.Amount.ToString());
        strWeekendsAreWorkdays = DL_WeekendsAreWorkdays.SelectedValue;

        if (intWeekendFirstDay < 0 | intWeekendFirstDay > 6 | intWeekendSecondDay < 0 | intWeekendSecondDay > 6)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存失败，周末开始日期，或结束日期不能大于6或小于0，请检查！')", true);
            return;
        }

        try
        {
            strHQL = "Delete From T_WorkingDayRule ";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_WorkingDayRule(WeekendFirstDay,WeekendSecondDay,WeekendsAreWorkdays) Values(" + intWeekendFirstDay.ToString() + "," + intWeekendSecondDay + ",'" + strWeekendsAreWorkdays + "')";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected int GetScheduleLimitedDays()
    {
        string strHQL;


        strHQL = "Select LimitedDays From T_ScheduleLimitedDays";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ScheduleLimitedDays");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }

    }

    protected void BT_AddReceivePayWay_Click(object sender, EventArgs e)
    {
        string strWay, strSortNumber;

        strWay = TB_ReceivePayType.Text.Trim();
        strSortNumber = TB_ReceivePayTypeSort.Text.Trim();

        ReceivePayWayBLL receivePayWayBLL = new ReceivePayWayBLL();
        ReceivePayWay receivePayWay = new ReceivePayWay();

        receivePayWay.Type = strWay;
        receivePayWay.SortNumber = int.Parse(strSortNumber);

        try
        {
            receivePayWayBLL.AddReceivePayWay(receivePayWay);
            LoadReceivePayWay();
        }
        catch
        {
        }
    }

    protected void BT_DeleteReceivePayWay_Click(object sender, EventArgs e)
    {
        string strWay, strSortNumber;

        strWay = TB_ReceivePayType.Text.Trim();
        strSortNumber = TB_ReceivePayTypeSort.Text.Trim();

        ReceivePayWayBLL receivePayWayBLL = new ReceivePayWayBLL();
        ReceivePayWay receivePayWay = new ReceivePayWay();

        receivePayWay.Type = strWay;
        receivePayWay.SortNumber = int.Parse(strSortNumber);

        try
        {
            receivePayWayBLL.DeleteReceivePayWay(receivePayWay);
            LoadReceivePayWay();
        }
        catch
        {
        }
    }


    protected void BT_AddBank_Click(object sender, EventArgs e)
    {
        string strBankName, strSortNumber;

        strBankName = TB_BankName.Text.Trim();
        strSortNumber = TB_BankSort.Text.Trim();

        BankBLL bankBLL = new BankBLL();
        Bank bank = new Bank();
        bank.BankName = strBankName;
        bank.SortNumber = int.Parse(strSortNumber);

        try
        {
            bankBLL.AddBank(bank);
            LoadBank();
        }
        catch
        {
        }
    }

    protected void BT_DeleteBank_Click(object sender, EventArgs e)
    {
        string strBankName, strSortNumber;

        strBankName = TB_BankName.Text.Trim();
        strSortNumber = TB_BankSort.Text.Trim();

        BankBLL bankBLL = new BankBLL();
        Bank bank = new Bank();
        bank.BankName = strBankName;
        bank.SortNumber = int.Parse(strSortNumber);

        try
        {
            bankBLL.DeleteBank(bank);
            LoadBank();
        }
        catch
        {
        }
    }

    protected bool IsOilTypeExits(string strP)
    {
        bool flag = true;
        string strHQL = " from OilType as OilType where OilType.OilName = '" + strP + "' ";
        OilTypeBLL OilTypeBLL = new OilTypeBLL();
        IList lst = OilTypeBLL.GetAllOilType(strHQL);
        if (lst.Count > 0)
        {
            flag = false;
        }
        else
            flag = true;

        return flag;
    }

    protected void BT_CodeRuleAdd_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strCodeType, strHeadChar, strFieldName, strIsStartup;
        int intFlowIDWidth;

        strCodeType = DL_CodeType.SelectedValue.Trim();
        strHeadChar = TB_HeadChar.Text.Trim();
        strFieldName = DL_FieldRule.SelectedValue.Trim();
        strIsStartup = DL_IsStartup.SelectedValue.Trim();

        try
        {
            intFlowIDWidth = int.Parse(TB_FlowIDWidth.Text.Trim());
        }
        catch
        {
            return;
        }

        strHQL = "Insert Into T_CodeRule(CodeType,HeadChar,FieldName,FlowIDWidth,IsStartup) Values(" + "'" + strCodeType + "'" + "," + "'" + strHeadChar + "'" + "," + "'" + strFieldName + "'" + "," + intFlowIDWidth.ToString() + "," + "'" + strIsStartup + "'" + ")";
        ShareClass.RunSqlCommand(strHQL);

        LoadCodeRule();

    }

    protected void BT_CodeRuleDelete_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strCodeRuleID;

        strCodeRuleID = LB_CodeRuleID.Text.Trim();

        strHQL = "Delete From T_CodeRule Where ID = " + strCodeRuleID;
        ShareClass.RunSqlCommand(strHQL);

        LoadCodeRule();
    }

    protected void LoadCodeRule()
    {
        string strHQL;

        strHQL = "Select * From T_CodeRule Order By ID ASc";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CodeRule");
        DataGrid44.DataSource = ds;
        DataGrid44.DataBind();
    }

    protected void DataGrid35_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strTypeName = ((Button)e.Item.FindControl("BT_CurrencyType")).Text.Trim();
        string strExchangeRate = e.Item.Cells[1].Text.Trim();
        string strSortNo = e.Item.Cells[2].Text.Trim();
        string strIsHome = e.Item.Cells[3].Text.Trim();

        TB_CurrencyType.Text = strTypeName;
        TB_ExchangeRate.Text = strExchangeRate;
        TB_CurrencyTypeSortNo.Text = strSortNo;
        DL_IsHomeCurrency.SelectedValue = strIsHome;
    }

    protected void BT_AddCurrencyType_Click(object sender, EventArgs e)
    {
        string strCurrencyType, strExchangeRate, strCurrencyTypeSortNo;

        strCurrencyType = TB_CurrencyType.Text.Trim();
        strExchangeRate = TB_ExchangeRate.Text.Trim();
        strCurrencyTypeSortNo = TB_CurrencyTypeSortNo.Text.Trim();

        if (!IsNumeric(strExchangeRate))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSRZDHLLXBXSSZJC + "')", true);
            TB_ExchangeRate.Focus();
            return;
        }
        if (!IsNumeric(strCurrencyTypeSortNo))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSRZDSXYDY0DZSJC + "')", true);
            TB_CurrencyTypeSortNo.Focus();
            return;
        }


        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        CurrencyType currencyType = new CurrencyType();

        try
        {
            currencyType.Type = strCurrencyType;
            currencyType.ExchangeRate = decimal.Parse(strExchangeRate);
            currencyType.SortNo = int.Parse(strCurrencyTypeSortNo);
            currencyType.IsHome = DL_IsHomeCurrency.SelectedValue.Trim();


            currencyTypeBLL.AddCurrencyType(currencyType);

            LoadCurrencyType();
        }
        catch
        {
        }
    }

    protected void BT_DeleteCurrencyType_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strCurrencyType;

        strCurrencyType = TB_CurrencyType.Text.Trim();

        try
        {
            strHQL = "Delete From T_CurrencyType Where Type = " + "'" + strCurrencyType + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadCurrencyType();
        }
        catch
        {
        }
    }

    /// <summary>
    /// 判断读者类型是否存在  存在返回true；不存在则返回false
    /// </summary>
    protected bool IsBookReaderType(string strtypename)
    {
        bool flag = true;
        string strHQL = "from WorkType as workType Where workType.TypeName='" + strtypename + "' ";
        WorkTypeBLL workTypeBLL = new WorkTypeBLL();
        IList lst = workTypeBLL.GetAllWorkType(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            flag = true;
        }
        else
            flag = false;
        return flag;
    }



    //判断输入的字符是否是数字
    private bool IsNumeric(string str)
    {
        System.Text.RegularExpressions.Regex reg1
            = new System.Text.RegularExpressions.Regex(@"^[-]?\d+[.]?\d*$");
        return reg1.IsMatch(str);
    }

    protected void LoadReceivePayWay()
    {
        string strHQL;
        IList lst;

        strHQL = "From ReceivePayWay as receivePayWay Order By receivePayWay.SortNumber ASC";
        ReceivePayWayBLL receivePayWayBLL = new ReceivePayWayBLL();
        lst = receivePayWayBLL.GetAllReceivePayWays(strHQL);

        DataGrid38.DataSource = lst;
        DataGrid38.DataBind();
    }

    protected void LoadBank()
    {
        string strHQL;
        IList lst;

        strHQL = "From Bank as bank Order By bank.SortNumber ASC";
        BankBLL bankBLL = new BankBLL();
        lst = bankBLL.GetAllBanks(strHQL);

        DataGrid39.DataSource = lst;
        DataGrid39.DataBind();
    }


    protected bool IsWeiXinStand(string strWeiXinNo)
    {
        bool flag = false;
        string strHQL = "From WeiXinStand as weiXinStand Where weiXinStand.WeiXinNo='" + strWeiXinNo + "' ";
        WeiXinStandBLL weiXinStandBLL = new WeiXinStandBLL();
        IList lst = weiXinStandBLL.GetAllWeiXinStands(strHQL);
        if (lst != null && lst.Count > 0)
            flag = true;

        return flag;
    }

    protected void LoadDayHourNum()
    {
        string strHQL = "Select * From T_DayHourNum Order By ID Asc ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DayHourNum");

        try
        {
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lbl_DayHourNumID.Text = ds.Tables[0].Rows[0]["ID"].ToString().Trim();
                TB_HourNum.Text = ds.Tables[0].Rows[0]["HourNum"].ToString().Trim();
                DL_StartHour.SelectedValue = ds.Tables[0].Rows[0]["StartTime"].ToString().Trim().Substring(0, 2);
                DL_StartMin.SelectedValue = ds.Tables[0].Rows[0]["StartTime"].ToString().Trim().Substring(3, 2);
                DL_EndHour.SelectedValue = ds.Tables[0].Rows[0]["EndTime"].ToString().Trim().Substring(0, 2);
                DL_EndMin.SelectedValue = ds.Tables[0].Rows[0]["EndTime"].ToString().Trim().Substring(3, 2);

                DL_RestStartTimeHour.SelectedValue = ds.Tables[0].Rows[0]["RestStartTime"].ToString().Trim().Substring(0, 2);
                DL_RestStartTimeMin.SelectedValue = ds.Tables[0].Rows[0]["RestStartTime"].ToString().Trim().Substring(3, 2);
                DL_RestEndTimeHour.SelectedValue = ds.Tables[0].Rows[0]["RestEndTime"].ToString().Trim().Substring(0, 2);
                DL_RestEndTimeMin.SelectedValue = ds.Tables[0].Rows[0]["RestEndTime"].ToString().Trim().Substring(3, 2);
            }
            else
            {
                lbl_DayHourNumID.Text = "";
                TB_HourNum.Text = "8";
                DL_StartHour.SelectedValue = "08";
                DL_StartMin.SelectedValue = "30";
                DL_EndHour.SelectedValue = "18";
                DL_EndMin.SelectedValue = "30";

                DL_RestStartTimeHour.SelectedValue = "12";
                DL_RestStartTimeMin.SelectedValue = "00";
                DL_RestEndTimeHour.SelectedValue = "14";
                DL_RestEndTimeMin.SelectedValue = "00";
            }
        }
        catch
        {

        }
    }

    protected void BT_DayHourNum_Click(object sender, EventArgs e)
    {
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        try
        {
            if (lbl_DayHourNumID.Text.Trim() == "")//增加
            {
                DayHourNum dayHourNum = new DayHourNum();

                dayHourNum.HourNum = decimal.Parse(TB_HourNum.Text.Trim() == "" ? "8" : TB_HourNum.Text.Trim());
                dayHourNum.EndTime = DL_EndHour.SelectedValue.Trim() + ":" + DL_EndMin.SelectedValue.Trim();
                dayHourNum.StartTime = DL_StartHour.SelectedValue.Trim() + ":" + DL_StartMin.SelectedValue.Trim();
                dayHourNum.RestStartTime = DL_RestStartTimeHour.SelectedValue.Trim() + ":" + DL_RestStartTimeMin.SelectedValue.Trim();
                dayHourNum.RestEndTime = DL_RestEndTimeHour.SelectedValue.Trim() + ":" + DL_RestEndTimeMin.SelectedValue.Trim();
                DateTime dt1 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.StartTime.Trim());
                DateTime dt2 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.EndTime.Trim());
                DateTime dt3 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.RestStartTime.Trim());
                DateTime dt4 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.RestEndTime.Trim());
                if (dt1 >= dt2)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYXYJSSJJC + "')", true);
                    return;
                }
                if (dt3 >= dt4)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD1YXYXXSD2JC + "')", true);
                    return;
                }
                if (dt3 < dt1)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD1BNXYKSSJJC + "')", true);
                    return;
                }
                if (dt4 > dt2)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD2BNDYJSSJJC + "')", true);
                    return;
                }
                TimeSpan ts1 = dt2.Subtract(dt1);
                TimeSpan ts2 = dt4.Subtract(dt3);
                if (double.Parse(dayHourNum.HourNum.ToString()) + ts2.TotalHours > ts1.TotalHours)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGZSJXXSJCCSBSJJC + "')", true);
                    return;
                }
                dayHourNumBLL.AddDayHourNum(dayHourNum);
                lbl_DayHourNumID.Text = GetDayHourNumID();
            }
            else//更新
            {
                string strHQL = "From DayHourNum as dayHourNum Where dayHourNum.ID='" + lbl_DayHourNumID.Text.Trim() + "' ";
                IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
                if (lst.Count > 0 && lst != null)
                {
                    DayHourNum dayHourNum = (DayHourNum)lst[0];
                    dayHourNum.HourNum = decimal.Parse(TB_HourNum.Text.Trim() == "" ? "8" : TB_HourNum.Text.Trim());
                    dayHourNum.EndTime = DL_EndHour.SelectedValue.Trim() + ":" + DL_EndMin.SelectedValue.Trim();
                    dayHourNum.StartTime = DL_StartHour.SelectedValue.Trim() + ":" + DL_StartMin.SelectedValue.Trim();
                    dayHourNum.RestStartTime = DL_RestStartTimeHour.SelectedValue.Trim() + ":" + DL_RestStartTimeMin.SelectedValue.Trim();
                    dayHourNum.RestEndTime = DL_RestEndTimeHour.SelectedValue.Trim() + ":" + DL_RestEndTimeMin.SelectedValue.Trim();
                    DateTime dt1 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.StartTime.Trim());
                    DateTime dt2 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.EndTime.Trim());
                    DateTime dt3 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.RestStartTime.Trim());
                    DateTime dt4 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + dayHourNum.RestEndTime.Trim());
                    if (dt1 >= dt2)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYXYJSSJJC + "')", true);
                        return;
                    }
                    if (dt3 >= dt4)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD1YXYXXSD2JC + "')", true);
                        return;
                    }
                    if (dt3 < dt1)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD1BNXYKSSJJC + "')", true);
                        return;
                    }
                    if (dt4 > dt2)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXSD2BNDYJSSJJC + "')", true);
                        return;
                    }
                    TimeSpan ts1 = dt2.Subtract(dt1);
                    TimeSpan ts2 = dt4.Subtract(dt3);
                    if (double.Parse(dayHourNum.HourNum.ToString()) + ts2.TotalHours > ts1.TotalHours)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGZSJXXSJCCSBSJJC + "')", true);
                        return;
                    }
                    dayHourNumBLL.UpdateDayHourNum(dayHourNum, dayHourNum.ID);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }

    }

    protected string GetDayHourNumID()
    {
        string flag = "0";
        string strHQL = "From DayHourNum as dayHourNum Order By dayHourNum.ID Desc ";
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            DayHourNum dayHourNum = (DayHourNum)lst[0];
            flag = dayHourNum.ID.ToString();
        }
        return flag;
    }

    protected void BT_WeiXinStand_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (TB_WeiXinNo.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('公众号AppID不能为空！')", true);
            TB_WeiXinNo.Focus();

            return;
        }

        string strWeiXinNo, strPassWord, strStatus;

        strWeiXinNo = TB_WeiXinNo.Text.Trim();
        strPassWord = TB_PassWord.Text.Trim();

        strStatus = DL_WeiXinGZHStatus.SelectedValue.Trim();

        try
        {
            strHQL = "Delete From T_WeiXinStand";
            ShareClass.RunSqlCommand(strHQL);

            WeiXinStandBLL weiXinStandBLL = new WeiXinStandBLL();
            WeiXinStand weiXinStand = new WeiXinStand();
            weiXinStand.WeiXinNo = TB_WeiXinNo.Text.Trim();
            weiXinStand.PassWord = TB_PassWord.Text.Trim();

            weiXinStand.Status = DL_WeiXinGZHStatus.SelectedValue.Trim();
            try
            {
                weiXinStandBLL.AddWeiXinStand(weiXinStand);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_WeChatQYSave_Click(object sender, EventArgs e)
    {
        if (TB_WeChatQYCorpID.Text.Trim() == "" || TB_WeChatQYApplicationID.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('企业号CordID和应用ID不能为空！')", true);
            TB_WeChatQYCorpID.Focus();
            TB_WeChatQYApplicationID.Focus();
            return;
        }

        string strHQL;

        string strCorpID, strSecret, strAppID, strStatus;

        strCorpID = TB_WeChatQYCorpID.Text.Trim();
        strSecret = TB_WeChatQYSecret.Text.Trim();
        strAppID = TB_WeChatQYApplicationID.Text.Trim();
        strStatus = DL_WeiXinQYHStatus.SelectedValue.Trim();

        try
        {
            strHQL = "Delete From T_WeiXinQYStand";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_WeiXinQYStand(CorpID,CorpSecret,AgentID,Status) values('" + strCorpID + "','" + strSecret + "','" + strAppID + "','" + strStatus + "')";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

}

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

public partial class TTOvertimeApplyFormWF : System.Web.UI.Page
{
    string strUserCode;
    ArrayList hour, m;
    int i;

    string strRelatedType, strRelatedID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        if (ShareClass.IsMobileDeviceCheckAgent() & Session["IsMobileDevice"].ToString() == "YES")
        {
            Response.Redirect("TTAPPOvertimeApplyFormWF.aspx");
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            InitialCalendar();
            LoadOvertimeType();
            LoadOvertimeApplyForm(strUserCode);

            ShareClass.LoadWFTemplate(strUserCode, "考勤管理", DL_TemName);

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = ShareClass.GetUserName(strUserCode);
            TB_Duty.Text = GetUserDuty(strUserCode);
            TB_DepartCode.Text = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            LB_DepartName.Text = ShareClass.GetDepartName(TB_DepartCode.Text.Trim());

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
        }
    }

    protected void RB_OvertimeType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strOvertimeType;
        strOvertimeType = RB_OvertimeType.SelectedValue.Trim();
        LB_OvertimeType.Text = strOvertimeType;

        LB_TotalOvertimeDaysForCurrentMonth.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
        LB_TotalOvertimeDaysForCurrentYear.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void LoadOvertimeType()
    {
        string strHQL;

        strHQL = "Select * From T_OvertimeType Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OvertimeType");

        RB_OvertimeType.Items.Clear();

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                RB_OvertimeType.Items.Add(new ListItem(string.Format("{0}", ds.Tables[0].Rows[i]["SortNumber"].ToString() + " " + ds.Tables[0].Rows[i]["Type"].ToString().Trim()), ds.Tables[0].Rows[i]["Type"].ToString().Trim()));
            }
        }
        else
        {
            RB_OvertimeType.Items.Add(new ListItem("-1 无加班类型", ""));
        }
    }

    protected string GetUserDuty(string strusercode)
    {
        string strHQL = "From ProjectMember as projectMember where projectMember.UserCode = '" + strusercode + "' ";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return string.IsNullOrEmpty(projectMember.Duty) ? "" : projectMember.Duty.Trim();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    //取得规定上班工作小时数
    protected decimal GetDayHourNumHour()
    {
        decimal flag = 8;
        string strHQL = "From DayHourNum as dayHourNum Order By dayHourNum.ID Asc ";
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
        if (lst != null && lst.Count > 0)
        {
            DayHourNum dayHourNum = (DayHourNum)lst[0];
            flag = dayHourNum.HourNum;
        }
        return flag;
    }

    //取得规定上班工作时间对象
    protected DayHourNum GetDayHourNum()
    {
        string strHQL = "From DayHourNum as dayHourNum Order By dayHourNum.ID Asc ";
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
        if (lst != null && lst.Count > 0)
        {
            DayHourNum dayHourNum = (DayHourNum)lst[0];
            return dayHourNum;
        }
        else
        {
            return null;
        }
    }


    /// <summary>
    /// 获取请假时间数(小时）
    /// </summary>
    /// <param name="starttime"></param>
    /// <param name="endtime"></param>
    /// <param name="strHourStand"></param>
    /// <returns></returns>
    protected decimal GetOvertimeApplyHours(DateTime dtStartTime, DateTime dtEndTime)
    {
        double ms = 0, restms = 0;
        DateTime dtRestStartTime, dtRestEndTime;

        TimeSpan ts = dtEndTime.Subtract(dtStartTime);
        ms = ts.TotalMinutes;

        DayHourNum dayHourNum = GetDayHourNum();
        if (dayHourNum != null)
        {
            dtRestStartTime = DateTime.Parse(DateTime.Parse(DLC_StartTime.Text).ToString("yyyy-MM-dd ") + dayHourNum.RestStartTime);
            dtRestEndTime = DateTime.Parse(DateTime.Parse(DLC_EndTime.Text).ToString("yyyy-MM-dd ") + dayHourNum.RestEndTime);
            restms = (dtRestEndTime.Subtract(dtRestStartTime)).TotalMinutes;

            if (dtEndTime <= dtRestEndTime || dtEndTime <= dtRestStartTime || dtStartTime >= dtRestEndTime || dtStartTime >= dtRestStartTime)
            {
                restms = 0;
            }
        }
        else
        {
            restms = 0;
        }

        return decimal.Parse(((ms - restms) / 60).ToString());
    }

    /// <summary>
    /// 获取时间点-基础数据
    /// </summary>
    /// <param name="strStartTime"></param>
    /// <param name="strEndTime"></param>
    /// <param name="strRestStartTime"></param>
    /// <param name="strRestEndTime"></param>
    /// <param name="strNow"></param>
    protected void GetDayHourNumTimes(ref DateTime strStartTime, ref DateTime strEndTime, ref DateTime strRestStartTime, ref DateTime strRestEndTime, DateTime strNow)
    {
        string strHQL = "From DayHourNum as dayHourNum Order By dayHourNum.ID Asc ";
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
        if (lst != null && lst.Count > 0)
        {
            DayHourNum dayHourNum = (DayHourNum)lst[0];
            strStartTime = DateTime.Parse(strNow.ToString("yyyy-MM-dd") + " " + dayHourNum.StartTime.Trim());
            strEndTime = DateTime.Parse(strNow.ToString("yyyy-MM-dd") + " " + dayHourNum.EndTime.Trim());
            strRestStartTime = DateTime.Parse(strNow.ToString("yyyy-MM-dd") + " " + dayHourNum.RestStartTime.Trim());
            strRestEndTime = DateTime.Parse(strNow.ToString("yyyy-MM-dd") + " " + dayHourNum.RestEndTime.Trim());
        }
        else
        {
            strRestEndTime = strRestStartTime = strEndTime = strStartTime = DateTime.Parse(strNow.ToString("yyyy-MM-dd") + " 00:00");
        }
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
            AddOvertime();
        }
        else
        {
            UpdateOvertime();
        }
    }

    protected void AddOvertime()
    {
        if (RB_OvertimeType.SelectedValue.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLXWBXBXBZYJLXKJC + "')", true);
            RB_OvertimeType.Focus();
            return;
        }
        if (DLC_StartTime.Text.Trim() == "" || DLC_EndTime.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYJSSJDBNWKJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }
        DateTime dtStartTime, dtEndTime;

        dtStartTime = DateTime.Parse(DateTime.Parse(DLC_StartTime.Text).ToString("yyyy-MM-dd ") + DL_StartTimeHour.SelectedValue + ":" + DL_StartTimeMinute.SelectedValue);
        dtEndTime = DateTime.Parse(DateTime.Parse(DLC_EndTime.Text).ToString("yyyy-MM-dd ") + DL_EndTimeHour.SelectedValue + ":" + DL_EndTimeMinute.SelectedValue);

        if (DLC_StartTime.Text.Trim() != DLC_EndTime.Text.Trim())
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，开始时间和结束时间必须是同一天，请检查！')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        if (dtEndTime < dtStartTime)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJBNDYJSSJJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        if (dtEndTime.Year != dtStartTime.Year & dtEndTime.Month != dtStartTime.Month)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，不能申请跨年和跨月的加班，请检查！')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        OvertimeApplyFormBLL overtimeApplyFormBLL = new OvertimeApplyFormBLL();
        OvertimeApplyForm overtimeApplyForm = new OvertimeApplyForm();

        overtimeApplyForm.DepartCode = TB_DepartCode.Text.Trim();
        overtimeApplyForm.DepartName = LB_DepartName.Text.Trim();
        overtimeApplyForm.ApplyBecause = TB_ApplyBecause.Text.Trim();
        overtimeApplyForm.CreateTime = string.IsNullOrEmpty(DLC_CreateTime.Text) ? DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd")) : DateTime.Parse(DLC_CreateTime.Text.Trim());
        overtimeApplyForm.Creator = strUserCode;
        overtimeApplyForm.Duty = TB_Duty.Text.Trim();
        overtimeApplyForm.EndTime = dtEndTime;
        overtimeApplyForm.OvertimeType = RB_OvertimeType.SelectedValue.Trim();
        overtimeApplyForm.StartTime = dtStartTime;
        overtimeApplyForm.UserName = LB_UserName.Text.Trim();
        overtimeApplyForm.Status = DL_Status.SelectedValue.Trim();

        //每天规定上班小时数
        decimal strHourStand = GetDayHourNumHour();

        overtimeApplyForm.HourNum = GetOvertimeApplyHours(dtStartTime, dtEndTime);

        overtimeApplyForm.DayNum = overtimeApplyForm.HourNum / strHourStand;

        try
        {
            overtimeApplyFormBLL.AddOvertimeApplyForm(overtimeApplyForm);
            LB_ID.Text = GetMyCreatedMaxOvertimeApplyFormID(overtimeApplyForm.Creator.Trim());

            LoadOvertimeApplyForm(strUserCode);

            LoadRelatedWL("考勤管理", "加班", int.Parse(LB_ID.Text.Trim()));

            string strOvertimeType;
            strOvertimeType = RB_OvertimeType.SelectedValue.Trim();
            LB_OvertimeType.Text = strOvertimeType;

            LB_TotalOvertimeDaysForCurrentMonth.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
            LB_TotalOvertimeDaysForCurrentYear.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected string GetMyCreatedMaxOvertimeApplyFormID(string strusercode)
    {
        string flag = "0";
        string strHQL = "Select Max(ID) From T_OvertimeApplyForm where Creator='" + strusercode + "' ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OvertimeApplyForm");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            flag = ds.Tables[0].Rows[0][0].ToString();
        }
        return flag;
    }

    protected void UpdateOvertime()
    {
        if (RB_OvertimeType.SelectedValue.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLXWBXBXBZYJLXKJC + "')", true);
            RB_OvertimeType.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }
        if (DLC_StartTime.Text.Trim() == "" || DLC_EndTime.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYJSSJDBNWKJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        DateTime dtStartTime, dtEndTime;

        dtStartTime = DateTime.Parse(DateTime.Parse(DLC_StartTime.Text).ToString("yyyy-MM-dd ") + DL_StartTimeHour.SelectedValue + ":" + DL_StartTimeMinute.SelectedValue);
        dtEndTime = DateTime.Parse(DateTime.Parse(DLC_EndTime.Text).ToString("yyyy-MM-dd ") + DL_EndTimeHour.SelectedValue + ":" + DL_EndTimeMinute.SelectedValue);

        if (DLC_StartTime.Text.Trim() != DLC_EndTime.Text.Trim())
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，开始时间和结束时间必须是同一天，请检查！')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        if (dtEndTime < dtStartTime)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJBNDYJSSJJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        if (dtEndTime.Year != dtStartTime.Year & dtEndTime.Month != dtStartTime.Month)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，不能申请跨年和跨月的加班，请检查！')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            return;
        }

        string strHQL = "from OvertimeApplyForm as overtimeApplyForm Where overtimeApplyForm.ID = '" + LB_ID.Text.Trim() + "' ";
        OvertimeApplyFormBLL overtimeApplyFormBLL = new OvertimeApplyFormBLL();
        IList lst = overtimeApplyFormBLL.GetAllOvertimeApplyForms(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            OvertimeApplyForm overtimeApplyForm = (OvertimeApplyForm)lst[0];

            overtimeApplyForm.DepartCode = TB_DepartCode.Text.Trim();
            overtimeApplyForm.DepartName = LB_DepartName.Text.Trim();
            overtimeApplyForm.ApplyBecause = TB_ApplyBecause.Text.Trim();
            overtimeApplyForm.CreateTime = string.IsNullOrEmpty(DLC_CreateTime.Text) ? DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd")) : DateTime.Parse(DLC_CreateTime.Text.Trim());
            overtimeApplyForm.Duty = TB_Duty.Text.Trim();
            overtimeApplyForm.EndTime = dtEndTime;
            overtimeApplyForm.OvertimeType = RB_OvertimeType.SelectedValue.Trim();
            overtimeApplyForm.StartTime = dtStartTime;
            overtimeApplyForm.UserName = LB_UserName.Text.Trim();
            overtimeApplyForm.Status = DL_Status.SelectedValue.Trim();
            decimal strHourStand = GetDayHourNumHour();

            overtimeApplyForm.HourNum = GetOvertimeApplyHours(dtStartTime, dtEndTime);

            overtimeApplyForm.DayNum = overtimeApplyForm.HourNum / strHourStand;

            try
            {
                overtimeApplyFormBLL.UpdateOvertimeApplyForm(overtimeApplyForm, overtimeApplyForm.ID);


                LoadOvertimeApplyForm(strUserCode);

                string strOvertimeType;
                strOvertimeType = RB_OvertimeType.SelectedValue.Trim();
                LB_OvertimeType.Text = strOvertimeType;

                LB_TotalOvertimeDaysForCurrentMonth.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                LB_TotalOvertimeDaysForCurrentYear.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("考勤管理", "加班", LB_ID.Text.Trim(), "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText = "select * from T_OvertimeApplyForm where ID = " + LB_ID.Text;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("考勤管理", "加班", LB_ID.Text.Trim());
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }
                        ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
    }

    protected string SubmitApply()
    {
        string strHQL, strCmdText;
        string strID, strWLID, strXMLFileName, strXMLFile2;
        string strTemName;

        strID = LB_ID.Text.Trim();
        strWLID = "0";

        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWLCMBBNWKJC + "')", true);
            return strWLID;
        }

        XMLProcess xmlProcess = new XMLProcess();

        strHQL = "Update T_OvertimeApplyForm Set Status = '处理中' Where ID = " + strID;

        //try
        //{
        ShareClass.RunSqlCommand(strHQL);

        strXMLFileName = "加班申请" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        WorkFlow workFlow = new WorkFlow();

        workFlow.WLName = strUserCode + ShareClass.GetUserName(strUserCode) + " 的加班申请";
        workFlow.WLType = "考勤管理";
        workFlow.Status = "新建";
        workFlow.TemName = DL_TemName.SelectedValue.Trim();
        workFlow.CreateTime = DateTime.Now;
        workFlow.CreatorCode = strUserCode;
        workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
        workFlow.Description = TB_ApplyBecause.Text.Trim();
        workFlow.XMLFile = strXMLFile2;

        if (strRelatedType != "" & strRelatedType != null)
        {
            workFlow.RelatedType = strRelatedType;
            workFlow.RelatedID = int.Parse(strRelatedID);
        }
        else
        {
            workFlow.RelatedType = "加班";
            workFlow.RelatedID = int.Parse(strID);
        }

        workFlow.RelatedCode = "OvertimeApply" + strID;
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

        //try
        //{
        workFlowBLL.AddWorkFlow(workFlow);
        strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

        strCmdText = "select * from T_OvertimeApplyForm where ID = " + strID;

        strXMLFile2 = Server.MapPath(strXMLFile2);
        xmlProcess.DbToXML(strCmdText, "T_OvertimeApplyForm", strXMLFile2);

        LoadRelatedWL("考勤管理", "加班", int.Parse(LB_ID.Text.Trim()));

        DL_Status.SelectedValue = "处理中";

        //BT_Update.Visible = false;
        //BT_Delete.Visible = false;

        BT_SubmitApply.Enabled = false;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJBSCCG + "')", true);
        //}
        //catch
        //{
        //    strWLID = "0";

        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSSCSBKNSMCZSGDJC + "')", true);
        //}

        LoadOvertimeApplyForm(strUserCode);
        //}
        //catch
        //{
        //    strWLID = "0";
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        //}

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
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

            int intWLNumber = LoadRelatedWL("考勤管理", "加班", int.Parse(strID));
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("考勤管理", "加班", strID, "0");
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

                strHQL = "from OvertimeApplyForm as overtimeApplyForm Where overtimeApplyForm.ID = " + strID;
                OvertimeApplyFormBLL overtimeApplyFormBLL = new OvertimeApplyFormBLL();
                lst = overtimeApplyFormBLL.GetAllOvertimeApplyForms(strHQL);
                OvertimeApplyForm overtimeApplyForm = (OvertimeApplyForm)lst[0];

                LB_ID.Text = strID;
                TB_DepartCode.Text = overtimeApplyForm.DepartCode.Trim();
                LB_UserCode.Text = overtimeApplyForm.Creator.Trim();
                LB_UserName.Text = overtimeApplyForm.UserName.Trim();
                RB_OvertimeType.SelectedValue = overtimeApplyForm.OvertimeType.Trim();
                DLC_StartTime.Text = overtimeApplyForm.StartTime.ToString("yyyy-MM-dd");
                DL_StartTimeHour.SelectedValue = overtimeApplyForm.StartTime.Hour.ToString();
                DL_StartTimeMinute.SelectedValue = overtimeApplyForm.StartTime.Minute.ToString();
                DLC_EndTime.Text = overtimeApplyForm.EndTime.ToString("yyyy-MM-dd");
                DL_EndTimeHour.SelectedValue = overtimeApplyForm.EndTime.Hour.ToString();
                DL_EndTimeMinute.SelectedValue = overtimeApplyForm.EndTime.Minute.ToString();
                TB_ApplyBecause.Text = overtimeApplyForm.ApplyBecause.Trim();
                DL_Status.SelectedValue = overtimeApplyForm.Status.Trim();
                DLC_CreateTime.Text = overtimeApplyForm.CreateTime.ToString("yyyy-MM-dd");
                TB_Duty.Text = overtimeApplyForm.Duty.Trim();
                LB_DepartName.Text = overtimeApplyForm.DepartName.Trim();

                LoadRelatedWL("考勤管理", "加班", int.Parse(LB_ID.Text.Trim()));

                string strOvertimeType;
                strOvertimeType = RB_OvertimeType.SelectedValue.Trim();
                LB_OvertimeType.Text = strOvertimeType;

                LB_TotalOvertimeDaysForCurrentMonth.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                LB_TotalOvertimeDaysForCurrentYear.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

                }
            }

            if (e.CommandName == "Delete")
            {
                if (intWLNumber > 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCZGLDGZLJLBNSCJC + "')", true);
                    return;
                }

                strHQL = "Delete from T_OvertimeApplyForm where ID='" + strID + "' ";

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    BT_New.Visible = false;
                    BT_SubmitApply.Enabled = false;

                    LoadOvertimeApplyForm(strUserCode);

                    string strOvertimeType;
                    strOvertimeType = RB_OvertimeType.SelectedValue.Trim();
                    LB_OvertimeType.Text = strOvertimeType;

                    LB_TotalOvertimeDaysForCurrentMonth.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                    LB_TotalOvertimeDaysForCurrentYear.Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
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

        OvertimeApplyFormBLL overtimeApplyFormBLL = new OvertimeApplyFormBLL();
        IList lst = overtimeApplyFormBLL.GetAllOvertimeApplyForms(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '考勤管理'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strSatus;
        string strID;

        strID = LB_ID.Text.Trim();
        strSatus = DL_Status.SelectedValue.Trim();

        if (strID != "")
        {
            strHQL = "Update T_OvertimeApplyForm Set Status = " + "'" + strSatus + "'" + " where ID = " + strID;

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadOvertimeApplyForm(strUserCode);
            }
            catch
            {
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

   

    protected void LoadOvertimeApplyForm(string strusercode)
    {
        string strHQL = "From OvertimeApplyForm as overtimeApplyForm Where overtimeApplyForm.Creator = '" + strusercode + "' Order By overtimeApplyForm.ID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "From OvertimeApplyForm as overtimeApplyForm Where overtimeApplyForm.ID = " + strWLBusinessID;
        }
        OvertimeApplyFormBLL overtimeApplyFormBLL = new OvertimeApplyFormBLL();
        IList lst = overtimeApplyFormBLL.GetAllOvertimeApplyForms(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
        LB_Sql.Text = strHQL;
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


    protected int LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        return lst.Count;
    }

    protected void InitialCalendar()
    {
        hour = new ArrayList();
        m = new ArrayList();

        for (i = 0; i <= 23; i++)
            hour.Add(i.ToString());
        for (i = 00; i <= 59; i++)
            m.Add(i.ToString());

        DL_StartTimeHour.DataSource = hour;
        DL_StartTimeHour.DataBind();
        DL_StartTimeHour.Text = System.DateTime.Now.Hour.ToString();

        DL_StartTimeMinute.DataSource = m;
        DL_StartTimeMinute.DataBind();
        DL_StartTimeMinute.Text = System.DateTime.Now.Minute.ToString();

        DL_EndTimeHour.DataSource = hour;
        DL_EndTimeHour.DataBind();
        DL_EndTimeHour.Text = System.DateTime.Now.Hour.ToString();

        DL_EndTimeMinute.DataSource = m;
        DL_EndTimeMinute.DataBind();
        DL_EndTimeMinute.Text = System.DateTime.Now.Minute.ToString();
    }

    //取得此员工当年的此类型的请假天数
    protected string GetTotalOvertimeDayNumberInCurrentYear(string strOvertimeType, string strApplicantCode)
    {
        string strHQL;

        strHQL = "Select COALESCE(sum(DayNum),0) From T_OvertimeApplyForm Where SUBSTRING (to_char( StartTime, 'yyyymmdd'), 1, 4) = SUBSTRING(to_char( now(), 'yyyymmdd'), 1, 4)";
        strHQL += " And OvertimeType = '" + strOvertimeType + "'";
        strHQL += " And Creator = '" + strApplicantCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OvertimeApplyForm");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }
}
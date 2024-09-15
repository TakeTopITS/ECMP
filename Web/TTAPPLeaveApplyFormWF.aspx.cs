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

public partial class TTAPPLeaveApplyFormWF : System.Web.UI.Page
{
    string strUserCode;
    ArrayList hour, m;
    int i;

    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID= Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            InitialCalendar();
            LoadLeaveType();
            LoadLeaveApplyForm(strUserCode);

            ShareClass.LoadWFTemplate(strUserCode, "考勤管理", DL_TemName);

            TB_Duty.Text = GetUserDuty(strUserCode);
            TB_DepartCode.Text = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            LB_DepartName.Text = ShareClass.GetDepartName(TB_DepartCode.Text.Trim());

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
        }
    }

    protected void RB_LeaveType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strLeaveType;
        strLeaveType = RB_LeaveType.SelectedValue.Trim();
        LB_LeaveType.Text = strLeaveType;

        LB_TotalLeaveDaysForCurrentMonth.Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
        LB_TotalLeaveDaysForCurrentYear.Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void LoadLeaveType()
    {
        string strHQL;
        IList lst;

        strHQL = "From LeaveType as leaveType Order By leaveType.SortNumber ASC";
        LeaveTypeBLL leaveTypeBLL = new LeaveTypeBLL();
        lst = leaveTypeBLL.GetAllLeaveTypes(strHQL);
        RB_LeaveType.Items.Clear();
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                LeaveType leaveType = (LeaveType)lst[i];
                RB_LeaveType.Items.Add(new ListItem(string.Format("{0}", leaveType.SortNumber.ToString() + " " + leaveType.Type.Trim()), leaveType.Type.Trim()));
            }
        }
        else
        {
            RB_LeaveType.Items.Add(new ListItem("-1 无考勤流程", ""));
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

    protected decimal GetDayHourNum()
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

    /// <summary>
    /// 获取请假时间数
    /// </summary>
    /// <param name="starttime"></param>
    /// <param name="endtime"></param>
    /// <param name="strHourStand"></param>
    /// <returns></returns>
    protected decimal GetLeaveApplyHours(DateTime starttime, DateTime endtime, decimal strHourStand)
    {
        decimal hs = 0;
        TimeSpan ts = endtime.Subtract(starttime);
        double days = ts.TotalDays;
        if (days > 1)
        {
            #region [超过24小时]
            int num = (int)days;
            if (num == days)
            {
                hs += num * strHourStand;
            }
            else
            {
                hs += num * strHourStand;
                DateTime dt1 = starttime.AddDays(num);
                DateTime strStartTime = dt1, strEndTime = dt1, strRestStartTime = dt1, strRestEndTime = dt1;
                GetDayHourNumTimes(ref strStartTime, ref strEndTime, ref strRestStartTime, ref strRestEndTime, endtime);
                if (strEndTime.Subtract(strStartTime).TotalMinutes == 0 && strRestStartTime.Subtract(strStartTime).TotalMinutes == 0 && strRestEndTime.Subtract(strRestStartTime).TotalMinutes == 0)
                {
                }
                else
                {
                    if (dt1.ToString("yyyy-MM-dd") == endtime.ToString("yyyy-MM-dd"))
                    {
                        #region [同一天]
                        if (endtime <= strEndTime && endtime > strRestEndTime)
                        {
                            if (dt1 > strRestEndTime && dt1 <= strEndTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString());
                            }
                            else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 <= strStartTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                            }
                        }
                        else if (endtime <= strRestEndTime && endtime > strRestStartTime)
                        {
                            if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                            {
                            }
                            else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                            {
                                hs += decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 <= strStartTime)
                            {
                                hs += decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                            }
                        }
                        else if (endtime <= strRestStartTime && endtime > strStartTime)
                        {
                            if (dt1 > strStartTime && dt1 <= strRestStartTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 <= strStartTime)
                            {
                                hs += decimal.Parse(endtime.Subtract(strStartTime).TotalHours.ToString());
                            }
                        }
                        else if (endtime > strEndTime)
                        {
                            if (dt1 > strEndTime)
                            {
                            }
                            else if (dt1 > strRestEndTime && dt1 <= strEndTime)
                            {
                                hs += decimal.Parse(strEndTime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                            {
                                hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString());
                            }
                            else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                            {
                                hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                            }
                            else if (dt1 <= strStartTime)
                            {
                                hs += strHourStand;
                            }
                        }
                        #endregion
                    }
                    else
                    {
                        #region [非一天]
                        if (endtime <= strEndTime && endtime > strRestEndTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                        }
                        else if (endtime <= strRestEndTime && endtime > strRestStartTime)
                        {
                            hs += decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                        }
                        else if (endtime <= strRestStartTime && endtime > strStartTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strStartTime).TotalHours.ToString());
                        }
                        else if (endtime > strEndTime)
                        {
                            hs += strHourStand;
                        }
                        else if (endtime < strStartTime)
                        {
                        }

                        GetDayHourNumTimes(ref strStartTime, ref strEndTime, ref strRestStartTime, ref strRestEndTime, dt1);
                        if (dt1 > strRestEndTime && dt1 <= strEndTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString());
                        }
                        else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 <= strStartTime)
                        {
                            hs += strHourStand;
                        }
                        else if (dt1 > strEndTime)
                        {
                        }
                        #endregion
                    }
                }
            }
            #endregion
        }
        else
        {
            #region [不超过24小时]
            DateTime strStartTime = starttime, strEndTime = starttime, strRestStartTime = starttime, strRestEndTime = starttime, dt1 = starttime;
            GetDayHourNumTimes(ref strStartTime, ref strEndTime, ref strRestStartTime, ref strRestEndTime, endtime);
            if (strEndTime.Subtract(strStartTime).TotalMinutes == 0 && strRestStartTime.Subtract(strStartTime).TotalMinutes == 0 && strRestEndTime.Subtract(strRestStartTime).TotalMinutes == 0)
            {
            }
            else
            {
                if (dt1.ToString("yyyy-MM-dd") == endtime.ToString("yyyy-MM-dd"))
                {
                    #region [同一天]
                    if (endtime <= strEndTime && endtime > strRestEndTime)
                    {
                        if (dt1 > strRestEndTime && dt1 <= strEndTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString());
                        }
                        else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 <= strStartTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                        }
                    }
                    else if (endtime <= strRestEndTime && endtime > strRestStartTime)
                    {
                        if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                        {
                        }
                        else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                        {
                            hs += decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 <= strStartTime)
                        {
                            hs += decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                        }
                    }
                    else if (endtime <= strRestStartTime && endtime > strStartTime)
                    {
                        if (dt1 > strStartTime && dt1 <= strRestStartTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 <= strStartTime)
                        {
                            hs += decimal.Parse(endtime.Subtract(strStartTime).TotalHours.ToString());
                        }
                    }
                    else if (endtime > strEndTime)
                    {
                        if (dt1 > strEndTime)
                        {
                        }
                        else if (dt1 > strRestEndTime && dt1 <= strEndTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString());
                        }
                        else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                        {
                            hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                        }
                        else if (dt1 <= strStartTime)
                        {
                            hs += strHourStand;
                        }
                    }
                    #endregion
                }
                else
                {
                    #region [非一天]
                    if (endtime <= strEndTime && endtime > strRestEndTime)
                    {
                        hs += decimal.Parse(endtime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                    }
                    else if (endtime <= strRestEndTime && endtime > strRestStartTime)
                    {
                        hs += decimal.Parse(strRestStartTime.Subtract(strStartTime).TotalHours.ToString());
                    }
                    else if (endtime <= strRestStartTime && endtime > strStartTime)
                    {
                        hs += decimal.Parse(endtime.Subtract(strStartTime).TotalHours.ToString());
                    }
                    else if (endtime > strEndTime)
                    {
                        hs += strHourStand;
                    }
                    else if (endtime < strStartTime)
                    {
                    }

                    GetDayHourNumTimes(ref strStartTime, ref strEndTime, ref strRestStartTime, ref strRestEndTime, dt1);
                    if (dt1 > strRestEndTime && dt1 <= strEndTime)
                    {
                        hs += decimal.Parse(strEndTime.Subtract(dt1).TotalHours.ToString());
                    }
                    else if (dt1 > strRestStartTime && dt1 <= strRestEndTime)
                    {
                        hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString());
                    }
                    else if (dt1 > strStartTime && dt1 <= strRestStartTime)
                    {
                        hs += decimal.Parse(strEndTime.Subtract(strRestEndTime).TotalHours.ToString()) + decimal.Parse(strRestStartTime.Subtract(dt1).TotalHours.ToString());
                    }
                    else if (dt1 <= strStartTime)
                    {
                        hs += strHourStand;
                    }
                    else if (dt1 > strEndTime)
                    {
                    }
                    #endregion
                }
            }
            #endregion
        }
        return hs;
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

        BT_New.Enabled = true;
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddLeave();
        }
        else
        {
            UpdateLeave();
        }
    }

    protected void AddLeave()
    {
        if (RB_LeaveType.SelectedValue.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLXWBXBXBZYJLXKJC + "')", true);
            RB_LeaveType.Focus();
            return;
        }
        if (DLC_StartTime.Text.Trim() == "" || DLC_EndTime.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYJSSJDBNWKJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();
            return;
        }
        DateTime dtDepartTime, dtBacktime;

        dtDepartTime = DateTime.Parse(DateTime.Parse(DLC_StartTime.Text).ToString("yyyy/MM/dd ") + DL_StartTimeHour.SelectedValue + ":" + DL_StartTimeMinute.SelectedValue);
        dtBacktime = DateTime.Parse(DateTime.Parse(DLC_EndTime.Text).ToString("yyyy/MM/dd ") + DL_EndTimeHour.SelectedValue + ":" + DL_EndTimeMinute.SelectedValue);

        if (dtBacktime < dtDepartTime)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJBNDYJSSJJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();
            return;
        }

        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        LeaveApplyForm leaveApplyForm = new LeaveApplyForm();

        leaveApplyForm.DepartCode = TB_DepartCode.Text.Trim();
        leaveApplyForm.DepartName = LB_DepartName.Text.Trim();
        leaveApplyForm.ApplyBecause = TB_ApplyBecause.Text.Trim();
        leaveApplyForm.CreateTime = string.IsNullOrEmpty(DLC_CreateTime.Text) ? DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd")) : DateTime.Parse(DLC_CreateTime.Text.Trim());
        leaveApplyForm.Creator = strUserCode;
        leaveApplyForm.Duty = TB_Duty.Text.Trim();
        leaveApplyForm.EndTime = dtBacktime;
        leaveApplyForm.LeaveType = RB_LeaveType.SelectedValue.Trim();
        leaveApplyForm.StartTime = dtDepartTime;
        leaveApplyForm.UserName = LB_UserName.Text.Trim();
        leaveApplyForm.Status = DL_Status.SelectedValue.Trim();
        decimal strHourStand = GetDayHourNum();
        leaveApplyForm.HourNum = GetLeaveApplyHours(dtDepartTime, dtBacktime, strHourStand);

        leaveApplyForm.DayNum = leaveApplyForm.HourNum / strHourStand;

        try
        {
            leaveApplyFormBLL.AddLeaveApplyForm(leaveApplyForm);
            LB_ID.Text = GetMyCreatedMaxLeaveApplyFormID(leaveApplyForm.Creator.Trim());

            LoadLeaveApplyForm(strUserCode);

            LoadRelatedWL("考勤管理", "其它", int.Parse(LB_ID.Text.Trim()));

            string strLeaveType;
            strLeaveType = RB_LeaveType.SelectedValue.Trim();
            LB_LeaveType.Text = strLeaveType;

            LB_TotalLeaveDaysForCurrentMonth.Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
            LB_TotalLeaveDaysForCurrentYear.Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected string GetMyCreatedMaxLeaveApplyFormID(string strusercode)
    {
        string flag = "0";
        string strHQL = "Select Max(ID) From T_LeaveApplyForm where Creator='" + strusercode + "' ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LeaveApplyForm");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            flag = ds.Tables[0].Rows[0][0].ToString();
        }
        return flag;
    }

    protected void UpdateLeave()
    {
        if (RB_LeaveType.SelectedValue.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLXWBXBXBZYJLXKJC + "')", true);
            RB_LeaveType.Focus();
            return;
        }
        if (DLC_StartTime.Text.Trim() == "" || DLC_EndTime.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJYJSSJDBNWKJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();
            return;
        }

        DateTime dtDepartTime, dtBacktime;

        dtDepartTime = DateTime.Parse(DateTime.Parse(DLC_StartTime.Text).ToString("yyyy/MM/dd ") + DL_StartTimeHour.SelectedValue + ":" + DL_StartTimeMinute.SelectedValue);
        dtBacktime = DateTime.Parse(DateTime.Parse(DLC_EndTime.Text).ToString("yyyy/MM/dd ") + DL_EndTimeHour.SelectedValue + ":" + DL_EndTimeMinute.SelectedValue);

        if (dtBacktime < dtDepartTime)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKSSJBNDYJSSJJC + "')", true);
            DLC_StartTime.Focus();
            DLC_EndTime.Focus();
            return;
        }

        string strHQL = "from LeaveApplyForm as leaveApplyForm Where leaveApplyForm.ID = '" + LB_ID.Text.Trim() + "' ";
        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        IList lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            LeaveApplyForm leaveApplyForm = (LeaveApplyForm)lst[0];

            leaveApplyForm.DepartCode = TB_DepartCode.Text.Trim();
            leaveApplyForm.DepartName = LB_DepartName.Text.Trim();
            leaveApplyForm.ApplyBecause = TB_ApplyBecause.Text.Trim();
            leaveApplyForm.CreateTime = string.IsNullOrEmpty(DLC_CreateTime.Text) ? DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd")) : DateTime.Parse(DLC_CreateTime.Text.Trim());
            leaveApplyForm.Duty = TB_Duty.Text.Trim();
            leaveApplyForm.EndTime = dtBacktime;
            leaveApplyForm.LeaveType = RB_LeaveType.SelectedValue.Trim();
            leaveApplyForm.StartTime = dtDepartTime;
            leaveApplyForm.UserName = LB_UserName.Text.Trim();
            leaveApplyForm.Status = DL_Status.SelectedValue.Trim();
            decimal strHourStand = GetDayHourNum();
            //TimeSpan ts = dtBacktime.Subtract(dtDepartTime);
            //leaveApplyForm.HourNum = decimal.Parse(ts.TotalHours.ToString());
            leaveApplyForm.HourNum = GetLeaveApplyHours(dtDepartTime, dtBacktime, strHourStand);

            leaveApplyForm.DayNum = leaveApplyForm.HourNum / strHourStand;

            try
            {
                leaveApplyFormBLL.UpdateLeaveApplyForm(leaveApplyForm, leaveApplyForm.ID);


                LoadLeaveApplyForm(strUserCode);

                string strLeaveType;
                strLeaveType = RB_LeaveType.SelectedValue.Trim();
                LB_LeaveType.Text = strLeaveType;

                LB_TotalLeaveDaysForCurrentMonth.Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                LB_TotalLeaveDaysForCurrentYear.Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("考勤管理", "其它", LB_ID.Text.Trim(), "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText = "select * from T_LeaveApplyForm where ID = " + LB_ID.Text;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("考勤管理", "其它", LB_ID.Text.Trim());
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

        strHQL = "Update T_LeaveApplyForm Set Status = '处理中' Where ID = " + strID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            strXMLFileName = "考勤管理" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = "考勤管理";
            workFlow.WLType = "考勤管理";
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
            workFlow.Description = TB_ApplyBecause.Text.Trim();
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

                strCmdText = "select * from T_LeaveApplyForm where ID = " + strID;

                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "T_LeaveApplyForm", strXMLFile2);

                LoadRelatedWL("考勤管理", "其它", int.Parse(strID));

                DL_Status.SelectedValue = "处理中";

                //BT_Update.Visible = false;
                //BT_Delete.Visible = false;

                BT_SubmitApply.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSSCCG + "')", true);
            }
            catch
            {
                strWLID = "0";

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSSCSBKNSMCZSGDJC + "')", true);
            }

            LoadLeaveApplyForm(strUserCode);
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

            int intWLNumber = GetRelatedWorkFlowNumber("考勤管理", "其它", strID);
            if (intWLNumber > 0)
            {
                BT_New.Enabled = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_New.Enabled = true;
                BT_SubmitApply.Enabled = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("考勤管理", "其它", strID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_New.Enabled = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from LeaveApplyForm as leaveApplyForm Where leaveApplyForm.ID = " + strID;
                LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
                lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
                LeaveApplyForm leaveApplyForm = (LeaveApplyForm)lst[0];

                LB_ID.Text = strID;
                TB_DepartCode.Text = leaveApplyForm.DepartCode.Trim();
                LB_UserCode.Text = leaveApplyForm.Creator.Trim();
                LB_UserName.Text = leaveApplyForm.UserName.Trim();
                RB_LeaveType.SelectedValue = leaveApplyForm.LeaveType.Trim();
                DLC_StartTime.Text = leaveApplyForm.StartTime.ToString("yyyy-MM-dd");
                DL_StartTimeHour.SelectedValue = leaveApplyForm.StartTime.Hour.ToString();
                DL_StartTimeMinute.SelectedValue = leaveApplyForm.StartTime.Minute.ToString();
                DLC_EndTime.Text = leaveApplyForm.EndTime.ToString("yyyy-MM-dd");
                DL_EndTimeHour.SelectedValue = leaveApplyForm.EndTime.Hour.ToString();
                DL_EndTimeMinute.SelectedValue = leaveApplyForm.EndTime.Minute.ToString();
                TB_ApplyBecause.Text = leaveApplyForm.ApplyBecause.Trim();
                DL_Status.SelectedValue = leaveApplyForm.Status.Trim();
                DLC_CreateTime.Text = leaveApplyForm.CreateTime.ToString("yyyy-MM-dd");
                TB_Duty.Text = leaveApplyForm.Duty.Trim();
                LB_DepartName.Text = leaveApplyForm.DepartName.Trim();

                LoadRelatedWL("考勤管理", "其它", int.Parse(strID));



                string strLeaveType;
                strLeaveType = RB_LeaveType.SelectedValue.Trim();
                LB_LeaveType.Text = strLeaveType;

                LB_TotalLeaveDaysForCurrentMonth.Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                LB_TotalLeaveDaysForCurrentYear.Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));


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

                strHQL = "Delete from T_LeaveApplyForm where ID='" + strID + "' ";

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    BT_New.Visible = false;
                    BT_SubmitApply.Enabled = false;

                    LoadLeaveApplyForm(strUserCode);

                    string strLeaveType;
                    strLeaveType = RB_LeaveType.SelectedValue.Trim();
                    LB_LeaveType.Text = strLeaveType;

                    LB_TotalLeaveDaysForCurrentMonth.Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));
                    LB_TotalLeaveDaysForCurrentYear.Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strUserCode, DateTime.Now.ToString("yyyyMMdd"));


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

        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        IList lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);

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
            strHQL = "Update T_LeaveApplyForm Set Status = " + "'" + strSatus + "'" + " where ID = " + strID;

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadLeaveApplyForm(strUserCode);
            }
            catch
            {
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }
   

    protected void LoadLeaveApplyForm(string strusercode)
    {
        string strHQL = "From LeaveApplyForm as leaveApplyForm Where leaveApplyForm.Creator = '" + strusercode + "' Order By leaveApplyForm.ID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "From LeaveApplyForm as leaveApplyForm Where leaveApplyForm.ID = " + strWLBusinessID;
        }

        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        IList lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);

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
    protected string GetTotalLeaveDayNumberInCurrentYear(string strLeaveType, string strApplicantCode)
    {
        string strHQL;

        strHQL = "Select COALESCE(sum(DayNum),0) From T_LeaveApplyForm Where SUBSTRING (to_char( StartTime, 'yyyymmdd'), 1, 4) = SUBSTRING(to_char( now(), 'yyyymmdd'), 1, 4)";
        strHQL += " And LeaveType = '" + strLeaveType + "'";
        strHQL += " And Creator = '" + strApplicantCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LeaveApplyForm");

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
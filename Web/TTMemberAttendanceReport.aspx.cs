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

public partial class TTMemberAttendanceReport : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "成员请假", strUserCode.Trim());
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode.Trim();
        LB_UserName.Text = ShareClass.GetUserName(strUserCode).Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadLeaveType();
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Position", DataGrid2);

            LB_ProjectMemberOwner.Text = "直接成员请假信息列表：";
            
            strHQL = "from LeaveApplyForm as leaveApplyForm ";
            strHQL += " Where leaveApplyForm.Creator In (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.UserCode = '" + strUserCode + "')";
            strHQL += " Order by leaveApplyForm.ID DESC";
            LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
            lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            decimal strHourNum = 0;
            decimal strDayNum = 0;
            if (lst != null && lst.Count > 0)
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    LeaveApplyForm leaveApplyForm = (LeaveApplyForm)lst[i];
                    strHourNum += leaveApplyForm.HourNum;
                    strDayNum += leaveApplyForm.DayNum;
                }
            }

            LB_LeaveInfoNumber.Text = Resources.lang.GCXD + lst.Count.ToString() + " 条";
            lbl_DayHourTotal.Text = "共请假：" + strHourNum + " 小时；";

            LB_Sql.Text = strHQL;
        }
    }

    protected void LoadLeaveType()
    {
        string strHQL = "From LeaveType as leaveType Order By leaveType.SortNumber ASC ";
        LeaveTypeBLL leaveTypeBLL = new LeaveTypeBLL();
        IList lst = leaveTypeBLL.GetAllLeaveTypes(strHQL);
        DL_LeaveType.DataSource = lst;
        DL_LeaveType.DataBind();
        DL_LeaveType.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        strHQL = "from LeaveApplyForm as leaveApplyForm ";
        strHQL += " Where leaveApplyForm.Creator = '" + strOperatorCode + "'";
        strHQL += " Order by leaveApplyForm.ID DESC";
        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_OperatorCode.Text = strOperatorCode;

        LB_ProjectMemberOwner.Text = strOperatorCode + " " + strOperatorName  + " 的请假信息：";
        LB_LeaveInfoNumber.Text = Resources.lang.GCXD + lst.Count.ToString() + " 条";

        LB_Sql.Text = strHQL;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        LB_ProjectMemberOwner.Text = "所有请假信息列表：";

        string strStatus = "%" + DL_Status.SelectedValue + "%";
        string strCreatorCode = "%" + TB_UserCode.Text.Trim() + "%";
        string strUserName = "%" + TB_UserName.Text.Trim() + "%";
        string strLeaveType = "%" + DL_LeaveType.SelectedValue.Trim() + "%";
        string strStartTime = DLC_StartTime.Text.Trim();
        string strEndTime = DLC_EndTime.Text.Trim();

        strHQL = "from LeaveApplyForm as leaveApplyForm where ";
        strHQL += " leaveApplyForm.Creator Like " + "'" + strCreatorCode + "'";
        strHQL += " and leaveApplyForm.UserName Like " + "'" + strUserName + "'";
        strHQL += " and leaveApplyForm.Status Like " + "'" + strStatus + "'";
        strHQL += " and leaveApplyForm.LeaveType Like " + "'" + strLeaveType + "'";
        strHQL += " and leaveApplyForm.Creator In (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.UserCode = '" + strUserCode + "')";

        if (strStartTime != "")
        {
            strHQL += " and '" + strStartTime + "'::date-leaveApplyForm.EndTime::date<=0";
        }
        if (strEndTime != "")
        {
            strHQL += " and '" + strEndTime + "'::date-leaveApplyForm.StartTime::date>=0";
        }
        strHQL += " Order by leaveApplyForm.ID DESC";
        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        decimal strHourNum = 0;
        decimal strDayNum = 0;
        if (lst != null && lst.Count > 0)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                LeaveApplyForm leaveApplyForm = (LeaveApplyForm)lst[i];
                strHourNum += leaveApplyForm.HourNum;
                strDayNum += leaveApplyForm.DayNum;
            }
        }

        LB_LeaveInfoNumber.Text = Resources.lang.GCXD + lst.Count.ToString() + " 条";
        lbl_DayHourTotal.Text = "共请假：" + strHourNum + " 小时；";

        LB_Sql.Text = strHQL;

        LB_OperatorCode.Text = "";
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        LeaveApplyFormBLL leaveApplyFormBLL = new LeaveApplyFormBLL();
        IList lst = leaveApplyFormBLL.GetAllLeaveApplyForms(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = "请假信息_" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
                CreateExcel(getUserList(), fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }

    private void CreateExcel(DataTable dt, string fileName)
    {
        DataGrid dg = new DataGrid();
        dg.DataSource = dt;
        dg.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/vnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dg.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
    }

    protected DataTable getUserList()
    {
        string strHQL;
        string strOperatorCode = LB_OperatorCode.Text.Trim();

        if (strOperatorCode == "")//所有请假信息
        {
            strHQL = "Select ID '编号',UserName '请假人',DepartCode '部门代码',DepartName '部门名称',Duty '职位',LeaveType '请假类型',StartTime '开始时间'," +
                "EndTime '结束时间',ApplyBecause '请假事由',CreateTime '请假日期',Status '状态' from T_LeaveApplyForm  Where Creator In (Select UnderCode From T_MemberLevel Where UserCode = '" + strUserCode + "')";


            if (!string.IsNullOrEmpty(DL_Status.SelectedValue.Trim()))
            {
                strHQL += " and Status like '%" + DL_Status.SelectedValue.Trim() + "%' ";
            }
            if (!string.IsNullOrEmpty(TB_UserCode.Text.Trim()))
            {
                strHQL += " and Creator like '%" + TB_UserCode.Text.Trim() + "%' ";
            }
            if (!string.IsNullOrEmpty(TB_UserName.Text.Trim()))
            {
                strHQL += " and UserName like '%" + TB_UserName.Text.Trim() + "%' ";
            }
            if (DL_LeaveType.SelectedValue.Trim() != "")
            {
                strHQL += " and LeaveType Like '%" + DL_LeaveType.SelectedValue.Trim() + "%' ";
            }
            if (DLC_StartTime.Text.Trim() != "")
            {
                strHQL += " and '" + DLC_StartTime.Text.Trim() + "'::date-EndTime::date<=0";
            }
            if (DLC_EndTime.Text.Trim() != "")
            {
                strHQL += " and '" + DLC_EndTime.Text.Trim() + "'::date-StartTime::date>=0";
            }
            strHQL += " Order by ID DESC";
        }
        else//按组织架构查询的
        {
            strHQL = "Select ID '编号',UserName '请假人',DepartCode '部门代码',DepartName '部门名称',Duty '职位',LeaveType '请假类型',StartTime '开始时间'," +
                "EndTime '结束时间',ApplyBecause '请假事由',CreateTime '请假日期',Status '状态' from T_LeaveApplyForm Where Creator = '" + strOperatorCode + "' Order by ID DESC ";

        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LeaveApplyForm");
        return ds.Tables[0];
    }

    //取得此员工当年的此类型的请假天数
    protected string GetTotalLeaveDayNumberInCurrentYear(string strLeaveType, string strApplicantCode,string strLeaveTime)
    {
        string strHQL;

        strHQL = "Select COALESCE(sum(DayNum),0) From T_LeaveApplyForm Where SUBSTRING(to_char( StartTime, 'yyyymmdd'), 1, 4) = '" + strLeaveTime.Substring(0, 4) + "'";
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

    //取得此员工当月的此类型的请假天数
    protected string GetTotalLeaveDayNumberInCurrentMonth(string strLeaveType, string strApplicantCode, string strLeaveTime)
    {
        string strHQL;

        strHQL = "Select COALESCE(sum(DayNum),0) From T_LeaveApplyForm Where SUBSTRING (to_char( StartTime, 'yyyymmdd'), 1, 6)= '" + strLeaveTime.Substring(0, 6) + "'";
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
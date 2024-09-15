using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Data;
using System.Drawing;

public partial class TTUserInfor_StudentAtten : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataYearMonthBinder();

            if (!string.IsNullOrEmpty(Request.QueryString["studentcode"]))
            {
                string strStudentCode = Request.QueryString["studentcode"].ToString();
                HF_StudentCode.Value = strStudentCode;

                string strStudentName = Request.QueryString["StudentName"].ToString();
                HF_StudentName.Value = strStudentName;

                DataProjectMemberStudentAttendanceBinder(strStudentCode);

                LB_StudentCode.Text = strStudentCode;
                LB_StudentName.Text = strStudentName;
            }
        }
    }


    private void DataProjectMemberStudentAttendanceBinder(string strStudentCode)
    {
        DG_ProjectMemberStudentAttendance.CurrentPageIndex = 0;

        string strSeachYear = DDL_SYear.SelectedValue;
        string strSeachMonth = DDL_SMonth.SelectedValue;

        //ProjectMemberStudentAttendanceBLL projectMemberStudentAttendanceBLL = new ProjectMemberStudentAttendanceBLL();
        //string strProjectMemberStudentAttendanceHQL = string.Format("from ProjectMemberStudentAttendance as projectMemberStudentAttendance where AttendanceTime like '%{0}%' and StudentCode='{1}' order by projectMemberStudentAttendance.ID desc", strSeachYear + "/" + strSeachMonth, strStudentCode);
        //IList listProjectMemberStudentAttendance = projectMemberStudentAttendanceBLL.GetAllProjectMemberStudentAttendances(strProjectMemberStudentAttendanceHQL);

        
        string strProjectMemberStudentAttendanceHQL = string.Format("select * from T_ProjectMemberStudentAttendance where AttendanceTime like '%{0}%' and StudentCode='{1}' order by ID desc", strSeachYear + "/" + strSeachMonth, strStudentCode);
        DataTable dtProjectMemberStudentAttendance = ShareClass.GetDataSetFromSql(strProjectMemberStudentAttendanceHQL, "Attendanc").Tables[0];

        DG_ProjectMemberStudentAttendance.DataSource = dtProjectMemberStudentAttendance;
        DG_ProjectMemberStudentAttendance.DataBind();

        LB_ProjectMemberStudentAttendanceSql.Text = strProjectMemberStudentAttendanceHQL;
    }

    private void DataYearMonthBinder()
    {
        


        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_SYear.SelectedValue = DateTime.Now.Year.ToString();

        for (int i = 1; i <= 12; i++)
        {
            
            DDL_SMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        string strSCurrentMonth = DateTime.Now.Month.ToString();
        
        DDL_SMonth.SelectedValue = strSCurrentMonth;
    }




    protected void BT_Seach_Click(object sender, EventArgs e)
    {
        DataProjectMemberStudentAttendanceBinder(HF_StudentCode.Value);
    }


//    select StudentCode,StudentName,SUBSTRING(to_char( AttendanceTime, 'yyyy-mm-dd'),0,7) as AttendanceTime,COUNT(1) as MonthNumber from T_ProjectMemberStudentAttendance
//where IsStudy = '是'
//group by StudentCode,StudentName,SUBSTRING(to_char( AttendanceTime, 'yyyy-mm-dd'),0,7)

}
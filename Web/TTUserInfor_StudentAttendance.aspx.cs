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

public partial class TTUserInfor_StudentAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataYearMonthBinder();

            DataProjectMemberStudentAttendanceBinder();


        }
    }


    private void DataProjectMemberStudentAttendanceBinder()
    {
        DG_ProjectMemberStudentAttendance.CurrentPageIndex = 0;

        string strSeachYear = DDL_SYear.SelectedValue;
        string strSeachMonth = DDL_SMonth.SelectedValue;

        string strProjectMemberStudentAttendanceHQL = string.Format("select * from T_ProjectMemberStudentAttendance where AttendanceTime like '%{0}%' order by ID desc", strSeachYear + "/" + strSeachMonth);
        DataTable dtProjectMemberStudentAttendance = ShareClass.GetDataSetFromSql(strProjectMemberStudentAttendanceHQL, "StudentAttendance").Tables[0];

        DG_ProjectMemberStudentAttendance.DataSource = dtProjectMemberStudentAttendance;
        DG_ProjectMemberStudentAttendance.DataBind();


        LB_ProjectMemberStudentAttendanceSql.Text = strProjectMemberStudentAttendanceHQL;
    }

    private void DataYearMonthBinder()
    {
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_Year.SelectedValue = DateTime.Now.Year.ToString();

        for (int i = 1; i <= 12; i++)
        {
            //if (i < 10)
            //{
            //    DDL_Month.Items.Add(new ListItem("0" + i, "0" + i));
            //}
            //else
            //{
            //    DDL_Month.Items.Add(new ListItem(i.ToString(), i.ToString()));
            //}
            DDL_Month.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        string strCurrentMonth = DateTime.Now.Month.ToString();
        //if (strCurrentMonth.Length > 1)
        //{
        //    DDL_Month.SelectedValue = strCurrentMonth;
        //}
        //else
        //{
        //    DDL_Month.SelectedValue = "0" + strCurrentMonth;
        //}
        DDL_Month.SelectedValue = strCurrentMonth;


        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_SYear.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_SYear.SelectedValue = DateTime.Now.Year.ToString();

        for (int i = 1; i <= 12; i++)
        {
            //if (i < 10)
            //{
            //    DDL_SMonth.Items.Add(new ListItem("0" + i, "0" + i));
            //}
            //else
            //{
            //    DDL_SMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            //}
            DDL_SMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        string strSCurrentMonth = DateTime.Now.Month.ToString();
        //if (strSCurrentMonth.Length > 1)
        //{
        //    DDL_SMonth.SelectedValue = strSCurrentMonth;
        //}
        //else
        //{
        //    DDL_SMonth.SelectedValue = "0" + strSCurrentMonth;
        //}
        DDL_SMonth.SelectedValue = strSCurrentMonth;
    }

    


    protected void BT_Seach_Click(object sender, EventArgs e)
    {
        DataProjectMemberStudentAttendanceBinder();
    }

    protected void DG_ProjectMemberStudentAttendance_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        try
        {
            string cmdName = e.CommandName;
            if (cmdName == "edit")
            {
                for (int i = 0; i < DG_ProjectMemberStudentAttendance.Items.Count; i++)
                {
                    DG_ProjectMemberStudentAttendance.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                string strCmdArgu = e.CommandArgument.ToString();

                
            }
            
        }
        catch (Exception ex) { }
    }



    protected void DG_ProjectMemberStudentAttendance_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_ProjectMemberStudentAttendance.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_ProjectMemberStudentAttendanceSql.Text.Trim();
        ProjectMemberStudentAttendanceBLL projectMemberStudentAttendanceBLL = new ProjectMemberStudentAttendanceBLL();
        IList listProjectMemberStudentAttendance = projectMemberStudentAttendanceBLL.GetAllProjectMemberStudentAttendances(strHQL);

        DG_ProjectMemberStudentAttendance.DataSource = listProjectMemberStudentAttendance;
        DG_ProjectMemberStudentAttendance.DataBind();
    }


    protected void btnImport_Click(object sender, EventArgs e)
    {
        string fileName = fileExcel.PostedFile.FileName.Substring(fileExcel.PostedFile.FileName.LastIndexOf(".")).ToLower();
        string url = string.Format("Doc/XML/{0}{1}", "DW" + DateTime.Now.ToString("yyyyMMddHHmmss"), fileName);
        string destFilePath = Server.MapPath(url);
        fileExcel.SaveAs(destFilePath);
        DataTable dtExcel = null;
        string resultMsg = string.Empty;
        try
        {
            dtExcel = ExcelUtils.ReadExcel(destFilePath, "Sheet1").Tables[0];
            bool isSuccess = ValidateData(dtExcel, ref resultMsg);
            if (isSuccess)
            {
                Import(dtExcel, ref resultMsg);
            }

            lblMsg.Text = string.Format("<span style='color:red' >{0}</span>", resultMsg);
        }
        catch (Exception ex)
        {
            lblMsg.Text = string.Format("<span style='color:red' >导入时出现以下错误: {0}!</span>", ex.Message);
        }

    }


    /// <summary>
    /// 验证数据合法性.
    /// </summary>
    /// <param name="dtExcel"></param>
    /// <param name="resultMsg"></param>
    /// <returns></returns>
    private bool ValidateData(DataTable dtExcel, ref string resultMsg)
    {
        int lineNumber = 1;
        foreach (DataRow row in dtExcel.Rows)
        {
            lineNumber++;
            try
            {
                string strStudentCode = ShareClass.ObjectToString(row["学生编码"]);
                if (string.IsNullOrEmpty(strStudentCode))
                {
                    resultMsg += string.Format("第{0}行，学生编码不能为空<br/>", lineNumber);
                    continue;
                }
                string strStudentName = ShareClass.ObjectToString(row["学生姓名"]);
                if (string.IsNullOrEmpty(strStudentName))
                {
                    resultMsg += string.Format("第{0}行，学生姓名不能为空<br/>", lineNumber);
                    continue;
                }


                //日期
                string strPayMoney = ShareClass.ObjectToString(row["日期"]);
                if (string.IsNullOrEmpty(strPayMoney))
                {
                    resultMsg += string.Format("第{0}行，日期不能为空<br/>", lineNumber);
                    continue;
                }
                

            }
            catch (Exception ex)
            {
                lblMsg.Text = string.Format("<span style='color:red' >导入时出现以下错误: {0}!</span>", ex.Message);
            }

        }
        if (!string.IsNullOrEmpty(resultMsg)) return false;
        return true;
    }


    private bool Import(DataTable dtExcel, ref string resultMsg)
    {
        string strYearMonth = DDL_Year.SelectedValue + "/" + DDL_Month.SelectedValue;
        //删除已经导入的考勤
        string strDeleteSQL = string.Format("delete T_ProjectMemberStudentAttendance where AttendanceTime like '{0}%'", strYearMonth);
        ShareClass.RunSqlCommand(strDeleteSQL);

        int successCount = 0;
        int lineNumber = 0;

        ProjectMemberStudentAttendanceBLL projectMemberStudentAttendanceBLL = new ProjectMemberStudentAttendanceBLL();

        foreach (DataRow row in dtExcel.Rows)
        {
            string strStudentCode = string.Empty;
            string strStudentName = string.Empty;

            string strAttendanceTime = string.Empty;
            string strIsStudy = string.Empty;


            

            lineNumber++;
            strStudentCode = ShareClass.ObjectToString(row["学生编码"]);
            strStudentName = ShareClass.ObjectToString(row["学生姓名"]);
            strAttendanceTime = ShareClass.ObjectToString(row["日期"]);

            strIsStudy = ShareClass.ObjectToString(row["是否上学"]);

            ProjectMemberStudentAttendance projectMemberStudentAttendance = new ProjectMemberStudentAttendance();
            projectMemberStudentAttendance.StudentCode = strStudentCode;
            projectMemberStudentAttendance.StudentName = strStudentName;
            projectMemberStudentAttendance.AttendanceTime = strAttendanceTime;

            projectMemberStudentAttendance.IsStudy = strIsStudy;

            projectMemberStudentAttendanceBLL.AddProjectMemberStudentAttendance(projectMemberStudentAttendance);

            successCount++;
        }

        if (successCount > 0)
        {
            if (successCount == dtExcel.Rows.Count)
            {
                resultMsg += string.Format("<br/>已成功导入 {0} 条数据", successCount);
            }
            else
            {
                resultMsg += string.Format("<br/>已成功导入 {0} 条数据， 共有 {1} 条数据验证失败", successCount, dtExcel.Rows.Count - successCount);
            }

            //重新加载列表
            DataProjectMemberStudentAttendanceBinder();

            return true;
        }
        else
        {
            resultMsg += string.Format("<br/>未导入数据， 共有 {0} 条数据验证失败", dtExcel.Rows.Count - successCount);
        }

        return false;
    }
}
using System;
using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTLTAllCustomerRequirement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strStatus;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strStatus = DL_ServiceStatus.SelectedValue.Trim();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有成员招聘", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            if (strStatus == "预警的")
            {
                strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
                strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
                strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
                strHQL += " or ((customerQuestion.RecorderCode = '')";
                strHQL += " and (customerQuestion.OperatorCode = '')))";
                strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
                strHQL += " order by customerQuestion.ID DESC";
              
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
                LB_Sql1.Text = strHQL;

                LB_QueryScope.Text = strStatus;
            }
        }
    }

    protected void DL_ServiceStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();
        string strStatus = DL_ServiceStatus.SelectedValue.Trim();

        strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
        strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or ((customerQuestion.RecorderCode = '')";
        strHQL += " and (customerQuestion.OperatorCode = '')))";
        strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
        strHQL += " order by customerQuestion.ID DESC";

        if (strStatus == "预警的")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or ((customerQuestion.RecorderCode = '')";
            strHQL += " and (customerQuestion.OperatorCode = '')))";
            strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "待处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion ";
            strHQL += " where (((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.RecorderCode = ''))";
            strHQL += " and (customerQuestion.OperatorCode = ''))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "处理中")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or ((customerQuestion.RecorderCode = '')";
            strHQL += " and (customerQuestion.OperatorCode = '')))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '完成'  ";
            strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or ((customerQuestion.RecorderCode = '')";
            strHQL += " and (customerQuestion.OperatorCode = '')))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已删除")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '删除'  ";
            strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or ((customerQuestion.RecorderCode = '')";
            strHQL += " and (customerQuestion.OperatorCode = '')))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "所有")
        {
            strHQL = "Select 8 from T_CustomerQuestion as customerQuestion ";
            strHQL += " where ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or ((customerQuestion.RecorderCode = '')";
            strHQL += " and (customerQuestion.OperatorCode = '')))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        LB_QueryScope.Text = strStatus;
    }

    protected void DL_IsImportant_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();
        string strStatus = DL_ServiceStatus.SelectedValue.Trim();

        string strIsImportant = DL_IsImportant.SelectedValue.Trim();

        strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
        strHQL += " and ((customerQuestion.RecorderCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (customerQuestion.OperatorCode in (select projectMember.UserCode  From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or ((customerQuestion.RecorderCode = '')";
        strHQL += " and (customerQuestion.OperatorCode = '')))";
        strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";

        strHQL += " and customerQuestion.IsImportant = '" + strIsImportant + "'";
        strHQL += " order by customerQuestion.ID DESC";
       
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;


        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
    }

}

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

public partial class TTLTMyMemberCustomerRequirement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "直接成员招聘", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "CustomerService", DataGrid2);

            strHQL = "Select * from T_CustomerQuestion as customerQuestion where ";
            strHQL += " ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
            strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
            strHQL += " order by customerQuestion.ID DESC";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            LB_QueryScope.Text = Resources.lang.SuoYouKeHuFuWuXuQiu;
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        string strStatus = DL_ServiceStatus.SelectedValue.Trim();

        strHQL = "Select * from T_CustomerQuestion as customerQuestion  where ";
        strHQL += "  ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
        strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";
        //strHQL += " or ((customerQuestion.RecorderCode = '')";
        //strHQL += " and (customerQuestion.OperatorCode = ''))";
        strHQL += " order by customerQuestion.ID DESC";

        if (strStatus == "预警的")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
            strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";
            strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "待处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where ";
            strHQL += " ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
            strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "处理中")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
            strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";

            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '完成'  ";
            strHQL += " and ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
            strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已删除")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '删除'  ";
            strHQL += " and ((customerQuestion.RecorderCode = " + "'" + strOperatorCode + "'" + ")";
            strHQL += " or (customerQuestion.OperatorCode = " + "'" + strOperatorCode + "'" + "))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        LB_QueryScope.Text = ShareClass.GetUserName(strUserCode) + " " + strStatus;
    }

    protected void DL_IsImportant_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strIsImportant = DL_IsImportant.SelectedValue.Trim();

        strHQL = "Select * from T_CustomerQuestion as customerQuestion where ";
        strHQL += " ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
        strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
        strHQL += " and customerQuestion.IsImportant = '" + strIsImportant + "'";
        strHQL += " order by customerQuestion.ID DESC";
   
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
        LB_Sql1.Text = strHQL;
    }

    protected void DL_ServiceStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strStatus = DL_ServiceStatus.SelectedValue.Trim();

        strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
        strHQL += " and ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
        strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
        strHQL += " order by customerQuestion.ID DESC";

        if (strStatus == "预警的")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
            strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char( customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID) ) ";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "待处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where ";
            strHQL += " (customerQuestion.RecorderCode in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From T_MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "处理中")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已处理")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '完成' ";
            strHQL += " and ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
            strHQL += " order by customerQuestion.ID DESC";
        }

        if (strStatus == "已删除")
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = '删除'  ";
            strHQL += " and ((customerQuestion.RecorderCode in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " or (customerQuestion.OperatorCode  in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")))";
            strHQL += " order by customerQuestion.ID DESC";
        }


        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        LB_QueryScope.Text = strStatus;
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

    protected void LoadMyMemberCustomerService(string strUnderCode, string strStatus)
    {
        string strHQL;

        strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorStatus = " + "'" + strStatus + "'";
        strHQL += " and ((customerQuestion.RecorderCode = " + "'" + strUnderCode + "'" + ")";
        strHQL += " or (customerQuestion.OperatorCode = " + "'" + strUnderCode + "'" + "))";
        strHQL += " order by customerQuestion.ID DESC";

    
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
    }

}

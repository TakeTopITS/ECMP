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

public partial class TTAllCustomerQuestions : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString, strStatus;

        strUserCode = Session["UserCode"].ToString();
        strStatus = DL_ServiceStatus.SelectedValue.Trim();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有客户服务", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ShareClass.LoadSytemChart(strUserCode, "AllCustomerQuestion", RP_ChartList);
        HL_SystemAnalystChartRelatedUserSet.NavigateUrl = "TTSystemAnalystChartRelatedUserSet.aspx?FormType=AllCustomerQuestion";


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadCustomerQuestions("","");
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            LoadCustomerQuestions(strDepartCode, "");
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LoadCustomerQuestions("", strUserCode);
    }

    protected void DL_ServiceStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCustomerQuestions("", "");
    }

    protected void DL_IsImportant_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCustomerQuestions("", "");
    }

    protected void LoadCustomerQuestions(string strDepartCode, string strUserCode)
    {
        string strHQL;

        string strDepartString = LB_DepartString.Text.Trim();
        string strStatus = DL_ServiceStatus.SelectedValue.Trim();
        string strIsImportant = "%" + DL_IsImportant.SelectedValue.Trim() + "%";

        strDepartCode = "%" + strDepartCode + "%";
        strUserCode = "%" + strUserCode + "%";


        strHQL = "Select * from T_CustomerQuestion  where OperatorStatus = '受理' ";
        strHQL += " and ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
        strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
        //strHQL += " and ID in (Select QuestionID From T_CustomerQuestionHandleRecord Where  to_char( NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and ID in (Select Max(ID) From T_CustomerQuestionHandleRecord Group By QuestionID)) ";

        if (strStatus == "预警的")
        {
            strHQL = "Select * from T_CustomerQuestion  where OperatorStatus = '受理' ";
            strHQL += " and ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
            strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
            strHQL += " and ID in (Select QuestionID From T_CustomerQuestionHandleRecord Where  to_char( NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and ID in (Select Max(ID) From T_CustomerQuestionHandleRecord Group By QuestionID)) ";
        }

        if (strStatus == "待处理")
        {
            strHQL = "Select * from T_CustomerQuestion  ";
            strHQL += " where (((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
            strHQL += " or (RecorderCode = ''))";
            strHQL += " and (OperatorCode = ''))";
        }

        if (strStatus == "处理中")
        {
            strHQL = "Select * from T_CustomerQuestion  where OperatorStatus = '受理' ";
            strHQL += " and ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
            strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
            strHQL += " or ((RecorderCode = '')";
            strHQL += " and (OperatorCode = '')))";
        }

        if (strStatus == "已处理")
        {
            strHQL = "Select * from T_CustomerQuestion  where OperatorStatus = '完成'  ";
            strHQL += " and ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
            strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
        }

        if (strStatus == "已删除")
        {
            strHQL = "Select * from T_CustomerQuestion  where OperatorStatus = '删除'  ";
            strHQL += " and ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
            strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
        }

        if (strStatus == "所有")
        {
            strHQL = "Select * from T_CustomerQuestion  ";
            strHQL += " where ((RecorderCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + "))";
            strHQL += " or (OperatorCode in (select UserCode  From T_ProjectMember  Where DepartCode in " + strDepartString + ")))";
        }

        strHQL += " and ((RecorderCode in (Select UserCode From T_ProjectMember  Where DepartCode  Like '" + strDepartCode + "'))";
        strHQL += "  Or (OperatorCode in (Select UserCode From T_ProjectMember  Where DepartCode  Like '" + strDepartCode + "')))";

        strHQL += " and ((RecorderCode Like '" + strUserCode + "')";
        strHQL += " Or (OperatorCode Like '" + strUserCode + "'))";

        strHQL += " and IsImportant Like  '" + strIsImportant + "'";
        strHQL += " order by ID DESC";

        DataSet DS = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = DS;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        DataSet DS = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = DS;
        DataGrid1.DataBind();
    }

}

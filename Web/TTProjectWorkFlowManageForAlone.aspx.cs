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


public partial class TTProjectWorkFlowManageForAlone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];
        string strHQL;
        IList lst;

        string strUserName;

        //this.Title = "项目工作流管理---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        //设置是否自定义工作流模组模式
        Session["DIYWFModule"] = "NO";

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","项目工作流管理", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();

            DataSet ds = new DataSet();

            if (strProjectID != null & strProjectID != "0")
            {
                strHQL = "Select A.ID,A.WorkDetail,A.StepID,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,A.CheckingTime,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
                strHQL += " Where A.WLID = B.WLID And A.WLID In ";
                strHQL += " (select WLID  From T_WorkFlow Where ( ";
                strHQL += " (RelatedType = '项目' and RelatedID = " + strProjectID + ")";
                strHQL += " or (RelatedType = 'ExpenseApply' and RelatedID in (select ID from T_ExpenseApplyWL where RelatedID = " + strProjectID + "))";
                strHQL += " or (RelatedType = 'ExpenseClaim' and RelatedID in (select ECID from T_ExpenseClaim where RelatedID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '任务' and RelatedID in (Select TaskID From T_ProjectTask Where ProjectID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '风险' and RelatedID in (Select ID From T_ProjectRisk Where ProjectID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '需求' and RelatedID in (Select ReqID From T_RelatedReq Where ProjectID = " + strProjectID + "))";
                strHQL += " ) And Status not in ('修改中','关闭','结案'))";
                strHQL += " And A.Status in ('处理中','审核中','会签中','复核中') ";
                strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
                strHQL += " And A.IsOperator = 'YES'";
                strHQL += " Order By A.StepID DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
                DataGrid4.DataSource = ds;
                DataGrid4.DataBind();
                LB_Sql4.Text = strHQL;

                strHQL = "Select A.ID,A.WorkDetail,A.StepID,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,A.CheckingTime,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
                strHQL += " Where A.WLID = B.WLID And A.WLID In ";
                strHQL += " (select WLID  From T_WorkFlow Where ( ";
                strHQL += " (RelatedType = '项目' and RelatedID = " + strProjectID + ")";
                strHQL += " or (RelatedType = 'ExpenseApply' and RelatedID in (select ID from T_ExpenseApplyWL where RelatedID = " + strProjectID + "))";
                strHQL += " or (RelatedType = 'ExpenseClaim' and RelatedID in (select ECID from T_ExpenseClaim where RelatedID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '任务' and RelatedID in (Select TaskID From T_ProjectTask Where ProjectID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '风险' and RelatedID in (Select ID From T_ProjectRisk Where ProjectID = " + strProjectID + "))";
                strHQL += " Or (RelatedType = '需求' and RelatedID in (Select ReqID From T_RelatedReq Where ProjectID = " + strProjectID + "))";
                strHQL += " ) And Status not in ('修改中','关闭','结案'))";
                strHQL += " And A.Status in ('批准','驳回') ";
                strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
                strHQL += " Order By A.StepID DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
                LB_Sql1.Text = strHQL;


                strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and workFlow.WLID in ";
                strHQL += " ( select workFlow.WLID from WorkFlow as workFlow Where  (";
                strHQL += " ( workFlow.RelatedType = '项目' and workFlow.RelatedID = " + strProjectID + ")";
                strHQL += " or (workFlow.RelatedType = 'ExpenseApply' and workFlow.RelatedID in (select expenseApplyWL.ID from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedID = " + strProjectID + "))";
                strHQL += " or (workFlow.RelatedType = 'ExpenseClaim' and workFlow.RelatedID in (select expenseClaim.ECID from ExpenseClaim as expenseClaim where expenseClaim.RelatedID = " + strProjectID + "))";
                strHQL += " or (workFlow.RelatedType = '任务' and workFlow.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";
                strHQL += " or (workFlow.RelatedType = '风险' and workFlow.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
                strHQL += " or (workFlow.RelatedType = '需求' and workFlow.RelatedID in (select relatedReq from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";
                strHQL += " ) and workFlow.Status not in ('修改中','关闭','结案'))";
                strHQL += " Order by workFlow.WLID DESC";
                lst = workFlowBLL.GetAllWorkFlows(strHQL);
                DataGrid3.DataSource = lst;
                DataGrid3.DataBind();
                SetWorkFlowRecordColor();
                LB_Sql3.Text = strHQL;

                LB_QueryScope.Text = Resources.lang.Project + strProjectID;
            }
            else
            {
                strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,A.CheckingTime,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
                strHQL += " Where A.WLID = B.WLID And A.WLID In ";
                strHQL += " (Select WLID From T_WorkFlow Where (";
                strHQL += " (RelatedType = '项目' and RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + "))";
                strHQL += " or (RelatedType = 'ExpenseApply' and RelatedID in (select ID from T_ExpenseApplyWL where RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (RelatedType = 'ExpenseClaim' and RelatedID in (select ECID from T_ExpenseClaim where RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '任务' and RelatedID in (Select TaskID From T_ProjectTask Where ProjectID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '风险' and RelatedID in (Select ID From T_ProjectRisk Where ProjectID in (Select ProjectID From T_RelatedUser  where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '需求' and RelatedID in (Select ReqID From T_RelatedReq Where ProjectID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " ) and Status not in ('通过','修改中','关闭','结案'))";
                strHQL += " And A.Status in ('处理中','审核中','会签中','复核中') ";
                strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
                strHQL += " Order By A.StepID DESC";

                ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

                DataGrid4.DataSource = ds;
                DataGrid4.DataBind();
                LB_Sql4.Text = strHQL;

                strHQL = "Select A.ID,A.WorkDetail,A.StepID,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,A.CheckingTime,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
                strHQL += " Where A.WLID = B.WLID And A.WLID In ";
                strHQL += " (Select WLID From T_WorkFlow Where (";
                strHQL += "  (RelatedType = '项目' and RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + "))";
                strHQL += " or (RelatedType = 'ExpenseApply' and RelatedID in (select ID from T_ExpenseApplyWL where RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (RelatedType = 'ExpenseClaim' and RelatedID in (select ECID from T_ExpenseClaim where RelatedID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '任务' and RelatedID in (Select TaskID From T_ProjectTask Where ProjectID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '风险' and RelatedID in (Select ID From T_ProjectRisk Where ProjectID in (Select ProjectID From T_RelatedUser  where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += "  Or (RelatedType = '需求' and RelatedID in (Select ReqID From T_RelatedReq Where ProjectID in (Select ProjectID From T_RelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " ) and Status not in ('修改中','关闭','结案'))";
                strHQL += " And A.Status in ('批准','驳回') ";
                strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
                strHQL += " Order By A.StepID DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
                LB_Sql1.Text = strHQL;

                strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and workFlow.WLID in ";
                strHQL += " ( select workFlow.WLID from WorkFlow as workFlow Where  (";
                strHQL += " ( workFlow.RelatedType = '项目' and workFlow.RelatedID in (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
                strHQL += " or (workFlow.RelatedType = 'ExpenseApply' and workFlow.RelatedID in (select expenseApplyWL.ID from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.RelatedID in  (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (workFlow.RelatedType = 'ExpenseClaim' and workFlow.RelatedID in (select expenseClaim.ECID from ExpenseClaim as expenseClaim where expenseClaim.RelatedID in  (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (workFlow.RelatedType = '任务' and workFlow.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (workFlow.RelatedType = '风险' and workFlow.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID in (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " or (workFlow.RelatedType = '需求' and workFlow.RelatedID in (select relatedReq from RelatedReq as relatedReq where relatedReq.ProjectID in (Select relatedUser.ProjectID from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + ")))";
                strHQL += " ) and workFlow.Status not in ('修改中','关闭','结案'))";
                strHQL += " Order by workFlow.WLID DESC";
                lst = workFlowBLL.GetAllWorkFlows(strHQL);
                DataGrid3.DataSource = lst;
                DataGrid3.DataBind();
                SetWorkFlowRecordColor();
                LB_Sql3.Text = strHQL;

                LB_QueryScope.Text = Resources.lang.XiangMu + ":" + Resources.lang.SuoYou;
            }
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        IList lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void SetWorkFlowRecordColor()
    {
        int i;
        string strStatus;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strStatus = DataGrid3.Items[i].Cells[5].Text.Trim();

            if (strStatus == "通过")
            {
                DataGrid3.Items[i].ForeColor = Color.Red;

            }
        }
    }

}

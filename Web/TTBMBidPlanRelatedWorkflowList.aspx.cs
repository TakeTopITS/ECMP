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


public partial class TTBMBidPlanRelatedWorkflowList : System.Web.UI.Page
{
    string strLangCode;
    string strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        string strUserName;

        strRelatedID = Request.QueryString["RelatedID"];

        strLangCode = Session["LangCode"].ToString();
        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DataSet ds = new DataSet();

            strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
            strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " And A.IsOperator = 'YES'";
            strHQL += " And B.RelatedType = '招标计划' and B.RelatedID = " + strRelatedID;
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;


            strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
            strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
            strHQL += " And A.IsOperator = 'YES'";
            strHQL += " And B.RelatedType = '招标计划' and B.RelatedID = " + strRelatedID;
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid5.DataSource = ds;
            DataGrid5.DataBind();

            LB_Sql5.Text = strHQL;


            strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And A.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " And B.RelatedType = '招标计划' and B.RelatedID = " + strRelatedID;
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;


            strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
            strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
            strHQL += " And B.RelatedType = '招标计划' and B.RelatedID = " + strRelatedID;
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid6.DataSource = ds;
            DataGrid6.DataBind();

            LB_Sql6.Text = strHQL;

            strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
            strHQL += " And workFlow.RelatedType = '招标计划' and workFlow.RelatedID = " + strRelatedID;
            strHQL += " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            SetWorkFlowRecordColor();

            LB_Sql3.Text = strHQL;
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

        SetWorkFlowRecordColor();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql6.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds; ;
        DataGrid6.DataBind();
    }

    protected void SetWorkFlowRecordColor()
    {
        int i;
        string strWFID, strStatus;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strWFID = DataGrid3.Items[i].Cells[1].Text.Trim();
            strStatus = GetWorkflowStatus(strWFID);

            if (strStatus == "通过")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_green.png";
            }

            if (strStatus == "结案")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_ok.png";
            }

            if (strStatus == "驳回")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_refuse.png";
            }
        }
    }

    protected bool CheckWorkflowStepDetailStatus(string strWFID, string strStatus)
    {
        string strHQL;

        strHQL = "Select Status From T_WorkFlowStepDetail Where WLID = " + strWFID + " and Status = " + "'" + strStatus + "'";
        strHQL += " and StepID in (Select max(StepID) From T_WorkflowStep Where WLID = " + strWFID + ")";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected string GetWorkflowStatus(string strWLID)
    {
        string strHQL;

        strHQL = "Select Status From T_WorkFlow Where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }
}

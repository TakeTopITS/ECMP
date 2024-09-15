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
using Microsoft.Web.Management.Client.Win32;

public partial class TTAPPDIYSystemHandleRecord : System.Web.UI.Page
{
    string strTemIdentifyString, strModuleName, strHomeModuleName, strTemName;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName;

        strTemIdentifyString = Request.QueryString["TemIdentifyString"];
        strModuleName = Request.QueryString["ModuleName"];

        strLangCode = Session["LangCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

      
        try
        {
            strHomeModuleName = ShareClass.GetHomeModuleName(strModuleName, strLangCode);
            Label1.Text = strHomeModuleName;
        }
        catch
        {
            strHomeModuleName = "";
            Label1.Text = "";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            BT_CreateUserDIYModule.Attributes.Add("onclick", "popShowByURL('TTAPPDIYSystemByForm.aspx?TemIdentifyString=" + Request.QueryString["TemIdentifyString"].ToString() + "&ModuleName=" + strModuleName + "','" + strHomeModuleName + "', 1000, 500,window.location)");

            DataSet ds = new DataSet();

            strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
            strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " And A.IsOperator = 'YES'";
            strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;

            strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.CheckingTime,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And A.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;

            strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
            strHQL += " And workFlow.TemName in (Select workFlowTemplate.TemName From WorkFlowTemplate workFlowTemplate Where workFlowTemplate.IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
            strHQL += " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            SetWorkFlowRecordColor();

            LB_Sql3.Text = strHQL;
        }
    }


    protected void BT_AllWL_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        DataSet ds = new DataSet();

        strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;

        strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.CheckingTime,A.Requisite,A.CheckingTime,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And A.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " And workFlow.TemName in (Select workFlowTemplate.TemName From WorkFlowTemplate workFlowTemplate Where workFlowTemplate.IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text.Trim();


        string strUserCode = LB_UserCode.Text.Trim();
        string strHQL;
        IList lst;

        DataSet ds = new DataSet();

        strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;

        strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.CheckingTime,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And A.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " And B.TemName in (Select TemName From T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " and workFlow.Status = " + "'" + strStatus + "'";
        strHQL += " And workFlow.TemName in (Select workFlowTemplate.TemName From WorkFlowTemplate workFlowTemplate Where workFlowTemplate.IdentifyString = " + "'" + strTemIdentifyString + "'" + ")";
        strHQL += " Order By workFlow.WLID DESC";

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
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

    protected void SetWorkFlowRecordColor()
    {
        int i;
        string strWFID, strStatus;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strWFID = DataGrid3.Items[i].Cells[1].Text.Trim();
            strStatus = DataGrid3.Items[i].Cells[3].Text.Trim();

            if (strStatus == "通过")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_green.png";

                //DataGrid3.Items[i].ForeColor = Color.Red;
            }
            else
            {
                if (strStatus == "结案")
                {
                    ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_ok.png";
                }
                else
                {
                    if (CheckWorkflowStepDetailStatus(strWFID, "驳回"))
                    {
                        ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_refuse.png";
                    }
                }
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



}

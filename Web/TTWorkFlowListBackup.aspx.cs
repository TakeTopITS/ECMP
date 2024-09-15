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
using System.Data.SqlClient;

using System.Xml.XPath;
using System.Xml.Xsl;
using System.Xml;
using System.Text;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopWF;

public partial class TTWorkFlowListBackup : System.Web.UI.Page
{
    string strWLID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strWLName;
        string strTemName, strStatus;
        string strHQL;

        string strUserCode, strCreatorCode;

        strUserCode = Session["UserCode"].ToString();

        strWLID = Request.QueryString["WLID"];
        if (strWLID == "0")
        {
            return;
        }

        strHQL = "Select * from T_WorkFlowBackup where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackupBackup");

        strWLID = ds.Tables[0].Rows[0]["WLID"].ToString().Trim();
        strWLName = ds.Tables[0].Rows[0]["WLName"].ToString().Trim();
        strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();
        strStatus = ds.Tables[0].Rows[0]["Status"].ToString().Trim();
        strCreatorCode = ds.Tables[0].Rows[0]["CreatorCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadWorkFlowStep(strWLID);

            HL_WLRelatedDoc.NavigateUrl = "TTDocumentTreeView.aspx?RelatedType=WorkFlow&RelatedID=" + strWLID;
            HL_ApproveRecord.NavigateUrl = "TTWorkflowApproveRecord.aspx?Type=WorkFlow&RelatedID=" + strWLID + "&StepID=0";

            try
            {
                ////显示流程红绿灯
                //ShareClass.DisplayRelatedWFStepDump(strTemName, strWLID, strStatus, Repeater1);

                string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
                if (strDesignType == "SL")
                {
                    HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=" + strWLID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
                }
                if (strDesignType == "JS")
                {
                    HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=" + strWLID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
                }

                LoadChildWorkflow(strWLID);
            }
            catch(Exception err)
            {
                Response.Write("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

     protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStepID, strStepName;

        if (e.CommandName != "Page")
        {
            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strStepID = ((Button)e.Item.FindControl("BT_StepID")).Text;
            LoadWorkFlowStepDetail(strStepID);

            LoadWorkFlowApproveRecord(strWLID, strStepID);

            strStepName = GetWorkFlowStepName(strStepID);

            LB_StepName.Text = strStepID + " " + strStepName;
            LB_StepName1.Text = strStepID + " " + strStepName;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DisplayRelatedWFStepDump(string strTemName, string strWLID, string strWFStatus)
    {
        string strHQL;
        IList lst;
        int intSortNumber, j;
        string strWFStepStatus, strStepName;

        strHQL = "from WorkFlowTStep as workFlowTStep where workFlowTStep.TemName = " + "'" + strTemName + "'" + " Order by workFlowTStep.SortNumber ASC";
        WorkFlowTStepBLL workFlowTStepBLL = new WorkFlowTStepBLL();
        lst = workFlowTStepBLL.GetAllWorkFlowTSteps(strHQL);

        Repeater1.DataSource = lst;
        Repeater1.DataBind();

        WorkFlowTStep workFlowTStep = new WorkFlowTStep();

        WorkFlowStep workFlowStep = GetWorkFlowMaxApprovedStep(strWLID);

        if (lst.Count > 0)
        {
            try
            {
                intSortNumber = workFlowStep.SortNumber;
                strWFStepStatus = workFlowStep.Status.Trim();
                strStepName = workFlowStep.StepName.Trim();

                for (int i = 0; i < lst.Count; i++)
                {
                    workFlowTStep = (WorkFlowTStep)lst[i];

                    if (strWFStatus == "通过")
                    {
                        ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/GreenDump.png";
                    }
                    else
                    {
                        j = i + 1;

                        if (j < intSortNumber)
                        {
                            ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/GreenDump.png";
                        }
                        else
                        {
                            if (j == intSortNumber)
                            {
                                if (strWFStepStatus == "通过")
                                {
                                    ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/GreenDump.png";
                                }
                                else
                                {
                                    ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/RedDump.png";
                                }
                            }
                            else
                            {
                                ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/RedDump.png";
                            }
                        }
                    }

                    ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ToolTip = workFlowTStep.SortNumber.ToString() + " " + workFlowTStep.StepName.Trim();
                }
            }
            catch
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ImageUrl = "Images/RedDump.png";

                    workFlowTStep = (WorkFlowTStep)lst[i];
                    ((ImageButton)Repeater1.Items[i].FindControl("IBT_WFStep")).ToolTip = workFlowTStep.SortNumber.ToString() + " " + workFlowTStep.StepName.Trim();
                }
            }
        }
    }

    protected WorkFlowStep GetWorkFlowMaxApprovedStep(string strWLID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowStep as workFlowStep where workFlowStep.WLID = " + strWLID;
        strHQL += " Order By workFlowStep.StepID DESC";

        WorkFlowStepBLL workFlowStepBLL = new WorkFlowStepBLL();
        lst = workFlowStepBLL.GetAllWorkFlowSteps(strHQL);

        WorkFlowStep workFlowStep = new WorkFlowStep();

        if (lst.Count > 0)
        {
            workFlowStep = (WorkFlowStep)lst[0];

            return workFlowStep;
        }
        else
        {
            return workFlowStep;
        }
    }

    protected string GetWorkFlowStatus(string strWLID)
    {
        string strHQL;

        strHQL = "Select * from T_WorkFlowBackup where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");

        return ds.Tables[0].Rows[0]["Status"].ToString().Trim();
    }

    //取得此工作流相关子工作流列表
    protected void LoadChildWorkflow(string strWLID)
    {
        string strHQL;

        strHQL = "Select * From T_WorkflowBackup Where WLID in ( Select WFChildID From T_WFStepRelatedWF Where WFID = " + strWLID + ")";
        strHQL += " Order By WLID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void LoadWorkFlowStepDetail(string strStepID)
    {
        string strHQL;

        strHQL = "Select * from T_WorkFlowStepDetailBackup where StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetailBackup");
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }


    protected void LoadWorkFlowStep(string strWLID)
    {
        string strHQL;

        strHQL = "Select * from T_WorkFlowStepBackup where WLID = " + strWLID + " Order by StepID ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBackup");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected string GetWorkFlowStepName(string strStepID)
    {
        string strHQL;

        strHQL = "Select * from T_WorkFlowStepBackup where StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBackup");

        return ds.Tables[0].Rows[0]["StepName"].ToString().Trim();
    }

    protected void LoadWorkFlowApproveRecord(string strWLID, string strStepID)
    {
        string strHQL;

        try
        {
            strHQL = "Select * from T_ApproveFlowBackup where Type = '工作流' and RelatedID = " + strWLID + " and StepID = " + strStepID + " Order by ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ApproveFlow");

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
        catch
        {
        }
    }

}

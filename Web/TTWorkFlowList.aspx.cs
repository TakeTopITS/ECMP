using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWorkFlowList : System.Web.UI.Page
{
    string strWLID;
    string strWLName;
    string strTemName, strStatus;

    string strUserCode, strCreatorCode;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strLangCode = Session["LangCode"].ToString().Trim();
        strUserCode = Session["UserCode"].ToString();

        strWLID = Request.QueryString["WLID"];
        if (strWLID == "0")
        {
            return;
        }

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strWLID = workFlow.WLID.ToString().Trim();
        strWLName = workFlow.WLName.Trim();
        strTemName = workFlow.TemName.Trim();
        strStatus = workFlow.Status.Trim();

        strCreatorCode = workFlow.CreatorCode.Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadWorkFlowStep(strWLID);

            HL_WLRelatedDoc.NavigateUrl = "TTDocumentTreeView.aspx?RelatedType=WorkFlow&RelatedID=" + strWLID;
            HL_ApproveRecord.NavigateUrl = "TTWorkflowApproveRecord.aspx?Type=WorkFlow&RelatedID=" + strWLID + "&StepID=0";
            HL_Expense.NavigateUrl = "TTProExpenseView.aspx?WorkflowID=" + strWLID;


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

            strStepName = ShareClass.GetWorkFlowStep(strStepID).StepName.Trim();

            LB_StepID.Text = strStepID;
            LB_StepName.Text =  strStepName;
            LB_StepName1.Text = strStepName;

            LB_SortNumber.Text = ShareClass.GetWorkFlowStep(strStepID).SortNumber.ToString();

            LoadWorkFlowApproveRecord(strWLID, strStepID);

            string strStepGUID = ShareClass.GetWorkFlowTStep(strTemName, int.Parse(LB_SortNumber.Text)).GUID.Trim();
            ShareClass.LoadWorkFlowTStepRelatedModule(RP_RelatedModule, strWLID, strStepID, "0", "0", strLangCode, strUserCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID, strStepID;

        if (e.CommandName != "Page")
        {
            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strStepID = LB_StepID.Text;
            strID = ((Button)e.Item.FindControl("BT_ID")).Text;

            try
            {
                string strStepGUID = ShareClass.GetWorkFlowTStep(strTemName, int.Parse(LB_SortNumber.Text)).GUID.Trim();
                ShareClass.LoadWorkFlowTStepRelatedModule(RP_RelatedModule, strWLID, strStepID, strID, strStepGUID, strLangCode, strUserCode);
            }
            catch
            {
                ShareClass.LoadWorkFlowTStepRelatedModule(RP_RelatedModule, strWLID, strStepID, strID, "0", strLangCode, strUserCode);
            }

            LB_ID.Text = strID;

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
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        return workFlow.Status.Trim();
    }


    protected WorkFlowStep GetWorkFlowMaxStep(string strWLID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowStep as workFlowStep where workFlowStep.WLID = " + strWLID + " Order By workFlowStep.StepID DESC";
        WorkFlowStepBLL workFlowStepBLL = new WorkFlowStepBLL();
        lst = workFlowStepBLL.GetAllWorkFlowSteps(strHQL);

        if (lst.Count > 0)
        {
            WorkFlowStep workFlowStep = (WorkFlowStep)lst[0];

            return workFlowStep;
        }
        else
        {
            return null;
        }
    }

    protected void LoadWorkFlowStepDetail(string strStepID)
    {
        string strHQL;
        IList lst;

        WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();

        strHQL = "from WorkFlowStepDetail as workFlowStepDetail where workFlowStepDetail.StepID = " + strStepID;
        lst = workFlowStepDetailBLL.GetAllWorkFlowStepDetails(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }


    protected void LoadWorkFlowStep(string strWLID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowStep as workFlowStep where workFlowStep.WLID = " + strWLID + " Order by workFlowStep.StepID ASC";
        WorkFlowStepBLL workFlowStepBLL = new WorkFlowStepBLL();
        lst = workFlowStepBLL.GetAllWorkFlowSteps(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadWorkFlowApproveRecord(string strWLID, string strStepID)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from Approve as approve where approve.Type = '工作流' and approve.RelatedID = " + strWLID + " and approve.StepID = " + strStepID + " Order by approve.ID DESC";

            ApproveBLL approveBLL = new ApproveBLL();
            lst = approveBLL.GetAllApproves(strHQL);

            DataList1.DataSource = lst;
            DataList1.DataBind();
        }
        catch
        {
        }
    }

    //取得此工作流相关子工作流列表
    protected void LoadChildWorkflow(string strWLID)
    {
        string strHQL;

        strHQL = "Select * From T_Workflow Where WLID in ( Select WFChildID From T_WFStepRelatedWF Where WFID = " + strWLID + ")";
        strHQL += " Order By WLID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }


}

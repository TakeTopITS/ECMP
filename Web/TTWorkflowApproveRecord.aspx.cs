using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web.UI;
using System.Data;

public partial class TTWorkflowApproveRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strType = Request.QueryString["Type"];
        string strRelatedID = Request.QueryString["RelatedID"];
        string strStepID = Request.QueryString["StepID"];

        string strWLName;
        string strHQL;
        DataSet ds;

        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();

        strWLName = ShareClass.GetWorkFlowName(strRelatedID);
        if (strType == "WorkFlow")
        {
            LB_WorkFlow.Text = "工作流：" + strRelatedID + " " + strWLName + "  审核记录";
        }
        else
        {
            LB_WorkFlow.Text = "工作流：" + strRelatedID + " " + strWLName + " 步骤：" + strStepID + "  审核记录";
        }

        if (Page.IsPostBack != true)
        {
            LB_UserCode.Text = strUserCode;
            strUserName = ShareClass.GetUserName(strUserCode);
            LB_UserName.Text = strUserName;

            try
            {
                strHQL = "Select A.*,B.SortNumber,B.StepName from T_WorkFlowStepDetail A,T_WorkFlowStep B where A.StepID = B.StepID and  (A.WLID = " + strRelatedID;
                strHQL += " or A.WLID in (Select WFChildID From T_WFStepRelatedWF Where WFID = " + strRelatedID + " ))";
                strHQL += " and COALESCE(A.Operation,'')  <> ''";
                strHQL += " Order by A.ID DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_ApproveFlow");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    strHQL = "Select A.*,B.SortNumber,B.StepName from T_WorkFlowStepDetailBackup A,T_WorkFlowStepBackup B where A.StepID = B.StepID and  (A.WLID = " + strRelatedID;
                    strHQL += " or A.WLID in (Select WFChildID From T_WFStepRelatedWF Where WFID = " + strRelatedID + " ))";
                    strHQL += " and COALESCE(A.Operation,'') <> ''";
                    strHQL += " Order by A.ID DESC";
                    ds = ShareClass.GetDataSetFromSql(strHQL, "T_ApproveFlowBackup");
                }

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        catch
            {
            }
        }
    }

}

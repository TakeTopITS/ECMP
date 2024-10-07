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

public partial class TTProjectReqHandlePage : System.Web.UI.Page
{
    string strLangCode;
    string strUserCode, strUserName, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        if (strProjectID == null)
        {
            strProjectID = "0";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack != true)
        {
            LoadReqAssignRecord(strUserCode);
            LoadRequirement(strUserCode);
        }
    }
    protected void BT_UpdateStatus_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strStatus;

        strID = LB_SourceID.Value;
        strStatus = LB_TargetStatus.Value;

        strHQL = "Update T_ReqAssignRecord Set Status =  '" + strStatus + "',MoveTime = now() Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL);

        LoadReqAssignRecord(strUserCode);

        //Response.Redirect("TTProjectReqHandlePage.aspx?ProjectID=" + strProjectID);
    }

    protected void LoadReqAssignRecord(string strUserCode)
    {
        string strHQL;
        IList lst;

        if (strProjectID != "0")
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('计划','受理','待处理')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.MoveTime DESC";
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_ToBeHandled.DataSource = lst;
            DataList_ToBeHandled.DataBind();
            SetReqRecordColor(lst, DataList_ToBeHandled, "待处理");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('处理中','处理中')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_Handling.DataSource = lst;
            DataList_Handling.DataBind();
            SetReqRecordColor(lst, DataList_Handling, "处理中");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (reqAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_FinishedUnAssigned.DataSource = lst;
            DataList_FinishedUnAssigned.DataBind();
            SetReqRecordColor(lst, DataList_FinishedUnAssigned, "已完成");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and  reqAssignRecord.status = '已分派'";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_Assigned.DataSource = lst;
            DataList_Assigned.DataBind();
            SetReqRecordColor(lst, DataList_Assigned, "已分派");
        }
        else
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('计划','受理','待处理')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.MoveTime DESC";
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_ToBeHandled.DataSource = lst;
            DataList_ToBeHandled.DataBind();
            SetReqRecordColor(lst, DataList_ToBeHandled, "待处理");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('处理中','处理中')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";

            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_Handling.DataSource = lst;
            DataList_Handling.DataBind();
            SetReqRecordColor(lst, DataList_Handling, "处理中");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成')";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
          
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_FinishedUnAssigned.DataSource = lst;
            DataList_FinishedUnAssigned.DataBind();
            SetReqRecordColor(lst, DataList_FinishedUnAssigned, "已完成");

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status = '已分派'";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataList_Assigned.DataSource = lst;
            DataList_Assigned.DataBind();
            SetReqRecordColor(lst, DataList_Assigned, "已分派");
        }
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql5.Text;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void SetReqRecordColor(IList lst, DataList dataList, string strTaskStatus)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        //for (i = 0; i < lst.Count; i++)
        //{
        //    dtFinishedDate = DateTime.Parse(((ReqAssignRecord)lst[i]).EndDate.ToString());

        //    dtNowDate = DateTime.Now;

        //    strStatus = ((ReqAssignRecord)lst[i]).Status.Trim();

        //    if (strStatus != "完成" & strStatus != "已完成")
        //    {
        //        if (strTaskStatus != "已分派")
        //        {
        //            if (dtFinishedDate < dtNowDate)
        //            {
        //                dataList.Items[i].BackColor = Color.LightPink;
        //            }
        //        }
        //        else
        //        {
        //            dataList.Items[i].BackColor = Color.LightGreen;
        //        }
        //    }
        //    else
        //    {
        //        if (strTaskStatus == "已分派")
        //        {
        //            dataList.Items[i].BackColor = Color.Green;
        //        }
        //        else
        //        {
        //            dataList.Items[i].BackColor = Color.LightGreen;
        //        }
        //    }
        //}

    }

    protected void LoadRequirement(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Requirement as requirement where requirement.ApplicantCode = " + "'" + strUserCode + "'" + " order by requirement.ReqID DESC";
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }
}

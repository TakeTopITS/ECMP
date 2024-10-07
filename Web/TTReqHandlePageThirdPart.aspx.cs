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

public partial class TTReqHandlePageThirdPart : System.Web.UI.Page
{
    string strLangCode;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "我的需求", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack != true)
        {
            HL_CreateReq.NavigateUrl = "TTMakeReqThirdPart.aspx";

            LoadReqAssignRecord(strUserCode);
            LoadRequirement(strUserCode);
        }
    }

    protected void BT_CreateReq_Click(object sender, EventArgs e)
    {
        string strURL;

        strURL = "popShowByURL('TTMakeReqThirdPart.aspx', 800, 600,window.location);";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
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
    }

    protected void LoadReqAssignRecord(string strUserCode)
    {
        string strHQL;
        DataSet ds;

        strHQL = "Select * from T_ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and reqAssignRecord.Status in ('计划','受理','待处理')";
        strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from T_Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by reqAssignRecord.MoveTime DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReqAssignRecord");
        DataList_ToBeHandled.DataSource = ds;
        DataList_ToBeHandled.DataBind();
        SetReqRecordColor(ds, DataList_ToBeHandled, "待处理");

        strHQL = "Select * from T_ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and reqAssignRecord.Status in ('处理中','处理中')";
        strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from T_Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by reqAssignRecord.MoveTime DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReqAssignRecord");
        DataList_Handling.DataSource = ds;
        DataList_Handling.DataBind();
        SetReqRecordColor(ds, DataList_Handling, "处理中");

        strHQL = "Select * from T_ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and reqAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成') ";
        strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from T_Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by reqAssignRecord.MoveTime DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReqAssignRecord");
        DataList_FinishedUnAssigned.DataSource = ds;
        DataList_FinishedUnAssigned.DataBind();
        SetReqRecordColor(ds, DataList_FinishedUnAssigned, "已完成");


        strHQL = "Select * from T_ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and reqAssignRecord.status = '已分派'";
        strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from T_Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by reqAssignRecord.MoveTime DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReqAssignRecord");
        DataList_Assigned.DataSource = ds;
        DataList_Assigned.DataBind();
        SetReqRecordColor(ds, DataList_Assigned, "已分派");


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

    protected void SetReqRecordColor(DataSet ds, DataList dataList, string strTaskStatus)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        //for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    dtFinishedDate = DateTime.Parse(ds.Tables[0].Rows[i]["EndDate"].ToString());

        //    dtNowDate = DateTime.Now;

        //    strStatus = ds.Tables[0].Rows[i]["Status"].ToString().Trim();

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

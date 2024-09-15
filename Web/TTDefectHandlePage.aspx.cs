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
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTDefectHandlePage : System.Web.UI.Page
{
    string strLangCode;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "需求管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack != true)
        {
            HL_CreateDefect.NavigateUrl = "TTMakeDefect.aspx";

            LoadDefectAssignRecord(strUserCode);
            LoadDefectment(strUserCode);
        }
    }

    protected void BT_CreateDefect_Click(object sender, EventArgs e)
    {
        string strURL;

        strURL = "popShowByURL('TTMakeDefect.aspx'title, 800, 600,window.location);";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
    }

    protected void BT_UpdateStatus_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strStatus;

        strID = LB_SourceID.Value;
        strStatus = LB_TargetStatus.Value;

        strHQL = "Update T_DefectAssignRecord Set Status =  '" + strStatus + "',MoveTime = now() Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL);

        LoadDefectAssignRecord(strUserCode);

        //Response.Redirect("TTDefectHandlePage.aspx");
    }

    protected void LoadDefectAssignRecord(string strUserCode)
    {
        string strHQL;
        DataSet ds;

        strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.Status in ('计划','受理','待处理') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from T_DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.MoveTime DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
        DataList_ToBeHandled.DataSource = ds;
        DataList_ToBeHandled.DataBind();
        SetDefectRecordColor(ds, DataList_ToBeHandled, "待处理");

        strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.Status in ('处理中','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from T_DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
        DataList_Handling.DataSource = ds;
        DataList_Handling.DataBind();
        SetDefectRecordColor(ds, DataList_Handling, "处理中");

        strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (defectAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from T_DefectAssignRecord as defectAssignRecord))";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
        DataList_FinishedUnAssigned.DataSource = ds;
        DataList_FinishedUnAssigned.DataBind();
        SetDefectRecordColor(ds, DataList_FinishedUnAssigned, "已完成");

        strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from T_DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC limit 40";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
        DataList_Assigned.DataSource = ds;
        DataList_Assigned.DataBind();
        SetDefectRecordColor(ds, DataList_Assigned,"已分派");
    }

    protected void LoadDefectment(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Defectment as defectment where defectment.ApplicantCode = " + "'" + strUserCode + "'" + " order by defectment.DefectID DESC";
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
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

    protected void SetDefectRecordColor(DataSet ds, DataList dataList,string strTaskStatus)
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

}

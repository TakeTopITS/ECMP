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

public partial class TTProjectDefectmentHandlePage : System.Web.UI.Page
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

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "需求管理", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack != true)
        {
            LoadDefectAssignRecord(strUserCode);
            LoadDefectment(strUserCode);
        }
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

        //Response.Redirect("TTProjectDefectmentHandlePage.aspx?ProjectID=" + strProjectID);
    }

    protected void LoadDefectAssignRecord(string strUserCode)
    {
        string strHQL;

        if (strProjectID != "0")
        {
            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('计划','受理','待处理')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.MoveTime DESC limit 40";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('处理中','处理中')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status = '已分派'";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
        }
        else
        {
            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('计划','受理','待处理')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from T_Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.MoveTime  DESC limit 40";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('处理中','处理中')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from T_Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.MoveTime  DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成')";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from T_Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.MoveTime  DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();

            strHQL = "Select * from T_DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status = '已分派'";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from T_RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from T_Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.MoveTime  DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_DefectAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
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
        //    dtFinishedDate = DateTime.Parse(((DefectAssignRecord)lst[i]).EndDate.ToString());

        //    dtNowDate = DateTime.Now;

        //    strStatus = ((DefectAssignRecord)lst[i]).Status.Trim();

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
}

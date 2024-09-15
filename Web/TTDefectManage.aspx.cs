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


public partial class TTDefectManage : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;
        string strUserName;

        strLangCode = Session["LangCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        Response.Redirect("TTDefectHandlePage.aspx");

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "缺陷管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('计划','受理','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            SetDefectRecordColor(DataGrid4);

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (defectAssignRecord.Status in ('拒绝','完成','挂起','取消') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            SetDefectRecordColor(DataGrid1);


            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid6.DataSource = lst;
            DataGrid6.DataBind();
            LB_Sql6.Text = strHQL;

            SetDefectRecordColor(DataGrid6);

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;

            SetDefectRecordColor(DataGrid3);

            LoadDefectment(strUserCode);

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;

            strHQL = "from DefectStatus as defectStatus";
            strHQL += " Where defectStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by defectStatus.SortNumber ASC";
            DefectStatusBLL DefectStatusBLL = new DefectStatusBLL();
            lst = DefectStatusBLL.GetAllDefectStatuss(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_QueryScope.Text = Resources.lang.StatusAll;
        }
    }


    protected void BT_AllDefect_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.Status in ('计划','受理','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC";
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;

        SetDefectRecordColor(DataGrid4);

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (defectAssignRecord.Status in ('拒绝','完成','挂起','取消') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        SetDefectRecordColor(DataGrid1);

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
        LB_Sql6.Text = strHQL;

        SetDefectRecordColor(DataGrid6);

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
        //strHQL += " and (defectAssignRecord.Status = '转项' or defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;

        SetDefectRecordColor(DataGrid3);

        LB_QueryScope.Text = Resources.lang.StatusAll;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text.Trim();

        LB_QueryScope.Text = Resources.lang.Status + strStatus;

        string strUserCode = LB_UserCode.Text;
        string strHQL;
        IList lst;

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.Status in ('计划','受理','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档')))";
        strHQL += " and defectAssignRecord.Status = " + "'" + strStatus + "'" + " Order by defectAssignRecord.ID DESC";
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;

        SetDefectRecordColor(DataGrid4);

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (defectAssignRecord.Status in ('拒绝','完成','挂起','取消') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
        strHQL += " and defectAssignRecord.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档')))";
        strHQL += " and defectAssignRecord.Status = " + "'" + strStatus + "'" + " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        SetDefectRecordColor(DataGrid1);


        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
        strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
        strHQL += " and defectAssignRecord.Status = " + "'" + strStatus + "'" + " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
        LB_Sql6.Text = strHQL;

        SetDefectRecordColor(DataGrid6);

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
        //strHQL += " and (defectAssignRecord.Status = '转项' or defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
        strHQL += " and defectAssignRecord.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.DefectID not in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档')))";
        strHQL += " and defectAssignRecord.Status = " + "'" + strStatus + "'" + " Order by defectAssignRecord.ID DESC";
        defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;

        SetDefectRecordColor(DataGrid3);

    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        IList lst;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql1.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql3.Text;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
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

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql6.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }

    protected void SetDefectRecordColor(DataGrid dataGrid)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < dataGrid.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(dataGrid.Items[i].Cells[6].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = dataGrid.Items[i].Cells[7].Text.Trim();

            if (strStatus != "完成" & strStatus != "已完成")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    dataGrid.Items[i].ForeColor = Color.Red;
                }
            }
        }
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

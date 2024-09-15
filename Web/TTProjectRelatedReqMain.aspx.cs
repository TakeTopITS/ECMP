using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectRelatedReqMain : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        //this.Title = Resources.lang.Project + strProjectID + project.ProjectName + "的相关需求";

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strHQL = "Select Distinct ReqType From V_ProjectRelatedReqView Where ProjectID = " + strProjectID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedReqView");
            DL_ReqType.DataSource = ds;
            DL_ReqType.DataBind();

            strHQL = "from ProjectRelatedReqView as projectRelatedReqView where projectRelatedReqView.ProjectID = " + strProjectID + " Order by ReqID DESC";
            ProjectRelatedReqViewBLL projectRelatedReqView = new ProjectRelatedReqViewBLL();
            lst = projectRelatedReqView.GetAllProjectRelatedReqViews(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }

    protected void BT_RecordDefect_Click(object sender, EventArgs e)
    {
        string strURL = "popShowByURL('TTMakeProjectRequirement.aspx?ProjectID=" + strProjectID + "','" + Resources.lang.CreateReq + "', 800, 600,window.location);";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
    }

    protected void BT_AllReq_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectRelatedReqView as projectRelatedReqView where projectRelatedReqView.ProjectID = " + strProjectID + " Order by ReqID DESC";
        ProjectRelatedReqViewBLL projectRelatedReqView = new ProjectRelatedReqViewBLL();
        lst = projectRelatedReqView.GetAllProjectRelatedReqViews(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL, strReqType, strUserCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();
        strReqType = DL_ReqType.SelectedValue.Trim();

        strHQL = "from ProjectRelatedReqView as projectRelatedReqView where projectRelatedReqView.ReqType = " + "'" + strReqType + "'" + " and projectRelatedReqView.ProjectID = " + strProjectID + " Order by ReqID DESC";
        ProjectRelatedReqViewBLL projectRelatedReqView = new ProjectRelatedReqViewBLL();
        lst = projectRelatedReqView.GetAllProjectRelatedReqViews(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strReqID = e.Item.Cells[0].Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();
        string strStatus = ShareClass.GetProjectStatus(strProjectID);

        if (e.CommandName != "Page")
        {
            if (strStatus == "结案" || strStatus == "挂起" || strStatus == "取消")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCXMYBJAGHX + "')", true);
            }
            else
            {
                string strHQL = "from RelatedReq as relatedReq where relatedReq.ReqID = " + strReqID + " and relatedReq.ProjectID = " + strProjectID;
                RelatedReqBLL relatedReqBLL = new RelatedReqBLL();
                IList lst = relatedReqBLL.GetAllRelatedReqs(strHQL);
                RelatedReq relatedReq = (RelatedReq)lst[0];

                relatedReqBLL.DeleteRelatedReq(relatedReq);

                strHQL = "from ProjectRelatedReqView as projectRelatedReqView where projectRelatedReqView.ProjectID = " + strProjectID;
                ProjectRelatedReqViewBLL projectRelatedReqView = new ProjectRelatedReqViewBLL();
                lst = projectRelatedReqView.GetAllProjectRelatedReqViews(strHQL);
                DataGrid2.DataSource = lst;
                DataGrid2.DataBind();
            }
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL, strReqType, strUserCode;
        IList lst;

        if (e.CommandName != "Page")
        {
            strUserCode = LB_UserCode.Text.Trim();
            strReqType = ((Button)e.Item.FindControl("BT_ReqType")).Text.Trim();

            strHQL = "from ProjectRelatedReqView as projectRelatedReqView where projectRelatedReqView.ReqType = " + "'" + strReqType + "'" + " and projectRelatedReqView.ProjectID = " + strProjectID + " Order by ReqID DESC";
            ProjectRelatedReqViewBLL projectRelatedReqView = new ProjectRelatedReqViewBLL();
            lst = projectRelatedReqView.GetAllProjectRelatedReqViews(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.Status.Trim();
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}

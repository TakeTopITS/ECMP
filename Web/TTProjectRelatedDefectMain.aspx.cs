using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTProjectRelatedDefectMain : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        //this.Title = Resources.lang.Project + strProjectID + project.ProjectName + "的相关缺陷";

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strHQL = "Select Distinct DefectType From V_ProjectRelatedDefectView Where ProjectID = " + strProjectID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedDefectView");
            DL_DefectType.DataSource = ds;
            DL_DefectType.DataBind();

            strHQL = "from ProjectRelatedDefectView as projectRelatedDefectView where projectRelatedDefectView.ProjectID = " + strProjectID + " Order by DefectID DESC";
            ProjectRelatedDefectViewBLL projectRelatedDefectView = new ProjectRelatedDefectViewBLL();
            lst = projectRelatedDefectView.GetAllProjectRelatedDefectViews(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }


    protected void BT_RecordDefect_Click(object sender, EventArgs e)
    {
        string strURL = "popShowByURL('TTMakeProjectDefectment.aspx?ProjectID=" + strProjectID +"','" + Resources.lang.JiLuQueXian + "', 800, 600,window.location);";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
    }

    protected void BT_AllDefect_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectRelatedDefectView as projectRelatedDefectView where projectRelatedDefectView.ProjectID = " + strProjectID + " Order by DefectID DESC";
        ProjectRelatedDefectViewBLL projectRelatedDefectView = new ProjectRelatedDefectViewBLL();
        lst = projectRelatedDefectView.GetAllProjectRelatedDefectViews(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL, strDefectType, strUserCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();
        strDefectType = DL_DefectType.SelectedValue.Trim();

        strHQL = "from ProjectRelatedDefectView as projectRelatedDefectView where projectRelatedDefectView.DefectType = " + "'" + strDefectType + "'" + " and projectRelatedDefectView.ProjectID = " + strProjectID + " Order by DefectID DESC";
        ProjectRelatedDefectViewBLL projectRelatedDefectView = new ProjectRelatedDefectViewBLL();
        lst = projectRelatedDefectView.GetAllProjectRelatedDefectViews(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strDefectID = e.Item.Cells[0].Text.Trim();
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
                string strHQL = "from RelatedDefect as relatedDefect where relatedDefect.DefectID = " + strDefectID + " and relatedDefect.ProjectID = " + strProjectID;
                RelatedDefectBLL relatedDefectBLL = new RelatedDefectBLL();
                IList lst = relatedDefectBLL.GetAllRelatedDefects(strHQL);
                RelatedDefect relatedDefect = (RelatedDefect)lst[0];

                relatedDefectBLL.DeleteRelatedDefect(relatedDefect);

                strHQL = "from ProjectRelatedDefectView as projectRelatedDefectView where projectRelatedDefectView.ProjectID = " + strProjectID;
                ProjectRelatedDefectViewBLL projectRelatedDefectView = new ProjectRelatedDefectViewBLL();
                lst = projectRelatedDefectView.GetAllProjectRelatedDefectViews(strHQL);
                DataGrid2.DataSource = lst;
                DataGrid2.DataBind();
            }
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL, strDefectType, strUserCode;
        IList lst;

        if (e.CommandName != "Page")
        {
            strUserCode = LB_UserCode.Text.Trim();
            strDefectType = ((Button)e.Item.FindControl("BT_DefectType")).Text.Trim();

            strHQL = "from ProjectRelatedDefectView as projectRelatedDefectView where projectRelatedDefectView.DefectType = " + "'" + strDefectType + "'" + " and projectRelatedDefectView.ProjectID = " + strProjectID + " Order by DefectID DESC";
            ProjectRelatedDefectViewBLL projectRelatedDefectView = new ProjectRelatedDefectViewBLL();
            lst = projectRelatedDefectView.GetAllProjectRelatedDefectViews(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }

}

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTBaseDataInner : System.Web.UI.Page
{
    private string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        string strUserCode = Session["UserCode"].ToString();
        LB_UserCode.Text = strUserCode;
        strLangCode = Session["LangCode"].ToString();


        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "基础数据(内置)", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_SelectedProjectType.Text = "";
            LoadProjectType();
            LoadProjectStatus("", strLangCode);

            LoadWLStatus(strLangCode);
            LoadWLType(strLangCode);

            LoadTestStatus(strLangCode);
            LoadPlanStatus(strLangCode);
            LoadTaskStatus(strLangCode);
            LoadReqStatus(strLangCode);

            LoadActorGroup(strLangCode);

            LoadOtherStatus(strLangCode);
            LoadFunInforDialBoxList(strLangCode);

            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
            ddlLangSwitcher.SelectedValue = strLangCode;
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = ((Button)e.Item.FindControl("BT_StatusID")).Text;
        string strStatus = e.Item.Cells[1].Text.Trim();
        string strMakeType = e.Item.Cells[6].Text.Trim();

        string strReviewConstrol = e.Item.Cells[5].Text.Trim();

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }
        e.Item.ForeColor = Color.Red;

        LB_ID.Text = strID;
        TB_ProjectStatus.Text = strStatus;

        DL_ReviewControl.SelectedValue = strReviewConstrol;

        if (strMakeType == "SYS")
        {
            BT_ProjectStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid20_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectType = ((Button)e.Item.FindControl("BT_ProjectType")).Text.Trim();

        strHQL = "From ProjectType as projectType Where projectType = '" + strProjectType + "'";
        ProjectTypeBLL projectTypeBLL = new ProjectTypeBLL();
        lst = projectTypeBLL.GetAllProjectTypes(strHQL);
        ProjectType projectType = (ProjectType)lst[0];

        string strKeyWord = projectType.KeyWord.Trim();
        string strAllowPMChangeStatus = projectType.AllowPMChangeStatus.Trim();
        string strAutoRunWFAfterMakeProject = projectType.AutoRunWFAfterMakeProject.Trim();
        string strProgressByDetailImpact = projectType.ProgressByDetailImpact.Trim();
        string strPlanProgressNeedPlanerConfirm = projectType.PlanProgressNeedPlanerConfirm.Trim();
        string strSortNumber = projectType.SortNumber.ToString();

        for (int i = 0; i < DataGrid20.Items.Count; i++)
        {
            DataGrid20.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        TB_ProjectType.Text = strProjectType;
        TB_KeyWord.Text = strKeyWord;
        DL_AllowPMChangeStatus.SelectedValue = strAllowPMChangeStatus;
        DL_AutoRunWFAfterMakeProject.SelectedValue = strAutoRunWFAfterMakeProject;
        DL_ImpactByDetail.SelectedValue = strProgressByDetailImpact;
        DL_PlanProgressNeedPlanerConfirm.SelectedValue = strPlanProgressNeedPlanerConfirm;
        DL_ProjectStartupNeedSupperConfirm.SelectedValue = projectType.ProjectStartupNeedSupperConfirm.Trim();
        TB_ProjectTypeSort.Text = strSortNumber;

        LB_SelectedProjectType.Text = strProjectType;

        BT_ProjectTypeUpdate.Enabled = true;
        BT_ProjectTypeDelete.Enabled = true;

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        LoadProjectStatus(strProjectType, strLangCode);

        if (strProjectType == "OtherProject")
        {
            BT_ProjectTypeDelete.Enabled = false;
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_ReqStatus.Text = strStatus;
        TB_ReqSortNumber.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_ReqStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_TaskStatus.Text = strStatus;
        TB_TaskSortNumber.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_TaskStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperation = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_PlanStatus.Text = strOperation;
        TB_PlanStatusSort.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_PlanStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_WLStatus.Text = strStatus;
        TB_WLStatusSort.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_WorkflowStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strWLType = ((Button)e.Item.FindControl("BT_Type")).Text.Trim();
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_WLType.Text = strWLType;
        TB_WLTypeSort.Text = strSortNumber;
    }

    protected void DataGrid16_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_TestStatus.Text = strStatus;
        TB_TestStatusSort.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_TestStatusDelete.Enabled = false;
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strSortNumber = e.Item.Cells[3].Text.Trim();
        string strMakeType = e.Item.Cells[4].Text.Trim();

        TB_OtherStatus.Text = strStatus;
        TB_OtherStatusSort.Text = strSortNumber;

        if (strMakeType == "SYS")
        {
            BT_OtherStatusDelete.Enabled = false;
        }
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        strLangCode = ddlLangSwitcher.SelectedValue;

        LoadWLType(strLangCode);
        LoadProjectStatus("", strLangCode);
        LoadWLStatus(strLangCode);

        LoadTestStatus(strLangCode);
        LoadPlanStatus(strLangCode);
        LoadTaskStatus(strLangCode);
        LoadReqStatus(strLangCode);
        LoadActorGroup(strLangCode);
        LoadOtherStatus(strLangCode);
        LoadFunInforDialBoxList(strLangCode);
    }

    protected void BT_CopyForHomeLanguage_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strFromLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();
        try
        {
            strHQL = "Insert Into T_WLType(Type,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Type,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_WLType";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Type)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Type)) || ltrim(rtrim(LangCode))  From T_WLType Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_ProjectStatus(Status,SortNumber ,ReviewControl ,ProjectType ,IdentityString ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,ReviewControl ,ProjectType ,IdentityString,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_ProjectStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " || ltrim(rtrim(ProjectType)) Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode)) || ltrim(rtrim(ProjectType)) From T_ProjectStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_ReqStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_ReqStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_ReqStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_PlanStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_PlanStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_PlanStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_TaskStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_TaskStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_TaskStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_TestStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_TestStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_TestStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_WLStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_WLStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_WLStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_ActorGroup(GroupName,MakeUserCode,Type,IdentifyString,BelongDepartCode,BelongDepartName,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT GroupName,MakeUserCode,Type,IdentifyString,BelongDepartCode,BelongDepartName,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_ActorGroup";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(GroupName)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(GroupName)) || ltrim(rtrim(LangCode))  From T_ActorGroup Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_OtherStatus(Status,SortNumber ,MakeType,LangCode,HomeName )";
            strHQL += " SELECT Status,SortNumber ,MakeType ," + "'" + strLangCode + "'" + ",HomeName FROM T_OtherStatus";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(Status)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(Status)) || ltrim(rtrim(LangCode))  From T_OtherStatus Where LangCode = " + "'" + strLangCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_FunInforDialBox(InforName,SQLCode ,Status,CreateTime,BoxType,LinkAddress ,IsSendMsg ,IsSendEmail,SortNumber,MobileLinkAddress ,IsForceInfor,UserType,HomeName,LangCode)";
            strHQL += " Select InforName,SQLCode ,Status,CreateTime,BoxType,LinkAddress ,IsSendMsg ,IsSendEmail,SortNumber,MobileLinkAddress ,IsForceInfor,UserType,HomeName," + "'" + strLangCode + "'" + " From T_FunInforDialBox";
            strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(InforName)) || " + "'" + strLangCode + "'" + " Not in (Select ltrim(rtrim(InforName)) || ltrim(rtrim(LangCode))  From T_FunInforDialBox Where LangCode = " + "'" + strLangCode + "'" + ")";            ShareClass.RunSqlCommand(strHQL);
            ShareClass.RunSqlCommand(strHQL);

            LoadWLType(strLangCode);
            LoadProjectStatus("", strLangCode);
            LoadWLStatus(strLangCode);

            LoadTestStatus(strLangCode);
            LoadPlanStatus(strLangCode);
            LoadTaskStatus(strLangCode);
            LoadReqStatus(strLangCode);
            LoadActorGroup(strLangCode);
            LoadOtherStatus(strLangCode);
            LoadFunInforDialBoxList(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
        }
    }

    protected void BT_ProjectStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus = TB_ProjectStatus.Text.Trim();

        string strReviewControl = DL_ReviewControl.SelectedValue.Trim();
        string strProjectType = LB_SelectedProjectType.Text.Trim();
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        ProjectStatus projectStatus = new ProjectStatus();

        try
        {
            projectStatus.Status = strStatus;
            projectStatus.LangCode = strLangCode;
            projectStatus.SortNumber = 1;
            projectStatus.ProjectType = strProjectType;
            projectStatus.ReviewControl = strReviewControl;
            projectStatus.IdentityString = DateTime.Now.ToString("yyyyMMddHHMMssff");
            projectStatus.LangCode = strLangCode;
            projectStatus.HomeName = strStatus;
            projectStatus.MakeType = "DIY";

            projectStatusBLL.AddProjectStatus(projectStatus);

            LoadProjectStatus(strProjectType, strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_ProjectStatusDelete_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strID = LB_ID.Text.Trim();
        string strStatus = TB_ProjectStatus.Text.Trim();
        string strProjectType = LB_SelectedProjectType.Text.Trim();
        string strStatusString = "新建,评审,受理,活动,拒绝,结案,取消,挂起,归档,隐藏,删除";

        if (strStatusString.IndexOf(strStatus) == -1)
        {
            strHQL = "Delete From T_ProjectStatus Where ID =" + strID;

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadProjectStatus(strProjectType, strLangCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSTRSTATUSZTBNBSC + "')", true);
        }
    }

    protected void BT_ProjectStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strHomeName, strSortNumber;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid3.Items.Count; j++)
            {
                strID = ((Button)DataGrid3.Items[j].FindControl("BT_StatusID")).Text;

                strHomeName = ((TextBox)(DataGrid3.Items[j].FindControl("TB_HomeName"))).Text.Trim();

                strHQL = "Update T_ProjectStatus Set HomeName = N" + "'" + strHomeName + "'" + "  Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                strSortNumber = ((TextBox)(DataGrid3.Items[j].FindControl("TB_SortNumber"))).Text.Trim();

                strHQL = "Update T_ProjectStatus Set SortNumber = " + strSortNumber + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            string strProjectType = LB_SelectedProjectType.Text.Trim();
            LoadProjectStatus(strProjectType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void DL_ReviewControl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strStatus, strControl;
        string strHQL;

        string strProjectType = LB_SelectedProjectType.Text.Trim();

        strStatus = TB_ProjectStatus.Text.Trim();
        strControl = DL_ReviewControl.SelectedValue.Trim();

        strHQL = "Update T_ProjectStatus Set ReviewControl = " + "'" + strControl + "'" + " Where ProjectType = '" + strProjectType + "' and Status = '" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);
            LoadProjectStatus(strProjectType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJC + "')", true);

            if (strControl == "是")
            {
                DL_ReviewControl.SelectedValue = "否";
            }
            else
            {
                DL_ReviewControl.SelectedValue = "是";
            }
        }
    }

    protected void TB_ProejctTypeNew_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strType, strKeyWord, strAllowPMChangeStatus, strAutoRunWFAfterMakeProject, strProgressByDetailImpact, strPlanProgressNeedPlanerConfirm, strSortNumber;
        string strProjectStartupNeedSupperConfirm;

        strType = TB_ProjectType.Text.Trim();
        strKeyWord = TB_KeyWord.Text.Trim();
        strAllowPMChangeStatus = DL_AllowPMChangeStatus.SelectedValue.Trim();
        strAutoRunWFAfterMakeProject = DL_AutoRunWFAfterMakeProject.SelectedValue.Trim();
        strProgressByDetailImpact = DL_ImpactByDetail.SelectedValue.Trim();
        strPlanProgressNeedPlanerConfirm = DL_PlanProgressNeedPlanerConfirm.SelectedValue.Trim();

        strProjectStartupNeedSupperConfirm = DL_ProjectStartupNeedSupperConfirm.SelectedValue.Trim();

        strSortNumber = TB_ProjectTypeSort.Text.Trim();

        ProjectTypeBLL projectTypeBLL = new ProjectTypeBLL();
        ProjectType projectType = new ProjectType();

        projectType.Type = strType;
        projectType.KeyWord = strKeyWord;
        projectType.AllowPMChangeStatus = strAllowPMChangeStatus;
        projectType.AutoRunWFAfterMakeProject = strAutoRunWFAfterMakeProject;
        projectType.ProgressByDetailImpact = strProgressByDetailImpact;
        projectType.PlanProgressNeedPlanerConfirm = strPlanProgressNeedPlanerConfirm;
        projectType.ProjectStartupNeedSupperConfirm = strProjectStartupNeedSupperConfirm;

        try
        {
            projectType.SortNumber = 1;
            projectType.SortNumber = int.Parse(strSortNumber);
        }
        catch
        {
        }

        try
        {
            projectTypeBLL.AddProjectType(projectType);
            LoadProjectType();

            strHQL = "insert into T_ProjectStatus(Status,SortNumber,ReviewControl,IdentityString,ProjectType,HomeName,LangCode,MakeType)";
            strHQL += " select Status,SortNumber,ReviewControl,IdentityString," + "'" + strType + "',HomeName,LangCode,MakeType";
            strHQL += " from T_ProjectStatus where ProjectType = 'OtherProject'";
            ShareClass.RunSqlCommand(strHQL);

            BT_ProjectTypeUpdate.Enabled = true;
            BT_ProjectTypeDelete.Enabled = true;

            LoadProjectStatus(strType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_ProjectTypeUpdate_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strType, strSelectedType, strKeyWord, strAllowPMChangeStatus, strAutoRunWFAfterMakeProject, strProgressByDetailImpact, strPlanProgressNeedPlanerConfirm, strSortNumber;
        string strProjectStartupNeedSupperConfirm;

        strSelectedType = LB_SelectedProjectType.Text.Trim();
        strType = TB_ProjectType.Text.Trim();
        strKeyWord = TB_KeyWord.Text.Trim();
        strAllowPMChangeStatus = DL_AllowPMChangeStatus.SelectedValue.Trim();
        strAutoRunWFAfterMakeProject = DL_AutoRunWFAfterMakeProject.SelectedValue.Trim();
        strProgressByDetailImpact = DL_ImpactByDetail.SelectedValue.Trim();
        strPlanProgressNeedPlanerConfirm = DL_PlanProgressNeedPlanerConfirm.SelectedValue.Trim();
        strProjectStartupNeedSupperConfirm = DL_ProjectStartupNeedSupperConfirm.SelectedValue.Trim();
        strSortNumber = TB_ProjectTypeSort.Text.Trim();

        strHQL = "From ProjectType as projectType Where projectType = " + "'" + strSelectedType + "'";
        ProjectTypeBLL projectTypeBLL = new ProjectTypeBLL();
        IList lst = projectTypeBLL.GetAllProjectTypes(strHQL);
        ProjectType projectType = (ProjectType)lst[0];

        if (projectType.Type.Trim() != "OtherProject")
        {
            projectType.Type = strType;
        }
        projectType.KeyWord = strKeyWord;
        projectType.AllowPMChangeStatus = strAllowPMChangeStatus;
        projectType.AutoRunWFAfterMakeProject = strAutoRunWFAfterMakeProject;
        projectType.ProgressByDetailImpact = strProgressByDetailImpact;
        projectType.PlanProgressNeedPlanerConfirm = strPlanProgressNeedPlanerConfirm;
        projectType.ProjectStartupNeedSupperConfirm = strProjectStartupNeedSupperConfirm;

        projectType.SortNumber = int.Parse(strSortNumber);

        try
        {
            projectTypeBLL.UpdateProjectType(projectType, strSelectedType);

            LoadProjectType();
            LoadProjectStatus(strType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_ProjectTypeDelete_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strType;

        strType = TB_ProjectType.Text.Trim();

        strHQL = "Select * From T_Project Where ProjectType = '" + strType + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGYJYXMSYZLXBNSCHXGQJC + "')", true);
            return;
        }

        try
        {
            strHQL = "Delete From T_ProjectType Where Type = '" + strType + "'";
            ShareClass.RunSqlCommand(strHQL); ;
            LoadProjectType();

            strHQL = " Delete from T_ProjectStatus where ProjectType = " + "'" + strType + "'";
            ShareClass.RunSqlCommand(strHQL);

            BT_ProjectTypeUpdate.Enabled = false;
            BT_ProjectTypeDelete.Enabled = false;

            LoadProjectStatus(strType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void BT_TaskStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus = TB_TaskStatus.Text.Trim();
        string strSortNumber = TB_TaskSortNumber.Text.Trim();

        TaskStatusBLL taskStatusBLL = new TaskStatusBLL();
        TaskStatus taskStatus = new TaskStatus();

        try
        {
            taskStatus.Status = strStatus;
            taskStatus.LangCode = strLangCode;
            taskStatus.MakeType = "DIY";
            taskStatus.Status = strStatus;
            taskStatus.SortNumber = int.Parse(strSortNumber);

            taskStatusBLL.AddTaskStatus(taskStatus);

            LoadTaskStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_TaskStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus = TB_TaskStatus.Text.Trim();
        string strSortNumber = TB_TaskSortNumber.Text.Trim();

        string strHQL = "Delete From T_TaskStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadTaskStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_TaskStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID, strSortNumber;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid6.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid6.Items[j].FindControl("BT_Status")).Text;
                strHomeName = ((TextBox)(DataGrid6.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid6.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_TaskStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_TaskStatus.Text.Trim();
                strSortNumber = TB_TaskSortNumber.Text.Trim();

                strHQL = "Update T_TaskStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadTaskStatus(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_PlanStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus = TB_PlanStatus.Text.Trim();
        string strSortNumber = TB_PlanStatusSort.Text.Trim();

        PlanStatusBLL planStatusBLL = new PlanStatusBLL();
        PlanStatus planStatus = new PlanStatus();

        try
        {
            planStatus.Status = strStatus;
            planStatus.LangCode = strLangCode;
            planStatus.MakeType = "DIY";
            planStatus.Status = strStatus;
            planStatus.SortNumber = int.Parse(strSortNumber);

            planStatusBLL.AddPlanStatus(planStatus);

            LoadPlanStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_PlanStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus = TB_PlanStatus.Text.Trim();
        string strSortNumber = TB_PlanStatusSort.Text.Trim();

        string strHQL = "Delete From T_PlanStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadPlanStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_PlanStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid8.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid8.Items[j].FindControl("BT_Status")).Text;
                strHomeName = ((TextBox)(DataGrid8.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid8.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_PlanStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_PlanStatus.Text.Trim();
                string strSortNumber = TB_PlanStatusSort.Text.Trim();

                strHQL = "Update T_PlanStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadPlanStatus(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_WorkflowStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus = TB_WLStatus.Text.Trim();
        string strSortNumber = TB_WLStatusSort.Text.Trim();

        WLStatusBLL wlStatusBLL = new WLStatusBLL();
        WLStatus wlStatus = new WLStatus();

        try
        {
            wlStatus.Status = strStatus;
            wlStatus.LangCode = strLangCode;
            wlStatus.MakeType = "DIY";
            wlStatus.Status = strStatus;
            wlStatus.SortNumber = int.Parse(strSortNumber);

            wlStatusBLL.AddWLStatus(wlStatus);

            LoadWLStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_WorkflowStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus = TB_WLStatus.Text.Trim();
        string strSortNumber = TB_WLStatusSort.Text.Trim();

        string strHQL = "Delete From T_WLStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadWLStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_WorkflowStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid12.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid12.Items[j].FindControl("BT_Status")).Text;
                strHomeName = ((TextBox)(DataGrid12.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid12.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_WLStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_WLStatus.Text.Trim();
                string strSortNumber = TB_WLStatusSort.Text.Trim();

                strHQL = "Update T_WLStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadWLStatus(strLangCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void TB_WLTypeNew_Click(object sender, EventArgs e)
    {
        string strType, strSortNumber;

        strType = TB_WLType.Text.Trim();
        strSortNumber = TB_WLTypeSort.Text.Trim();

        WLTypeBLL wlTypeBLL = new WLTypeBLL();
        WLType wlType = new WLType();

        wlType.Type = strType;
        wlType.LangCode = strLangCode;
        wlType.MakeType = "DIY";
        wlType.HomeName = strType;
        wlType.SortNumber = int.Parse(strSortNumber);

        try
        {
            wlTypeBLL.AddWLType(wlType);
            LoadWLType(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_WLTypeDelete_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strType, strSortNumber;

        strType = TB_WLType.Text.Trim();
        strSortNumber = TB_WLTypeSort.Text.Trim();

        strHQL = "Select * From T_WorkFlow Where WLType = '" + strType + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGYJYLCSYZLCBNSCHXGQJC + "')", true);
            return;
        }

        try
        {
            strHQL = "Delete From T_WLType Where Type = " + "'" + strType + "'";

            ShareClass.RunSqlCommand(strHQL);
            LoadWLType(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void BT_WFTypeSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strType, strHomeName, strID, strSortNumber;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid13.Items.Count; j++)
            {
                strType = ((Button)DataGrid13.Items[j].FindControl("BT_Type")).Text;
                strHomeName = ((TextBox)(DataGrid13.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid13.Items[j].Cells[5].Text.Trim();

                strSortNumber = TB_WLTypeSort.Text;

                strHQL = "Update T_WLType Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strType = TB_WLType.Text.Trim();
                strSortNumber = TB_WLTypeSort.Text.Trim();

                strHQL = "Update T_WLType Set SortNumber = " + strSortNumber + " Where Type = '" + strType + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadWLType(strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_TestStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus;
        int intSortNumber;

        strStatus = TB_TestStatus.Text.Trim();
        intSortNumber = int.Parse(TB_TestStatusSort.Text);

        TestStatusBLL testStatusBLL = new TestStatusBLL();
        TestStatus testStatus = new TestStatus();

        try
        {
            testStatus.Status = strStatus;
            testStatus.LangCode = strLangCode;
            testStatus.MakeType = "DIY";
            testStatus.HomeName = strStatus;
            testStatus.SortNumber = intSortNumber;

            testStatusBLL.AddTestStatus(testStatus);
            LoadTestStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_TestStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus;
        int intSortNumber;

        strStatus = TB_TestStatus.Text.Trim();
        intSortNumber = int.Parse(TB_TestStatusSort.Text);

        string strHQL = "Delete From T_TestStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadTestStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_TestStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid16.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid16.Items[j].FindControl("BT_Status")).Text;
                strHomeName = ((TextBox)(DataGrid16.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid16.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_TestStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_TestStatus.Text.Trim();
                string strSortNumber = TB_TestStatusSort.Text.Trim();

                strHQL = "Update T_TestStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadTestStatus(strLangCode);
            LoadReqStatus(strLangCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_ReqStatusNew_Click(object sender, EventArgs e)
    {
        string strStatus = TB_ReqStatus.Text.Trim();
        string strSortNumber = TB_ReqSortNumber.Text.Trim();

        ReqStatusBLL reqStatusBLL = new ReqStatusBLL();
        ReqStatus reqStatus = new ReqStatus();

        try
        {
            reqStatus.Status = strStatus;
            reqStatus.LangCode = strLangCode;
            reqStatus.MakeType = "DIY";
            reqStatus.Status = strStatus;
            reqStatus.SortNumber = int.Parse(strSortNumber);

            reqStatusBLL.AddReqStatus(reqStatus);

            LoadReqStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_ReqStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus = TB_ReqStatus.Text.Trim();
        string strSortNumber = TB_ReqSortNumber.Text.Trim();

        string strHQL = "Delete From T_ReqStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadReqStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_ReqStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID, strSortNumber;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid5.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid5.Items[j].FindControl("BT_Status")).Text;

                strHomeName = ((TextBox)(DataGrid5.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid5.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_ReqStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_ReqStatus.Text.Trim();
                strSortNumber = TB_ReqSortNumber.Text.Trim();

                strHQL = "Update T_ReqStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            LoadReqStatus(strLangCode);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_ActorGroupSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strGroupName, strHomeName, strID;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid21.Items.Count; j++)
            {
                strGroupName = ((Button)DataGrid21.Items[j].FindControl("BT_GroupName")).Text;

                strHomeName = ((TextBox)(DataGrid21.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid21.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_ActorGroup Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_OtherStatusNew_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStatus;
        int intSortNumber;

        strStatus = TB_OtherStatus.Text.Trim();

        intSortNumber = int.Parse(TB_OtherStatusSort.Text);

        strHQL = "Insert Into T_OtherStatus(STatus,SortNumber,HomeName,LangCode,MakeType)";
        strHQL += " Values('" + strStatus + "'," + intSortNumber.ToString() + ",'" + strStatus + "','" + strLangCode + "','DIY')";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadOtherStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_OtherStatusDelete_Click(object sender, EventArgs e)
    {
        string strStatus;
        int intSortNumber;

        strStatus = TB_OtherStatus.Text.Trim();
        intSortNumber = int.Parse(TB_OtherStatusSort.Text);

        string strHQL = "Delete From T_OtherStatus Where Status = " + "'" + strStatus + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadOtherStatus(strLangCode);
        }
        catch
        {
        }
    }

    protected void BT_OtherStatusSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStatus, strHomeName, strID, strSortNumber;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid1.Items.Count; j++)
            {
                strStatus = ((Button)DataGrid1.Items[j].FindControl("BT_Status")).Text;
                strHomeName = ((TextBox)(DataGrid1.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid1.Items[j].Cells[5].Text.Trim();

                strHQL = "Update T_OtherStatus Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            try
            {
                strStatus = TB_OtherStatus.Text.Trim();
                strSortNumber = TB_OtherStatusSort.Text.Trim();

                strHQL = "Update T_OtherStatus Set SortNumber = " + strSortNumber + " Where Status = '" + strStatus + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_EarlyOrderNameSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strOrderName, strHomeName, strID;

        int j = 0;

        try
        {
            for (j = 0; j < DataGrid2.Items.Count; j++)
            {
                strOrderName = ((Button)DataGrid2.Items[j].FindControl("BT_OrderName")).Text;
                strHomeName = ((TextBox)(DataGrid2.Items[j].FindControl("TB_HomeName"))).Text.Trim();
                strID = DataGrid2.Items[j].Cells[4].Text.Trim();

                strHQL = "Update T_FunInforDialBox Set HomeName = N" + "'" + strHomeName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void LoadReqStatus(string strLangCode)
    {
        string strHQL = "from ReqStatus as reqStatus ";
        strHQL += " Where reqStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by reqStatus.SortNumber ASC";
        ReqStatusBLL ReqStatusBLL = new ReqStatusBLL();
        IList lst = ReqStatusBLL.GetAllReqStatuss(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadTaskStatus(string strLangCode)
    {
        string strHQL = "from TaskStatus as taskStatus ";
        strHQL += " Where taskStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by taskStatus.SortNumber ASC";

        TaskStatusBLL taskStatusBLL = new TaskStatusBLL();
        IList lst = taskStatusBLL.GetAllTaskStatuss(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadPlanStatus(string strLangCode)
    {
        string strHQL = "from PlanStatus as planStatus ";
        strHQL += " Where planStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by planStatus.SortNumber ASC";

        PlanStatusBLL planStatusBLL = new PlanStatusBLL();
        IList lst = planStatusBLL.GetAllPlanStatuss(strHQL);

        DataGrid8.DataSource = lst;
        DataGrid8.DataBind();
    }

    protected void LoadProjectStatus(string strProjectType, string strLangCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectStatus.ProjectType = " + "'" + strProjectType + "'";
        strHQL += " And projectStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by projectStatus.SortNumber ASC";
        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        lst = projectStatusBLL.GetAllProjectStatuss(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void LoadProjectType()
    {
        string strHQL = "from ProjectType as projectType order by projectType.SortNumber ASC";
        ProjectTypeBLL projectTypeBLL = new ProjectTypeBLL();
        IList lst = projectTypeBLL.GetAllProjectTypes(strHQL);

        DataGrid20.DataSource = lst;
        DataGrid20.DataBind();
    }

    protected void LoadWLStatus(string strLangCode)
    {
        string strHQL = "from WLStatus as wlStatus ";
        strHQL += " Where wlStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by wlStatus.SortNumber ASC";

        WLStatusBLL wlStatusBLL = new WLStatusBLL();
        IList lst = wlStatusBLL.GetAllWLStatuss(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }

    protected void LoadWLType(string strLangCode)
    {
        string strHQL = " from WLType as wlType";
        strHQL += " Where wlType.LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order by wlType.SortNumber ASC";
        WLTypeBLL wlTypeBLL = new WLTypeBLL();
        IList lst = wlTypeBLL.GetAllWLTypes(strHQL);

        DataGrid13.DataSource = lst;
        DataGrid13.DataBind();
    }

    protected void LoadTestStatus(string strLangCode)
    {
        string strHQL = "From TestStatus as testStatus ";
        strHQL += " Where testStatus.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by testStatus.SortNumber ASC";

        TestStatusBLL testStatusBLL = new TestStatusBLL();
        IList lst = testStatusBLL.GetAllTestStatuss(strHQL);

        DataGrid16.DataSource = lst;
        DataGrid16.DataBind();
    }

    protected void LoadOtherStatus(string strLangCode)
    {
        string strHQL;

        strHQL = "Select * From T_OtherStatus ";
        strHQL += " Where LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OtherStatus");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadActorGroup(string strLangCode)
    {
        string strHQL;
        IList lst;

        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        strHQL = "from ActorGroup as actorGroup";
        strHQL += " Where actorGroup.LangCode = " + "'" + strLangCode + "'";
        strHQL += " order by actorGroup.SortNumber ASC";
        lst = actorGroupBLL.GetAllActorGroups(strHQL);

        DataGrid21.DataSource = lst;
        DataGrid21.DataBind();
    }

    protected void LoadFunInforDialBoxList(string strLangCode)
    {
        string strHQL = "Select * From T_FunInforDialBox  Where LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By SortNumber ASC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_FunInforDialBox");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

}
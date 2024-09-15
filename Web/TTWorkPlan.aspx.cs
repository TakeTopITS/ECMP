using System;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

using net.sf.mpxj;
using net.sf.mpxj.MpxjUtilities;
using net.sf.mpxj.reader;

using TakeTopCore;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using TakeTopGantt.models;

public partial class TTWorkPlan : System.Web.UI.Page
{
    string strProjectID, strProjectName;
    string strUserCode, strUserName, strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        string strHQL, strVerID, strID, strVerType, strPMCode, strProjectCreatorCode;
        IList lst;
        int intPlanID;
        string strExpandType;

        HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID;
        LB_ProjectID.Text = strProjectID;

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        if (Page.IsPostBack != true)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_BaseBeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_BaseEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.InitialUserDocTypeTree(TreeView3, strUserCode);
            ShareClass.LoadProjectActorGroupForDropDownList(DL_Visible, strProjectID);
            TB_Author.Text = ShareClass.GetUserName(strUserCode);

            try
            {
                strHQL = "Update T_ImplePlan Set Start_Date = now() Where COALESCE(Start_Date,now()) = now()";
                ShareClass.RunSqlCommand(strHQL);
                strHQL = "Update T_ImplePlan Set End_Date = now() Where COALESCE(End_Date,now()) = now()";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch
            {
            }

            strHQL = "from PlanStatus as planStatus";
            strHQL += " Where planStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by planStatus.SortNumber Asc";
            PlanStatusBLL planStautsBLL = new PlanStatusBLL();
            lst = planStautsBLL.GetAllPlanStatuss(strHQL);
            DL_Status.DataSource = lst;
            DL_Status.DataBind();

            LoadProjectPlanVersion(strProjectID);

            Session["ProjectIDForGantt"] = strProjectID;

            if (DL_VersionID.Items.Count > 0)
            {
                if (Session["VerIDForGantt"] == null)
                {
                    intPlanID = ShareClass.GetProjectPlanVersionID(strProjectID, "在用");
                    if (intPlanID > 0)
                    {
                        DL_VersionID.SelectedValue = intPlanID.ToString();
                        DL_ChangeVersionType.SelectedValue = "在用";
                    }
                    else
                    {
                        strVerID = ShareClass.GetLargestProjectPlanVerID(strProjectID);
                        if (strVerID == "")
                        {
                            return;
                        }

                        strID = ShareClass.GetProjectPlanKeyIDByVerID(strProjectID, strVerID);
                        DL_VersionID.SelectedValue = strID;
                    }

                    strID = DL_VersionID.SelectedValue.Trim();
                    strVerType = GetProjectPlanVersionType(strID);
                    DL_VersionType.SelectedValue = strVerType;
                    DL_ChangeVersionType.SelectedValue = strVerType;
                }
                else
                {
                    strID = ShareClass.GetProjectPlanKeyIDByVerID(strProjectID, Session["VerIDForGantt"].ToString());
                    DL_VersionID.SelectedValue = strID;

                    strVerType = GetProjectPlanVersionType(strID);
                    DL_VersionType.SelectedValue = strVerType;
                    DL_ChangeVersionType.SelectedValue = strVerType;
                }

                strVerID = DL_VersionID.SelectedItem.Text.Trim();
                Session["VerIDForGantt"] = strVerID;

                strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

                strPMCode = ShareClass.GetProjectPMCode(strProjectID);
                strProjectCreatorCode = ShareClass.GetProjectCreatorCode(strProjectID);

                if (strUserCode == strPMCode | strUserCode == strProjectCreatorCode | ShareClass.CheckMemberIsProjectPlanOperator(strProjectID, strUserCode))
                {
                    BT_NewVersion.Enabled = true;
                    BT_DeleteVersion.Enabled = true;
                    BT_CopyVersion.Enabled = true;
                    DL_ChangeVersionType.Enabled = true;

                    HL_CopyFromOtherProjectPlan.NavigateUrl = "TTProjectPlanCopy.aspx?ProjectID=" + strProjectID;
                    HL_ProjectPlanReviewWL.NavigateUrl = "TTProjectReviewWL.aspx?ProjectID=" + strProjectID + "&Type=Plan&ProjectStatus=NONE";
                }
                else
                {
                    BT_NewVersion.Enabled = false;
                    BT_DeleteVersion.Enabled = false;
                    BT_CopyVersion.Enabled = false;
                    HL_CopyFromOtherProjectPlan.Visible = false;
                    HL_ProjectPlanReviewWL.Visible = false;
                    DL_ChangeVersionType.Enabled = false;
                }

                bool blIsProjectPlanOperator;
                blIsProjectPlanOperator = ShareClass.CheckMemberIsProjectPlanOperator(strProjectID, strUserCode);
                //当前用户是项目计划员，项目经理，立项者
                if (blIsProjectPlanOperator == true || strUserCode == strPMCode || strUserCode == strProjectCreatorCode)
                {
                    BtnUP.Visible = true;
                }
                else
                {
                    BtnUP.Visible = false;
                }

                //如果项目已经验收\结案\归档，那么不能更改计划信息
                if (ShareClass.CheckProjectIsFinish(strProjectID))
                {
                    BT_NewVersion.Enabled = false;
                    BT_DeleteVersion.Enabled = false;
                    BT_CopyVersion.Enabled = false;
                    HL_CopyFromOtherProjectPlan.Visible = false;
                    HL_ProjectPlanReviewWL.Visible = false;
                    DL_ChangeVersionType.Enabled = false;

                    BtnUP.Enabled = false;
                }

                HL_WorkSchedule.NavigateUrl = "TTProjectPlanScheduleReport.aspx?ProjectID=" + strProjectID + "&VerID=" + DL_VersionID.SelectedItem.Text;
                HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;


                TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView2, strUserCode);

                ShareClass.LoadProjectMember(strProjectID, DL_LeaderCode);
                HL_MemberWorkload.NavigateUrl = "TTMemberWorkload.aspx?UserCode=" + DL_LeaderCode.SelectedValue;

                ShareClass.LoadUnitForDropDownList(DL_UnitName);

                //依项目属性是否锁定已启动的项目计划判断能否修改计划
                if (ShareClass.CheckProjectPlanCanBeUpdate(strProjectID) == "NO")
                {
                    BT_NewVersion.Enabled = false;
                    BT_DeleteVersion.Enabled = false;

                    DL_VersionType.Enabled = false;
                    DL_ChangeVersionType.Enabled = false;

                    BT_New.Visible = false;
                    BT_Update.Visible = false;
                    BT_Delete.Visible = false;

                    BT_CopyVersion.Enabled = false;
                    HL_CopyFromOtherProjectPlan.Enabled = false;

                    BT_StartUp.Text = Resources.lang.YiQiDong;
                    BT_StartUp.Enabled = false;
                }
                else
                {
                    BT_StartUp.Text = Resources.lang.QiDong;
                    BT_StartUp.Enabled = true;
                }

                if (ShareClass.CheckProjectPlanIsStartup(strProjectID) == "YES")
                {
                    BT_StartUp.Text = Resources.lang.YiQiDong;
                    BT_StartUp.Enabled = false;
                }

                string strSystemVersionType = Session["SystemVersionType"].ToString();
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
                {
                    HL_ProjectPlanReviewWL.Visible = false;
                    BT_StartUp.Visible = false;
                }
            }
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            LB_BelongDepartCode.Text = strDepartCode;
            LB_BelongDepartName.Text = ShareClass.GetDepartName(strDepartCode);

            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Order By projectMember.SortNumber DESC";

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DL_LeaderCode.DataSource = lst;
            DL_LeaderCode.DataBind();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DL_LeaderCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strLeaderCode;

        strLeaderCode = DL_LeaderCode.SelectedValue.Trim();

        if (strLeaderCode != "")
        {
            HL_MemberWorkload.NavigateUrl = "TTMemberWorkload.aspx?UserCode=" + strLeaderCode;
        }
    }

    protected void BT_StartUp_Click(object sender, EventArgs e)
    {
        string strHQL;

        try
        {
            strHQL = string.Format(@"Update T_Project Set ProjectPlanStartupStatus = 'YES' Where ProjectID = {0}", strProjectID);
            ShareClass.RunSqlCommand(strHQL);

            //依项目属性是否锁定已启动的项目计划判断能否修改计划
            if (ShareClass.CheckProjectPlanCanBeUpdate(strProjectID) == "NO")
            {
                BT_NewVersion.Enabled = false;
                BT_DeleteVersion.Enabled = false;

                DL_VersionType.Enabled = false;
                DL_ChangeVersionType.Enabled = false;

                BT_New.Visible = false;
                BT_Update.Visible = false;
                BT_Delete.Visible = false;

                BT_CopyVersion.Enabled = false;
                HL_CopyFromOtherProjectPlan.Enabled = false;

                BT_StartUp.Text = Resources.lang.YiQiDong;
                BT_StartUp.Enabled = false;
            }
            else
            {
                BT_StartUp.Text = Resources.lang.QiDong;
                BT_StartUp.Enabled = true;
            }

            if (ShareClass.CheckProjectPlanIsStartup(strProjectID) == "YES")
            {
                BT_StartUp.Text = Resources.lang.YiQiDong;
                BT_StartUp.Enabled = false;
            }


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZQDCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZQDSBQJC + "')", true);
        }

    }

    protected void BT_NewVersion_Click(object sender, EventArgs e)
    {
        string strID, strType, strHQL;
        int intVerID;

        intVerID = int.Parse(NB_NewVerID.Amount.ToString());
        strType = DL_VersionType.SelectedValue.Trim();

        if (intVerID > 100 | intVerID < 1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBBHZNS1100ZJDSZ + "')", true);
            return;
        }

        if (GetProjectPlanVersionCount(strProjectID, intVerID.ToString()) == 0)
        {
            ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
            ProjectPlanVersion projectPlanVersion = new ProjectPlanVersion();
            projectPlanVersion.VerID = intVerID;
            projectPlanVersion.ProjectID = int.Parse(strProjectID);
            projectPlanVersion.Type = strType;
            projectPlanVersion.CreatorCode = strUserCode;
            projectPlanVersion.CreateTime = DateTime.Now;
            projectPlanVersion.FromProjectID = int.Parse(strProjectID);
            projectPlanVersion.FromProjectPlanVerID = intVerID;

            try
            {
                projectPlanVersionBLL.AddProjectPlanVersion(projectPlanVersion);
                LoadProjectPlanVersion(strProjectID);

                DL_VersionID.Items[0].Text = intVerID.ToString();

                string strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, intVerID.ToString(), strUserCode);

                Session["ProjectIDForGantt"] = strProjectID;
                Session["VerIDForGantt"] = intVerID.ToString();

                string strCode = "window.parent.frames['Right'].location.reload();";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", strCode, true);

                strID = DL_VersionID.SelectedValue.Trim();
                strType = DL_ChangeVersionType.SelectedValue.Trim();

                if (strType == "在用")
                {
                    strHQL = "update T_ProjectPlanVersion Set Type = '备用' where Type = '在用' and ProjectID = " + strProjectID;
                    ShareClass.RunSqlCommand(strHQL);
                }

                if (strType == "基准")
                {
                    strHQL = "update T_ProjectPlanVersion Set Type = '备用' where Type = '在用' and ProjectID = " + strProjectID;
                    ShareClass.RunSqlCommand(strHQL);
                }

                HL_WorkSchedule.NavigateUrl = "TTProjectPlanScheduleReport.aspx?ProjectID=" + strProjectID + "&VerID=" + DL_VersionID.SelectedItem.Text;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBCXMZKNCZCBBHJC + "')", true);
        }
    }

    protected void BT_DeleteVersion_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strVerID;
        string strProjectCreatorCode;

        if (DL_VersionID.Items.Count == 1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBMXMBXBLYGJHBB + "')", true);
            return;
        }

        strVerID = NB_NewVerID.Amount.ToString();
        strProjectCreatorCode = ShareClass.GetProjectCreatorCode(strProjectID);

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.VerID = " + strVerID + " and projectPlanVersion.ProjectID = " + strProjectID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            strType = projectPlanVersion.Type.Trim();
            try
            {
                if (strType == "基准" || strType == "在用")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBBZBBZNYLXZSCJC + "')", true);
                    return;
                }
                else
                {
                    projectPlanVersionBLL.DeleteProjectPlanVersion(projectPlanVersion);

                    strHQL = "Delete From T_Document Where RelatedType = '计划' and RelatedID in (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_PlanMember where PlanID in (Select ID from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from dependency Where From_ID in (Select ID from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From assignment Where task_id in (Select ID from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID;
                    ShareClass.RunSqlCommand(strHQL);
                }

                LoadProjectPlanVersion(strProjectID);

                if (DL_VersionID.Items.Count > 0)
                {
                    strVerID = DL_VersionID.SelectedItem.Text.Trim();
                }

                string strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);


                Session["ProjectIDForGantt"] = strProjectID;
                Session["VerIDForGantt"] = strVerID;

                string strCode = "window.parent.frames['Right'].location.reload();";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", strCode, true);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBKNBCZCBBHJC + "')", true);
            }
        }
    }

    protected void BT_CopyVersion_Click(object sender, EventArgs e)
    {
        string strOldVerID, strNewVerID, strPlanVerType;
        string strPlanDocCopy;

        strOldVerID = DL_OldVersionID.SelectedItem.Text.Trim();
        strNewVerID = DL_NewVersionID.SelectedItem.Text.Trim();

        strPlanDocCopy = DL_PlanDocCopy.SelectedValue.Trim();

        if (strOldVerID == strNewVerID)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYFZDBBHBFZDBBBNXTJC + "')", true);
            return;
        }

        strPlanVerType = GetProjectPlanVersionTypeByVerID(strProjectID, strNewVerID);
        if (strPlanVerType == "基准" || strPlanVerType == "在用")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBNFZBZBBDJHJC + "')", true);
            return;
        }

        try
        {
            if (TakeTopCore.TakeTopPlan.CopyProjectPlanVersionToSameProject(strProjectID, strPlanVerType, strOldVerID, strNewVerID, strPlanDocCopy, strUserCode) == true)
            {
                DL_VersionID.SelectedValue = DL_NewVersionID.SelectedValue;

                string strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strNewVerID, strUserCode);

                //改变基准时间段和单位的值
                string strHQL;
                strHQL = "update T_ImplePlan Set BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date Where ProjectID = " + strProjectID + " and VerID = " + strNewVerID;
                ShareClass.RunSqlCommand(strHQL);
                strHQL = "update T_ImplePlan Set Duration = F_WorkDay(Start_Date,End_Date), Duration_Unit = 'd' Where ProjectID = " + strProjectID + " and VerID = " + strNewVerID;
                ShareClass.RunSqlCommand(strHQL);

                Session["ProjectIDForGantt"] = strProjectID;
                Session["VerIDForGantt"] = strNewVerID;
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click000", "window.parent.frames['Right'].location.reload()", true);

                string strCode = "window.parent.frames['Right'].location.reload();";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", strCode, true);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click222", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
        }
    }

    protected void DL_Version_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID;
        string strHQL;
        IList lst;

        string strCode;
        try
        {
            strID = DL_VersionID.SelectedValue;

            strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
            ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
            lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

            strVerID = projectPlanVersion.VerID.ToString();

            Session["ProjectIDForGantt"] = strProjectID;
            Session["VerIDForGantt"] = strVerID;

            strCode = "window.parent.frames['Right'].location.reload();";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strCode, true);

            try
            {
                DL_ChangeVersionType.SelectedValue = projectPlanVersion.Type.Trim();
            }
            catch
            {
                //DL_ChangeVersionType.SelectedValue = "备用";
            }

            string strExpandType = DL_ExpandType.SelectedValue.Trim();
            TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

            HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProjects.aspx?pid=" + strProjectID + "&VerID=" + strVerID;
            HL_WorkSchedule.NavigateUrl = "TTProjectPlanScheduleReport.aspx?ProjectID=" + strProjectID + "&VerID=" + DL_VersionID.SelectedItem.Text;
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void DL_ChangeVersionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strType, strStatusValue, strVerType, strVerID;
        string strProjectCreatorCode;
        string strHQL;
        IList lst;

        if (DL_VersionID.Items.Count > 0)
        {
            strID = DL_VersionID.SelectedValue.Trim();
            strType = DL_ChangeVersionType.SelectedValue.Trim();

            strStatusValue = ShareClass.GetProjectStatusValue(strProjectID);
            strVerType = GetProjectPlanVersionType(strProjectID, strID);

            strProjectCreatorCode = ShareClass.GetProjectCreatorCode(strProjectID);
            string strSystemVersionType = Session["SystemVersionType"].ToString();

            if (strStatusValue == "通过" | strSystemVersionType == "SAAS")
            {
                if (strVerType == "基准" & strUserCode != strProjectCreatorCode)
                {
                    DL_ChangeVersionType.SelectedValue = strVerType;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBZBBJHLXZNYLXZGBJC + "')", true);
                    return;
                }

                if (strType == "基准" & strUserCode != strProjectCreatorCode)
                {
                    DL_ChangeVersionType.SelectedValue = strVerType;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBZBBJHLXZNYLXZZDJC + "')", true);
                    return;
                }
                else
                {
                    if (strType == "在用")
                    {
                        strHQL = "update T_ProjectPlanVersion Set Type = '备用' where Type = '在用' and ProjectID = " + strProjectID;
                        ShareClass.RunSqlCommand(strHQL);
                    }

                    if (strType == "基准")
                    {
                        strHQL = "update T_ProjectPlanVersion Set Type = '备用' where Type = '基准' and ProjectID = " + strProjectID;
                        ShareClass.RunSqlCommand(strHQL);
                    }
                }

                strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
                ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
                lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
                ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

                projectPlanVersion.Type = strType;
                strVerID = projectPlanVersion.VerID.ToString();

                try
                {
                    projectPlanVersionBLL.UpdateProjectPlanVersion(projectPlanVersion, int.Parse(strID));

                    HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBBLXYGG + "')", true);
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }
            }
            else
            {
                DL_ChangeVersionType.SelectedValue = strVerType;
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSBXMZTDZTZBWTGBNGBJHBBLXJC + "')", true);
            }
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID = TreeView3.SelectedNode.Target;
        string strDocType = ShareClass.GetDocTypeName(strDocTypeID);

        LB_DocTypeID.Text = strDocTypeID;
        TB_DocType.Text = strDocType;
    }

    protected int GetNoLeaderPlanNumber(string strProjectID, string strPlanVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ImplePlan Where char_length(COALESCE(leader,'')) = 0 and ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        return ds.Tables[0].Rows.Count;
    }


    protected void BtnUP_Click(object sender, EventArgs e)
    {
        if (AttachFile.HasFile)
        {
            string strVerID = DL_VersionID.SelectedItem.Text.Trim();
            string strProjectID = LB_ProjectID.Text.Trim();
            string strProjectName = ShareClass.GetProjectName(strProjectID);
            string strAuthor = TB_Author.Text.Trim();
            string strDocTypeID = LB_DocTypeID.Text.Trim();
            if (strDocTypeID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGWDLXBNWKJC + "')", true);
                return;
            }
            string strDocType = ShareClass.GetDocTypeName(strDocTypeID);
            string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            string strVisible = DL_Visible.SelectedValue.Trim();

            string strCode;
            string strFileName1, strExtendName;

            if (DL_ChangeVersionType.SelectedValue.Trim() == "基准" || DL_ChangeVersionType.SelectedValue.Trim() == "在用")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBZBBJHLXZNYLXZGBJC + "')", true);
                return;
            }


            strFileName1 = this.AttachFile.FileName;//获取上传文件的文件名,包括后缀
            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);
            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";

            if (strExtendName.ToUpper().Trim() != ".MPP")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCWJBSMSPROJECTGSMPPWJBNSC + "')", true);
                return;
            }

            FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

            if (fi.Exists)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
            }
            else
            {
                DocumentBLL documentBLL = new DocumentBLL();
                Document document = new Document();

                document.RelatedType = "项目";
                document.DocTypeID = int.Parse(strDocTypeID);
                document.DocType = strDocType;
                document.RelatedID = int.Parse(strProjectID);
                document.Author = strAuthor;
                document.DocName = strFileName2;
                document.Address = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
                document.UploadManCode = strUserCode;
                document.UploadManName = ShareClass.GetUserName(strUserCode);
                document.UploadTime = DateTime.Now;
                document.Visible = strVisible;
                document.DepartCode = strDepartCode; document.DepartName = ShareClass.GetDepartName(strDepartCode);
                document.Status = "处理中";
                document.RelatedName = "";

                try
                {
                    documentBLL.AddDocument(document);

                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);


                    MSProjectHandler.ImportMPPFileToDataTable(strDocSavePath + strFileName3, strProjectID, strVerID, strUserCode);

                    string strExpandType = DL_ExpandType.SelectedValue.Trim();
                    TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

                    //改变基准时间段和单位的值
                    string strHQL;
                    strHQL = "update T_ImplePlan Set BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
                    ShareClass.RunSqlCommand(strHQL);
                    strHQL = "update T_ImplePlan Set Duration = F_WorkDay(Start_Date,End_Date), Duration_Unit = 'd' Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
                    ShareClass.RunSqlCommand(strHQL);

                    Session["ProjectIDForGantt"] = strProjectID;
                    Session["VerIDForGantt"] = strVerID;
                    strCode = "window.parent.frames['Right'].location.reload()";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strCode, true);
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRWC + "')", true);
                }
                catch (Exception ex)
                {
                    Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg=" + ex.Message.ToString() + "," + Resources.lang.YYYGSFFQMYAZMSPROJECT2007BQJC);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDMSPROJECTJHWJ + "')", true);
        }
    }

    protected void DL_ExpandType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strVerID;

        strVerID = DL_VersionID.SelectedItem.Text.Trim();

        string strExpandType = DL_ExpandType.SelectedValue.Trim();
        TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strPlanID, strParentPlanID, strPlanVerID, strPlanVerType, strProjectCreatorCode, strPMCode;
        string strLockStatus, strPlanCreatorCode, strParentPlanCreatorCode, strPlanLeaderCode;
        string strHQL;
        IList lst;

        int intDepth;

        try
        {
            strPlanVerID = DL_VersionID.SelectedItem.Text;
            strPlanVerType = DL_ChangeVersionType.SelectedValue.Trim();

            TreeNode treeNode = new TreeNode();
            treeNode = TreeView1.SelectedNode;

            intDepth = treeNode.Depth;

            strPlanID = treeNode.Target.Trim();

            strHQL = "from WorkPlan as workPlan where workPlan.ID= " + strPlanID;
            WorkPlanBLL workPlanBLL = new WorkPlanBLL();
            lst = workPlanBLL.GetAllWorkPlans(strHQL);
            WorkPlan workPlan = (WorkPlan)lst[0];

            LB_BackupID.Text = workPlan.ID.ToString();
            LB_SelectID.Text = workPlan.ID.ToString();

            LB_PlanID.Text = workPlan.ID.ToString();
            LB_PlanDetail.Text = workPlan.Name.Trim();
            DL_PlanType.SelectedValue = workPlan.Type.Trim();

            NB_PriorID.Amount = workPlan.PriorID;

            LB_ParentID.Text = workPlan.Parent_ID.ToString();
            TB_PlanDetail.Text = workPlan.Name;
            DLC_BeginDate.Text = workPlan.Start_Date.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = workPlan.End_Date.ToString("yyyy-MM-dd");
            TB_PlanBudget.Amount = workPlan.Budget;
            NB_PlanWorkhour.Amount = workPlan.WorkHour;

            LB_MakeTime.Text = workPlan.MakeDate.ToString();
            try
            {
                DL_Status.SelectedValue = workPlan.Status;
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
            NB_PriorID.Amount = GetProjectPlanID(workPlan.PriorID.ToString());
            NB_DefaultSchedule.Amount = workPlan.DefaultSchedule;
            NB_DefaultCost.Amount = workPlan.DefaultCost;

            DL_LockStatus.SelectedValue = workPlan.LockStatus.Trim();

            string strHQL1;
            strHQL1 = "Select RequireNumber,FinishedNumber,UnitName,Price,BelongDepartCode,BelongDepartName From T_ImplePlan Where ID = " + strPlanID;
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_ImplePlan");

            try
            {
                NB_RequireNumber.Amount = decimal.Parse(ds1.Tables[0].Rows[0]["RequireNumber"].ToString());
            }
            catch
            {
                NB_RequireNumber.Amount = 0;
            }
            try
            {
                NB_FinishedNumber.Amount = decimal.Parse(ds1.Tables[0].Rows[0]["FinishedNumber"].ToString());
            }
            catch
            {
                NB_FinishedNumber.Amount = 0;
            }
            try
            {
                DL_UnitName.SelectedValue = ds1.Tables[0].Rows[0]["UnitName"].ToString();
            }
            catch
            {
            }

            try
            {
                NB_Price.Amount = decimal.Parse(ds1.Tables[0].Rows[0]["Price"].ToString());
            }
            catch
            {
                NB_Price.Amount = 0;
            }

            try
            {
                LB_BelongDepartCode.Text = ds1.Tables[0].Rows[0]["BelongDepartCode"].ToString();
                LB_BelongDepartName.Text = ds1.Tables[0].Rows[0]["BelongDepartName"].ToString();
            }
            catch
            {
                LB_BelongDepartCode.Text = "";
                LB_BelongDepartName.Text = "";
            }

            HL_DocumentForProjectPlanTemplate.Visible = true;
            HL_DocumentForProjectPlanTemplate.NavigateUrl = "TTProPlanRelatedDocForTemplate.aspx?PlanID=" + strPlanID;


            strPlanCreatorCode = workPlan.CreatorCode.Trim();
            strLockStatus = workPlan.LockStatus.Trim();
            strProjectCreatorCode = ShareClass.GetProjectCreatorCode(strProjectID);
            strPMCode = ShareClass.GetProjectPMCode(strProjectID);
            strPlanLeaderCode = GetProjectPlanLeaderCode(strPlanID);

            try
            {
                DL_LeaderCode.SelectedValue = strPlanLeaderCode;

                strHQL = "Update T_ImplePlan Set LeaderCode = '" + strPlanLeaderCode + "' Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                if (strPlanLeaderCode != "")
                {
                    HL_MemberWorkload.NavigateUrl = "TTMemberWorkload.aspx?UserCode=" + strPlanLeaderCode;
                }
            }
            catch (Exception err)
            {
               // LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }


            NB_SortNumber.Amount = workPlan.SortNumber;

            DataSet ds;

            strHQL = "Select BaseLine_Start_Date,BaseLine_End_Date,Remark From T_ImplePlan Where ID = " + strPlanID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
            try
            {
                TB_Remark.Text = ds.Tables[0].Rows[0][2].ToString();
                DLC_BaseBeginDate.Text = DateTime.Parse(ds.Tables[0].Rows[0][0].ToString().Trim()).ToString("yyyy-MM-dd");
                DLC_BaseEndDate.Text = DateTime.Parse(ds.Tables[0].Rows[0][1].ToString().Trim()).ToString("yyyy-MM-dd");
            }
            catch
            {
                strHQL = " Update T_ImplePlan Set BaseLine_Start_Date = Start_Date, BaseLine_End_Date = End_Date Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);
            }

            strHQL = "Select Percent_Done,Duration_Unit From T_ImplePlan Where ID = " + strPlanID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
            NB_Percent_Done.Amount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            LB_DurationUnit.Text = ds.Tables[0].Rows[0][1].ToString();

            BT_New.Enabled = true;

            try
            {
                strParentPlanID = treeNode.Parent.Target.ToString();
                strParentPlanCreatorCode = GetProjectPlanCreatorCode(strParentPlanID);
            }
            catch
            {
                strParentPlanID = "";
                strParentPlanCreatorCode = "";
            }

            bool blIsProjectPlanOperator;
            blIsProjectPlanOperator = ShareClass.CheckMemberIsProjectPlanOperator(strProjectID, strUserCode);

            strHQL = string.Format(@"Select HomeModuleName, PageName || '{0}' as ModulePage  From T_ProModuleLevelForPage 
                             Where  ParentModule = '项目计划菜单' and char_length(rtrim(HomeModuleName)) > 0 and rtrim(PageName) <> '' 
                            and char_length(COALESCE(REPLACE(substring(PageName,0,position('?' in PageName)),'.aspx',''),'')) >= 3
                            and LangCode = '{1}' and Visible ='YES' and IsDeleted = 'NO' Order By SortNumber ASC", strPlanID, strLangCode);

            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            //当前用户是项目计划员，项目经理，立项者
            if (blIsProjectPlanOperator == true || strUserCode == strPMCode || strUserCode == strProjectCreatorCode)
            {
                BT_New.Enabled = true;
                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;

                DL_LockStatus.Enabled = true;

                Repeater1.Visible = true;
            }
            else
            {
                BT_New.Enabled = false;
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                DL_LockStatus.Enabled = false;

                Repeater1.Visible = false;
            }

            //是否计划员
            bool blParentPlanHaveLockStatus;
            blParentPlanHaveLockStatus = TakeTopPlan.CheckParentPlanHaveLockStatus(strPlanID);

            //依项目属性是否锁定已启动的项目计划判断能否修改计划
            if (ShareClass.CheckProjectPlanCanBeUpdate(strProjectID) == "NO" && CheckProjectPlanStartupRelatedWorkflowTemplateIsPass(strPlanID, GetProjectPlanStartupRelatedWorkflowTemplate(strProjectID)) == false)
            {
                BT_New.Visible = false;
                BT_Update.Visible = false;
                BT_Delete.Visible = false;
            }
            else
            {
                BT_New.Visible = true;
                BT_Update.Visible = true;
                BT_Delete.Visible = true;
            }

            //当前用户是计划创建者，但不项目计划员，项目经理，立项者
            if (strUserCode == strPlanCreatorCode & blIsProjectPlanOperator == false & strUserCode != strPMCode & strUserCode != strProjectCreatorCode)
            {
                if (blParentPlanHaveLockStatus == true)
                {
                    BT_New.Enabled = false;
                    BT_Update.Enabled = false;
                    BT_Delete.Enabled = false;

                    DL_LockStatus.Enabled = false;

                    Repeater1.Visible = false;
                }
                else
                {
                    BT_New.Enabled = true;
                    BT_Update.Enabled = true;
                    BT_Delete.Enabled = true;

                    DL_LockStatus.Enabled = true;

                    Repeater1.Visible = true;
                }
            }

            //当前用户是计划负责人，但不是计划创建人，项目计划员，项目经理，立项者
            if (strUserCode == strPlanLeaderCode.Trim() & strUserCode != strPlanCreatorCode & blIsProjectPlanOperator == false & strUserCode != strPMCode & strUserCode != strProjectCreatorCode)
            {
                if (strLockStatus == "Yes")
                {
                    BT_New.Enabled = false;
                    BT_Update.Enabled = false;
                    BT_Delete.Enabled = false;

                    DL_LockStatus.Enabled = false;

                    Repeater1.Visible = false;
                }
                else
                {
                    if (blParentPlanHaveLockStatus == true)
                    {
                        BT_New.Enabled = false;
                        BT_Update.Enabled = false;
                        BT_Delete.Enabled = false;

                        DL_LockStatus.Enabled = false;

                        Repeater1.Visible = true;
                    }
                    else
                    {
                        BT_New.Enabled = true;
                        BT_Update.Enabled = true;
                        BT_Delete.Enabled = true;

                        DL_LockStatus.Enabled = true;

                        Repeater1.Visible = true;
                    }
                }

                DL_LockStatus.Enabled = false;
            }

            if (strPlanVerType == "基准" & strUserCode != strProjectCreatorCode)
            {
                BT_New.Enabled = false;
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                DL_LockStatus.Enabled = false;

                Repeater1.Visible = false;
            }


            //如果项目挂起\取消\验收\结案\归档，那么不能更新计划信息
            if (ShareClass.CheckProjectIsFinish(strProjectID))
            {
                BT_New.Enabled = false;
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                DL_LockStatus.Enabled = false;

                Repeater1.Visible = false;
            }


            if (ShareClass.GetProjectClass(strProjectID) == "模板项目")
            {
                HL_ProPlanRelatedDocByPush.NavigateUrl = "TTProPlanRelatedDoc_YYUP.aspx?PlanID=" + strPlanID + "&ProjectID=" + strProjectID + "&VerID=" + strPlanVerID;
            }
            else
            {
                HL_ProPlanRelatedDocByPush.NavigateUrl = "TTProPlanRelatedDocDetail_YYUP.aspx?PlanID=" + strPlanID + "&ProjectID=" + strProjectID + "&VerID=" + strPlanVerID;
            }
            HL_RunProjectPlanByWF.NavigateUrl = "TTRelatedDIYWorkFlowForm.aspx?RelatedType=ProjectPlan&RelatedID=" + strPlanID;

            HL_RelatedWorkFlowTemplate.Enabled = true;
            HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=ProjectPlan&RelatedID=" + strPlanID;
            HL_WLTem.Enabled = true;
            HL_WLTem.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=ProjectPlan&RelatedID=" + strPlanID;
            HL_ProPlanRelatedDocByPush.Enabled = true;

            TB_Message.Text = ShareClass.GetUserName(strUserCode) + " " + "改变了项目：" + strProjectID + " " + strProjectName + " 的计划： " + strPlanID + " " + TB_PlanDetail.Text.Trim() + " 的内容或状态，特此通知！";
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
    }

    //取得关联的工作流模板
    public static string GetProjectPlanStartupRelatedWorkflowTemplate(string strProjectID)
    {
        string strHQL;

        strHQL = string.Format(@"Select PlanStartupRelatedWorkflowTemplate From T_Project Where ProjectID = {0}", strProjectID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0]["PlanStartupRelatedWorkflowTemplate"].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    //检查项目计划关联工作流模板的工作流状态
    public static bool CheckProjectPlanStartupRelatedWorkflowTemplateIsPass(string strPlanID, string strWorkflowTemName)
    {
        string strHQL;

        if (strWorkflowTemName != "")
        {
            strHQL = string.Format(@"Select Status From T_WorkFlow Where RelatedType = '计划' and RelatedID = {0} and TemName = '{1}' and Status in ('通过','结案')", strPlanID, strWorkflowTemName);
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strPlanID, strVerID, strPlanType, strPlanDetail, strRemark, strLeaderCode, strLeaderName;
        string strWorkID, strBeginDate, strEndDate, strBaseBeginDate, strBaseEndDate, strPMCode, strPMName;
        string strStatus;
        DateTime dtMakeDate;
        int intProjectID, intVerID, intParentID, intPriorID, intPID, intParentIDGantt, intSortNumber;
        string strHQL;

        decimal deDefaultSchedule, deDefaultCost, dePlanBudget;

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();

        strVerID = DL_VersionID.SelectedItem.Text.Trim();
        strPlanType = DL_PlanType.SelectedValue.Trim();
        strProjectID = LB_ProjectID.Text.Trim();

        strPMCode = ShareClass.GetProjectPMCode(strProjectID);
        strPMName = ShareClass.GetUserName(strPMCode);

        intProjectID = int.Parse(strProjectID);
        intVerID = int.Parse(strVerID);

        intParentID = int.Parse(LB_SelectID.Text.Trim());
        intPriorID = int.Parse(NB_PriorID.Amount.ToString());

        strWorkID = "0";
        strPlanDetail = TB_PlanDetail.Text.Trim();
        dePlanBudget = TB_PlanBudget.Amount;
        strRemark = TB_Remark.Text.Trim();

        strBeginDate = DLC_BeginDate.Text;
        strEndDate = DLC_EndDate.Text;

        strBaseBeginDate = DLC_BaseBeginDate.Text;
        strBaseEndDate = DLC_BaseEndDate.Text;

        dtMakeDate = DateTime.Now;
        strStatus = DL_Status.SelectedValue;
        deDefaultSchedule = NB_DefaultSchedule.Amount;
        deDefaultCost = NB_DefaultCost.Amount;
        strPlanID = LB_PlanID.Text.Trim();

        try
        {
            strLeaderCode = DL_LeaderCode.SelectedValue.Trim();
            if (strLeaderCode == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGJHFZRBNWKQJC + "')", true);
                return;

            }
            strLeaderName = ShareClass.GetUserName(strLeaderCode);
        }
        catch
        {
            strLeaderCode = strPMCode;
            strLeaderName = strPMName;
        }

        intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        intPID = TakeTopPlan.GetPIDForGantt(intProjectID, intVerID);
        intParentIDGantt = int.Parse(MSProjectHandler.getPlanIDByBackupID(strProjectID, strVerID, intParentID.ToString()));

        if (JudgetPriorIDIsExist(strProjectID, strVerID, intPriorID.ToString()) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCXMCBBDXMJHLCJHIDBCZXGSBJC + "')", true);
            return;
        }


        if (strWorkID == "" | strPlanDetail == "" | strBeginDate == "" | strEndDate == "" | LB_BelongDepartCode.Text == "" | LB_BelongDepartName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJHHNRKSRJSRZYBNWKJC + "')", true);
        }
        else
        {
            workPlan.WorkID = int.Parse(strWorkID);
            workPlan.Type = strPlanType;
            workPlan.ProjectID = intProjectID;
            workPlan.VerID = int.Parse(strVerID);
            workPlan.FromProjectID = intProjectID;
            workPlan.FromProjectPlanVerID = int.Parse(strVerID);
            workPlan.Name = strPlanDetail;
            workPlan.Budget = dePlanBudget;
            workPlan.WorkHour = NB_PlanWorkhour.Amount;
            workPlan.Resource = "";
            workPlan.Start_Date = DateTime.Parse(strBeginDate);
            workPlan.End_Date = DateTime.Parse(strEndDate);
            workPlan.MakeDate = dtMakeDate;

            workPlan.PriorID = GetProjectPlanID(intPriorID.ToString());
            workPlan.Status = strStatus;
            workPlan.SortNumber = intSortNumber;

            workPlan.Percent_Done = int.Parse(deDefaultSchedule.ToString());
            workPlan.DefaultSchedule = deDefaultSchedule;
            workPlan.DefaultCost = deDefaultCost;

            workPlan.LockStatus = "No";
            workPlan.UpdateManCode = strUserCode;
            workPlan.CreatorCode = strUserCode;
            workPlan.UpdateTime = DateTime.Now;

            workPlan.PID = intPID;
            workPlan.Parent_ID = intParentID;

            if (workPlan.Type.Trim() == "里程碑")
            {
                if (workPlan.Start_Date.ToString("yyyyMMdd") != workPlan.End_Date.ToString("yyyyMMdd"))
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLXWLCBDJHKSSJBXHJSSJXTXGSBJC + "')", true);
                    return;
                }
            }

            try
            {
                workPlanBLL.AddWorkPlan(workPlan);
                strPlanID = ShareClass.GetMyCreatedMaxProPlanID(strProjectID, strVerID);

                DLC_BaseBeginDate.Text = strBeginDate;
                DLC_BaseEndDate.Text = strEndDate;

                strHQL = "Update T_ImplePlan Set LeaderCode = '" + strLeaderCode + "',Leader = '" + strLeaderName + "',Remark ='" + strRemark + "' Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_ImplePlan Set BaseLine_Start_Date = cast('" + strBaseBeginDate + "' as timestamp)" + ", BaseLine_End_Date = cast('" + strBaseEndDate + "'as timestamp)" + " Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_Impleplan Set RequireNumber = " + NB_RequireNumber.Amount.ToString() + ",FinishedNumber = " + NB_FinishedNumber.Amount.ToString() + ",Price =" + NB_Price.Amount.ToString() + ",UnitName ='" + DL_UnitName.SelectedValue + "' Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_ImplePlan Set BelongDepartCode = '" + LB_BelongDepartCode.Text + "',BelongDepartName = '" + LB_BelongDepartName.Text + "' Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                string strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

                Session["ProjectIDForGantt"] = strProjectID;
                Session["VerIDForGantt"] = strVerID;
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click1", "window.parent.frames['Right'].location.reload()", true);

                LB_PlanID.Text = strPlanID;
                LB_PlanDetail.Text = strPlanDetail;

                LB_BackupID.Text = strPlanID;
                LB_ParentID.Text = intParentID.ToString();

                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;

                DL_LockStatus.SelectedValue = "No";

                HL_ProPlanRelatedDocByPush.Visible = true;
                HL_ProPlanRelatedDocByPush.NavigateUrl = "TTProPlanRelatedDoc_YYUP.aspx?PlanID=" + strPlanID + "&ProjectID=" + strProjectID + "&VerID=" + int.Parse(strVerID);

                TB_Message.Text = ShareClass.GetUserName(strUserCode) + " " + "改变了项目：" + strProjectID + " " + strProjectName + " 的计划： " + strPlanID + " " + TB_PlanDetail.Text.Trim() + " 的内容或状态，特此通知！";

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCCJC + "')", true);
            }
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strVerID, strPlanID, strProjectID, strParentID, strPriorID, strPlanDetail, strBaseBeginDate, strBaseEndDate;
        string strPlanType, strStatus, strBeginDate, strEndDate, strRemark, strLeaderCode, strLeaderName, strPMCode, strPMName;

        decimal deDefaultSchedule, deDefaultCost, dePlanBudget;
        int intPriorID, intPercentDone, intSortNumber;

        string strHQL;
        IList lst;

        strVerID = DL_VersionID.SelectedItem.Text.Trim();
        strPlanID = LB_PlanID.Text.Trim();

        strPlanType = DL_PlanType.SelectedValue.Trim();
        strProjectID = LB_ProjectID.Text.Trim();
        intPriorID = int.Parse(NB_PriorID.Amount.ToString());

        strPMCode = ShareClass.GetProjectPMCode(strProjectID);
        strPMName = ShareClass.GetUserName(strPMCode);

        strPlanDetail = TB_PlanDetail.Text.Trim();
        strBeginDate = DLC_BeginDate.Text;
        strEndDate = DLC_EndDate.Text;
        strParentID = LB_ParentID.Text.Trim();
        strPriorID = GetProjectPlanID(intPriorID.ToString()).ToString();

        strRemark = TB_Remark.Text.Trim();
        dePlanBudget = TB_PlanBudget.Amount;
        strStatus = DL_Status.SelectedValue;
        deDefaultSchedule = NB_DefaultSchedule.Amount;
        deDefaultCost = NB_DefaultCost.Amount;
        intPercentDone = int.Parse(NB_Percent_Done.Amount.ToString());

        intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        strBaseBeginDate = DateTime.Parse(DLC_BaseBeginDate.Text.Trim()).ToString("yyyy-MM-dd");
        strBaseEndDate = DateTime.Parse(DLC_BaseEndDate.Text.Trim()).ToString("yyyy-MM-dd");

        try
        {
            strLeaderCode = DL_LeaderCode.SelectedValue.Trim();
            if (strLeaderCode == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGJHFZRBNWKQJC + "')", true);
                return;
            }
            strLeaderName = ShareClass.GetUserName(strLeaderCode);
        }
        catch
        {
            strLeaderCode = strPMCode;
            strLeaderName = strPMName;
        }

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        WorkPlan workPlan = (WorkPlan)lst[0];

        if (JudgetPriorIDIsExist(strProjectID, strVerID, intPriorID.ToString()) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCXMCBBDXMJHLCJHIDBCZXGSBJC + "')", true);
            return;
        }

        if (strPlanType == "里程碑")
        {
            if (workPlan.Start_Date.ToString("yyyyMMdd") != workPlan.End_Date.ToString("yyyyMMdd"))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLXWLCBDJHKSSJBXHJSSJXTXGSBJC + "')", true);
                return;
            }
        }

        try
        {
            strHQL = "Update T_ImplePlan Set WorkID =0,Type='" + strPlanType + "',ProjectID=" + strProjectID + ",VerID=" + strVerID + ",Name='" + strPlanDetail + "'";
            strHQL += ",Start_Date=cast('" + strBeginDate + "' as timestamp)" + ",End_Date=cast('" + strEndDate + "' as timestamp)" + ",Remark='" + strRemark + "',Budget=" + dePlanBudget.ToString() + ",WorkHour=" + NB_PlanWorkhour.Amount.ToString();
            strHQL += ",Status='" + strStatus + "',Parent_ID=" + LB_ParentID.Text.Trim() + ",PriorID=" + GetProjectPlanID(intPriorID.ToString());
            strHQL += ",DefaultSchedule=" + deDefaultSchedule.ToString() + ",DefaultCost =" + deDefaultCost.ToString() + ",LockStatus='" + DL_LockStatus.SelectedValue.Trim() + "'";
            strHQL += ",UpdateManCode ='" + strUserCode + "',UpdateTime=now(),Percent_Done=" + intPercentDone.ToString() + ",Index=" + intSortNumber.ToString();
            strHQL += ",LeaderCode = '" + strLeaderCode + "',Leader = '" + strLeaderName + "',RequireNumber=" + NB_RequireNumber.Amount.ToString() + ",FinishedNumber=" + NB_FinishedNumber.Amount.ToString() + ",UnitName='" + DL_UnitName.SelectedValue + "',Price=" + NB_Price.Amount.ToString();
            strHQL += ",BelongDepartCode = '" + LB_BelongDepartCode.Text + "',BelongDepartName = '" + LB_BelongDepartName.Text + "'";
            strHQL += " Where ID = " + strPlanID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Update T_ImplePlan Set BaseLine_Start_Date = cast('" + strBaseBeginDate + "' as timestamp),BaseLine_End_Date = cast('" + strBaseEndDate + "' as timestamp) Where ID = " + strPlanID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = " Update T_ImplePlan Set BaseLine_Start_Date = Start_Date, BaseLine_End_Date = End_Date Where ID = " + strPlanID;
            ShareClass.RunSqlCommand(strHQL);


            string strExpandType = DL_ExpandType.SelectedValue.Trim();
            TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

            Session["ProjectIDForGantt"] = strProjectID;
            Session["VerIDForGantt"] = strVerID;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click1", "window.parent.frames['Right'].location.reload()", true);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strVerID, strPlanID, strProjectID;
        string strHQL;
        IList lst1, lst2;

        strVerID = DL_VersionID.SelectedItem.Text.Trim();
        strProjectID = LB_ProjectID.Text.Trim();
        strPlanID = LB_PlanID.Text.Trim();

        strHQL = "From WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strVerID;
        strHQL += " and ((workPlan.Parent_ID  in ( Select workPlan.ID from WorkPlan as workPlan where workPlan.ID = " + strPlanID + " ))";
        strHQL += " or  (workPlan.PriorID in ( Select workPlan.ID from WorkPlan as workPlan where workPlan.ID = " + strPlanID + " )))";

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst1 = workPlanBLL.GetAllWorkPlans(strHQL);

        if (lst1.Count == 0)
        {
            strHQL = "Delete from T_ImplePlan where ID = " + strPlanID;

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                string strExpandType = DL_ExpandType.SelectedValue.Trim();
                TakeTopPlan.InitialProjectPlanTreeByExpandType(TreeView1, strExpandType, strProjectID, strVerID, strUserCode);

                Session["ProjectIDForGantt"] = strProjectID;
                Session["VerIDForGantt"] = strVerID;
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click1", "window.parent.frames['Right'].location.reload()", true);

                BT_New.Enabled = false;

                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCJHCZZJHHZWLYJHDJHBNSCJC + "')", true);
        }
    }

    protected void DL_LockStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strVerID, strPlanID, strLockStatus;

        string strHQL;

        strVerID = DL_VersionID.SelectedItem.Text.Trim();
        strPlanID = LB_PlanID.Text.Trim();
        strLockStatus = DL_LockStatus.SelectedValue.Trim();

        if (strPlanID != "")
        {
            try
            {
                strHQL = "Update T_ImplePlan Set LockStatus = " + "'" + strLockStatus + "'" + " Where ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJHSZTGGCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJHSZTGGCCJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXJHBNXG + "')", true);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strPlanID = LB_PlanID.Text.Trim();

        Msg msg = new Msg();

        string strSubject, strMsg;
        string strRelatedUserCode;

        if (CB_SendMsg.Checked == true | CB_SendMail.Checked == true)
        {
            strHQL = "from PlanMember as planMember where planMember.PlanID = " + strPlanID;
            PlanMemberBLL planMemberBLL = new PlanMemberBLL();
            lst = planMemberBLL.GetAllPlanMembers(strHQL);
            PlanMember planMember = new PlanMember();

            for (int i = 0; i < lst.Count; i++)
            {
                planMember = (PlanMember)lst[0];
                strRelatedUserCode = planMember.UserCode.Trim();

                strMsg = TB_Message.Text.Trim();

                if (CB_SendMail.Checked == true | CB_SendMsg.Checked == true)
                {
                    strSubject = "项目计划变更通知";

                    if (CB_SendMsg.Checked == true)
                    {
                        msg.SendMSM("Message", strRelatedUserCode, strMsg, strUserCode);
                    }

                    if (CB_SendMail.Checked == true)
                    {
                        msg.SendMail(strRelatedUserCode, strSubject, strMsg, strUserCode);
                    }
                }
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
    }

    protected bool JudgetPriorIDIsExist(string strProjectID, string strVerID, string strPriorID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strVerID + " and workPlan.ID = " + strPriorID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        if (lst.Count > 0 | strPriorID == "0")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void LoadProjectPlanVersion(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " Order by projectPlanVersion.VerID DESC";
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        DL_VersionID.DataSource = lst;
        DL_VersionID.DataBind();

        DL_OldVersionID.DataSource = lst;
        DL_OldVersionID.DataBind();

        DL_NewVersionID.DataSource = lst;
        DL_NewVersionID.DataBind();
    }

    //取得任务关联计划的计划的负责人
    protected string GetProjectPlanLeaderCode(string strPlanID)
    {
        string strHQL;
        string strLeaderCode;

        strHQL = "Select LeaderCode From T_ImplePlan Where ID = " + strPlanID;
        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
            strLeaderCode = ds.Tables[0].Rows[0][0].ToString();

            return strLeaderCode;
        }
        catch
        {
            return "";
        }
    }

    protected string GetProjectPlanCreatorCode(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        WorkPlan workPlan = (WorkPlan)lst[0];

        return workPlan.CreatorCode.Trim();
    }

    protected string GetProjectPlanUpdateManCode(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        WorkPlan workPlan = (WorkPlan)lst[0];

        return workPlan.UpdateManCode.Trim();
    }

    protected string GetProjectPlanLockStatus(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        WorkPlan workPlan = (WorkPlan)lst[0];

        return workPlan.LockStatus.Trim();
    }

    protected int GetProjectPlanID(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        if (lst.Count == 0)
        {
            return 0;
        }
        else
        {
            WorkPlan workPlan = (WorkPlan)lst[0];
            return workPlan.ID;
        }
    }

    protected string GetProjectPlanVersionType(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            return projectPlanVersion.Type.Trim();
        }
        else
        {
            return "备用";
        }
    }

    protected int GetProjectPlanVersionCount(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID =" + strVerID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        return lst.Count;
    }

    protected string GetProjectPlanVersionType(string strProjectID, string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

    protected string GetProjectPlanVersionTypeByVerID(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID = " + strVerID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }


}

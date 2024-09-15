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

using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopSecurity;
using Stimulsoft.Data.Functions;


public partial class TTProjectRelatedUser_BYJF : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName, strUserType;
        string strProjectID, strProjectName;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strUserType = ShareClass.GetUserType(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;
        strProjectName = GetProjectName(strProjectID);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            Response.Redirect("TTProjectRelatedUserSAAS.aspx?ProjectID=" + strProjectID);
        }

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_JoinDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_LeaveDate.Text = GetProjectEndDate(strProjectID).ToString("yyyy-MM-dd");

            strSystemVersionType = Session["SystemVersionType"].ToString();
            if (strSystemVersionType != "GROUP" & strSystemVersionType != "ENTERPRISE")
            {
                LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialAllDepartmentTree(Resources.lang.ZZJGT, TreeView1);
            }
            else
            {
                LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView1, strUserCode);
            }
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Project", DataGrid4);

            LoadProjectRelatedUser(strProjectID);
            LoadActorGroup(strUserCode, LB_DepartString.Text.Trim(), strLangCode);

            TB_SMS.Text = strUserName.Trim() + Resources.lang.BaNiJiaRuLeXiangMU + "：" + strProjectID + " " + strProjectName + Resources.lang.QingJiShiChuLi + "！";
            TB_PersonalSMS.Text = strUserName.Trim() + Resources.lang.BaNiJiaRuLeXiangMU + "：" + strProjectID + " " + strProjectName + Resources.lang.QingJiShiChuLi + "！";
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid4);
        }

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strProjectID = LB_ProjectID.Text.Trim();
            string strUserCode = e.Item.Cells[3].Text.Trim();

            string strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                string strHQL = "from RelatedUser as relatedUser where relatedUser.ID = " + strID;

                RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
                IList lst = relatedUserBLL.GetAllRelatedUsers(strHQL);
                RelatedUser relatedUser = (RelatedUser)lst[0];

                LB_ID.Visible = true;

                LB_ID.Text = relatedUser.ID.ToString();
                LB_RelatedUserCode.Text = relatedUser.UserCode.Trim();
                LB_RelatedUserName.Text = relatedUser.UserName.Trim();

                try
                {
                    LB_DepartCode.Text = relatedUser.DepartCode.Trim();
                    LB_DepartName.Text = ShareClass.GetDepartName(relatedUser.DepartCode.Trim());
                }
                catch
                {
                    LB_DepartCode.Text = ShareClass.GetDepartCodeFromUserCode(strUserCode);
                    LB_DepartName.Text = ShareClass.GetDepartName(LB_DepartCode.Text);
                }

                TB_Actor.Text = relatedUser.Actor.Trim();
                DLC_JoinDate.Text = relatedUser.JoinDate.ToString("yyyy-MM-dd");
                DLC_LeaveDate.Text = relatedUser.LeaveDate.ToString("yyyy-MM-dd");
                TB_WorkDetail.Text = relatedUser.WorkDetail;
                DL_SalaryMethod.SelectedValue = relatedUser.SalaryMethod;
                NB_PromissionScale.Amount = relatedUser.PromissionScale;
                NB_UnitHourSalary.Amount = relatedUser.UnitHourSalary;
                DL_Status.SelectedValue = relatedUser.Status.Trim();

                try
                {
                    DL_CanUpdatePlan.SelectedValue = relatedUser.CanUpdatePlan.Trim();
                }
                catch
                {
                }

                HL_MemberWorkload.NavigateUrl = "TTMemberWorkload.aspx?UserCode=" + strUserCode;


                BT_SendMsg.Enabled = true;
                BT_PersonalSMS.Enabled = true;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strHQL = "Delete from T_RelatedUser where ID = " + strID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    LoadProjectRelatedUser(strProjectID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
                }
            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_SqlGM.Text;

        ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
        IList lst = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strDepartCode = ((Button)e.Item.FindControl("BT_DepartCode")).Text.Trim();

            string strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'";

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        LB_RelatedUserCode.Text = strUserCode;
        LB_RelatedUserName.Text = strUserName;
        LB_DepartCode.Text = projectMember.DepartCode;
        LB_DepartName.Text = ShareClass.GetDepartName(projectMember.DepartCode.Trim());
        TB_Actor.Text = projectMember.Duty;

        NB_UnitHourSalary.Amount = projectMember.HourlySalary;

        HL_MemberWorkload.NavigateUrl = "TTMemberWorkload.aspx?UserCode=" + strUserCode;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_FindUserName_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserName = "%" + TB_UserNameForFind.Text.Trim() + "%";
        strHQL = "Select * From T_ProjectMember Where UserName Like " + "'" + strUserName + "'";
        strHQL += " and DepartCode in " + LB_DepartString.Text.Trim();
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddUser();
        }
        else
        {
            UpdateUser();
        }
    }

    protected void DLC_JoinDate_TextChanged(object sender, EventArgs e)
    {
        string strHQL1;

        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_RelatedUserCode.Text.Trim();
        string strUserName = LB_RelatedUserName.Text.Trim();
        string strJoinDate = DLC_JoinDate.Text;
        string strLeaveDate = DLC_LeaveDate.Text;

        strHQL1 = "Select *  From V_ProjectMember_WorkLoadSchedule";
        strHQL1 += " Where UserCode = " + "'" + strUserCode + "'";
        strHQL1 += " and ((to_char(BeginDate,'yyyymmdd') >= to_char(cast('" + strJoinDate + "' as timestamp) ,'yyyymmdd') and to_char(BeginDate,'yyyymmdd') <= to_char( cast('" + strLeaveDate + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(EndDate,'yyyymmdd') >= to_char(cast('" + strJoinDate + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') <= to_char(cast('" + strLeaveDate + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(BeginDate,'yyyymmdd') <= to_char(cast('" + strJoinDate + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') >= to_char(cast('" + strLeaveDate + "' as timestamp),'yyyymmdd')))";
        strHQL1 += " and Type ='项目' and ProjectID <> " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "V_ProjectMember_WorkLoadSchedule");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZTSCCYZCSJDYQTXMJX + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DLC_LeaveDate_TextChanged(object sender, EventArgs e)
    {
        string strHQL1;

        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_RelatedUserCode.Text.Trim();
        string strUserName = LB_RelatedUserName.Text.Trim();
        string strJoinDate = DLC_JoinDate.Text;
        string strLeaveDate = DLC_LeaveDate.Text;

        strHQL1 = "Select *  From V_ProjectMember_WorkLoadSchedule";
        strHQL1 += " Where UserCode = " + "'" + strUserCode + "'";
        strHQL1 += " and ((to_char(BeginDate,'yyyymmdd') >= to_char(cast('" + strJoinDate + "' as timestamp) ,'yyyymmdd') and to_char(BeginDate,'yyyymmdd') <= to_char( cast('" + strLeaveDate + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(EndDate,'yyyymmdd') >= to_char(cast('" + strJoinDate + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') <= to_char(cast('" + strLeaveDate + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(BeginDate,'yyyymmdd') <= to_char(cast('" + strJoinDate + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') >= to_char(cast('" + strLeaveDate + "' as timestamp),'yyyymmdd')))";
        strHQL1 += " and Type ='项目' and ProjectID <> " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "V_ProjectMember_WorkLoadSchedule");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZTSCCYZCSJDYQTXMJX + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void BT_AddMember_Click(object sender, EventArgs e)
    {
        AddUser();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void AddUser()
    {
        string strID;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strProjectName = GetProjectName(strProjectID);
        string strUserCode = LB_RelatedUserCode.Text.Trim();
        string strUserName = LB_RelatedUserName.Text.Trim();
        string strDepartCode = LB_DepartCode.Text.Trim();
        string strDepartName = ShareClass.GetDepartName(strDepartCode);
        string strActor = TB_Actor.Text.Trim();
        string strJoinDate = DLC_JoinDate.Text;
        string strLeaveDate = DLC_LeaveDate.Text;
        string strWorkDetail = TB_WorkDetail.Text.Trim();
        string strSalaryMethod = DL_SalaryMethod.SelectedValue;
        decimal dePromissionScale = NB_PromissionScale.Amount;
        decimal deHourSalary = NB_UnitHourSalary.Amount;
        string strCanUpdatePlan = DL_CanUpdatePlan.SelectedValue.Trim();

        if (ShareClass.CheckProjectMemberIsExisted(strProjectID, strUserCode) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFJRJC + "')", true);
            return;
        }

        if (strActor != "")
        {
            try
            {
                RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
                RelatedUser relatedUser = new RelatedUser();

                relatedUser.ProjectID = int.Parse(strProjectID);
                relatedUser.ProjectName = strProjectName;
                relatedUser.UserCode = strUserCode;
                relatedUser.UserName = strUserName;
                relatedUser.DepartCode = strDepartCode;
                relatedUser.DepartName = ShareClass.GetDepartName(strDepartCode);
                relatedUser.Actor = strActor;
                relatedUser.JoinDate = DateTime.Parse(strJoinDate);
                relatedUser.LeaveDate = DateTime.Parse(strLeaveDate);
                relatedUser.Status = DL_Status.SelectedValue.Trim();
                relatedUser.WorkDetail = strWorkDetail;
                relatedUser.SMSCount = 0;
                relatedUser.SalaryMethod = strSalaryMethod;
                relatedUser.PromissionScale = dePromissionScale;
                relatedUser.UnitHourSalary = deHourSalary;
                relatedUser.CanUpdatePlan = strCanUpdatePlan;

                relatedUserBLL.AddRelatedUser(relatedUser);

                strID = ShareClass.GetMyCreatedMaxProjectRelatedUserID(strProjectID);
                LB_ID.Text = strID;

                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;

                LoadProjectRelatedUser(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateUser()
    {
        string strProjectID = LB_ProjectID.Text.Trim();
        string strID = LB_ID.Text.Trim();
        string strUserCode = LB_RelatedUserCode.Text.Trim();
        string strUserName = LB_RelatedUserName.Text.Trim();
        string strDepartCode = LB_DepartCode.Text.Trim();
        string strDepartName = ShareClass.GetDepartName(strDepartCode);
        string strActor = TB_Actor.Text.Trim();
        string strWorkDetail = TB_WorkDetail.Text.Trim();
        DateTime dtJoinDate = DateTime.Parse(DLC_JoinDate.Text);
        string strLeaveDate = DLC_LeaveDate.Text;
        string strSalaryMethod = DL_SalaryMethod.SelectedValue;
        decimal dePromissionScale = NB_PromissionScale.Amount;
        decimal deHourSalary = NB_UnitHourSalary.Amount;
        decimal deUnitHourSalary = NB_UnitHourSalary.Amount;
        string strStatus = DL_Status.SelectedValue.Trim();
        string strCanUpdatePlan = DL_CanUpdatePlan.SelectedValue.Trim();

        if (strActor != "")
        {
            string strHQL = "from RelatedUser as relatedUser where relatedUser.ID = " + strID;
            RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
            IList lst = relatedUserBLL.GetAllRelatedUsers(strHQL);
            RelatedUser relatedUser = (RelatedUser)lst[0];

            relatedUser.UserCode = strUserCode;
            relatedUser.UserName = strUserName;
            relatedUser.DepartCode = strDepartCode;
            relatedUser.DepartName = strDepartName;
            relatedUser.ProjectID = int.Parse(strProjectID);
            relatedUser.ProjectName = GetProjectName(strProjectID);
            relatedUser.Actor = strActor;
            relatedUser.WorkDetail = strWorkDetail;
            relatedUser.JoinDate = dtJoinDate;
            relatedUser.LeaveDate = DateTime.Parse(strLeaveDate);
            relatedUser.SalaryMethod = strSalaryMethod;
            relatedUser.PromissionScale = dePromissionScale;
            relatedUser.UnitHourSalary = deUnitHourSalary;
            relatedUser.Status = strStatus;
            relatedUser.CanUpdatePlan = strCanUpdatePlan;

            try
            {
                relatedUserBLL.UpdateRelatedUser(relatedUser, int.Parse(strID));

                LoadProjectRelatedUser(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }


    protected void BT_CreateActorGroup_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGroupName, strUserCode, strDepartCode, strDepartName;
        string strProjectID;

        strProjectID = LB_ProjectID.Text.Trim();
        strGroupName = TB_ActorGroup.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartName = ShareClass.GetDepartName(strDepartCode);


        if (strGroupName != "")
        {
            ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
            ActorGroup actorGroup = new ActorGroup();

            strHQL = "from ActorGroup as actorGroup";
            lst = actorGroupBLL.GetAllActorGroups(strHQL);

            actorGroup.GroupName = strGroupName;
            actorGroup.Type = "部分";
            actorGroup.MakeUserCode = strUserCode;
            actorGroup.SortNumber = lst.Count + 1;
            actorGroup.IdentifyString = DateTime.Now.ToString("yyyyMMddHHMMssff");
            actorGroup.BelongDepartCode = strDepartCode;
            actorGroup.BelongDepartName = strDepartName;
            actorGroup.HomeName = strGroupName;
            actorGroup.LangCode = strLangCode;
            actorGroup.MakeType = "DIY";

            try
            {
                actorGroupBLL.AddActorGroup(actorGroup);

                //InsertActorGroupMemberFromProRelatedUser(strGroupName, strProjectID);

                LoadActorGroup(strUserCode, LB_DepartString.Text.Trim(), strLangCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJSZZMBNWKJC + "')", true);
        }

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strProjectID, strGroupName;
            string strHQL;
            string strUserCode, strActor;
            IList lst, lst1;
            string strAction;
            int i = 0;

            strProjectID = LB_ProjectID.Text.Trim();

            strGroupName = ((Button)e.Item.FindControl("BT_GroupName")).Text.Trim();
            DataGrid2.CurrentPageIndex = 0;

            strAction = LB_AddDelete.Text.Trim();
            string strCanUpdatePlan = DL_CanUpdatePlan.SelectedValue.Trim();

            RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
            RelatedUser relatedUser = new RelatedUser();

            ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
            ActorGroupDetail actorGroupDetail = new ActorGroupDetail();

            if (strAction == "Add")
            {
                strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'";
                lst = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);

                for (i = 0; i < lst.Count; i++)
                {
                    actorGroupDetail = (ActorGroupDetail)lst[i];

                    strUserCode = actorGroupDetail.UserCode.Trim();
                    strActor = actorGroupDetail.Actor.Trim();
                    strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID + " and  relatedUser.UserCode = " + "'" + strUserCode + "'" + " and relatedUser.Actor = " + "'" + strActor + "'";
                    lst1 = relatedUserBLL.GetAllRelatedUsers(strHQL);

                    if (lst1.Count == 0)
                    {
                        relatedUser.ProjectID = int.Parse(strProjectID);
                        relatedUser.ProjectName = GetProjectName(strProjectID);
                        relatedUser.UserCode = actorGroupDetail.UserCode;
                        relatedUser.UserName = actorGroupDetail.UserName;
                        relatedUser.DepartCode = actorGroupDetail.DepartCode;
                        relatedUser.DepartName = actorGroupDetail.DepartName;
                        relatedUser.Actor = actorGroupDetail.Actor;
                        relatedUser.WorkDetail = actorGroupDetail.WorkDetail;
                        relatedUser.JoinDate = DateTime.Now;
                        relatedUser.LeaveDate = GetProjectEndDate(strProjectID);
                        relatedUser.ActorGroup = strGroupName;
                        relatedUser.SalaryMethod = "提成";
                        relatedUser.PromissionScale = 0;
                        relatedUser.UnitHourSalary = GetUserHourlySalary(actorGroupDetail.UserCode.Trim());
                        relatedUser.Status = "计划";
                        relatedUser.CanUpdatePlan = strCanUpdatePlan;

                        relatedUserBLL.AddRelatedUser(relatedUser);
                    }
                }

                LB_AddDelete.Text = "Delete";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCGCJSZCYYJRCXMCYZ + "')", true);
            }
            else
            {
                strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID + " and relatedUser.ActorGroup = " + "'" + strGroupName + "'";
                lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

                for (i = 0; i < lst.Count; i++)
                {
                    relatedUser = (RelatedUser)lst[i];
                    strUserCode = relatedUser.UserCode.Trim();

                    try
                    {
                        relatedUserBLL.DeleteRelatedUser(relatedUser);

                        //删除此项目触色组的相关成员
                        strHQL = "  delete from T_ActorGroupDetail  where UserCode = " + "'" + strUserCode + "'" + " and GroupName";
                        strHQL += "  in (Select ActorGroupName from T_ProjectRelatedActorGroup where ProjectID = " + strProjectID + ")";

                        ShareClass.RunSqlCommand(strHQL);
                    }
                    catch
                    {
                    }
                }

                LB_AddDelete.Text = "Add";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCGSYCJSZCYDXMDXGCYYSC + "')", true);
            }

            LoadProjectRelatedUser(strProjectID);

            LB_ActorGroup.Text = strGroupName;
        }

        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected decimal GetUserHourlySalary(string strUserCode)
    {
        string strHQL;

        strHQL = "Select HourlySalary From T_ProjectMember Where UserCode = '" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }


    protected void InsertActorGroupMemberFromProRelatedUser(string strGroupName, string strProjectID)
    {
        string strHQL;
        IList lst1, lst2;

        ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
        ActorGroupDetail actorGroupDetail = new ActorGroupDetail();

        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        RelatedUser relatedUser = new RelatedUser();

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        lst1 = relatedUserBLL.GetAllRelatedUsers(strHQL);

        try
        {
            for (int i = 0; i < lst1.Count; i++)
            {
                relatedUser = (RelatedUser)lst1[i];

                strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'" + " and actorGroupDetail.UserCode = " + "'" + relatedUser.UserCode.Trim() + "'";
                lst2 = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);

                if (lst2.Count == 0)
                {
                    actorGroupDetail.GroupName = strGroupName;
                    actorGroupDetail.UserCode = relatedUser.UserCode;
                    actorGroupDetail.UserName = relatedUser.UserName;
                    actorGroupDetail.DepartCode = relatedUser.DepartCode;
                    actorGroupDetail.DepartName = relatedUser.DepartName;
                    actorGroupDetail.Actor = relatedUser.Actor;
                    actorGroupDetail.WorkDetail = relatedUser.WorkDetail;

                    actorGroupDetailBLL.AddActorGroupDetail(actorGroupDetail);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYWCCYZR + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZRSBJC + "')", true);
        }
    }

    protected void BT_SendMsg_Click(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        string strUserCode, strUserName, strRelatedUserCode, strRelatedUserName;
        string strPMName;
        IList lst1;
        string strProject, strMsg, strSubject;
        int intSMSCount, intID;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = ShareClass.GetUserName(strUserCode);

        strPMName = LB_UserName.Text.Trim();
        strProjectID = LB_ProjectID.Text.Trim();
        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        lst1 = relatedUserBLL.GetAllRelatedUsers(strHQL);
        RelatedUser relatedUser = new RelatedUser();

        strMsg = TB_SMS.Text.Trim();
        strSubject = Resources.lang.JiaRuXiangMuTongZi;

        Msg msg = new Msg();

        try
        {
            for (int i = 0; i < lst1.Count; i++)
            {
                relatedUser = (RelatedUser)lst1[i];

                strRelatedUserCode = relatedUser.UserCode.Trim();
                strRelatedUserName = relatedUser.UserName.Trim();
                strProject = relatedUser.ProjectName.Trim();
                intID = relatedUser.ID;
                intSMSCount = relatedUser.SMSCount;

                if (CB_Sms.Checked == true | CB_Mail.Checked == true)
                {
                    if (CB_Sms.Checked == true)
                    {
                        msg.SendMSM("Message", strRelatedUserCode, strMsg, strUserCode);
                    }

                    if (CB_Mail.Checked == true)
                    {
                        msg.SendMail(strRelatedUserCode, strSubject, strMsg, strUserCode);
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_PersonalSMS_Click(object sender, EventArgs e)
    {
        string strRelatedUserCode, strRelatedUserName;
        string strUserCode, strUserName;
        string strMsg, strSubject;

        Msg msg = new Msg();

        strMsg = TB_PersonalSMS.Text.Trim();

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();

        strRelatedUserCode = LB_RelatedUserCode.Text.Trim();
        strRelatedUserName = LB_RelatedUserName.Text.Trim();

        try
        {
            if (CB_SendSMS.Checked == true | CB_SendEMail.Checked == true)
            {
                if (CB_SendSMS.Checked == true)
                {
                    msg.SendMSM("Message", strRelatedUserCode, strMsg, strUserCode);
                }

                if (CB_SendEMail.Checked == true)
                {
                    strSubject = Resources.lang.JiaRuXiangMuTongZi;
                    msg.SendMail(strRelatedUserCode, strSubject, strMsg, strUserCode);
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSCG + "')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_FindGroup_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        string strGroupName = TB_ActorGroupName.Text.Trim();
        strGroupName = "%" + strGroupName + "%";

        strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
        strHQL += " and GroupName Like " + "'" + strGroupName + "'";
        strHQL += " and (actorGroup.BlongDepartCode in " + LB_DepartString.Text.Trim();
        strHQL += " Or actorGroup.MakeUserCode = " + "'" + strUserCode + "'" + ")";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);
        Repeater1.DataSource = lst;
        Repeater1.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void LoadActorGroup(string strUserCode, string strDepartString, string strLangCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
        strHQL += " and (actorGroup.BelongDepartCode in " + strDepartString;
        strHQL += " Or actorGroup.MakeUserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and actorGroup.LangCode = " + "'" + strLangCode + "'";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);
        Repeater1.DataSource = lst;
        Repeater1.DataBind();
    }

    protected void LoadProjectRelatedUser(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        relatedUserBLL = new RelatedUserBLL();
        lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        string strProjectName = project.ProjectName.Trim();
        return strProjectName;
    }

    protected DateTime GetProjectEndDate(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.EndDate;
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        string strStatus = project.Status.Trim();

        return strStatus;
    }
}

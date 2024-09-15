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

public partial class TTProjectRelatedUserSAAS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName, strUserType;
        string strProjectID, strProjectName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strUserType = ShareClass.GetUserType(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;
        strProjectName = ShareClass.GetProjectName(strProjectID);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        if (Page.IsPostBack == false)
        {
            DLC_JoinDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_LeaveDate.Text = GetProjectEndDate(strProjectID).ToString("yyyy-MM-dd");

            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Project", DataGrid4);

            LoadProjectRelatedUser(strProjectID);

            TB_SMS.Text = strUserName.Trim() + Resources.lang.BaNiJiaRuLeXiangMU + "：" + strProjectID + " " + strProjectName + Resources.lang.QingJiShiChuLi + "！";
            TB_PersonalSMS.Text = strUserName.Trim() + Resources.lang.BaNiJiaRuLeXiangMU + "：" + strProjectID + " " + strProjectName + Resources.lang.QingJiShiChuLi + "！";
        }
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
                LB_DepartCode.Text = relatedUser.DepartCode.Trim();
                LB_DepartName.Text = ShareClass.GetDepartName(relatedUser.DepartCode.Trim());
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

        for (int i = 0; i < DataGrid4.Items.Count; i++)
        {
            DataGrid4.Items[i].ForeColor = Color.White;
        }
        e.Item.ForeColor = Color.Red;

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

        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_FindUserName_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserName = "%" + TB_UserNameForFind.Text.Trim() + "%";
        strHQL = "Select * From T_ProjectMember Where UserName Like " + "'" + strUserName + "'";
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

    protected void BT_AddMember_Click(object sender, EventArgs e)
    {
        AddUser();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void AddUser()
    {
        string strID;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strProjectName = ShareClass.GetProjectName(strProjectID);
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
            relatedUser.ProjectName = ShareClass.GetProjectName(strProjectID);
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

    protected DateTime GetProjectEndDate(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.EndDate;
    }

}

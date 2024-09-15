using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Drawing;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTUserInfor_ThirtPart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strDepartString;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        //this.Title = "第三方成员设置";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        if (Page.IsPostBack == false)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            DLC_BirthDay.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_JoinDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView3, strUserCode);

            ShareClass.LoadSystemMDIStyle(DL_SystemMDIStyle);
            LoadWorkType();

            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strUserCode;

        string strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strUserCode = Session["UserCode"].ToString();

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target;

            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);
            LB_DepartCode.Text = strDepartCode;

            if (GetDepartUserInforRelatedUserCount(strDepartCode, strUserCode) > 0)
            {
                BT_New.Visible = true;
            }
            else
            {
                BT_New.Visible = false;
            }
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = e.Item.Cells[2].Text.Trim();
        string strUserName = ShareClass.GetUserName(strUserCode);

        for (int i = 0; i < DataGrid2.Items.Count; i++)
        {
            DataGrid2.Items[i].ForeColor = Color.Black;
        }
        e.Item.ForeColor = Color.Red;

        if (e.CommandName == "Update")
        {
            strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            ProjectMember projectMember = (ProjectMember)lst[0];

            try
            {
                LB_NewUserCode.Text = projectMember.UserCode.Trim();

                TB_UserCode.Text = projectMember.UserCode;
                TB_UserName.Text = projectMember.UserName;
                DL_Gender.SelectedValue = projectMember.Gender.Trim();

                TB_Duty.Text = projectMember.Duty;

                TB_DepartCode.Text = projectMember.DepartCode.Trim();
                LB_DepartName.Text = projectMember.DepartName.Trim();

                TB_ChildDepartment.Text = projectMember.ChildDepartment.Trim();
                TB_OfficePhone.Text = projectMember.OfficePhone;
                TB_MobilePhone.Text = projectMember.MobilePhone;
                TB_EMail.Text = projectMember.EMail;
                TB_WorkScope.Text = projectMember.WorkScope;
                DLC_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
                DL_Status.SelectedValue = projectMember.Status.Trim();

                TB_RefUserCode.Text = projectMember.RefUserCode.Trim();
                NB_SortNumber.Amount = projectMember.SortNumber;

                TB_EnglishName.Text = projectMember.EnglishName.Trim();
                TB_Nationality.Text = projectMember.Nationality.Trim();
                TB_NativePlace.Text = projectMember.NativePlace.Trim();
                TB_HuKou.Text = projectMember.HuKou.Trim();
                TB_Residency.Text = projectMember.Residency.Trim();
                TB_Address.Text = projectMember.Address.Trim();
                DLC_BirthDay.Text = projectMember.BirthDay.ToString("yyyy-MM-dd");
                DL_MaritalStatus.SelectedValue = projectMember.MaritalStatus.Trim();
                TB_Degree.Text = projectMember.Degree.Trim();
                TB_Major.Text = projectMember.Major.Trim();
                TB_GraduateSchool.Text = projectMember.GraduateSchool.Trim();
                TB_IDCard.Text = projectMember.IDCard.Trim();
                TB_BloodType.Text = projectMember.BloodType.Trim();
                NB_Height.Amount = projectMember.Height;

                try
                {
                    ddlLangSwitcher.SelectedValue = projectMember.LangCode.Trim();
                }
                catch
                {
                }
                TB_UrgencyPerson.Text = projectMember.UrgencyPerson.Trim();
                TB_UrgencyCall.Text = projectMember.UrgencyCall.Trim();
                TB_Introducer.Text = projectMember.Introducer.Trim();
                TB_IntroducerDepartment.Text = projectMember.IntroducerDepartment.Trim();
                TB_IntroducerRelation.Text = projectMember.IntroducerRelation.Trim();
                TB_Comment.Text = projectMember.Comment.Trim();

                DL_UserType.SelectedValue = projectMember.UserType.Trim();

                TB_UserRTXCode.Text = projectMember.UserRTXCode.Trim();

                DL_SystemMDIStyle.SelectedValue = projectMember.MDIStyle.Trim();

                DL_WorkType.SelectedValue = projectMember.WorkType.Trim();

                DL_AllowDevice.SelectedValue = projectMember.AllowDevice.Trim();

                IM_MemberPhoto.ImageUrl = projectMember.PhotoURL.Trim();
                HL_MemberPhoto.NavigateUrl = projectMember.PhotoURL.Trim();

                NB_HourlySalary.Amount = projectMember.HourlySalary;
                NB_MonthlySalary.Amount = projectMember.MonthlySalary;
            }
            catch (Exception ex)
            {
            }

            BT_UploadPhoto.Enabled = true;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }

        if (e.CommandName == "Delete")
        {
            string strDepartCode;
            strDepartCode = LB_DepartCode.Text.Trim();

            if (strUserCode == "ADMIN" | strUserCode == "SAMPLE")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGADMINHSAMPLESNZYHBNSCJC + "')", true);
                return;
            }

            if (strUserCode != "ADMIN")
            {
                string strDepartString = LB_DepartString.Text.Trim();
                if (ShareClass.VerifyUserCode(strUserCode, strDepartString) == false | ShareClass.VerifyUserName(strUserName, strDepartString) == false)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGNMYXCZCYHJC + "')", true);
                    return;
                }
            }

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            ProjectMember projectMember = new ProjectMember();

            projectMember.UserCode = strUserCode;

            try
            {
                projectMemberBLL.DeleteProjectMember(projectMember);

                BT_UploadPhoto.Enabled = false;

                LoadProjectMember(strDepartCode);

                strHQL = "Delete From T_MailBoxAuthority Where UserCode = " + "'" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Delete From T_ProModule Where UserCode = " + "'" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Delete From T_UserAttendanceRule Where UserCode = " + "'" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);


                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_UploadPhoto_Click(object sender, EventArgs e)
    {
        if (this.FUP_File.PostedFile != null)
        {
            string strFileName1 = FUP_File.PostedFile.FileName.Trim();
            string strUserCode = TB_UserCode.Text.Trim();
            string strHQL;

            string strLoginUserCode = Session["UserCode"].ToString().Trim();
            int i;

            if (strFileName1 != "")
            {
                //获取初始文件名
                i = strFileName1.LastIndexOf("."); //取得文件名中最后一个"."的索引
                string strNewExt = strFileName1.Substring(i); //获取文件扩展名

                DateTime dtUploadNow = DateTime.Now; //获取系统时间

                string strFileName2 = System.IO.Path.GetFileName(strFileName1);
                string strExtName = Path.GetExtension(strFileName2);
                strFileName2 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtName;


                string strDocSavePath = Server.MapPath("Doc") + "\\UserPhoto\\";
                string strFileName3 = "Doc\\UserPhoto\\" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }

                try
                {
                    FUP_File.PostedFile.SaveAs(strFileName4);

                    strHQL = "Update T_ProjectMember Set PhotoURL = " + "'" + strFileName3 + "'" + " Where UserCode = " + "'" + strUserCode + "'";
                    ShareClass.RunSqlCommand(strHQL);

                    IM_MemberPhoto.ImageUrl = strFileName3;
                    HL_MemberPhoto.NavigateUrl = strFileName3;

                    ScriptManager.RegisterStartupScript(UpdatePanel2, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch
                {
                    //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
            else
            {
                // ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
            }
        }
        else
        {
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        }
    }

    protected void BT_DeletePhoto_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode = TB_UserCode.Text.Trim();

        try
        {
            strHQL = "Update T_ProjectMember Set PhotoURL = '' Where UserCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            IM_MemberPhoto.ImageUrl = "";
            HL_MemberPhoto.NavigateUrl = "";

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_NewUserCode.Text = "";
        BT_New.Visible = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = LB_NewUserCode.Text.Trim();

        if (strUserCode == "")
        {
            AddUser();
        }
        else
        {
            UpdateUser();
        }
    }

    protected void AddUser()
    {
        string strHQL;

        string strUserCode = TB_UserCode.Text.Trim();
        string strUserName = TB_UserName.Text.Trim();
        string strPassword = TB_Password.Text.Trim();
        string strDuty = TB_Duty.Text.Trim();
        string strEmail = TB_EMail.Text.Trim();
        string strCreatorCode = Session["UserCode"].ToString().Trim();
        string strChildDepartment = TB_ChildDepartment.Text.Trim();
        string strRefUserCode = TB_RefUserCode.Text.Trim();
        string strUserRTXCode = TB_UserRTXCode.Text.Trim();
        string strMDIStyle = DL_SystemMDIStyle.SelectedValue.Trim();
        string strAllowDevice = DL_AllowDevice.SelectedValue.Trim();

        int intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        if (strPassword.Length < 8)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBMMCDBXDYHDY8WJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        if (strRefUserCode == "")
        {
            strRefUserCode = strUserCode;
            TB_RefUserCode.Text = strRefUserCode;
        }

        if (strUserRTXCode == "")
        {
            TB_UserRTXCode.Text = strUserCode + strUserName;
        }

        if (strPassword != "" & strUserCode != "" & strUserName != "" & strDuty != "" & strEmail != "")
        {
            ProjectMember projectMember = new ProjectMember();

            projectMember.UserCode = TB_UserCode.Text.Trim().ToUpper();
            projectMember.UserName = TB_UserName.Text.Trim();
            projectMember.Gender = DL_Gender.SelectedValue.Trim();
            projectMember.Age = int.Parse(TB_Age.Amount.ToString());
            projectMember.Password = EncryptPassword(TB_Password.Text.Trim(), "MD5");

            projectMember.RefUserCode = TB_RefUserCode.Text.Trim();
            projectMember.SortNumber = intSortNumber;

            projectMember.DepartCode = TB_DepartCode.Text.Trim();
            projectMember.DepartName = LB_DepartName.Text.Trim();
            projectMember.ChildDepartment = TB_ChildDepartment.Text.Trim();
            projectMember.Duty = TB_Duty.Text.Trim();
            projectMember.OfficePhone = TB_OfficePhone.Text.Trim();
            projectMember.MobilePhone = TB_MobilePhone.Text.Trim();
            projectMember.EMail = TB_EMail.Text.Trim();
            projectMember.JoinDate = DateTime.Parse(DLC_JoinDate.Text);
            projectMember.WorkScope = TB_WorkScope.Text.Trim();
            projectMember.CreatorCode = strCreatorCode;
            projectMember.Status = DL_Status.SelectedValue.Trim();

            projectMember.EnglishName = TB_EnglishName.Text.Trim();
            projectMember.Nationality = TB_Nationality.Text.Trim();
            projectMember.NativePlace = TB_NativePlace.Text.Trim();
            projectMember.HuKou = TB_HuKou.Text.Trim();
            projectMember.Residency = TB_Residency.Text.Trim();
            projectMember.Address = TB_Address.Text.Trim();
            projectMember.BirthDay = DateTime.Parse(DLC_BirthDay.Text);
            projectMember.LunarBirthDay = ChinaDate.GetSunYearDate(DateTime.Parse(DLC_BirthDay.Text));
            projectMember.MaritalStatus = DL_MaritalStatus.SelectedValue.Trim();
            projectMember.Degree = TB_Degree.Text.Trim();
            projectMember.Major = TB_Major.Text.Trim();
            projectMember.GraduateSchool = TB_GraduateSchool.Text.Trim();
            projectMember.IDCard = TB_IDCard.Text.Trim();
            projectMember.BloodType = TB_BloodType.Text.Trim();
            projectMember.Height = int.Parse(NB_Height.Amount.ToString());

            projectMember.LangCode = ddlLangSwitcher.SelectedValue.Trim();
            projectMember.Language = ddlLangSwitcher.SelectedItem.Text.Trim();

            projectMember.UrgencyPerson = TB_UrgencyPerson.Text.Trim();
            projectMember.UrgencyCall = TB_UrgencyCall.Text.Trim();
            projectMember.Introducer = TB_Introducer.Text.Trim();
            projectMember.IntroducerDepartment = TB_IntroducerDepartment.Text.Trim();
            projectMember.IntroducerRelation = TB_IntroducerRelation.Text.Trim();

            projectMember.Comment = TB_Comment.Text.Trim();
            projectMember.PhotoURL = HL_MemberPhoto.NavigateUrl.Trim();

            projectMember.UserType = DL_UserType.SelectedValue.Trim();
            projectMember.UserRTXCode = strUserRTXCode;

            projectMember.CssDirectory = "CssRed";
            projectMember.MDIStyle = strMDIStyle;
            projectMember.WorkType = DL_WorkType.SelectedValue.Trim();
            projectMember.AllowDevice = strAllowDevice;

            projectMember.HourlySalary = NB_HourlySalary.Amount;
            projectMember.MonthlySalary = NB_MonthlySalary.Amount;

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();

            try
            {
                projectMemberBLL.AddProjectMember(projectMember);
                LoadProjectMember(LB_DepartCode.Text.Trim());

                LB_NewUserCode.Text = strUserCode;

                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;
                BT_UploadPhoto.Enabled = true;


                strHQL = "insert T_MailBoxAuthority(UserCode,PasswordSet,DeleteOperate) Values (" + "'" + strUserCode + "'" + ",'YES','YES'" + ")";
                ShareClass.RunSqlCommand(strHQL);


                //给员工增加考勤规则
                try
                {
                    strHQL = "Insert Into T_UserAttendanceRule(UserCode,UserName,CreateDate,MCheckInStart,MCheckInEnd,MCheckOutStart,MCheckOutEnd,";
                    strHQL += "ACheckInStart,ACheckInEnd,ACheckOutStart,ACheckOutEnd,NCheckInStart,NCheckInEnd,NCheckOutStart,NCheckOutEnd,";
                    strHQL += "OCheckInStart,OCheckInEnd,OCheckOutStart,OCheckOutEnd,Status,MCheckInIsMust,MCheckOutIsMust,ACheckInIsMust,ACheckOutIsMust,NCheckInIsMust,NCheckOutIsMust,OCheckInIsMust,OCheckOutIsMust,LargestDistance,LeaderCode,LeaderName,OfficeLongitude,OfficeLatitude)";
                    strHQL += " Select A.UserCode,A.UserName,now(),B.MCheckInStart,B.MCheckInEnd,B.MCheckOutStart,B.MCheckOutEnd,";
                    strHQL += "B.ACheckInStart,B.ACheckInEnd,B.ACheckOutStart,B.ACheckOutEnd,B.NCheckInStart,B.NCheckInEnd,B.NCheckOutStart,B.NCheckOutEnd,";
                    strHQL += "B.OCheckInStart,B.OCheckInEnd,B.OCheckOutStart,B.OCheckOutEnd,'处理中',B.MCheckInIsMust,B.MCheckOutIsMust,B.ACheckInIsMust,B.ACheckOutIsMust,B.NCheckInIsMust,B.NCheckOutIsMust,B.OCheckInIsMust,B.OCheckOutIsMust,B.LargestDistance,'','',OfficeLongitude,OfficeLatitude";
                    strHQL += " From T_ProjectMember A, T_AttendanceRule B";
                    strHQL += " Where A.UserCode = '" + strUserCode + "' and A.UserCode not in (Select UserCode From T_UserAttendanceRule) and A.Status not in ('离职','终止') ";
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch
                {

                }
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJCDMZFHMXWK + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYHDMYHMCMMZWEMAILDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateUser()
    {
        string strUserCode = TB_UserCode.Text.Trim().ToUpper();
        string strUserName = TB_UserName.Text.Trim();
        string strPassword = TB_Password.Text.Trim();
        string strDuty = TB_Duty.Text.Trim();
        string strEmail = TB_EMail.Text.Trim();

        string strRefUserCode = TB_RefUserCode.Text.Trim();
        string strUserRTXCode = TB_UserRTXCode.Text.Trim();
        string strMIDStyle = DL_SystemMDIStyle.SelectedValue.Trim();
        string strAllowDevice = DL_AllowDevice.SelectedValue.Trim();

        int intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        string strHQL;
        IList lst;

        if (strPassword != "")
        {
            if (strPassword.Length < 8)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSBMMCDBXDYHDY8WJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                return;
            }
        }

        if (strRefUserCode == "")
        {
            strRefUserCode = strUserCode;
            TB_RefUserCode.Text = strRefUserCode;
        }

        if (strUserRTXCode == "")
        {
            TB_UserRTXCode.Text = strUserCode + strUserName;
        }

        if (strUserCode != "" & strUserName != "" & strDuty != "" & strEmail != "")
        {
            strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);

            ProjectMember projectMember = (ProjectMember)lst[0];

            projectMember.UserCode = TB_UserCode.Text.Trim();
            projectMember.UserName = TB_UserName.Text.Trim();

            projectMember.Gender = DL_Gender.SelectedValue.Trim();
            projectMember.Age = int.Parse(TB_Age.Amount.ToString());

            if (strPassword != "")
            {
                projectMember.Password = EncryptPassword(strPassword, "MD5");
            }

            projectMember.RefUserCode = strRefUserCode;
            projectMember.SortNumber = intSortNumber;

            projectMember.DepartCode = TB_DepartCode.Text.Trim();
            projectMember.DepartName = LB_DepartName.Text.Trim();
            projectMember.ChildDepartment = TB_ChildDepartment.Text.Trim();
            projectMember.Duty = TB_Duty.Text.Trim();
            projectMember.OfficePhone = TB_OfficePhone.Text.Trim();
            projectMember.MobilePhone = TB_MobilePhone.Text.Trim();
            projectMember.EMail = TB_EMail.Text.Trim();
            projectMember.JoinDate = DateTime.Parse(DLC_JoinDate.Text);
            projectMember.WorkScope = TB_WorkScope.Text.Trim();
            projectMember.Status = DL_Status.SelectedValue.Trim();

            projectMember.EnglishName = TB_EnglishName.Text.Trim();
            projectMember.Nationality = TB_Nationality.Text.Trim();
            projectMember.NativePlace = TB_NativePlace.Text.Trim();
            projectMember.HuKou = TB_HuKou.Text.Trim();
            projectMember.Residency = TB_Residency.Text.Trim();
            projectMember.Address = TB_Address.Text.Trim();
            projectMember.BirthDay = DateTime.Parse(DLC_BirthDay.Text);
            projectMember.LunarBirthDay = ChinaDate.GetSunYearDate(DateTime.Parse(DLC_BirthDay.Text));
            projectMember.MaritalStatus = DL_MaritalStatus.SelectedValue.Trim();
            projectMember.Degree = TB_Degree.Text.Trim();
            projectMember.Major = TB_Major.Text.Trim();
            projectMember.GraduateSchool = TB_GraduateSchool.Text.Trim();
            projectMember.IDCard = TB_IDCard.Text.Trim();
            projectMember.BloodType = TB_BloodType.Text.Trim();
            projectMember.Height = int.Parse(NB_Height.Amount.ToString());

            projectMember.LangCode = ddlLangSwitcher.SelectedValue.Trim();
            projectMember.Language = ddlLangSwitcher.SelectedItem.Text.Trim();

            projectMember.UrgencyPerson = TB_UrgencyPerson.Text.Trim();
            projectMember.UrgencyCall = TB_UrgencyCall.Text.Trim();
            projectMember.Introducer = TB_Introducer.Text.Trim();
            projectMember.IntroducerDepartment = TB_IntroducerDepartment.Text.Trim();
            projectMember.IntroducerRelation = TB_IntroducerRelation.Text.Trim();
            projectMember.Comment = TB_Comment.Text.Trim();
            projectMember.PhotoURL = HL_MemberPhoto.NavigateUrl.Trim();

            projectMember.UserType = DL_UserType.SelectedValue.Trim();
            projectMember.UserRTXCode = TB_UserRTXCode.Text.Trim();
            projectMember.WorkType = DL_WorkType.SelectedValue.Trim();

            projectMember.MDIStyle = strMIDStyle;
            projectMember.AllowDevice = strAllowDevice;

            projectMember.HourlySalary = NB_HourlySalary.Amount;
            projectMember.MonthlySalary = NB_MonthlySalary.Amount;


            try
            {
                projectMemberBLL.UpdateProjectMember(projectMember, strUserCode);
                LoadProjectMember(LB_DepartCode.Text.Trim());

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJCDMZFHMXWK + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYHDMYHMCZWEMAILDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();

        string strUserCode = "%" + TB_UserCodeFind.Text.Trim() + "%";
        string strUserName = "%" + TB_UserNameFind.Text.Trim() + "%";

        if (strUserCode != "ADMIN")
        {
            strHQL = "from ProjectMember as projectMember where projectMember.UserCode Like " + "'" + strUserCode + "'" + " and projectMember.UserName Like " + "'" + strUserName + "'";
            strHQL += " and projectMember.DepartCode in " + strDepartString;
        }
        else
        {
            strHQL = "from ProjectMember as projectMember where projectMember.UserCode Like " + "'" + strUserCode + "'" + " and projectMember.UserName Like " + "'" + strUserName + "'";
        }

        strHQL += " Order By projectMember.SortNumber ASC";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
    }

    protected void BT_SavePhoto_Click(object sender, EventArgs e)
    {
        string strUserCode;
        string strUserPhotoString;

        strUserCode = TB_UserCode.Text.Trim();
        strUserPhotoString = TB_PhotoString1.Text.Trim();
        strUserPhotoString += TB_PhotoString2.Text.Trim();
        strUserPhotoString += TB_PhotoString3.Text.Trim();
        strUserPhotoString += TB_PhotoString4.Text.Trim();

        if (strUserPhotoString != "")
        {
            var binaryData = Convert.FromBase64String(strUserPhotoString);

            string strDateTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            string strUserPhotoURL = "Doc\\" + "UserPhoto\\" + strUserCode + strDateTime + ".jpg";
            var imageFilePath = Server.MapPath("Doc") + "\\UserPhoto\\" + strUserCode + strDateTime + ".jpg";

            if (File.Exists(imageFilePath))
            { File.Delete(imageFilePath); }
            var stream = new System.IO.FileStream(imageFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            stream.Write(binaryData, 0, binaryData.Length);
            stream.Close();

            string strHQL = "Update T_ProjectMember Set PhotoURL = " + "'" + strUserPhotoURL + "'" + " Where UserCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            IM_MemberPhoto.ImageUrl = GetUserPhotoURL(strUserCode);
        }
    }

    protected string EncryptPassword(string strPassword, string strFormat)
    {
        string strNewPassword;

        if (strFormat == "SHA1")
        {
            strNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "SHA1");
        }
        else
        {
            strNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "MD5");

        }

        return strNewPassword;
    }

    protected int GetDepartUserInforRelatedUserCount(string strDepartCode, string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from DepartUserInforRelatedUser as departUserInforRelatedUser where departUserInforRelatedUser.DepartCode = " + "'" + strDepartCode + "'";
        strHQL += " and departUserInforRelatedUser.UserCode = " + "'" + strUserCode + "'";
        DepartUserInforRelatedUserBLL departAssetRelateduserBLL = new DepartUserInforRelatedUserBLL();
        lst = departAssetRelateduserBLL.GetAllDepartUserInforRelatedUsers(strHQL);

        return lst.Count;
    }

    protected void LoadProjectMember(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadWorkType()
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkType as workType Order by workType.SortNo ASC";
        WorkTypeBLL workTypeBLL = new WorkTypeBLL();
        lst = workTypeBLL.GetAllWorkType(strHQL);
        DL_WorkType.DataSource = lst;
        DL_WorkType.DataBind();
        DL_WorkType.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected string GetUserPhotoURL(string strUserCode)
    {
        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember.PhotoURL.Trim();
    }

    protected int GetUserNumber()
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }
}

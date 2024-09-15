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
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

using TakeTopSecurity;
using TakeTopCore;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAPPMemberRegisteredForSH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strType = Request.QueryString["type"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            //检查注是否为SAAS版本
            string strServerName = System.Configuration.ConfigurationManager.AppSettings["ServerName"];
            TakeTopLicense license = new TakeTopLicense();
            //string strSystemVersionType = license.GetVerType(strServerName); ;
            //if (strSystemVersionType != "SAAS")
            //{
            //    Response.Redirect("TTDisplayErrors.aspx");
            //}

            DLC_BirthDay.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_JoinDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //if (strType == "WXGZH" | !ShareClass.IsMobileDeviceCheckAgent())
            //{
            //    BT_BackLoginPage.Visible = false;
            //}
            //else
            //{
            //    BT_BackLoginPage.Visible = false;
            //}


            ShareClass.LoadSystemMDIStyle(DL_SystemMDIStyle);
            LoadWorkType();

            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
        }
    }

    protected void BT_Add_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode = TB_UserCode.Text.Trim();
        string strUserName = TB_UserName.Text.Trim();
        string strPassword = "12345678@";
        string strConfirmPassword = "12345678@";
        string strEmail = TB_EMail.Text.Trim();
        string strCreatorCode = TB_UserCode.Text.Trim();
        string strChildDepartment = TB_ChildDepartment.Text.Trim();
        string strRefUserCode = TB_RefUserCode.Text.Trim();
        string strUserRTXCode = TB_UserRTXCode.Text.Trim();
        string strMDIStyle = DL_SystemMDIStyle.SelectedValue.Trim();
        string strAllowDevice = DL_AllowDevice.SelectedValue.Trim();

        int intSortNumber = int.Parse(NB_SortNumber.Amount.ToString());

        if (strRefUserCode == "")
        {
            strRefUserCode = strUserCode;
            TB_RefUserCode.Text = strRefUserCode;
        }

        if (strUserRTXCode == "")
        {
            TB_UserRTXCode.Text = strUserCode + strUserName;
        }

        if (String.Compare(Request.Cookies["CheckCode"].Value, TB_CheckCode.Text, true) != 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYZMCWSRZDYZM + "')", true);
            TB_CheckCode.Text = "";
            return;
        }


        if (strUserCode != "" & strUserName != "" & strPassword != "" & strEmail != "")
        {
            if (strPassword.Length < 8)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZCSBMMCDBXDYHDY8WJC + "')", true);
                return;
            }

            if (strPassword != strConfirmPassword)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMMHQRMMBYZQJC + "')", true);
                return;
            }


            strHQL = "Select * From T_ProjectMember Where UserCode = " + "'" + strUserCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCYHYJZCQHLYGSJHM + "')", true);
                return;
            }

            Regex mobileReg = new Regex("[0-9]{11,11}");
            if (!mobileReg.IsMatch(strUserCode))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSJHMBZQQJC + "')", true);
                return;
            }

            ProjectMember projectMember = new ProjectMember();

            projectMember.UserCode = TB_UserCode.Text.Trim().ToUpper();
            projectMember.UserName = TB_UserName.Text.Trim();
            projectMember.Gender = DL_Gender.SelectedValue.Trim();
            projectMember.Age = int.Parse(TB_Age.Amount.ToString());
            projectMember.Password = EncryptPassword("12345678@", "MD5");

            projectMember.RefUserCode = TB_RefUserCode.Text.Trim();
            projectMember.SortNumber = intSortNumber;

            projectMember.DepartCode = ShareClass.GetDepartCodeFromUserCode("ADMIN");
            projectMember.DepartName = ShareClass.GetDepartName(ShareClass.GetDepartCodeFromUserCode("ADMIN"));
            projectMember.ChildDepartment = TB_ChildDepartment.Text.Trim();
            projectMember.Duty = TB_Duty.Text.Trim();
            projectMember.OfficePhone = TB_OfficePhone.Text.Trim();
            projectMember.MobilePhone = strUserCode;
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
            projectMember.LunarBirthDay = DateTime.Parse(DLC_BirthDay.Text);
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

                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;
                BT_UploadPhoto.Enabled = true;

                strHQL = "insert into T_MailBoxAuthority(UserCode,PasswordSet,DeleteOperate) Values (" + "'" + strUserCode + "'" + ",'YES','YES'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Select * From T_SystemActiveUser Where UserCode = '" + strUserCode + "'";
                DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_SystemActiveUser");
                if (ds1.Tables[0].Rows.Count == 0)
                {
                    strHQL = "Insert Into T_SystemActiveUser(UserCode,UserName,JoinTime,OperatorCode,AppUser,WebUser) ";
                    strHQL += "Values('" + strUserCode + "','" + strUserName + "',now(),'" + strUserCode + "','YES','YES')";
                    ShareClass.RunSqlCommand(strHQL);
                }

                strHQL = "Select * From T_MemberLevel Where UserCode = '" + strUserCode + "' and UnderCode = '" + strUserCode + "'";
                DataSet ds2 = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");
                if (ds2.Tables[0].Rows.Count == 0)
                {
                    strHQL = "Insert Into T_MemberLevel(UserCode  ,UnderCode ,AgencyStatus,ProjectVisible ,PlanVisible  ,KPIVisible ,WorkloadVisible ,ScheduleVisible ,WorkflowVisible,CustomerServiceVisible ,ConstractVisible,PositionVisible,SortNumber)";
                    strHQL += " values('" + strUserCode + "','" + strUserCode + "',1,'YES','YES','YES','YES','YES','YES','YES','YES','YES',1)";
                    ShareClass.RunSqlCommand(strHQL);
                }

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

                Msg msg = new Msg();

                new System.Threading.Thread(delegate ()
                {
                    try
                    {
                        msg.SendPhoneMSMBySP(strUserCode, "登记成功，欢迎你成为商会准成员，你的" + Resources.lang.ZhangHao + ": " + TB_UserCode.Text.Trim() + ", " + Resources.lang.Password + ": " + strPassword, "商会管理员");
                    }
                    catch
                    {
                    }

                    try
                    {
                        msg.SendMail(strUserCode, "登记成功，欢迎你成为商会准成员，你的" + Resources.lang.ZhangHao + Resources.lang.Password, Resources.lang.ZhangHao + ": " + TB_UserCode.Text.Trim() + ", " + Resources.lang.MiMa + ": " + strPassword, "商会管理员");
                    }
                    catch
                    {
                    }

                }).Start();

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click2", "alert('登记成功，欢迎你成为商会准成员！')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click3", "alert('登记失败，请联系商会管理员')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click4", "alert('" + Resources.lang.ZZJGDHXBNWKJC + "')", true);
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

            strHQL = "Select DepartCode,DepartName from T_Department where DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Union Select DepartCode,DepartName from T_Department where ParentCode = " + "'" + strDepartCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DepartMent");
            DL_Department.DataSource = ds;
            DL_Department.DataBind();

            LB_DepartCode.Text = strDepartCode;

            if (GetDepartUserInforRelatedUserCount(strDepartCode, strUserCode) > 0)
            {
                BT_Add.Enabled = true;
            }
            else
            {
                BT_Add.Enabled = false;
            }
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strDepartCode = ((Button)e.Item.FindControl("BT_DepartCode")).Text.Trim();
            string strDepartName = ((Button)e.Item.FindControl("BT_DepartName")).Text.Trim();

            string strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_DepartCode.Text = strDepartCode;
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strCreatorCode, strCurrentUserCode;

        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        ProjectMember projectMember = (ProjectMember)lst[0];

        TB_UserCode.Text = projectMember.UserCode;
        TB_UserName.Text = projectMember.UserName;
        DL_Gender.SelectedValue = projectMember.Gender.Trim();
        TB_Age.Amount = projectMember.Age;
        TB_Duty.Text = projectMember.Duty;
        DL_Department.SelectedValue = projectMember.DepartCode;
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

        ddlLangSwitcher.SelectedValue = projectMember.LangCode.Trim();

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

        NB_MonthlySalary.Amount = projectMember.MonthlySalary;
        NB_HourlySalary.Amount = projectMember.HourlySalary;

        strCurrentUserCode = Session["UserCode"].ToString().Trim();
        strCreatorCode = projectMember.CreatorCode.Trim();

        if (strCreatorCode == strCurrentUserCode)
        {
            BT_Update.Enabled = true;
            BT_Delete.Enabled = true;
            BT_UploadPhoto.Enabled = true;
            BT_DeletePhoto.Enabled = true;
            BT_TakePhoto.Enabled = true;
        }
        else
        {
            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;
            BT_UploadPhoto.Enabled = false;
            BT_DeletePhoto.Enabled = false;
            BT_TakePhoto.Enabled = false;
        }
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

                string strDocSavePath = Server.MapPath("Doc") + "\\" + strLoginUserCode + "\\Images\\";
                string strFileName3 = "Doc\\" + strLoginUserCode + "\\Images\\" + strFileName2;
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


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCHCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
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

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }


    protected SystemMDIStyle GetSystemMDIStyle(string strMDIStyle)
    {
        string strHQL;
        IList lst;


        strHQL = "From SystemMDIStyle as systemMDIStyle Where MDIStyle = " + "'" + strMDIStyle + "'";
        SystemMDIStyleBLL systemMDIStyleBLL = new SystemMDIStyleBLL();
        lst = systemMDIStyleBLL.GetAllSystemMDIStyles(strHQL);

        if (lst.Count > 0)
        {
            SystemMDIStyle systemMDIStyle = (SystemMDIStyle)lst[0];
            return systemMDIStyle;
        }
        else
        {
            return null;
        }
    }


    protected bool CheckUserLoginManage(string strUserCode, string strUserName)
    {
        //根据用户登录IP判断是否阻止用户登录系统
        string strHQL;
        string strLoginID, strIsAllMember, strIsForbidLogin, strLoginUserCode;
        string strMsg, strIP, strUserHostAddress;

        strUserHostAddress = HttpContext.Current.Request.UserHostAddress.Trim();

        if (strUserCode != "ADMIN")
        {
            DataSet ds = ShareClass.GetUserLoginManageDataSet(strUserCode);

            if (ds.Tables[0].Rows.Count > 0)
            {
                strLoginID = ds.Tables[0].Rows[0][0].ToString().Trim();
                strIsAllMember = ds.Tables[0].Rows[0][1].ToString().Trim();
                strIsForbidLogin = ds.Tables[0].Rows[0][2].ToString().Trim();
                strMsg = ds.Tables[0].Rows[0][3].ToString().Trim();
                strLoginUserCode = ds.Tables[0].Rows[0][4].ToString().Trim();
                strIP = ds.Tables[0].Rows[0][5].ToString().Trim();

                if (strIP == "" | strIP.IndexOf(strUserHostAddress) >= 0)
                {
                    if (strIsForbidLogin == "YES")
                    {
                        if (strMsg != "")
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + strMsg + "');</script>");

                            strHQL = "Insert Into T_UserLoginManageMsgRelatedUser(LoginID,UserCode,UserName)";
                            strHQL += " Values(" + strLoginID + ",'" + strUserCode + "','" + strUserName + "')";
                            ShareClass.RunSqlCommand(strHQL);
                        }

                        return false;
                    }
                    else
                    {
                        if (strMsg != "")
                        {
                            strHQL = "Select LoginID From T_UserLoginManageMsgRelatedUser Where LoginID = " + strLoginID + " and UserCode Like " + "'" + strUserCode + "'";
                            ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserLoginManage");
                            if (ds.Tables[0].Rows.Count == 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + strMsg + "');</script>");

                                strHQL = "Insert Into T_UserLoginManageMsgRelatedUser(LoginID,UserCode,UserName)";
                                strHQL += " Values(" + strLoginID + ",'" + strUserCode + "','" + strUserName + "')";
                                ShareClass.RunSqlCommand(strHQL);
                            }
                        }

                        return true;
                    }
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }
    }



    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strUserCode = TB_UserCode.Text.Trim().ToUpper();
        string strUserName = TB_UserName.Text.Trim();
        string strPassword = "12345678@";
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

            projectMember.DepartCode = DL_Department.SelectedValue.Trim();
            projectMember.DepartName = DL_Department.SelectedItem.Text.Trim();
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

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJCDMZFHMXWK + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYHDMYHMCZWEMAILDBNWKJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode, strDepartCode;

        strUserCode = TB_UserCode.Text.Trim();
        strDepartCode = LB_DepartCode.Text.Trim();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        ProjectMember projectMember = new ProjectMember();

        projectMember.UserCode = strUserCode;

        try
        {
            projectMemberBLL.DeleteProjectMember(projectMember);

            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;
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

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strUserCode = TB_UserCode.Text.Trim();
        string strUserName = TB_UserName.Text.Trim();

        string strHQL;
        IList lst;

        if (strUserCode == "" & strUserName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZSBXSRYHDMHMCZYCNC + "')", true);
            return;
        }

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'" + " or projectMember.UserName = " + "'" + strUserName + "'";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        if (lst.Count > 0)
        {
            ProjectMember projectMember = (ProjectMember)lst[0];

            TB_UserCode.Text = projectMember.UserCode;
            TB_UserName.Text = projectMember.UserName;
            DL_Gender.SelectedValue = projectMember.Gender.Trim();
            TB_Age.Amount = projectMember.Age;
            TB_Duty.Text = projectMember.Duty;
            DL_Department.SelectedValue = projectMember.DepartCode;
            TB_OfficePhone.Text = projectMember.OfficePhone;
            TB_MobilePhone.Text = projectMember.MobilePhone;
            TB_EMail.Text = projectMember.EMail;
            TB_WorkScope.Text = projectMember.WorkScope;
            DLC_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
            DL_Status.SelectedValue = projectMember.Status.Trim();

            TB_EnglishName.Text = projectMember.EnglishName.Trim();
            TB_Nationality.Text = projectMember.Nationality.Trim();
            TB_NativePlace.Text = projectMember.NativePlace.Trim();
            TB_HuKou.Text = projectMember.HuKou.Trim();
            TB_Residency.Text = projectMember.Residency.Trim();
            TB_Address.Text = projectMember.Address.Trim();
            DLC_BirthDay.Text = projectMember.BirthDay.ToString("yyyy-MM-dd");
            DL_MaritalStatus.SelectedValue = projectMember.MaritalStatus;
            TB_Degree.Text = projectMember.Degree.Trim();
            TB_Major.Text = projectMember.Major.Trim();
            TB_GraduateSchool.Text = projectMember.GraduateSchool.Trim();
            TB_IDCard.Text = projectMember.IDCard.Trim();
            TB_BloodType.Text = projectMember.BloodType.Trim();
            NB_Height.Amount = projectMember.Height;

            ddlLangSwitcher.SelectedValue = projectMember.LangCode.Trim();

            TB_UrgencyPerson.Text = projectMember.UrgencyPerson.Trim();
            TB_UrgencyCall.Text = projectMember.UrgencyCall.Trim();
            TB_Introducer.Text = projectMember.Introducer.Trim();
            TB_IntroducerDepartment.Text = projectMember.IntroducerDepartment.Trim();
            TB_IntroducerRelation.Text = projectMember.IntroducerRelation.Trim();
            TB_Comment.Text = projectMember.Comment.Trim();

            TB_RefUserCode.Text = projectMember.RefUserCode.Trim();
            TB_UserRTXCode.Text = projectMember.UserRTXCode.Trim();

            DL_UserType.SelectedValue = projectMember.UserType.Trim();

            IM_MemberPhoto.ImageUrl = projectMember.PhotoURL.Trim();
            HL_MemberPhoto.NavigateUrl = projectMember.PhotoURL.Trim();
            NB_SortNumber.Amount = projectMember.SortNumber;

            DL_SystemMDIStyle.SelectedValue = projectMember.MDIStyle.Trim();
            DL_AllowDevice.SelectedValue = projectMember.AllowDevice.Trim();

            BT_Update.Enabled = true;
            BT_Delete.Enabled = true;
            BT_UploadPhoto.Enabled = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZMYCCYJCYHDMHMCSFZ + "')", true);
        }
    }

    protected void BT_TakePhoto_Click(object sender, EventArgs e)
    {
        //Panel2.Visible = true;
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

    protected string GetDepartName(string strDepartCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
        DepartmentBLL departmentBLL = new DepartmentBLL();
        lst = departmentBLL.GetAllDepartments(strHQL);
        Department department = (Department)lst[0];

        return department.DepartName.Trim();
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

    protected int GetUserNumber()
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }

    protected string GetUserPhotoURL(string strUserCode)
    {
        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember.PhotoURL.Trim();
    }

}

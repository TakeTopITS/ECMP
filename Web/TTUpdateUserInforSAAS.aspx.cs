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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUpdateUserInforSAAS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx");
        //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "我的档案", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            try
            {
                ShareClass.LoadLanguageForDropList(ddlLangSwitcher);

                strHQL = "from WorkType as workType Order by workType.SortNo ASC";
                BookReaderTypeBLL bookReaderTypeBLL = new BookReaderTypeBLL();
                lst = bookReaderTypeBLL.GetAllBookReaderType(strHQL);
                DL_WorkType.DataSource = lst;
                DL_WorkType.DataBind();
                DL_WorkType.Items.Insert(0, new ListItem("--Select--", ""));

                DLLoadDepartMent();
                LoadSystemMDIStyle();

                strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
                projectMemberBLL = new ProjectMemberBLL();
                lst = projectMemberBLL.GetAllProjectMembers(strHQL);

                ProjectMember projectMember = (ProjectMember)lst[0];

                TB_UserCode.Text = projectMember.UserCode.Trim();
                TB_UserName.Text = projectMember.UserName.Trim();
                DL_Gender.SelectedValue = projectMember.Gender.Trim();
                TB_Age.Amount = projectMember.Age;

                TB_Duty.Text = projectMember.Duty;
                TB_JobTitle.Text = projectMember.JobTitle;

                if (projectMember.PhotoURL.Trim() != "")
                {
                    IM_MemberPhoto.ImageUrl = projectMember.PhotoURL.Trim();
                }
                else
                {
                    IM_MemberPhoto.ImageUrl = "Images/DefaultUserPhoto.png";
                }

                DL_Department.SelectedValue = projectMember.DepartCode;
                TB_ChildDepartment.Text = projectMember.ChildDepartment;
                TB_OfficePhone.Text = projectMember.OfficePhone;
                TB_MobilePhone.Text = projectMember.MobilePhone;
                TB_EMail.Text = projectMember.EMail;
                TB_WorkScope.Text = projectMember.WorkScope;
                TB_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
                DL_Status.SelectedValue = projectMember.Status.Trim();

                DL_UserType.SelectedValue = projectMember.UserType.Trim();
                TB_RefUserCode.Text = projectMember.RefUserCode.Trim();
                TB_UserRTXCode.Text = projectMember.UserRTXCode.Trim();
                NB_SortNumber.Amount = projectMember.SortNumber;
                try
                {
                    DL_WorkType.SelectedValue = projectMember.WorkType.Trim();
                }
                catch
                {
                }
                DL_SystemMDIStyle.SelectedValue = projectMember.MDIStyle.Trim();
                DL_CssDirectory.SelectedValue = projectMember.CssDirectory.Trim();
                DL_AllowDevice.SelectedValue = projectMember.AllowDevice.Trim();

                try
                {
                    ddlLangSwitcher.SelectedValue = projectMember.LangCode.Trim();
                }
                catch
                {
                    ddlLangSwitcher.SelectedValue = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
                }

                try
                {
                    DL_LeftBarExtend.SelectedValue = ShareClass.GetLeftBarExtendStatus(strUserCode);
                }
                catch
                {
                    DL_LeftBarExtend.SelectedValue = "NO";
                }
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strOldPassword = TB_OldPassword.Text.Trim();
        string strPassword = TB_Password.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();


        string strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        ProjectMember projectMember = (ProjectMember)lst[0];

        if (strOldPassword == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click11", "alert('" + Resources.lang.ZZYuanMiMaChuWuHouWeiKong + "')", true);
            return;
        }

        if (EncryptPassword(strOldPassword, "MD5") != projectMember.Password.Trim())
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click22", "alert('" + Resources.lang.ZZYuanMiMaChuWuHouWeiKong + "')", true);
            return;
        }

        if (strPassword != "")
        {
            if (ShareClass.SqlFilter(strPassword))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click33", "alert('" + Resources.lang.ZZZHHYFFZHDLSB + "')", true);
                return;
            }

            #region 判断输入的密码是否是字母与数字的结合，且长度要大于或等于8位 2013-09-03 By LiuJianping
            if (!IsPassword(strPassword))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBMMCDBXDYHDY8WBXBHSZJZMJC + "')", true);
                TB_Password.Focus();
                return;
            }
            string strPasswordShal = EncryptPasswordShal(strPassword);
            strPassword = EncryptPassword(strPassword, "MD5");
            projectMember.Password = strPassword;
            #endregion
        }

        projectMember.Age = int.Parse(TB_Age.Amount.ToString());
        projectMember.OfficePhone = TB_OfficePhone.Text.Trim();
        projectMember.MobilePhone = TB_MobilePhone.Text.Trim();
        projectMember.EMail = TB_EMail.Text.Trim();
        projectMember.MDIStyle = DL_SystemMDIStyle.SelectedValue.Trim();
        projectMember.LangCode = ddlLangSwitcher.SelectedValue.Trim();
        projectMember.CssDirectory = DL_CssDirectory.SelectedValue.Trim();

        try
        {
            projectMemberBLL.UpdateProjectMember(projectMember, strUserCode);

            Session["CssDirectory"] = DL_CssDirectory.SelectedValue.Trim();

            //设置缓存更改标志
            ChangePageCache();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click44", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click55", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void DL_LeftBarExtend_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strUserCode;
        string strLeftBarExtend;


        strUserCode = Session["UserCode"].ToString();
        strLeftBarExtend = DL_LeftBarExtend.SelectedValue.Trim();

        try
        {
            //更新左边栏展开状态
            UpdateLeftBarExtendStatus(strUserCode, strLeftBarExtend);

            Session["LeftBarExtend"] = strLeftBarExtend;

            ShareClass.AddSpaceLineToFile("TakeTopLRExLeft.aspx", "<%--***--%>");
            ShareClass.AddSpaceLineToFile("TakeTopCSLRLeft.aspx", "<%--***--%>");

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click55", "changeLeftBarExtend('" + strLeftBarExtend + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click66", "alert('" + Resources.lang.ZZGGSBJC + "')", true);
        }
    }

    //更新左边栏展开状态
    protected void UpdateLeftBarExtendStatus(string strUserCode, string strLeftBarExtend)
    {
        string strHQL;

        strHQL = "Update T_ProjectMember Set LeftBarExtend = '" + strLeftBarExtend + "' Where UserCode ='" + strUserCode + "'";
        ShareClass.RunSqlCommand(strHQL);
    }


    //设置缓存更改标志，并刷新页面缓存
    protected void ChangePageCache()
    {
        //设置缓存更改标志
        ShareClass.SetPageCacheMark("1");
        Session["CssDirectoryChangeNumber"] = "1";

        ////给相关页面文件添加空行以刷新页面缓存
        //ShareClass.AddSpaceLineToFileForRefreshCache();

    }

    protected void DLLoadDepartMent()
    {
        string strHQL = "from Department as department";

        DepartmentBLL departmentBLL = new DepartmentBLL();


        IList lst = departmentBLL.GetAllDepartments(strHQL);

        DL_Department.DataSource = lst;
        DL_Department.DataBind();
    }

    protected void LoadSystemMDIStyle()
    {
        string strHQL = "from SystemMDIStyle as systemMDIStyle Order By systemMDIStyle.SortNumber ASC";

        SystemMDIStyleBLL systemMDIStyleBLL = new SystemMDIStyleBLL();
        IList lst = systemMDIStyleBLL.GetAllSystemMDIStyles(strHQL);

        DL_SystemMDIStyle.DataSource = lst;
        DL_SystemMDIStyle.DataBind();
    }

    /// <summary>
    /// 判断输入的密码是否是字母与数字的结合 By LiuJianping 2013-09-03
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    private bool IsPassword(string str)
    {
        //字母，数字，非字母字符(例如 !、$、#、%) ^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{8,}
        System.Text.RegularExpressions.Regex reg
            = new System.Text.RegularExpressions.Regex("^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[0-9])|(?=.*[a-z])(?=.*[0-9])).{8,}");
        return reg.IsMatch(str);
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


    /// <summary>
    ///  散列加密
    /// </summary>
    protected string EncryptPasswordShal(string strPlaintext)
    {
        byte[] srcBuffer = System.Text.Encoding.UTF8.GetBytes(strPlaintext);

        System.Security.Cryptography.HashAlgorithm hash = System.Security.Cryptography.HashAlgorithm.Create("SHA1"); //将参数换成“MD5”，则执行 MD5 加密。不区分大小写。
        byte[] destBuffer = hash.ComputeHash(srcBuffer);

        string strHashedText = BitConverter.ToString(destBuffer).Replace("-", "");
        return strHashedText.ToLower();
    }
}

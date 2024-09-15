using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using TakeTopCore;
using TakeTopSecurity;

public partial class DefaultWeiXinQYH : System.Web.UI.Page
{
    //private string strToken;//与微信公众账号后台的Token设置保持一致，区分大小写。

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品(jack.erp@gmail.com)
        //泰顶拓鼎集团（TakeTop Software）2006－2026\

        string strVerificationCode, strSMSVerification, strIsOEMVersion;
        string strUserHostAddress = Request.UserHostAddress;

        this.Title = System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        if (Page.IsPostBack != true)
        {
            try
            {
                try
                {
                    ShareClass.LoadLanguageForDropList(ddlLangSwitcher);

                    if (Request.Cookies["LangCode"] != null)
                    {
                        ddlLangSwitcher.SelectedValue = Request.Cookies["LangCode"].Value;
                    }

                    if (Session["LangCode"] != null)
                    {
                        ddlLangSwitcher.SelectedValue = Session["LangCode"].ToString();
                    }

                    InitializeCulture();
                }
                catch (Exception ex)
                {
                }

                strVerificationCode = System.Configuration.ConfigurationManager.AppSettings["VerificationCode"].Trim().ToUpper();
                if (strVerificationCode == "NO")
                {
                    TB_CheckCode.Enabled = false;
                    TB_CheckCode.Text = "*********";
                    IM_CheckCode.Visible = false;
                }
                else
                {
                    strSMSVerification = System.Configuration.ConfigurationManager.AppSettings["SMSVerification"].Trim().ToUpper();
                    if (strSMSVerification == "YES")
                    {
                        IB_GetSMS.Visible = true;
                        IM_CheckCode.Visible = false;
                    }
                    else
                    {
                        if (ShareClass.IsMobileDeviceCheckAgent())
                        {
                            TB_CheckCode.Enabled = false;
                            TB_CheckCode.Text = "********";
                        }
                    }
                }

                strIsOEMVersion = System.Configuration.ConfigurationManager.AppSettings["IsOEMVersion"];
                LB_Copyright.Text = "Copyright© TakeTopITS Group 2006-2026";

                if (strIsOEMVersion == "NO")
                {
                    LB_Copyright.Visible = true;
                }
                else
                {
                    LB_Copyright.Visible = true;
                    LB_Copyright.Text = "Copyright© 2006-2026";
                }
            }
            catch (Exception err)
            {
                //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected void LB_Login_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode, strUserName, strPassword;
        string strUserType;
        string strUserHostAddress, strAllowDevice;

        strUserHostAddress = Request.UserHostAddress;

        strUserCode = TB_UserCode.Text.Trim().ToUpper();
        strPassword = TB_Password.Text.Trim();

        if (strUserCode == "" | strPassword == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZYHMHMMDBNWKJC + "');</script>");
            return;
        }

        if (ShareClass.SqlFilter(strUserCode) | ShareClass.SqlFilter(strPassword))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZZHHYFFZHDLSB + "');</script>");
            return;
        }

        try
        {
            strPassword = EncryptPassword(strPassword, "MD5");
            strHQL = "Select * from T_ProjectMember where UserCode = " + "'" + strUserCode + "'" + " and Password = " + "'" + strPassword + "'" + " And rtrim(ltrim(Status)) not in ( '终止','离职')";
            strHQL += " And UserCode in (Select UserCode From T_SystemActiveUser Where AppUser = 'YES')";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");
            if (ds.Tables[0].Rows.Count > 0)
            {
                //升级数据库
                if (ShareClass.SystemDBer == "")
                {
                    ShareClass.SystemDBer = strUserCode;
                    TakeTopCore.CoreShareClass.UpgradeDataBase();
                }

                strUserName = ds.Tables[0].Rows[0]["UserName"].ToString().Trim();
                strUserType = ds.Tables[0].Rows[0]["UserType"].ToString().Trim();
                strAllowDevice = ds.Tables[0].Rows[0]["AllowDevice"].ToString().Trim();

                Session["UserCode"] = strUserCode;
                Session["UserName"] = strUserName;
                Session["UserType"] = strUserType;
                Session["IsMobileDevice"] = "YES";
                Session["SystemType"] = "APP";

                //Session["CssDirectory"] = ds.Tables[0].Rows[0]["CssDirectory"].ToString().Trim();
                Session["CssDirectory"] = "CssBlue";

                Session["CssDirectoryChangeNumber"] = ds.Tables[0].Rows[0]["CssDirectoryChangeNumber"].ToString().Trim();
                try
                {
                    Session["LeftBarExtend"] = ds.Tables[0].Rows[0]["LeftBarExtend"].ToString().Trim();
                }
                catch
                {
                    Session["LeftBarExtend"] = "NO";
                }
                try
                {
                    //初始化界面语言
                    try
                    {
                        Session["LangCode"] = ds.Tables[0].Rows[0]["LangCode"].ToString().Trim();
                    }
                    catch
                    {
                    }

                    if (Session["LangCode"] == null)
                    {
                        try
                        {
                            Session["LangCode"] = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
                        }
                        catch
                        {
                            Session["LangCode"] = "zh-CN";
                        }
                    }

                    Session["SkinFlag"] = ds.Tables[0].Rows[0]["CssDirectory"].ToString().Trim() + Session["LangCode"].ToString();

                    InitializeCulture();
                }
                catch
                {
                }

                //YES时页面必须在框架内打开，否则关闭
                try
                {
                    Session["MustInFrame"] = System.Configuration.ConfigurationManager.AppSettings["MustInFrame"];
                }
                catch
                {
                }
                if (Session["MustInFrame"] == null)
                {
                    Session["MustInFrame"] = "YES";
                }
                //是否自动工作流申请者自选或上一步审批者自选人员
                try
                {
                    Session["AutoSaveWFOperator"] = System.Configuration.ConfigurationManager.AppSettings["AutoSaveWFOperator"];
                }
                catch
                {
                }
                if (Session["AutoSaveWFOperator"] == null)
                {
                    Session["AutoSaveWFOperator"] = "YES";
                }

                //检查注册码是否合法
                string strServerName = System.Configuration.ConfigurationManager.AppSettings["ServerName"];
                try
                {
                    TakeTopLicense license = new TakeTopLicense();
                    if (!license.CheckWEBLicense(strServerName))
                    {
                        Response.Redirect("TTDisplayErrors.aspx");
                        return;
                    }

                    Session["SystemVersionType"] = license.GetVerType(strServerName);
                    Session["ForbitModule"] = license.GetForbitModuleString(strServerName);
                }
                catch
                {

                    Session["SystemVersionType"] = "GROUP";
                    Session["ForbitModule"] = "NONE";
                }
                if (System.Configuration.ConfigurationManager.AppSettings["ProductType"].IndexOf("SAAS") > -1)
                {
                    Session["SystemVersionType"] = "SAAS";
                }

                //把用户的微信OpenID写入人员档案表
                string strWeiXinQYCode;
                strWeiXinQYCode = Request.QueryString["code"];
                if (CheckAndSetWXUserID(strWeiXinQYCode, strUserCode) == false)
                {
                    LB_ErrorMsg.Visible = true;
                    LB_ErrorMsg.Text = Resources.lang.ZZDLSBNDWXIDYPLYZHSY + "（" + LB_ErrorMsg.Text + "）" + Resources.lang.ZZSYQLXXTGLY;

                    return;
                }

                try
                {
                    //创建用户目录
                    ShareClass.MakeUserDirectory(strUserCode);

                    //根据样板用户初始化模组
                    ShareClass.InitialUserModules("SAMPLE", strUserCode);

                    //保存登录日志
                    ShareClass.InsertUserLogonLog(strUserCode, strUserName, "APP");
                }
                catch
                {
                }

                Response.Redirect("TakeTopAPPMain.aspx", false);
                return;
            }
            else
            {
                LB_ErrorMsg.Visible = true;
                LB_ErrorMsg.Text = Resources.lang.ZZSBYYKNRX1YHDMHMMCW2BSAPPYHHYBZZSY;

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSBYYKNRX1YHDMHMMCW2BSAPPYHHYBZZSY + "');</script>");
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            Response.Redirect("TTDisplayErrors.aspx");
        }
    }

    //把用户的微信OpenID写入人员档案表
    public bool CheckAndSetWXUserID(string strWeiXinQYCode, string strUserCode)
    {
        string strHQL;
        string strUserWXUserID, strUserWXUserDeviceID, strAccessToken;

        try
        {
            strAccessToken = TakeTopCore.WXHelper.GetAccessToken();
            strUserWXUserID = TakeTopCore.WXHelper.GetQYHUserID(strAccessToken, strWeiXinQYCode);
            strUserWXUserDeviceID = TakeTopCore.WXHelper.GetQYHUserDeviceID(strAccessToken, strWeiXinQYCode);

            Session["DeviceID"] = strUserWXUserDeviceID;

            if (strUserWXUserID == null)
            {
                strUserWXUserID = "";
            }

            if (strUserWXUserDeviceID == null)
            {
                strUserWXUserDeviceID = "";
            }

            //if (strUserWXUserID != "" & strUserWXUserDeviceID != "" )
            //{
            //strHQL = "Select UserCode+UserName From T_ProjectMember Where (WeChatUserID = '" + strUserWXUserID + "' and WeChatDeviceID = '" + strUserWXUserDeviceID + "') and UserCode <> '" + strUserCode + "'";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    LB_ErrorMsg.Text = ds.Tables[0].Rows[0][0].ToString();
            //    return false;
            //}

            strHQL = "Update T_ProjectMember Set WeChatUserID = '" + strUserWXUserID + "' Where UserCode = '" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Update T_ProjectMember Set WeChatDeviceID = '" + strUserWXUserDeviceID + "' Where UserCode = '" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            return true;
            //}
            //else
            //{
            //    return true;
            //}
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            return false;
        }
    }

    protected void LB_Register_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTDisplayErrors.aspx");
    }

    protected void IB_GetSMS_Click(object sender, ImageClickEventArgs e)
    {
        string strUserCode, strPassword, strSMSCode, strMsg;
        int intCount;

        strUserCode = TB_UserCode.Text.Trim();
        strPassword = TB_Password.Text.Trim();

        strPassword = EncryptPassword(strPassword, "MD5");

        intCount = GetUserCount(strUserCode, strPassword);

        Msg msg = new Msg();

        if (intCount > 0)
        {
            strSMSCode = msg.CreateRandomCode(5);

            strMsg = "短信验证码：" + strSMSCode + "，当天有效！";

            if (msg.SendMSM("Message", strUserCode, strMsg, strUserCode))
            {
                InsertOrUpdateSMSCode(strUserCode, strSMSCode);

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZDXYZMYFSCS + "');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGDXYZMFSSBJCDXJKHWLLJ + "');</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGYHDMHMMCWBNDDXMJC + "');</script>");
        }
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLangSwitcher.SelectedValue != "")
        {
            Session["LangCode"] = ddlLangSwitcher.SelectedValue;
        }
        else
        {
            Session["LangCode"] = null;
        }

        InitializeCulture();

        Response.Redirect("DefaultWeiXinQYH.aspx");
    }

    protected override void InitializeCulture()
    {
        string strLangCode;

        if (Session["LangCode"] == null)
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
            Session["LangCode"] = strLangCode;
        }
        else
        {
            strLangCode = Session["LangCode"].ToString();
        }

        try
        {
            Response.SetCookie(new HttpCookie("LangCode", strLangCode));
        }
        catch
        {
        }

        if (Request.Cookies["LangCode"] != null)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(Request.Cookies["LangCode"].Value.ToString());
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Request.Cookies["LangCode"].Value.ToString());

            Page.Culture = Request.Cookies["LangCode"].Value;
            Page.UICulture = Request.Cookies["LangCode"].Value;

            base.InitializeCulture();
        }
    }

    protected void InsertOrUpdateSMSCode(string strUserCode, string strSMSCode)
    {
        string strHQL;
        IList lst;

        int intID;

        strHQL = "From SMSCode as smsCode Where smsCode.UserCode = " + "'" + strUserCode + "'" + " and to_char(smsCode.SendTime,'yyyymmdd') = " + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
        SMSCodeBLL smsCodeBLL = new SMSCodeBLL();
        lst = smsCodeBLL.GetAllSMSCodes(strHQL);

        SMSCode smsCode = new SMSCode();

        if (lst.Count > 0)
        {
            smsCode = (SMSCode)lst[0];

            intID = smsCode.ID;
            smsCode.UserCode = strUserCode;
            smsCode.RandomCode = strSMSCode;
            smsCode.SendTime = DateTime.Now;

            try
            {
                smsCodeBLL.UpdateSMSCode(smsCode, intID);
            }
            catch
            {
            }
        }
        else
        {
            smsCode.UserCode = strUserCode;
            smsCode.RandomCode = strSMSCode;
            smsCode.SendTime = DateTime.Now;

            try
            {
                smsCodeBLL.AddSMSCode(smsCode);
            }
            catch
            {
            }
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

    protected int GetUserCount(string strUserCode, string strPassword)
    {
        string strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'" + " and projectMember.Password = " + "'" + strPassword + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }


    private void WriteContent(string str)
    {
        Response.Output.Write(str);
    }
}

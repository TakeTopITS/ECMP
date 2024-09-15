using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Drawing;

using TakeTopSecurity;
using TakeTopCore;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.IO;
using System.Net;
using System.Text;


public partial class DefaultWeiXinSAAS : System.Web.UI.Page
{
    //private string strToken;//与微信公众账号后台的Token设置保持一致，区分大小写。

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品(jack.erp@gmail.com)
        //泰顶拓鼎集团（TakeTop Software）2006－2026\
        string strVerificationCode, strSMSVerification, strIsOEMVersion;
        string strUserHostAddress = Request.UserHostAddress;

        this.Title = "";

        if (Page.IsPostBack != true)
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
    }

    protected void LB_Login_Click(object sender, EventArgs e)
    {
        string strUserCode, strPassword;
        string strUserHostAddress;

        strUserHostAddress = Request.UserHostAddress;

        strUserCode = TB_UserCode.Text.Trim().ToUpper();
        strPassword = TB_Password.Text.Trim();

        string strURL;
        string strSiteURL;

        string strWeiXinCode;
        strWeiXinCode = Request.QueryString["code"];

        string strSimpleName = TB_CompanyName.Text.Trim();
        strSiteURL = GetCustomerWorkSiteURL(strSimpleName);

        if (strSimpleName != "" && strSiteURL == "")
        {
            TB_CompanyName.Focus();
            LB_Copyright.Text = Resources.lang.ZZGSMCBCZQJC;
            LB_Copyright.ForeColor = Color.Red;
            return;
        }

        if (strSiteURL == "" | strUserCode == "" | strPassword == "")
        {
            TB_UserCode.Focus();
            LB_Copyright.Text = Resources.lang.ZZYSGXDBNWKQJC;
            LB_Copyright.ForeColor = Color.Red;
            return;
        }

        if (ShareClass.SqlFilter(strUserCode) | ShareClass.SqlFilter(strPassword) | ShareClass.SqlFilter(strSiteURL))
        {
            LB_Copyright.Text = Resources.lang.ZZZHHYFFZHDLSB;
            LB_Copyright.ForeColor = Color.Red;
            return;
        }

        string strFullSiteURL = GetCustomerFullSiteURL(strSiteURL);
        string strUserInforIsRight = ShareClass.GetPostDataPage(strFullSiteURL + @"/Handler/CheckUserCodeAndPasswordIsRight.ashx?UserCode=" + strUserCode + "&Password=" + strPassword, "");
        if (strUserInforIsRight.ToLower() == "false")
        {
            TB_UserCode.Focus();
            LB_Copyright.Text = Resources.lang.ZZJGYHDMHMMCWHYBZZSY;
            LB_Copyright.ForeColor = Color.Red;
            return;
        }

        try
        {
            strURL = strFullSiteURL + "DefaultAPPMobileDemo.aspx?UserCode=" + strUserCode + "&PassWord=" + strPassword + "&WeiXinCode=" + strWeiXinCode;
            Response.Redirect(strURL, false);
        }
        catch (Exception ex)
        {
            LB_Copyright.Text = ex.Message.ToString();
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

        Response.Redirect("DefaultWeiXinSAAS.aspx");
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

    //取得站点办公网址
    protected string GetCustomerWorkSiteURL(string strSimpleName)
    {
        string strHQL;

        if (strSimpleName == "")
        {
            return "";
        }

        strHQL = string.Format(@"Select WorkSiteURL From T_Customer Where SimpleName = '{0}'", strSimpleName);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }


    //根据站点名，取得站点url
    public static string GetCustomerFullSiteURL(string strSiteURL)
    {
        // 是否为SSL认证站点
        string secure = HttpContext.Current.Request.ServerVariables["HTTPS"];
        string httpProtocol = (secure == "on" ? "https://" : "http://");
        // 服务器名称
        string serverName = HttpContext.Current.Request.ServerVariables["Server_Name"];
        string port = HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
        // 应用服务名称
        string applicationName = HttpContext.Current.Request.ApplicationPath;

        if (strSiteURL.Substring(strSiteURL.Length - 1, 1) != "/")
        {
            return strSiteURL + "/";
        }
        else
        {
            return strSiteURL;
        }
    }


}

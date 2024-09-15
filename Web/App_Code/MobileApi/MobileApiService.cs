using Newtonsoft.Json;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Web.Security;

using TakeTopCore;

[ServiceContract]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
[ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Single)]
public class MobileApiService
{
    [OperationContract]
    [WebGet(UriTemplate = "/Login?userName={userName}&password={password}",
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json)]
    public string Login(string userName, string password)
    {
        string errorMsg;
        bool isSuccess = OnLogin(userName, password, out errorMsg);

        Dictionary<string, object> dic = new Dictionary<string, object>();
        dic.Add("result", isSuccess);
        dic.Add("msg", errorMsg);
        string strJson = JsonConvert.SerializeObject(dic);
        Debug.WriteLine(strJson);
        return strJson;
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

    protected bool OnLogin(string userName, string password, out string errorMsg)
    {
        string strUserCode, strUserName, strPassword;
        string strUserType, strMDIStyle, strMDIPageName, strMDIMobilePageName, strThirdPartPageNme, strThirdPartMobilePageName;
        string strAllowDevice;

        string strHQL;
        IList lst;

        string strServerName = System.Configuration.ConfigurationManager.AppSettings["ServerName"];

        strUserCode = userName.Trim().ToUpper();
        strPassword = password;

        if (strUserCode == "" | strPassword == "")
        {
            errorMsg = "用户名和密码都不能为空，请检查！";
            return false;
        }

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'" + " and " + " projectMember.Password = " + "'" + strPassword + "'" + " and " + " rtrim(ltrim(projectMember.Status)) not in ( '终止','离职')";
        strHQL += " And projectMember.UserCode in (Select systemActiveUser.UserCode From SystemActiveUser as systemActiveUser)";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        if (lst.Count > 0)
        {
            ProjectMember projectMember = (ProjectMember)lst[0];
            strUserName = projectMember.UserName.Trim();
            strUserType = projectMember.UserType.Trim();
            strAllowDevice = projectMember.AllowDevice.Trim();

            strMDIStyle = projectMember.MDIStyle.Trim();
            SystemMDIStyle systemMDIStyle = GetSystemMDIStyle(strMDIStyle);
            if (systemMDIStyle != null)
            {
                strMDIPageName = systemMDIStyle.PageName.Trim();
                strMDIMobilePageName = systemMDIStyle.MobilePageName.Trim();
                strThirdPartPageNme = systemMDIStyle.ThirdPartPageName.Trim();
                strThirdPartMobilePageName = systemMDIStyle.ThirdPartMobilePageName.Trim();
            }
            else
            {
                strMDIPageName = "TakeTopLRExMDI.html";
                strMDIMobilePageName = "TakeTopLRExMDI.html";
                strThirdPartPageNme = "TakeTopCSMDI.html";
                strThirdPartMobilePageName = "TakeTopCSMDI.html";
            }

            //根据用户登录IP判断是否阻止用户登录系统
            string strMsg;
            string strIsAllMember, strIsForbidLogin, strLoginUserCode;

            DataSet ds = ShareClass.GetUserLoginManageDataSet(strUserCode);

            if (ds.Tables[0].Rows.Count > 0)
            {
                strIsAllMember = ds.Tables[0].Rows[0][1].ToString().Trim();
                strIsForbidLogin = ds.Tables[0].Rows[0][2].ToString().Trim();
                strMsg = ds.Tables[0].Rows[0][3].ToString().Trim();
                strLoginUserCode = ds.Tables[0].Rows[0][4].ToString().Trim();
            }
            else
            {
                strIsAllMember = "NO";
                strIsForbidLogin = "NO";
                strMsg = "";
                strLoginUserCode = "";
            }

            if (strIsForbidLogin == "YES")
            {
                if (strMsg != "")
                {
                    errorMsg = strMsg;
                    return false;
                }
            }
            else
            {
                //如果存在升级语句，那么升级数据库
                CoreShareClass.UpgradeDataBase();

                //---判断用户能用来登录的设备类型----------------------
                if (strAllowDevice != "ALL")
                {
                    if (ShareClass.IsMobileDeviceCheckAgent())
                    {
                        if (strAllowDevice == "PC")
                        {
                            errorMsg = "警告，你不能用移动设备登录平台，请检查！";

                            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('警告，你不能用移动设备登录平台，请检查！');</script>");
                            return false;
                        }
                    }
                    else
                    {
                        if (strAllowDevice == "MOBILE")
                        {
                            errorMsg = "警告，你只能用移动设备登录平台，请检查！";
                            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('警告，你只能用移动设备登录平台，请检查！');</script>");
                            return false;
                        }
                    }
                }

                if (strUserType != "OUTER")
                {
                    //判断用户所用登录设备（平板或电脑）
                    if (ShareClass.IsMobileDeviceCheckAgent())
                    {
                        //Session["IsMobileDevice"] = "YES";

                        //Response.Redirect(strMDIMobilePageName);
                        errorMsg = "登录成功";
                        return true;
                    }
                    else
                    {
                        //Session["IsMobileDevice"] = "NO";

                        //Response.Redirect(strMDIPageName);
                        //errorMsg = "非移动设备登录";
                        //return false;

                        errorMsg = "登录成功";
                        return true;
                    }
                }
                else
                {
                    //判断用户所用登录设备（平板或电脑）
                    if (ShareClass.IsMobileDeviceCheckAgent())
                    {
                        //Session["IsMobileDevice"] = "YES";
                        //Response.Redirect(strThirdPartMobilePageName);
                        errorMsg = "登录成功";
                        return true;
                    }
                    else
                    {
                        //Session["IsMobileDevice"] = "NO";
                        //Response.Redirect(strThirdPartPageNme);
                        //errorMsg = "非移动设备登录";
                        //return false;

                        errorMsg = "登录成功";
                        return true;
                    }
                }
            }
        }
        else
        {
            errorMsg = "用户代或码或密码错误，已被终止使用！";
            return false;
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('用户代码或密码错误，或已被终止使用！');</script>");
        }

        errorMsg = "登录失败";
        return false;
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
}
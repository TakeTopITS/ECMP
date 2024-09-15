using System;
using System.Resources;
using System.Data;
using System.Configuration.Internal;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

using Microsoft.Web.Administration;
using Microsoft.Web.Management;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopSoftBuy_TakeTopSoftCloud : System.Web.UI.Page
{
    string strWebSite;
    protected void Page_Load(object sender, EventArgs e)
    {
        strWebSite = Request.QueryString["WebSite"];
        if (strWebSite == null)
        {
            strWebSite = "";
        }

        if (Page.IsPostBack == false)
        {

        }
    }

    protected void DL_ServerType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strServerType = DL_ServerType.SelectedValue.Trim();

        if (strServerType == "购买")
        {
            TB_StorageCapacity.Enabled = true;
        }
        else
        {
            TB_StorageCapacity.Enabled = false;
        }
    }

    protected void BT_Summit_Click(object sender, EventArgs e)
    {
        string strRentUserCompanyName, strUserIP, strSiteID, strUserPosition, strServerType, strRentUserName, strRentUserPhoneNumber, strRentUserEMail, strAddress, strPostCode, strRentProductName, strRentProductVersion, strRentUserNumber, strQuestion;
        string strSQL;
        DateTime dtAnswerTime;


        strUserIP = Request.UserHostAddress.Trim();
        strUserPosition = ShareClass.GetIPinArea(strUserIP);
        strRentUserCompanyName = TB_Company.Text.Trim();
        strRentUserName = TB_ContactPerson.Text.Trim();
        strRentUserPhoneNumber = TB_PhoneNumber.Text.Trim();
        strRentUserEMail = TB_EMail.Text.Trim();
        strAddress = TB_Address.Text.Trim();
        strPostCode = "";
        strRentProductName = DL_Type.SelectedValue.Trim();
        strRentProductVersion = DL_Version.SelectedValue.Trim();
        strRentUserNumber = TB_UserNumber.Text.Trim();
        strQuestion = "购买 版本：" + strRentProductVersion + "，用户数：" + strRentUserNumber + "人";

        string strSiteCreatorName = strRentUserName;

        dtAnswerTime = DateTime.Now.AddHours(24);

        if (strRentUserCompanyName == "" | strRentUserName == "" | strRentUserPhoneNumber == "" | strRentUserEMail == "" | strQuestion == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDHXBNWKJC + "')", true);

            LB_Message.Text = "提交失败，请检查！";
        }
        else
        {
            if (String.Compare(Request.Cookies["CheckCode"].Value, TB_CheckCode.Text, true) != 0)
            {
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYZMCWSRZDYZM + "')", true);
                TB_CheckCode.Text = "";

                LB_Message.Text = "验证码错误，请检查！";
                return;
            }

            //推送信息给客服主管
            try
            {
                string strCSOperatorCode = ShareClass.GetWebSiteCustomerServiceOperatorCode(strWebSite);
                string strNofiInfo = "提示：公司: " + strRentUserCompanyName + " 的员工: " + strRentUserName + "( " + strRentUserPhoneNumber + " )" + " 提交了：" + strRentProductName + "，" + strQuestion + " 的 购买 申请，请及时处理！！！";
                Action action = new Action(delegate ()
                {
                    Msg msg = new Msg();
                    try
                    {
                        msg.SendMSM("Message", strCSOperatorCode, strNofiInfo, "ADMIN");
                    }
                    catch
                    {
                    }

                    try
                    {
                        string strUserEMail = GetUserEMail(strCSOperatorCode);
                        if (strUserEMail != "")
                        {
                            msg.SendMailByEmail(strUserEMail, "软件购买申请通知", strNofiInfo, "ADMIN");
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                });
                System.Threading.Tasks.Task.Factory.StartNew(action);
            }
            catch
            {
            }

            strSQL = " Insert into T_CustomerQuestion(Company,UserIP,UserPosition,ContactPerson,PhoneNumber,EMail,Address,PostCode,Type,Question,SummitTime,AnswerTime,Status,RecorderCode,OperatorCode,OperatorName,OperatorStatus,FromWebSite)";
            strSQL += " Values(" + "'" + strRentUserCompanyName + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strUserPosition + "'" + "," + "'" + strRentUserName + "'" + "," + "'" + strRentUserPhoneNumber + "'" + "," + "'" + strRentUserEMail + "'" + "," + "'" + strAddress + "'" + "," + "'" + strPostCode + "'" + "," + "'" + strRentProductName + "'" + "," + "'" + strQuestion + "'" + "," + "now(),now()+interval '1 day'," + "'新建'" + ",'','','','','" + strWebSite + "')";

            try
            {
                ShareClass.RunSqlCommandForNOOperateLog(strSQL);
                string strQuestionID = GetMyCreatedMaxCustomerQuestionID();
                LB_Message.Text = "提交成功！";

                string strIsAutoBuildSite, strTargetHomeSiteURL;
                strIsAutoBuildSite = getIsAutoBuildSite(strRentProductName, strRentProductVersion);
                strTargetHomeSiteURL = getTargetHomeSiteURL(strRentProductName, strRentProductVersion);

                //存储站点信息
                string strHQL = string.Format(@"INSERT INTO T_RentSiteInfoByCustomer
                               (RentUserPhoneNumber
                               ,RentUserEmail
                               ,RentUserName
                               ,RentUserCompanyName
                               ,RentProductName
                               ,RentProductVersion
                               ,RentUserNumber
                               ,SiteAppSystemName
                               ,SiteAppName
                               ,SiteStatus
                               ,SiteAppURL
                               ,SiteName
                               ,SiteURL
                               ,SiteBindingInfo
                               ,SiteDirectory
                               ,SiteTemplateDirectory
                               ,SiteVirtualDirectoryName
                               ,SiteVirtualDirectoryPhysicalPath
                               ,SiteDBName
                               ,SiteDBRestoreFile
                               ,SiteDBSetupDirectory
                               ,SiteDBLoginUserID
                               ,SiteDBUserLoginPassword
                               ,SiteCreatorName
                               ,SiteCreateTime
                               ,BuyCapacity
                               ,CurrentCapacity
                               ,CustomerQuestionID
                               ,ServerType
                               )
                         VALUES
                               ('{0}'
                               ,'{1}'
                               ,'{2}'
                               ,'{3}'
                               ,'{4}'
                               ,'{5}'
                               ,'{6}'
                               ,'{7}'
                               ,'{8}'
                               ,'{9}'
                               ,'{10}'
                               ,'{11}'
                               ,'{12}'
                               ,'{13}'
                               ,'{14}'
                               ,'{15}'
                               ,'{16}'
                               ,'{17}'
                               ,'{18}' 
                               ,'{19}'
                               ,'{20}'
                               ,'{21}'
                               ,'{22}'
                               ,'{23}'
                               ,now()
                               ,10
                               ,0
                               ,{24}
                               ,'{25}'
                                )", strRentUserPhoneNumber, strRentUserEMail, strRentUserName, strRentUserCompanyName, strRentProductName, strRentProductVersion, strRentUserNumber, "", "", "",
                       "", "", "", "", "", "", "", "",
                      "", "", "", "", "", "", strQuestionID, "购买");

                try
                {
                    ShareClass.RunSqlCommand(strHQL);
                    strSiteID = GetMyCreatedMaxRentSiteInfoByCustomerID();
                }
                catch
                {
                    strSiteID = "0";
                }


                if (strIsAutoBuildSite == "YES" & strTargetHomeSiteURL != "")
                {
                    IFrame_BuildSite.Src = "TakeTopSoftRent_BuildSite.aspx?RentUserCompanyName=" + strRentUserCompanyName + "&RentUserName=" + strRentUserName + "&RentUserPhoneNumber=" + strRentUserPhoneNumber + "&RentUserEMail=" + strRentUserEMail + "&RentProductName=" + strRentProductName + "&RentProductVersion=" + strRentProductVersion + "&RentUserNumber=" + strRentUserNumber + "&SiteID=" + strSiteID + "&ServerType=购买";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('-----提交成功，泰顶拓鼎客服会在5分钟之内联系你，请稍候，谢谢！')", true);
                }
            }
            catch (Exception err)
            {
                LB_Message.Text = err.Message.ToString();
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('-----提交失败，请电话联系泰顶拓鼎客服（021-51085119），谢谢！')", true);
            }
        }
    }

    //取得用户建立的最大的客户问题号
    public static string GetMyCreatedMaxCustomerQuestionID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_CustomerQuestion";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "0";
        }
    }

    //取得站点的最大ID号
    public static string GetMyCreatedMaxRentSiteInfoByCustomerID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_RentSiteInfoByCustomer";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteInfoByCustomer");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "0";
        }
    }

    //取得EMAIL地址
    protected string GetUserEMail(string strUserCode)
    {
        string strHQL;

        strHQL = "Select EMail From T_MailProfile Where UserCode ='" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MailProfile");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    //取得是否自动建站的判断
    protected string getIsAutoBuildSite(string strProductName, string strProductVersionType)
    {
        string strHQL;

        strHQL = "Select IsAutoBuildSite From T_RentSiteBaseData Where RentProductName = '" + strProductName + "' and RentProductVersion = '" + strProductVersionType + "' and IsCanUse = 'YES'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "NO";
        }
    }

    //取得目标站点的URL
    protected string getTargetHomeSiteURL(string strProductName, string strProductVersionType)
    {
        string strHQL;

        strHQL = "Select SiteURL From T_RentSiteBaseData Where RentProductName = '" + strProductName + "' and RentProductVersion = '" + strProductVersionType + "' and IsCanUse = 'YES'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }
}
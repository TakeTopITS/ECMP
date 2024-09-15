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


public partial class TakeTopSoftDownload_TakeTopSoftCloud : System.Web.UI.Page
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

        if (strServerType == "租用")
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
        string strCompany, strUserIP, strUserPosition, strContactPerson, strPhoneNumber, strEMail, strAddress, strPostCode, strType, strQuestion;
        string strSQL;
        DateTime dtAnswerTime;


        strUserIP = Request.UserHostAddress.Trim();
        strUserPosition = ShareClass.GetIPinArea(strUserIP);
        strCompany = TB_Company.Text.Trim();
        strContactPerson = TB_ContactPerson.Text.Trim();
        strPhoneNumber = TB_PhoneNumber.Text.Trim();
        strEMail = TB_EMail.Text.Trim();
        strAddress = TB_Address.Text.Trim();
        strPostCode = "";
        strType = DL_Type.SelectedValue.Trim();
        strQuestion = "源码下载";
        dtAnswerTime = DateTime.Now.AddHours(24);


        if (strCompany == "" | strContactPerson == "" | strPhoneNumber == "" | strQuestion == "")
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
                string strNofiInfo = "提示：公司: " + strCompany + " 的员工: " + strContactPerson + "( " + strPhoneNumber + " )" + " 提交了：" + strQuestion + " 的申请，请及时处理！！！";
                Action action = new Action(delegate ()
                {
                    try
                    {
                        Msg msg = new Msg();
                        msg.SendMSM("Message", strCSOperatorCode, strNofiInfo, "ADMIN");
                    }
                    catch (Exception ex)
                    {

                    }
                });
                System.Threading.Tasks.Task.Factory.StartNew(action);
            }
            catch (Exception ex)
            {
                //LB_Message.Text = ex.Message.ToString();
                //return;
            }

            strSQL = " Insert into T_CustomerQuestion(Company,UserIP,UserPosition,ContactPerson,PhoneNumber,EMail,Address,PostCode,Type,Question,SummitTime,AnswerTime,Status,RecorderCode,OperatorCode,OperatorName,OperatorStatus,FromWebSite)";
            strSQL += " Values(" + "'" + strCompany + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strUserPosition + "'" + "," + "'" + strContactPerson + "'" + "," + "'" + strPhoneNumber + "'" + "," + "'" + strEMail + "'" + "," + "'" + strAddress + "'" + "," + "'" + strPostCode + "'" + "," + "'" + strType + "'" + "," + "'" + strQuestion + "'" + "," + "now(),now()+interval '1 day'," + "'新建'" + ",'','','','','" + strWebSite + "')";

            try
            {
                ShareClass.RunSqlCommandForNOOperateLog(strSQL);

                LB_Message.Text = "提交成功，下载链接在下面，点击可下载！";

                HL_SourceCodeDownload.Visible = true;
                HL_SourceCodeDownload.NavigateUrl = "https://www.taketopits.com/Download/Setup/Develop/TakeTopPCMPDPSetup.zip";

                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('---提交成功')", true);
            }
            catch
            {

                LB_Message.Text = "提交失败，请检查！";

                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('-----提交失败，请检查！')", true);

            }
        }

        //CreateSite("TestSite", "*:80:localhost", @"C:\公司文档\TestSite");
    }


    public void DeleteApplicationPool(String poolName)
    {
        ServerManager iisManager = new ServerManager();
        ApplicationPool appPool = iisManager.ApplicationPools[poolName];
        iisManager.ApplicationPools.Remove(appPool); iisManager.CommitChanges();
    }

    /// <summary> 
    /// Create a new web site. 
    /// </summary> 
    /// <param name="siteName"></param> 
    /// <param name="bindingInfo">"*:&lt;port&gt;:&lt;hostname&gt;" <example>"*:80:myhost.com"</example></param> 
    /// <param name="physicalPath"></param> 
    public void CreateSite(string siteName, string bindingInfo, string physicalPath)
    {
        createSite(siteName, "http", bindingInfo, physicalPath, true, siteName + "Pool", ProcessModelIdentityType.NetworkService, null, null, ManagedPipelineMode.Integrated, null);
    }

    private void createSite(string siteName, string protocol, string bindingInformation, string physicalPath,
            bool createAppPool, string appPoolName, ProcessModelIdentityType identityType,
            string appPoolUserName, string appPoolPassword, ManagedPipelineMode appPoolPipelineMode, string managedRuntimeVersion)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site;
            try
            {
                site = mgr.Sites.Add(siteName, protocol, bindingInformation, physicalPath);
            }
            catch (Exception err)
            {
                LB_Message.Text = err.Message.ToString();
                return;
            }


            if (createAppPool)
            {
                ApplicationPool pool = mgr.ApplicationPools.Add(appPoolName);
                if (pool.ProcessModel.IdentityType != identityType)
                {
                    pool.ProcessModel.IdentityType = identityType;
                }
                if (!String.IsNullOrEmpty(appPoolUserName))
                {
                    pool.ProcessModel.UserName = appPoolUserName;
                    pool.ProcessModel.Password = appPoolPassword;
                }
                if (appPoolPipelineMode != pool.ManagedPipelineMode)
                {
                    pool.ManagedPipelineMode = appPoolPipelineMode;
                }

                site.Applications["/"].ApplicationPoolName = pool.Name;
            }

            mgr.CommitChanges();
        }
    }

    /// <summary> 
    /// Delete an existent web site. 
    /// </summary> 
    /// <param name="siteName">Site name.</param> 
    public void DeleteSite(string siteName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site != null)
            {
                mgr.Sites.Remove(site);
                mgr.CommitChanges();
            }
        }
    }

    public void CreateVDir(string siteName, string vDirName, string physicalPath)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site == null)
            {
                throw new ApplicationException(String.Format("Web site {0} does not exist", siteName));
            }
            site.Applications.Add("/" + vDirName, physicalPath);
            mgr.CommitChanges();
        }
    }

    public void DeleteVDir(string siteName, string vDirName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site != null)
            {
                Microsoft.Web.Administration.Application app = site.Applications["/" + vDirName];
                if (app != null)
                {
                    site.Applications.Remove(app);
                    mgr.CommitChanges();
                }
            }
        }
    }

    /// <summary> 
    /// Delete an existent web site app pool. 
    /// </summary> 
    /// <param name="appPoolName">App pool name for deletion.</param> 
    public void DeletePool(string appPoolName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            ApplicationPool pool = mgr.ApplicationPools[appPoolName];
            if (pool != null)
            {
                mgr.ApplicationPools.Remove(pool);
                mgr.CommitChanges();
            }
        }
    }

    public void AddDefaultDocument(string siteName, string defaultDocName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Configuration cfg = mgr.GetWebConfiguration(siteName);
            ConfigurationSection defaultDocumentSection = cfg.GetSection("system.webServer/defaultDocument");
            ConfigurationElement filesElement = defaultDocumentSection.GetChildElement("files");
            ConfigurationElementCollection filesCollection = filesElement.GetCollection();

            foreach (ConfigurationElement elt in filesCollection)
            {
                if (elt.Attributes["value"].Value.ToString() == defaultDocName)
                {
                    return;
                }
            }

            try
            {
                ConfigurationElement docElement = filesCollection.CreateElement();
                docElement.SetAttributeValue("value", defaultDocName);
                filesCollection.Add(docElement);
            }
            catch (Exception) { }   //this will fail if existing 

            mgr.CommitChanges();
        }
    }

    public bool VerifyVirtualPathIsExist(string siteName, string path)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site != null)
            {
                foreach (Microsoft.Web.Administration.Application app in site.Applications)
                {
                    if (app.Path.ToUpper().Equals(path.ToUpper()))
                    {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    public bool VerifyWebSiteIsExist(string siteName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            for (int i = 0; i < mgr.Sites.Count; i++)
            {
                if (mgr.Sites[i].Name.ToUpper().Equals(siteName.ToUpper()))
                {
                    return true;
                }
            }
        }

        return false;
    }

    public bool VerifyWebSiteBindingsIsExist(string bindingInfo)
    {
        string temp = string.Empty;
        using (ServerManager mgr = new ServerManager())
        {
            for (int i = 0; i < mgr.Sites.Count; i++)
            {
                foreach (Microsoft.Web.Administration.Binding b in mgr.Sites[i].Bindings)
                {
                    temp = b.BindingInformation;
                    if (temp.IndexOf('*') < 0)
                    {
                        temp = "*" + temp;
                    }
                    if (temp.Equals(bindingInfo))
                    {
                        return true;
                    }
                }
            }
        }

        return false;
    }
}
using LANZ;

using LumiSoft.Net.POP3.Client;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using RTXSAPILib;

using RTXServerApi;

using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml;// 增加这几个命名空间，而且要在引用中增加System.Web类

using TakeTopSecurity;

/// <summary>
/// Msg 的摘要说明
/// </summary>
public class Msg
{
    public Msg()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    //----发信息,即时发送--------------------------
    public bool SendMSM(string strSubject, string strReceivedUserCode, string strMsg, string strSendUserCode)
    {
        try
        {
            new System.Threading.Thread(delegate ()
            {
                string strSendUserName = "";
                try
                {
                    strSendUserName = ShareClass.GetUserName(strSendUserCode);
                }
                catch
                {
                    strSendUserName = "";
                }

                try
                {
                    try
                    {
                        //发送消息到微信用户，用于企业号
                        string strUserID = TakeTopCore.WXHelper.GetUserWeXinUserIDByUserCode(strReceivedUserCode);
                        if (strUserID != "")
                        {
                            SendWeChatQYMsg(strUserID, strMsg + ",---" + Resources.lang.ZZZXinXiLaiZhi + strSendUserCode + " " + strSendUserName);
                        }
                    }
                    catch
                    {
                    }

                    try
                    {
                        //发送消息到微信用户，用于公众号
                        string strOpenID = TakeTopCore.WXHelper.GetUserWeXinOpenIDByUserCode(strReceivedUserCode);
                        if (strOpenID != "")
                        {
                            SendWeChatGZMsg(strOpenID, strMsg + ",---" + Resources.lang.ZZZXinXiLaiZhi + strSendUserCode + " " + strSendUserName);
                        }
                    }
                    catch
                    {
                    }

                    try
                    {
                        //发送短信到手机上
                        SendMsgToPhoneBySP(strReceivedUserCode, strMsg, strSendUserCode);
                    }
                    catch
                    {
                    }

                    ////以协作方式发消息
                    //try
                    //{
                    //    SendCollaboration(strSendUserCode, strReceivedUserCode, strSubject, strMsg);
                    //}
                    //catch
                    //{
                    //}

                    //try
                    //{
                    //    //发送消息到IOS APP
                    //    NotificationHelper.ApplePush(strReceivedUserCode, strMsg, 1);

                    //}
                    //catch
                    //{
                    //}

                    //try
                    //{
                    //    //极光推送到ANDROID APP
                    //    PushMsgByJPUSH.SendSMSByJPUSH(strReceivedUserCode, strMsg);
                    //}
                    //catch
                    //{
                    //}

                    //try
                    //{
                    //    //发送RTX消息
                    //    SendRTXMsg(strReceivedUserCode, strMsg);
                    //}
                    //catch
                    //{
                    //}
                }
                catch
                {
                }
            }).Start();
        }
        catch
        {
        }

        return true;
    }

    //依功作关键词推送消息给额外人员
    public void SendMsgToOtherMemberForWorkflow(string strUserCode, string strWFTemName, string strWFTemStepID, string strWLID, string strWFName, string strStepID, string strStepName, string strNoticeKeyWord, string strOperation)
    {
        try
        {
            string strHQL;
            string strOtherUserCode, strMustNotice, strMsgTitle, strMsg;

            strHQL = "Select * From T_WorkFlowTemplateStepBusinessMember Where TemName = " + "'" + strWFTemName + "'" + " and StepID = " + strWFTemStepID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateStepBusinessMember");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                strOtherUserCode = ds.Tables[0].Rows[i]["UserCode"].ToString().Trim();
                strMustNotice = ds.Tables[0].Rows[i][strNoticeKeyWord].ToString().Trim();

                strMsgTitle = strWLID + strWFName + " " + strOperation;
                strMsg = strUserCode + ShareClass.GetUserName(strUserCode) + " " + Resources.lang.YiJing + " " + strOperation + Resources.lang.GongZuoLiuShenQing + " : " + strWLID + strWFName + "," + Resources.lang.BuZhou + ": " + strStepID + strStepName;

                if (strMustNotice == "YES")
                {
                    SendMSM(strMsgTitle, strOtherUserCode, strMsg, strUserCode);
                }
            }
        }
        catch
        {
        }
    }

    //以协作方式推送消息
    public static void SendCollaboration(string strUserCode, string strChatterCode, string strCollaborationName, string strContent)
    {
        string strCoID;

        strCoID = AddCollaborationForAutoSend(strUserCode, strChatterCode, strCollaborationName, strContent);

        CollaborationLogBLL collaborationLogBLL = new CollaborationLogBLL();
        CollaborationLog collaborationLog = new CollaborationLog();

        collaborationLog.CoID = int.Parse(strCoID);
        collaborationLog.LogContent = strContent;
        collaborationLog.UserCode = strUserCode;
        collaborationLog.UserName = ShareClass.GetUserName(strUserCode);
        collaborationLog.CreateTime = DateTime.Now;

        try
        {
            collaborationLogBLL.AddCollaborationLog(collaborationLog);
        }
        catch
        {
        }
    }

    //建立协作，以协作方式推送消息
    public static string AddCollaborationForAutoSend(string strUserCode, string strChatterCode, string strCollaborationName, string strContent)
    {
        string strHQL;
        string strCOID;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        Collaboration collaboration = new Collaboration();

        collaboration.CollaborationName = strCollaborationName;
        collaboration.Comment = strContent;
        collaboration.CreateTime = DateTime.Now;
        collaboration.CreatorCode = strUserCode;
        collaboration.CreatorName = ShareClass.GetUserName(strUserCode);
        collaboration.RelatedType = "OTHER";
        collaboration.RelatedID = 0;
        collaboration.Status = "处理中";

        try
        {
            collaborationBLL.AddCollaboration(collaboration);

            strCOID = ShareClass.GetMyCreatedMaxColloaborationID(strUserCode);

            strHQL = "insert T_CollaborationMember(CoID,UserCode,UserName,CreateTime,LastLoginTime) ";
            strHQL += " Values(" + strCOID + "," + "'" + strChatterCode + "'" + "," + "'" + ShareClass.GetUserName(strChatterCode) + "'" + ",now(),now())";
            ShareClass.RunSqlCommand(strHQL);

            return strCOID;
        }
        catch
        {
            return "0";
        }
    }

    //---发送待发送的信息，每次20条，基于ICP----------------------------------------
    public void SendUNSentSMSBySP()
    {
        string strHQL1, strHQL2;
        string strID = "0", strMobilePhone, strUserCode, strUserRTXCode, strMsg, strSPInterface, strSPName;
        int i;

        DataSet ds;

        //发送消息到APP
        strHQL1 = "Select ID,UserCode,Msg,Mobile,UserRTXCode From sms_send Where ltrim(rtrim(UserCode)) <> '' and State = 0 ";
        strHQL1 += " order By ID DESC limit 20";
        ds = ShareClass.GetDataSetFromSql(strHQL1, "T_Sms_Send");
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strID = ds.Tables[0].Rows[i][0].ToString();

            strHQL2 = "Update Sms_Send Set State = 1,SendYorn = 1,Sendtime = now() Where ID = " + strID;
            ShareClass.RunSqlCommandForNOOperateLog(strHQL2);

            try
            {
                strUserCode = ds.Tables[0].Rows[i][1].ToString().Trim();
            }
            catch
            {
                strUserCode = "";
            }
            strMsg = ds.Tables[0].Rows[i][2].ToString().Trim();

            strMsg = strMsg.Replace("通知：你好，你有审批工作，内容：自审 ，请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZTZNHNYSPGZNRZSQJSDLGLPTJXCLZXXLZXTGLY);
            strMsg = strMsg.Replace("通知：你好，你有审批工作，内容：", Resources.lang.ZZTZNHNYSPGZNR);
            strMsg = strMsg.Replace("请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZQJSDLGLPTJXCLZXXLZXTGLY);

            strMobilePhone = ds.Tables[0].Rows[i][3].ToString().Trim();
            strUserRTXCode = ds.Tables[0].Rows[i][4].ToString().Trim();

            //向APP发送消息
            if (strUserCode != "")
            {
                try
                {
                    new System.Threading.Thread(delegate ()
                    {
                        try
                        {
                            try
                            {
                                //发送消息到微信用户，用于企业号
                                string strUserID = TakeTopCore.WXHelper.GetUserWeXinUserIDByUserCode(strUserCode);
                                if (strUserID != "")
                                {
                                    SendWeChatQYMsg(strUserID, strMsg);
                                }
                            }
                            catch
                            {
                            }

                            try
                            {
                                //发送消息到微信用户，用于公众号
                                string strOpenID = TakeTopCore.WXHelper.GetUserWeXinOpenIDByUserCode(strUserCode);
                                if (strOpenID != "")
                                {
                                    SendWeChatGZMsg(strOpenID, strMsg);
                                }
                            }
                            catch
                            {
                            }

                            //向手机发送短信
                            strSPInterface = GetSPInterface().SPInterface.Trim();
                            strSPName = GetSPInterface().SPName;
                            if (strSPInterface != "")
                            {
                                try
                                {
                                    SendSMSBySP(strSPName, strSPInterface, strMobilePhone, strMsg);
                                }
                                catch
                                {
                                }
                            }

                            ////以协作方式发消息
                            //try
                            //{
                            //    SendCollaboration("ADMIN", strUserCode, "Message", strMsg);
                            //}
                            //catch
                            //{
                            //}

                            //try
                            //{
                            //    //极光推送到ANDROID APP
                            //    PushMsgByJPUSH.SendSMSByJPUSH(strUserCode, strMsg);
                            //}
                            //catch
                            //{
                            //}

                            //try
                            //{
                            //    //推送消息给IOS APP
                            //    NotificationHelper.ApplePush(strUserCode, strMsg, 1);
                            //}
                            //catch
                            //{
                            //}

                            ////向RTX推送消息
                            //if (GetRTXServerCount() > 0)
                            //{
                            //    try
                            //    {
                            //        strMsg = ds.Tables[0].Rows[i][2].ToString().Trim();
                            //        strUserRTXCode = ds.Tables[0].Rows[i][4].ToString().Trim();
                            //        //发送消息给RTX
                            //        if (SendRTXMsgByUserRTXCode(strUserRTXCode, strMsg))
                            //        {
                            //            strHQL2 = "Update Sms_Send Set RTXState = 1,Sendtime = now() Where RTXState = 0 and ID = " + strID;
                            //            ShareClass.RunSqlCommandForNOOperateLog(strHQL2);
                            //        }
                            //    }
                            //    catch
                            //    {
                            //    }
                            //}
                        }
                        catch
                        {
                        }
                    }).Start();
                }
                catch
                {
                }
            }
        }
    }

    //-------向全部系统用户推送消息----------------------------------------------------------------
    public void StartNotificationToSystemActiveUser()
    {
        string strHQL;
        string strActiveUserCode, strSuperDepartString;
        string strLangCode;
        int i = 0, k = 0, count = 0, total = 0;

        Msg msg = new Msg();

        strHQL = "from SystemActiveUser as systemActiveUser where 1=1";
        SystemActiveUserBLL systemActiveUserBLL = new SystemActiveUserBLL();
        IList lst_User = systemActiveUserBLL.GetAllSystemActiveUsers(strHQL);
        if (lst_User.Count == 0 & lst_User != null)
        {
            return;
        }

        if (HttpContext.Current.Session["SystemVersionType"] == null)
        {
            //检查注册码是否合法
            string strServerName = System.Configuration.ConfigurationManager.AppSettings["ServerName"];
            try
            {
                TakeTopLicense license = new TakeTopLicense();
                if (!license.CheckWEBLicense(strServerName))
                {
                    HttpContext.Current.Response.Redirect("TTDisplayErrors.aspx");
                    return;
                }

                HttpContext.Current.Session["SystemVersionType"] = license.GetVerType(strServerName);
                HttpContext.Current.Session["ForbitModule"] = license.GetForbitModuleString(strServerName);
            }
            catch
            {

                HttpContext.Current.Session["SystemVersionType"] = "GROUP";
                HttpContext.Current.Session["ForbitModule"] = "NONE";
            }
            if (System.Configuration.ConfigurationManager.AppSettings["ProductType"].IndexOf("SAAS") > -1)
            {
                HttpContext.Current.Session["SystemVersionType"] = "SAAS";
            }
        }
        else
        {
            HttpContext.Current.Session["SystemVersionType"] = "GROUP";
        }

        string strSystemVersionType = HttpContext.Current.Session["SystemVersionType"].ToString();

        SystemActiveUser activeUser = new SystemActiveUser();
        FunInforDialBox funInforDialBox = new FunInforDialBox();

        for (i = 0; i < lst_User.Count; i++)
        {
            total = 0;

            activeUser = (SystemActiveUser)lst_User[i];

            strActiveUserCode = activeUser.UserCode.Trim();

            if (ShareClass.CheckUserIsExist(strActiveUserCode))
            {
                //strSuperDepartString = ShareClass.InitialDepartmentStringByAuthoritySuperUser(strActiveUserCode, strSystemVersionType);
                strLangCode = ShareClass.GetUserLangCode(strActiveUserCode);

                StringBuilder newInforNameList = new StringBuilder();//提示预警名称
                FunInforDialBoxBLL funInforDialBoxBLL = new FunInforDialBoxBLL();
                string strHQL_Fun = "From FunInforDialBox as funInforDialBoxBySystem Where funInforDialBoxBySystem.Status = '启用'";
                //strHQL_Fun += " and len(Ltrim(Rtrim(funInforDialBoxBySystem.LinkAddress))) > 0 ";
                strHQL_Fun += " and funInforDialBoxBySystem.LangCode = " + "'" + strLangCode + "'";
                strHQL_Fun += " Order By funInforDialBoxBySystem.ID Desc ";
                IList lst_Fun = funInforDialBoxBLL.GetAllFunInforDialBoxs(strHQL_Fun);
                if (lst_Fun.Count > 0 & lst_Fun != null)
                {
                    for (k = 0; k < lst_Fun.Count; k++)
                    {
                        funInforDialBox = (FunInforDialBox)lst_Fun[k];

                        try
                        {
                            strHQL = funInforDialBox.SQLCode.Trim();
                            strHQL = strHQL.Replace("[TAKETOPUSERCODE]", strActiveUserCode);
                            //strHQL = strHQL.Replace("[TAKETOPSUPERDEPARTSTRING]", strSuperDepartString);
                            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "FunInforDialBoxList");

                            count = 0;
                            count = ds.Tables[0].Rows.Count;

                            if (count > 0)
                            {
                                total += count;
                                if (newInforNameList.Length > 0)
                                {
                                    newInforNameList.AppendFormat("\n{0}({1})", funInforDialBox.InforName, count);
                                }
                                else
                                {
                                    newInforNameList.AppendFormat("{0}({1})", funInforDialBox.InforName, count);
                                }
                            }
                        }
                        catch
                        {
                        }
                    }

                    string strNofiInfo = Resources.lang.ZZDNCLDGZ + newInforNameList.ToString() + "，" + Resources.lang.ZZFZXTGLY;

                    if (total > 0)
                    {
                        try
                        {
                            //发送消息到微信用户，用于企业号
                            string strUserID = TakeTopCore.WXHelper.GetUserWeXinUserIDByUserCode(strActiveUserCode);
                            if (strUserID != "")
                            {
                                SendWeChatQYMsg(strUserID, strNofiInfo);
                            }
                        }
                        catch
                        {
                        }

                        try
                        {
                            //发送消息到微信用户，用于公众号
                            string strOpenID = TakeTopCore.WXHelper.GetUserWeXinOpenIDByUserCode(strActiveUserCode);
                            if (strOpenID != "")
                            {
                                SendWeChatGZMsg(strOpenID, strNofiInfo);
                            }
                        }
                        catch
                        {
                        }

                        try
                        {
                            //发送短信
                            msg.SendMsgToPhoneBySP(strActiveUserCode, strNofiInfo, "ADMIN");
                        }
                        catch
                        {
                        }

                        ////以协作方式发消息
                        //try
                        //{
                        //    SendCollaboration("ADMIN", strUserCode, "Message", strNofiInfo);
                        //}
                        //catch
                        //{
                        //}

                        //try
                        //{
                        //    //极光推送到ANDROID APP
                        //    PushMsgByJPUSH.SendSMSByJPUSH(strUserCode, strNofiInfo);
                        //}
                        //catch (Exception ex)
                        //{
                        //}

                        //try
                        //{
                        //    //向IOS APP推送消息
                        //    NotificationHelper.ApplePush(strUserCode, strNofiInfo, total);
                        //}
                        //catch (Exception ex)
                        //{
                        //}

                        //try
                        //{
                        //    //信息推送邮件
                        //    msg.SendMail(strUserCode, Resources.lang.ZZDNCLDGZ, strNofiInfo, "ADMIN");
                        //}
                        //catch (Exception ex)
                        //{
                        //}
                    }
                }
            }
        }
    }


    //微信公众号，发送消息给相应微信用户
    public void SendWeChatGZMsg(string OPENID, string text)
    {
        //string accessToken = ShareClass.GetUserWeChatAccessToken();

        string accessToken = TakeTopCore.WXHelper.GetAccessToken();

        if (accessToken != "")
        {
            var data = "{ \"touser\":\"" + OPENID + "\", \"msgtype\":\"text\", \"text\": { \"content\":\" " + text + "\" }}";
            var json = HttpHelper.Post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + accessToken, data);
            HttpContext.Current.Response.Write(json);
            HttpContext.Current.Response.End();
        }
    }

    ///微信企业号，发送消息给相应微信用户
    public string SendWeChatQYMsg(string strUserOID, string strMessage)
    {
        string strAgentID = "1";

        string strHQL;
        strHQL = "Select AgentID From T_WeiXinQYStand";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WeiXinQYStand");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strAgentID = ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            strAgentID = "1";
        }

        string responeJsonStr = "{";
        responeJsonStr += "\"touser\": \"" + strUserOID + "\",";
        responeJsonStr += "\"msgtype\": \"text\",";
        responeJsonStr += "\"agentid\": \"" + strAgentID + "\",";
        responeJsonStr += "\"text\": {";
        responeJsonStr += "  \"content\": \"" + strMessage + "\"";
        responeJsonStr += "},";
        responeJsonStr += "\"safe\":\"0\"";
        responeJsonStr += "}";

        string accessToken = TakeTopCore.WXHelper.GetAccessToken();
        string postUrl = string.Format("https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={0}", accessToken);

        return PostWebRequest(postUrl, responeJsonStr, Encoding.UTF8);
    }

    /// <summary>
    /// 微信企业号 Post数据接口
    /// </summary>
    /// <param name="postUrl">接口地址</param>
    /// <param name="paramData">提交json数据</param>
    /// <param name="dataEncode">编码方式</param>
    /// <returns></returns>
    public string PostWebRequest(string postUrl, string paramData, Encoding dataEncode)
    {
        string ret = string.Empty;
        try
        {
            byte[] byteArray = dataEncode.GetBytes(paramData); //转化
            HttpWebRequest webReq = (HttpWebRequest)WebRequest.Create(new Uri(postUrl));
            webReq.Method = "POST";
            webReq.ContentType = "application/x-www-form-urlencoded";

            webReq.ContentLength = byteArray.Length;
            Stream newStream = webReq.GetRequestStream();
            newStream.Write(byteArray, 0, byteArray.Length);//写入参数
            newStream.Close();
            HttpWebResponse response = (HttpWebResponse)webReq.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.Default);
            ret = sr.ReadToEnd();
            sr.Close();
            response.Close();
            newStream.Close();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        return ret;
    }

    //--------BEGIN基于ICP以GET方式发送得结果，不同的ICP有不同的发送方法，改方法内内代码就可（[TAKETOPNUMBER]，[TAKETOPMESSAGE]代表接收的手机号码和信息内容）-----------------------------------------------------
    //发送消息到手机上，基于ICP
    public bool SendMsgToPhoneBySP(string strReceivedUserCode, string strMsg, string strSendUserCode)
    {
        string strHQL;
        IList lst;
        string strMobilePhone, strUserRTXCode, strSPInterface, strSPName;

        //发送短信

        try
        {
            strSPName = GetSPInterface().SPName;
            strSPInterface = GetSPInterface().SPInterface;
        }
        catch
        {
            return false;
        }

        if (strSPInterface != "" & strSPInterface != null)
        {
            strMsg = strMsg + "---" + Resources.lang.ZZZXinXiLaiZhi + "：" + strSendUserCode + " " + ShareClass.GetUserName(strSendUserCode);

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            strHQL = "from ProjectMember as projectMemberBySystem where projectMemberBySystem.UserCode = " + "'" + strReceivedUserCode + "'";
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            ProjectMember projectMember = (ProjectMember)lst[0];

            strMobilePhone = projectMember.MobilePhone.Trim();
            strUserRTXCode = projectMember.UserRTXCode.Trim();

            if (strMobilePhone == null)
            {
                return false;
            }
            if (strMobilePhone.Trim() == "")
            {
                return false;
            }

            try
            {
                if (SendSMSBySP(strSPName, strSPInterface, strMobilePhone, strMsg))
                {
                    strHQL = "Insert Into Sms_Send(UserCode,UserRTXCode,Mobile,Msg,State,SendYorn,SendTime) Values(" + "'" + strReceivedUserCode + "'" + "," + "'" + strUserRTXCode + "'" + "," + "'" + strMobilePhone + "'" + "," + "'" + strMsg + "'" + ",1,1,now())";
                    ShareClass.RunSqlCommandForNOOperateLog(strHQL);

                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 根据手机号码发送短信 By Liu Jianping 2013-11-21
    /// </summary>
    /// <param name="strReceivedUserCode"></param>
    /// <param name="strMsg"></param>
    /// <param name="strSendUserCode"></param>
    /// <returns></returns>
    public bool SendPhoneMSMBySP(string strMobilePhone, string strMsg, string strSendUserCode)
    {
        string strSPInterface, strSPName;

        if (strMobilePhone == null)
        {
            return false;
        }
        if (strMobilePhone.Trim() == "")
        {
            return false;
        }

        try
        {
            strSPName = GetSPInterface().SPName;
            strSPInterface = GetSPInterface().SPInterface;
        }
        catch
        {
            return false;
        }

        if (strSPInterface != "" & strSPInterface != null)
        {
            strMsg = strMsg + "---" + Resources.lang.ZZZXinXiLaiZhi + "：" + strSendUserCode + " " + ShareClass.GetUserName(strSendUserCode);

            try
            {
                if (SendSMSBySP(strSPName, strSPInterface, strMobilePhone, strMsg))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }//end

    //基于ICP接口发送短信
    private bool SendSMSBySP(string strSPName, string strSPInterfaceURL, string strMobilePhone, string strMessage)
    {
        HttpWebRequest hwRequest;
        HttpWebResponse hwResponse;

        if (strMobilePhone == null)
        {
            return false;
        }
        if (strMobilePhone.Trim() == "")
        {
            return false;
        }

        Random rd = new Random();
        int AuthCodeNumber = rd.Next(100000, 1000000);
        string strAuthCode = AuthCodeNumber.ToString();

        try
        {
            if (strSPName == "阿里云")
            {
                strMessage = System.Web.HttpUtility.UrlEncode(strMessage, Encoding.UTF8);
                strSPInterfaceURL += "&PhoneNumber=" + strMobilePhone + "&Message=" + strMessage;

                HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(strSPInterfaceURL);
                req.Method = "GET";
                req.ContentType = "application/x-www-form-urlencoded";

                try
                {
                    using (WebResponse wr = req.GetResponse())
                    {
                        //在这里对接收到的页面内容进行处理
                    }
                }
                catch (System.Exception err)
                {
                    // WriteErrLog(err.ToString());
                    return false;
                }
            }
        }
        catch
        {
        }

        if (strSPName == "兰化短信")
        {
            strMessage = System.Web.HttpUtility.UrlEncode(strMessage, Encoding.UTF8);

            strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPNUMBER]", strMobilePhone);
            strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPMESSAGE]", strMessage);

            string strResult = string.Empty;
            try
            {
                hwRequest = (System.Net.HttpWebRequest)WebRequest.Create(strSPInterfaceURL);

                hwRequest.Timeout = 6000;
                hwRequest.Method = "POST";
                hwRequest.ContentType = "application/x-www-form-urlencoded";
            }
            catch (System.Exception err)
            {
                // WriteErrLog(err.ToString());
                return false;
            }

            //get response
            try
            {
                hwResponse = (HttpWebResponse)hwRequest.GetResponse();
                StreamReader srReader = new StreamReader(hwResponse.GetResponseStream(), Encoding.ASCII);
                strResult = srReader.ReadToEnd();
                srReader.Close();
                hwResponse.Close();

                ////LiuJianping 2013-09-17
                //if (strResult.Trim() != "100")
                //{
                //    return false;
                //}
                ////end
            }
            catch (System.Exception err)
            {
                //WriteErrLog(err.ToString());
                return false;
            }
        }


        try
        {
            if (strSPName == "创明短信")
            {
                strMessage = System.Web.HttpUtility.UrlEncode(strMessage, Encoding.UTF8);

                strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPNUMBER]", strMobilePhone);
                strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPMESSAGE]", strMessage);

                string strResult = string.Empty;
                try
                {
                    hwRequest = (System.Net.HttpWebRequest)WebRequest.Create(strSPInterfaceURL);
                    //     hwRequest.Timeout = 5000;
                    hwRequest.Timeout = 5000;
                    hwRequest.Method = "GET";
                    hwRequest.ContentType = "application/x-www-form-urlencoded";
                }
                catch (System.Exception err)
                {
                    // WriteErrLog(err.ToString());
                    return false;
                }

                //get response
                try
                {
                    hwResponse = (HttpWebResponse)hwRequest.GetResponse();
                    StreamReader srReader = new StreamReader(hwResponse.GetResponseStream(), Encoding.ASCII);
                    strResult = srReader.ReadToEnd();
                    srReader.Close();
                    hwResponse.Close();

                    //LiuJianping 2013-09-17
                    if (strResult.Trim() != "100")
                    {
                        return false;
                    }
                    //end
                }
                catch (System.Exception err)
                {
                    //WriteErrLog(err.ToString());
                    return false;
                }
            }

            if (strSPName == "浪驰短信")
            {
                string url, SMSparameters, targeturl, res;
                string[] Para;

                strMessage += "//回复TD退订【河东电子】";
                strMessage = System.Web.HttpUtility.UrlEncode(strMessage, System.Text.Encoding.GetEncoding("gb2312"));

                //url = "http://www.lanz.net.cn/LANZGateway/DirectSendSMSs.asp";
                //string SMSparameters = "UserID=" + Userid + "&Account=" + Account + "&Password=" + PassWord + "&SMSType=1" + "&Content=" + content + "&Phones=" + TextBox1.Text + "&SendDate=&Sendtime=";

                Para = strSPInterfaceURL.Split(new string[] { "?" }, StringSplitOptions.RemoveEmptyEntries);
                url = Para[0];
                SMSparameters = Para[1];
                //SMSparameters += "&SendDate=" + DateTime.Now.ToShortDateString() + "&Sendtime=" + DateTime.Now.ToLocalTime();

                SMSparameters = SMSparameters.Replace("[TAKETOPNUMBER]", strMobilePhone);
                SMSparameters = SMSparameters.Replace("[TAKETOPMESSAGE]", strMessage);

                targeturl = url.Trim().ToString();
                HttpWebRequest hr = (HttpWebRequest)WebRequest.Create(targeturl);
                //hr.CookieContainer = Form1.cookieContainerSMS;
                res = httpPost.HttpSMSPost(hr, url, SMSparameters);

                XmlDocument xml = new XmlDocument();
                xml.LoadXml(res);

                string errorNum = xml.SelectSingleNode("/LANZ_ROOT/ErrorNum").InnerText;  //获取是否登陆成功

                if (errorNum == "0")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            if (strSPName == "函谷短信")
            {
                strMessage += "//回复TD退订【中油二建】";

                strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPNUMBER]", strMobilePhone);
                strSPInterfaceURL = strSPInterfaceURL.Replace("[TAKETOPMESSAGE]", strMessage);

                HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(strSPInterfaceURL);
                req.Method = "GET";
                req.ContentType = "application/x-www-form-urlencoded";

                try
                {
                    using (WebResponse wr = req.GetResponse())
                    {
                        //在这里对接收到的页面内容进行处理
                    }
                }
                catch
                {
                }
            }

            return true;
        }
        catch
        {
            return false;
        }
    }

    //---END 手机短信推送方式------------------------------------------------------------------------------------------------------------

    //--RTX操作方法BEGIN---------------------------------------------------------------------------------------------------------
    //发送消息给RTX（依用户代码）
    public bool SendRTXMsg(string strReceivedUserCode, string strMsg)
    {
        string strHQL;
        IList lst;

        string strServerIP;
        string strServerPort;
        string strWebSite;
        string strUserRTXCode;

        RTXSAPILib.RTXSAPIRootObj RootObj;  //声明一个根对象

        if (GetRTXServerCount() > 0)
        {
            strHQL = "From ProjectMember as projectMemberBySystem Where projectMemberBySystem.UserCode = " + "'" + strReceivedUserCode + "'";
            ProjectMemberBLL projectMemberBLl = new ProjectMemberBLL();
            lst = projectMemberBLl.GetAllProjectMembers(strHQL);
            ProjectMember projectMember = (ProjectMember)lst[0];

            strUserRTXCode = projectMember.UserRTXCode.Trim();

            if (strUserRTXCode == "")
            {
                return false;
            }

            strHQL = "From RTXConfig as rtxConfigBySystem";
            RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
            lst = rtxConfigBLL.GetAllRTXConfigs(strHQL);

            RTXConfig rtxConfig = new RTXConfig();

            for (int i = 0; i < lst.Count; i++)
            {
                rtxConfig = (RTXConfig)lst[i];

                strServerIP = rtxConfig.ServerIP.Trim();
                strServerPort = rtxConfig.ServerPort.ToString();
                strWebSite = rtxConfig.WebSite.Trim();

                if (strServerIP == "" | strServerPort == "")
                {
                    return false;
                }

                RootObj = new RTXSAPIRootObj();     //创建根对象
                RootObj.ServerIP = strServerIP; //设置服务器IP
                RootObj.ServerPort = Convert.ToInt16(strServerPort); //设置服务器端口

                strMsg = strMsg + " " + strWebSite;

                //发送信息
                try
                {
                    RootObj.SendNotify(strUserRTXCode, "系统消息", 60000000, strMsg); //获取版本信息
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        return true;
    }

    //发送消息给RTX(依用户RTX代码）
    public bool SendRTXMsgByUserRTXCode(string strUserRTXCode, string strMsg)
    {
        string strHQL;
        IList lst;

        string strServerIP;
        string strServerPort;
        string strWebSite;

        RTXSAPILib.RTXSAPIRootObj RootObj;  //声明一个根对象

        if (strUserRTXCode == "")
        {
            return false;
        }

        strHQL = "From RTXConfig as rtxConfigBySystem";
        RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
        lst = rtxConfigBLL.GetAllRTXConfigs(strHQL);

        RTXConfig rtxConfig = new RTXConfig();

        for (int i = 0; i < lst.Count; i++)
        {
            rtxConfig = (RTXConfig)lst[i];

            strServerIP = rtxConfig.ServerIP.Trim();
            strServerPort = rtxConfig.ServerPort.ToString();
            strWebSite = rtxConfig.WebSite.Trim();

            if (strServerIP == "" | strServerPort == "")
            {
                return false;
            }

            RootObj = new RTXSAPIRootObj();     //创建根对象
            RootObj.ServerIP = strServerIP; //设置服务器IP
            RootObj.ServerPort = Convert.ToInt16(strServerPort); //设置服务器端口

            strMsg = strMsg + " " + strWebSite;

            //发送信息
            try
            {
                RootObj.SendNotify(strUserRTXCode, Resources.lang.SystemMessage, 60000000, strMsg); //获取版本信息
                return true;
            }
            catch
            {
                return false;
            }
        }

        return true;
    }

    public bool RTXSendIM(string Sender, string pwd, string RECVUsers, string IMMsg) //发送及时消息
    {
        //作用:发送及时消息
        //参数说明:
        //Sender:发送者
        //pwd:发送者密码
        //RECVUsers:接收者,多个中间用,间隔
        //IMMsg:发送的消息内容
        try
        {
            RTXObjectClass RTXObj = new RTXObjectClass();
            RTXCollectionClass RTXParams = new RTXCollectionClass();

            RTXObj.Name = "SYSTOOLS";
            RTXParams.Add("SENDER", Sender);
            RTXParams.Add("RECVUSERS", RECVUsers);
            RTXParams.Add("IMMsg", IMMsg);
            //string pass=Page.Session["UserPwd"].ToString();
            //string pass="123";
            RTXParams.Add("SDKPASSWORD", pwd);
            Object iStatus = new Object();
            //iStatus =RTXobj.Call2( &H2002, RTXParams);

            iStatus = RTXObj.Call2(enumCommand_.PRO_SYS_SENDIM, RTXParams);
            string result = iStatus.ToString();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public bool RTXSendIMts(string Sender, string pwd, string RECVUsers, string IMMsg)//广播方式发送消息
    {
        //作用:广播方式发送消息
        //参数说明:
        //Sender:发送者
        //pwd:发送者密码
        //RECVUsers:接收者,多个中间用,间隔
        //IMMsg:发送的消息内容
        try
        {
            RTXObjectClass RTXObj = new RTXObjectClass();
            RTXCollectionClass RTXParams = new RTXCollectionClass();
            RTXObj.Name = "EXTTOOLS";
            RTXParams.Add("USERNAME", RECVUsers);
            RTXParams.Add("SDKPASSWORD", pwd);
            RTXParams.Add("MSGINFO", IMMsg);
            Object iStatus = new Object();
            iStatus = RTXObj.Call2(RTXServerApi.enumCommand_.PRO_EXT_NOTIFY, RTXParams);

            return true;
        }
        catch
        {
            return false;
        }
    }

    //----RTX操作方法END-----------------------------------------------------------------------------------------------------

    //发送邮件（基于邮件内容，邮箱地址）
    public bool SendMailByEmail(string strEmail, string strSubject, string strBody, string strSendUserCode)
    {
        int nContain = 0;
        string strHQL;
        IList lst;

        string strTo;
        int nMailID;

        Folder folder = new Folder();

        strTo = strEmail;

        if (strTo == "")
            return false;

        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strSendUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);

        if (lst.Count == 0)
            return false;

        MailProfile mailProfile = (MailProfile)lst[0];

        if (mailProfile.Email == null)
            return false;

        ///添加发件人地址
        string strFrom = mailProfile.Email.Trim();

        if (strFrom == "")
            return false;

        MailMessage mailMsg = new MailMessage();

        mailMsg.From = new MailAddress(strFrom, mailProfile.UserName.Trim());
        mailMsg.To.Add(strTo);
        nContain += strTo.Length;

        //mailMsg.CC.Add(strTo);
        //nContain += strTo.Length;

        ///添加邮件主题
        mailMsg.Subject = strSubject;
        nContain += strSubject.Length;

        ///添加邮件内容
        mailMsg.Body = strBody;
        mailMsg.BodyEncoding = Encoding.UTF8;
        mailMsg.IsBodyHtml = true;

        nContain += strBody.Length;

        //nContain += 100;

        try
        {
            IMail mail = new Mail();
            SmtpClient smtpClient = new SmtpClient(mailProfile.SmtpServerIP, mailProfile.SmtpServerPort);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(mailProfile.AliasName.Trim(), mailProfile.Password.Trim());
            /*指定如何处理待发的邮件*/
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            try
            {
                //发送邮件
                smtpClient.Send(mailMsg);

                return true;
            }
            catch
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    //发送不带附件的未发的邮件
    public void SendUNSentNoAttachmentMail()
    {
        string strHQL;
        IList lst;

        string strUserCode;

        Folder folder = new Folder();
        strHQL = "From Mails as mails where mails.FolderID in (Select folders.FolderID From Folders as folders Where folders.KeyWord = 'Waiting')";
        strHQL += " and mails.MailID not in (Select attachments.MailID From Attachments as attachments )";
        MailsBLL mailsBLL = new MailsBLL();
        lst = mailsBLL.GetAllMailss(strHQL);

        Mails mails = new Mails();

        if (lst.Count > 0)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                mails = (Mails)lst[i];

                strUserCode = mails.UserCode.Trim();

                SendMailByNoAttachmentMails(strUserCode, mails);
            }
        }
    }

    //发送不带附件邮件（基于的邮件对象，向外发送）
    protected void SendMailByNoAttachmentMails(string strUserCode, Mails mails)
    {
        int nContain = 0;
        string strHQL;
        IList lst;

        string from;

        int intMailID;
        int intSendFoldID;
        int intWaitingFoldID;

        Folder folder = new Folder();
        intSendFoldID = folder.GetFolderID("Send", strUserCode);
        intWaitingFoldID = folder.GetFolderID("Waiting", strUserCode);

        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);
        MailProfile mailProfile = (MailProfile)lst[0];

        ///添加发件人地址
        from = mailProfile.Email.Trim();

        intMailID = mails.MailID;

        MailMessage mailMsg = new MailMessage();

        mailMsg.From = new MailAddress(from);
        mailMsg.To.Add(mails.ToAddress.Trim());
        nContain += mails.ToAddress.Trim().Length;

        if (mails.CCAddress.Trim() != "")
        {
            mailMsg.CC.Add(mails.CCAddress.Trim());
            nContain += mails.CCAddress.Trim().Length;
        }
        else
        {
            //mailMsg.CC.Add(mails.ToAddress.Trim());
        }

        ///添加邮件主题
        mailMsg.Subject = mails.Title.Trim();
        nContain += mails.Title.Trim().Length;

        ///添加邮件内容
        mailMsg.Body = mails.Body.Trim();
        mailMsg.BodyEncoding = Encoding.UTF8;
        mailMsg.IsBodyHtml = true;

        nContain += mails.Body.Trim().Length;

        try
        {
            Mail mail = new Mail();

            SmtpClient smtpClient = new SmtpClient(mailProfile.SmtpServerIP, mailProfile.SmtpServerPort);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(mailProfile.AliasName.Trim(), mailProfile.Password.Trim());
            /*指定如何处理待发的邮件*/
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            try
            {
                smtpClient.Send(mailMsg);

                mail.MoveMail(intMailID, intSendFoldID);
            }
            catch
            {
            }
        }
        catch (Exception ex)
        {
        }
    }

    //发送邮件（基于邮件内容，用于内部成员间相互发送）
    public bool SendMail(string strUserCode, string strSubject, string strBody, string strSendUserCode)
    {
        int nContain = 0;
        string strHQL;
        IList lst;

        string strTo;
        int nMailID;

        string strEnableSMTPSSL;

        Folder folder = new Folder();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        strHQL = "from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        if (lst.Count == 0)
            return false;

        ProjectMember projectMember = (ProjectMember)lst[0];

        if (projectMember.EMail == null)
            return false;

        strTo = projectMember.EMail.Trim();

        if (strTo == "")
            return false;

        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strSendUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);

        if (lst.Count == 0)
            return false;

        MailProfile mailProfile = (MailProfile)lst[0];

        strEnableSMTPSSL = mailProfile.EnableSMTPSSL.Trim();

        if (mailProfile.Email == null)
            return false;

        ///添加发件人地址
        string strFrom = mailProfile.Email.Trim();

        if (strFrom == "")
            return false;

        MailMessage mailMsg = new MailMessage();

        mailMsg.From = new MailAddress(strFrom, mailProfile.UserName.Trim());
        mailMsg.To.Add(strTo);
        nContain += strTo.Length;

        //mailMsg.CC.Add(strTo);
        //nContain += strTo.Length;

        ///添加邮件主题
        mailMsg.Subject = strSubject;
        mailMsg.Subject = mailMsg.Subject.Replace("审批通知", Resources.lang.ZZShengPiTongZhi);

        nContain += strSubject.Length;

        ///添加邮件内容
        mailMsg.Body = strBody;
        mailMsg.Body = mailMsg.Body.Replace("通知：你好，你有审批工作，内容：自审 ，请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZTZNHNYSPGZNRZSQJSDLGLPTJXCLZXXLZXTGLY);
        mailMsg.Body = mailMsg.Body.Replace("通知：你好，你有审批工作，内容：", Resources.lang.ZZTZNHNYSPGZNR);
        mailMsg.Body = mailMsg.Body.Replace("请及时登录管理平台进行处理，此信息来自：系统管理员！", Resources.lang.ZZQJSDLGLPTJXCLZXXLZXTGLY);

        mailMsg.BodyEncoding = Encoding.UTF8;
        mailMsg.IsBodyHtml = true;

        nContain += strBody.Length;

        //nContain += 100;

        try
        {
            //mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            ////用户名
            //mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", mailProfile.AliasName.Trim());
            ////密码
            //mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", mailProfile.Password.Trim());

            IMail mail = new Mail();
            SmtpClient smtpClient = new SmtpClient(mailProfile.SmtpServerIP, mailProfile.SmtpServerPort);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(mailProfile.AliasName.Trim(), mailProfile.Password.Trim());
            /*指定如何处理待发的邮件*/
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            if (strEnableSMTPSSL == "YES")
            {
                //启用SSL
                smtpClient.EnableSsl = true;
            }

            try
            {
                //发送邮件
                smtpClient.Send(mailMsg);

                nMailID = mail.SaveAsMail(mailMsg.Subject, mailMsg.Body, strFrom,
                    strTo, strTo, 1,
                    nContain, mailMsg.Attachments.Count > 0 ? 1 : 0, 1, folder.GetFolderID("Send", strUserCode), strSendUserCode);

                return true;
            }
            catch
            {
                nMailID = mail.SaveAsMail(mailMsg.Subject, mailMsg.Body, strFrom,
                    strTo, strTo, 1,
                    nContain, mailMsg.Attachments.Count > 0 ? 1 : 0, 1, folder.GetFolderID("Waiting", strUserCode), strSendUserCode);

                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    //自动收取邮件方法(基于用户代码）
    public void ReceiveMailByUserCode(string strUserCode, string strDocSavePath)
    {
        string strHQL;
        IList lst;

        string strPop3Server, strAliasName, strPassword;
        int intPort, intMailCount;

        strHQL = "from MailProfile as mailProfile where mailProfile.UserCode = " + "'" + strUserCode + "'";
        MailProfileBLL mailProfileBLL = new MailProfileBLL();
        lst = mailProfileBLL.GetAllMailProfiles(strHQL);

        if (lst.Count > 0)
        {
            MailProfile mailProfile = (MailProfile)lst[0];

            strAliasName = mailProfile.AliasName.Trim();
            strPassword = mailProfile.Password.Trim();
            strPop3Server = mailProfile.Pop3ServerIP.Trim();
            intPort = mailProfile.Pop3ServerPort;

            POP3_Client _POP3Client = new POP3_Client();
            if (_POP3Client.IsConnected == false)
            {
                _POP3Client.Connect(strPop3Server, intPort);
                _POP3Client.Authenticate(strAliasName, strPassword, true);

                intMailCount = _POP3Client.Messages.Count;
                _POP3Client.Disconnect();
                _POP3Client.Dispose();

                for (int i = 1; i <= intMailCount; i++)
                {
                    //strAliasName:登录名 strPassword:密码
                    ShareClass.ReceiveMail(strPop3Server, strUserCode, strAliasName, strPassword, intPort, strDocSavePath);
                }
            }
        }
    }

    //从POP3服务器端删除邮件
    public void DeleteMailFromPOP3Server(string strMailPOP3Server, int intPOP3Port, string strMailAccount, string strMailServerPassword)
    {
        using (POP3_Client c = new POP3_Client())
        {
            //连接POP3服务器
            c.Connect(strMailPOP3Server, intPOP3Port);

            //验证用户身份
            c.Authenticate(strMailAccount, strMailServerPassword, false);

            if (c.Messages.Count > 0)
            {
                foreach (POP3_ClientMessage mail in c.Messages)
                {
                    mail.MarkForDeletion(); //删除邮件
                }
            }

            c.Disconnect();
            c.Dispose();
        }
    }

    public int GetRTXServerCount()
    {
        string strHQL;
        IList lst;

        strHQL = "From RTXConfig as rtxConfigBySystem";
        RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
        lst = rtxConfigBLL.GetAllRTXConfigs(strHQL);

        return lst.Count;
    }

    public SMSInterface GetSPInterface()
    {
        string strHQL;
        IList lst;

        strHQL = "From SMSInterface as smsInterfaceBySystem Where smsInterfaceBySystem.Status ='处理中'";
        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        lst = smsInterfaceBLL.GetAllSMSInterfaces(strHQL);
        SMSInterface smsInterface = new SMSInterface();

        if (lst.Count > 0)
        {
            smsInterface = (SMSInterface)lst[0];
            return smsInterface;
        }
        else
        {
            return null;
        }
    }

    public string CreateRandomCode(int codeCount)
    {
        string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
        string[] allCharArray = allChar.Split(',');
        string randomCode = "";
        int temp = -1;

        Random rand = new Random();
        for (int i = 0; i < codeCount; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(36);
            if (temp != -1 && temp == t)
            {
                return CreateRandomCode(codeCount);
            }
            temp = t;
            randomCode += allCharArray[t];
        }
        return randomCode;
    }

    public string StringToUnicode(string srcText)
    {
        string dst = "";
        char[] src = srcText.ToCharArray();
        for (int i = 0; i < src.Length; i++)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(src[i].ToString());
            string str = @"\u" + bytes[1].ToString("X2") + bytes[0].ToString("X2");
            dst += str;
        }
        return dst;
    }
}
using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using TakeTopSecurity;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using Stimulsoft.Base;

public partial class TakeTopMainTop : System.Web.UI.Page
{
    int intRunNumber;

    string strHQL;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strLangCode;
        string strUserCode;
        string strUserName;
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            if (Session["SystemVersionType"].ToString() == "SAAS")
            {
                Response.Redirect("TakeTopMainTopSAAS.aspx");
            }

            strUserName = ShareClass.GetUserName(strUserCode);
            LB_UserName.Text = strUserName;
            LB_SystemMsg.Text = Resources.lang.NiHao + "，" + Resources.lang.HuanYingNiShiYong + " " + System.Configuration.ConfigurationManager.AppSettings["SystemName"];       

            //清空页面缓存，用于改变皮肤
            SetPageNoCache();

            intRunNumber = 0;

            //设置待处理事项
            LB_SuperDepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_UnHandledCase.Text = GetUNHandledWorkCount(strUserCode, strLangCode).ToString() + " " + Resources.lang.ToDoList;

            AsyncWork();
        }
    }
  

    //清空页面缓存，用于改变皮肤
    public void SetPageNoCache()
    {
        if (Session["CssDirectoryChangeNumber"].ToString() == "1")
        {
            //清除全部缓存
            IDictionaryEnumerator allCaches = Page.Cache.GetEnumerator();
            while (allCaches.MoveNext())
            {
                Page.Cache.Remove(allCaches.Key.ToString());
            }

            Page.Response.Buffer = true;
            Page.Response.AddHeader("Pragma", "No-Cache");

            Page.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            Page.Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Page.Response.Expires = 0;
            Page.Response.CacheControl = "no-cache";
            Page.Response.Cache.SetNoStore();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (intRunNumber == 0)
        {
            AsyncWork();

            Timer1.Interval = 360000;

            intRunNumber = 1;
        }
    }

    private void AsyncWork()
    {
        string strWebSite;
        string strLangCode;

        string strUserCode, strUserName, strUserType;
        string strIsMobileDevice, strSystemType;
        string strVerType, strCssDirectory, strMustInFrame, strAutoSaveWFOperator;
        string strForbitModule;

        string strIsOEMVersion;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        strUserType = Session["UserType"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();
        strSystemType = Session["SystemType"].ToString();
        strVerType = Session["SystemVersionType"].ToString();
        strCssDirectory = Session["CssDirectory"].ToString();
        strForbitModule = Session["ForbitModule"].ToString();
        strMustInFrame = Session["MustInFrame"].ToString();
        strAutoSaveWFOperator = Session["AutoSaveWFOperator"].ToString();
        strWebSite = System.Configuration.ConfigurationManager.AppSettings["WebSite"];

        if (strLangCode == "zh-CN")
        {
            LB_Copyright.Text = "Copyright © 2006-2026 " + " <a href=https://www.taketopits.com  target=_blank style='text-decoration:none;'>&nbsp;泰顶拓鼎</a>";
        }
        else
        {
            LB_Copyright.Text = "Copyright © 2006-2026 " + " <a href=https://www.taketopits.com  target=_blank style='text-decoration:none;'>&nbsp;TakeTopITS</a>";
        }

        strIsOEMVersion = System.Configuration.ConfigurationManager.AppSettings["IsOEMVersion"];
        if (strIsOEMVersion == "NO")
        {
            LB_Copyright.Visible = true;
        }
        else
        {
            LB_Copyright.Visible = true;
            LB_Copyright.Text = "Copyright© 2006-2026";
        }

        LB_CurrentUserCode.Text = strUserCode;
        LB_CurrentUserName.Text = strUserName;
        LB_CurrentUserType.Text = strUserType;
        LB_IsMobileDevice.Text = strIsMobileDevice;
        LB_SystemType.Text = strSystemType;
        LB_VerType.Text = strVerType;
        LB_CssDirectory.Text = strCssDirectory;
        LB_ForbitModule.Text = strForbitModule;
        LB_MustInFrame.Text = strMustInFrame;
        LB_AutoSaveWFOperator.Text = strAutoSaveWFOperator;


        //执行定时器页
        ShareClass.ExecuteTakeTopTimer();

        //推送用户的系统消息
        SetUserSystemMsg();
    }

    protected void SetUserSystemMsg()
    {
        string strUserCode, strUserName;
        string strIsMobileDevice;
        int intIntervalTime;

        try
        {
            TakeTopLicense license = new TakeTopLicense();

            strUserCode = LB_CurrentUserCode.Text.Trim();
            strUserName = LB_CurrentUserName.Text.Trim();
            strIsMobileDevice = LB_IsMobileDevice.Text.Trim();

            //应用会话对象，以保持在线连接
            Session["UserCode"] = LB_CurrentUserCode.Text.Trim();
            Session["UserName"] = LB_CurrentUserName.Text.Trim();
            Session["UserType"] = LB_CurrentUserType.Text.Trim();
            Session["IsMobileDevice"] = LB_IsMobileDevice.Text.Trim();
            Session["SystemType"] = LB_SystemType.Text.Trim();
            Session["SystemVersionType"] = LB_VerType.Text.Trim();
            Session["CssDirectory"] = LB_CssDirectory.Text.Trim();
            Session["ForbitModule"] = LB_ForbitModule.Text.Trim();
            Session["MustInFrame"] = LB_MustInFrame.Text.Trim();
            Session["AutoSaveWFOperator"] = LB_AutoSaveWFOperator.Text.Trim();

            //更新用户在线时间和取得最新用户数
            intIntervalTime = int.Parse(System.Configuration.ConfigurationManager.AppSettings["TimerInterval"]);
            SetLastestUseTime(intIntervalTime);

            int intActiveUserNumber = GetActiveUserNumber(180000);
            if (intActiveUserNumber == 0)
            {
                intActiveUserNumber++;
            }
            HL_ActiveUserCount.Text = intActiveUserNumber.ToString();
            HL_ActiveUserCount.NavigateUrl = "TTTakeTopIM.aspx";

            //取得系统登录次数
            lbl_LogonNumber.Text = GetLogonNumber().ToString();

            ////即时通预警
            //OpenIMMessage();

            try
            {
                //弹出组织级信息
                PushDeartmentMsg(strUserCode);

                //弹出信息框
                OpenMessageWindow(strUserCode);

                //即时通预警
                OpenIMMessage();
            }
            catch
            {
            }
        }
        catch (Exception err)
        {
            //Response.Write(err.Message.ToString());
        }
    }

    protected void OpenMessageWindow(string strUserCode)
    {
        string strJavaScriptFuntion;
        string strMessageType = "Msg";
        string strIsForceInfor;
        string strMessage = "";
        string strVerType;
        string strURL;



        int i = 0;

        Random random = new Random();

        strVerType = LB_VerType.Text.Trim();

        #region 追加信息提示框信息  By LiuJianping 2014-02-12
        if (lbl_FunInfoDialBoxNum.Text.Trim() != "无追加的信息提示框")
        {
            string[] tempOldNumList = lbl_FunInfoDialBoxNum.Text.Trim().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            StringBuilder NewNumList = new StringBuilder();//数量
            StringBuilder NewInforNameList = new StringBuilder();//提示预警名称
            StringBuilder NewIsSendMsgList = new StringBuilder();//是否短信通知
            StringBuilder NewIsSendEmailList = new StringBuilder();//是否邮件通知
            StringBuilder NewPageNameList = new StringBuilder();//关联页面

            FunInforDialBoxBLL funInforDialBoxBLL = new FunInforDialBoxBLL();
            string strHQL_Fun = lbl_sql.Text.Trim();
            IList lst_Fun = funInforDialBoxBLL.GetAllFunInforDialBoxs(strHQL_Fun);
            if (lst_Fun.Count > 0 && lst_Fun != null)
            {
                for (int k = 0; k < lst_Fun.Count; k++)
                {
                    FunInforDialBox funInforDialBox = (FunInforDialBox)lst_Fun[k];

                    try
                    {
                        strHQL = funInforDialBox.SQLCode.Trim();
                        strHQL = strHQL.Replace("[TAKETOPUSERCODE]", strUserCode);
                        strHQL = strHQL.Replace("[TAKETOPSUPERDEPARTSTRING]", LB_SuperDepartString.Text.Trim());

                        //LogClass.WriteLogFile(strHQL);

                        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "FunInforDialBoxList");

                        NewInforNameList.AppendFormat("{0}@", funInforDialBox.InforName.ToString());
                        NewNumList.AppendFormat("{0},", ds.Tables[0].Rows.Count.ToString());
                        NewIsSendMsgList.AppendFormat("{0},", funInforDialBox.IsSendMsg.ToString().Trim());
                        NewIsSendEmailList.AppendFormat("{0},", funInforDialBox.IsSendEmail.ToString().Trim());
                        NewPageNameList.AppendFormat("{0},", funInforDialBox.LinkAddress.ToString().Trim());

                        //强制通知 BY JackZhong 20140917
                        strIsForceInfor = funInforDialBox.IsForceInfor.Trim();
                        if (strIsForceInfor == "YES")
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                //Updated 20160123
                                if (k == 0)
                                {
                                    strJavaScriptFuntion = "soundPlay('msg')";
                                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);
                                }

                                strMessageType = random.Next(1, 100).ToString();
                                strMessage = "强制通知：" + funInforDialBox.InforName.Trim() + ": " + ds.Tables[0].Rows.Count.ToString();

                                strURL = funInforDialBox.LinkAddress.Trim() + "&URLType=POP";
                                strJavaScriptFuntion = "opAdvert('" + strMessageType + "'," + "'TTDisplayPOPMessage.aspx?URL=" + strURL + "&Msg=" + strMessage + "');";
                                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), strMessageType, strJavaScriptFuntion, true);
                            }
                        }
                    }
                    catch (Exception err)
                    {
                        LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                    }
                }
            }

            if (!string.IsNullOrEmpty(NewNumList.ToString().Trim()))
            {
                string NewNum = NewNumList.ToString().Substring(0, NewNumList.ToString().Length - 1);
                string NewInforName = NewInforNameList.ToString().Substring(0, NewInforNameList.ToString().Length - 1);
                string NewIsSendMsg = NewIsSendMsgList.ToString().Substring(0, NewIsSendMsgList.ToString().Length - 1);
                string NewIsSendEmail = NewIsSendEmailList.ToString().Substring(0, NewIsSendEmailList.ToString().Length - 1);
                string NewPageName = NewPageNameList.ToString().Substring(0, NewPageNameList.ToString().Length - 1);

                string[] tempNewNumList = NewNum.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                string[] tempNewInforNameList = NewInforName.Split(new char[] { '@' }, StringSplitOptions.RemoveEmptyEntries);
                string[] tempNewIsSendMsgList = NewIsSendMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                string[] tempNewIsSendEmailList = NewIsSendEmail.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                string[] tempPageNameList = NewPageName.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                if (tempOldNumList.Length == tempNewNumList.Length)
                {
                    for (int m = 0; m < tempNewNumList.Length; m++)
                    {
                        i += int.Parse(tempNewNumList[m]);

                        if (int.Parse(tempNewNumList[m]) > int.Parse(tempOldNumList[m]))
                        {
                            strMessage += tempNewInforNameList[m] + "：" + (int.Parse(tempNewNumList[m]) - int.Parse(tempOldNumList[m])).ToString() + " 条要处理！";

                            strMessageType = tempNewInforNameList[m] + random.Next(1, 100).ToString();

                            if (tempNewIsSendMsgList[m].ToString().Trim() == "YES")
                            {
                                Msg msg = new Msg();
                                msg.SendMSM("Message", strUserCode, tempNewInforNameList[m] + "：" + (int.Parse(tempNewNumList[m]) - int.Parse(tempOldNumList[m])).ToString() + " 条要处理！", strUserCode);
                            }

                            if (tempNewIsSendEmailList[m].ToString().Trim() == "YES")
                            {
                                Msg msg = new Msg();
                                msg.SendMail(strUserCode, tempNewInforNameList[m], tempNewInforNameList[m] + "：" + (int.Parse(tempNewNumList[m]) - int.Parse(tempOldNumList[m])).ToString() + " 条要处理！", strUserCode);
                            }

                            ////Updated 20160123
                            if (m == 0)
                            {
                                strJavaScriptFuntion = "soundPlay('msg')";
                                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);
                            }

                            strURL = tempPageNameList[m] + "&URLType=POP";
                            strJavaScriptFuntion = "opAdvert('" + strMessageType + "'," + "'TTDisplayPOPMessage.aspx?URL=" + strURL + "&Msg=" + strMessage + "');";
                            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), strMessageType, strJavaScriptFuntion, true);
                        }
                    }
                }

                lbl_FunInfoDialBoxNum.Text = NewNumList.ToString().Substring(0, NewNumList.ToString().Length - 1);

                LB_UnHandledCase.Text = i.ToString();
            }
        }
        #endregion
    }

    protected void BT_PopMsg_Click(object sender, EventArgs e)
    {
        OpenMessageWindow(Session["UserCode"].ToString());

        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "alert('kdfkdk');", true);
    }

    protected int GetUNHandledWorkCount(string strUserCode, string strlangCode)
    {
        #region 追加信息提示框信息  By LiuJianping 2014-02-12

        int i = 0;

        string strLangCode = Session["LangCode"].ToString();

        string strSuperDepartString;
        strSuperDepartString = LB_SuperDepartString.Text.Trim();

        StringBuilder OldNumList = new StringBuilder();
        FunInforDialBoxBLL funInforDialBoxBLL = new FunInforDialBoxBLL();
        string strHQL_Fun = "From FunInforDialBox as funInforDialBoxBySystem Where funInforDialBoxBySystem.Status='启用'";
        strHQL_Fun += " and funInforDialBoxBySystem.LangCode = " + "'" + strLangCode + "'";
        strHQL_Fun += "Order By funInforDialBoxBySystem.ID Desc ";

        lbl_sql.Text = strHQL_Fun;

        IList lst_Fun = funInforDialBoxBLL.GetAllFunInforDialBoxs(strHQL_Fun);
        if (lst_Fun.Count > 0 && lst_Fun != null)
        {
            for (int k = 0; k < lst_Fun.Count; k++)
            {
                FunInforDialBox funInforDialBox = (FunInforDialBox)lst_Fun[k];

                try
                {
                    string strHQL;

                    strHQL = funInforDialBox.SQLCode.Trim();
                    strHQL = strHQL.Replace("[TAKETOPUSERCODE]", strUserCode);
                    strHQL = strHQL.Replace("[TAKETOPSUPERDEPARTSTRING]", strSuperDepartString);

                    DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "FunInforDialBoxList");

                    OldNumList.AppendFormat("{0},", ds.Tables[0].Rows.Count.ToString());
                }
                catch
                {
                }
            }

            if (!string.IsNullOrEmpty(OldNumList.ToString().Trim()))
            {
                lbl_FunInfoDialBoxNum.Text = OldNumList.ToString().Substring(0, OldNumList.ToString().Length - 1);

                string[] tempOldNumList = lbl_FunInfoDialBoxNum.Text.Trim().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                for (int L = 0; L < tempOldNumList.Length; L++)
                {
                    i += int.Parse(tempOldNumList[L]);
                }
            }
            else
            {
                lbl_FunInfoDialBoxNum.Text = "没有新的信息";
            }
        }
        else
        {
            lbl_FunInfoDialBoxNum.Text = "没有新的信息";
        }

        return i;

        #endregion
    }


    protected void BT_OpenIMByPC_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode;
        string strCoID, strChatterCode, strChatterName;

        string strRandomID;
        string strJavaScriptFuntion;
        string strMessage, strIMTitle;

        strUserCode = Session["UserCode"].ToString();

        strHQL = "Select CoID,UserCode,UserName From T_CollaborationLog Where CoID in (";
        strHQL += "  select CoID from T_Collaboration where rtrim(ltrim(status)) not in ('新建','关闭') and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
        strHQL += " UNION ";
        strHQL += " select CoID from T_Collaboration where rtrim(ltrim(status)) not in ('新建','关闭') and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
        strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and rtrim(ltrim(COALESCE(A.LogContent,''))) <> ''";
        strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
        strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " )) )";

        strHQL += " Order By LogID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationLog");

        BT_CloseIMByPC.Visible = true;
        BT_OpenIMByPC.Visible = false;

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                strCoID = ds.Tables[0].Rows[i][0].ToString();
                strChatterCode = ds.Tables[0].Rows[i][1].ToString();
                strChatterName = ds.Tables[0].Rows[i][2].ToString();

                strRandomID = strCoID;
                strIMTitle = "TakeTopIM---" + strChatterName + "---" + (i + 1).ToString();
                strMessage = "TTTakeTopIMMain.aspx?CoID=" + strCoID + "&ChatterCode=" + strChatterCode;

                try
                {
                    strJavaScriptFuntion = "opim(" + "'" + strRandomID + "'" + "," + "'" + strIMTitle + "'" + "," + "'" + strMessage + "'" + ");";
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), strCoID, strJavaScriptFuntion, true);
                }
                catch
                {
                }
            }
        }
    }

    protected void BT_CloseIMByPC_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode;
        string strCoID, strChatterCode, strChatterName;

        string strRandomID;
        string strJavaScriptFuntion;
        string strMessage, strIMTitle;

        strUserCode = Session["UserCode"].ToString();

        strHQL = "Select CoID,UserCode,UserName From T_CollaborationLog Where CoID in (";
        strHQL += "  select CoID from T_Collaboration where rtrim(ltrim(status)) not in ('新建','关闭') and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
        strHQL += " UNION ";
        strHQL += " select CoID from T_Collaboration where rtrim(ltrim(status)) not in ('新建','关闭') and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
        strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and rtrim(ltrim(COALESCE(A.LogContent,''))) <> ''";
        strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
        strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " )) )";
        strHQL += " Order By LogID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationLog");

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                strCoID = ds.Tables[0].Rows[i][0].ToString();
                strChatterCode = ds.Tables[0].Rows[i][1].ToString();
                strChatterName = ds.Tables[0].Rows[i][2].ToString();

                strRandomID = strCoID;
                strIMTitle = "TakeTopIM---" + strChatterName + "---" + (i + 1).ToString();
                strMessage = "TTTakeTopIMMain.aspx?CoID=" + strCoID + "&ChatterCode=" + strChatterCode;

                try
                {
                    strJavaScriptFuntion = "opim(" + "'" + strRandomID + "'" + "," + "'" + strIMTitle + "'" + "," + "'" + strMessage + "'" + ");";
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), strCoID, strJavaScriptFuntion, true);
                }
                catch
                {
                }
            }
        }
    }

    protected void PushDeartmentMsg(string strUserCode)
    {
        string strHQL;
        string strUserName, strDepartCode, strMsgID, strMsg, strJavaScriptFuntion, strMsgType;

        Random random = new Random();

        strUserName = ShareClass.GetUserName(strUserCode);
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = string.Format(@"Select MsgId, Message From T_DepartmentMsgPush Where Position('{0}' in DepartString)> 0
                 And MsgID not in (Select MsgID From T_DepartmentMsgRelatedUser Where UserCode = '{1}')
                 And Status = '启用'
                 Order By MsgID DESC", strDepartCode, strUserCode);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DepartmentMsgPush");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            //Updated --20160123
            if (i == 0)
            {
                strJavaScriptFuntion = "soundPlay('msg')";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);
            }

            strMsgID = ds.Tables[0].Rows[0][0].ToString().Trim();
            strMsg = ds.Tables[0].Rows[0][1].ToString().Trim();
            strMsgType = random.Next(100, 200).ToString();
            strJavaScriptFuntion = "opdg('" + strMsgType + "'," + "'" + strMsg + "'" + ");";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), strMsgType, strJavaScriptFuntion, true);

            strHQL = "Insert Into T_DepartmentMsgRelatedUser(MsgID,UserCode,UserName) Values(" + strMsgID + "," + "'" + strUserCode + "'" + "," + "'" + strUserName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void OpenIMMessage()
    {
        string strHQL;
        string strUserCode;
        string strJavaScriptFuntion;
        int intOldCount, intNewCount;
        string strMsg;

        strUserCode = Session["UserCode"].ToString();

        strHQL = "select * from T_Collaboration ABySystem where rtrim(ltrim(ABySystem.status)) not in ('新建','关闭') and ABySystem.CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
        strHQL += " UNION ";
        strHQL += " select * from T_Collaboration where rtrim(ltrim(status)) not in ('新建','关闭') and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
        strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and rtrim(ltrim(COALESCE(A.LogContent,''))) <> ''";
        strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
        strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " )) Order by ABySystem.CoID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_Collaboration");

        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_NewToBeHandledNumber.Text = ds.Tables[0].Rows.Count.ToString();
            intNewCount = int.Parse(TB_NewToBeHandledNumber.Text);
            intOldCount = int.Parse(TB_OldToBeHandledNumber.Text);

            if (!ShareClass.IsMobileDeviceCheckAgent())
            {
                if (intNewCount > intOldCount)
                {
                    strJavaScriptFuntion = "soundPlay('msg')";
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);

                    TB_OldToBeHandledNumber.Text = intNewCount.ToString();

                    BT_OpenIMByPC.ToolTip = ds.Tables[0].Rows.Count + " 条消息";
                    BT_OpenIMByMobile.ToolTip = ds.Tables[0].Rows.Count + " 条消息";

                    BT_OpenIMByPC.Visible = true;

                    BT_CloseIMByPC.Visible = false;
                    BT_OpenIMByMobile.Visible = false;

                    strMsg = "有" + ds.Tables[0].Rows.Count + "条协作要处理！";

                    try
                    {
                        //发关消息给RTX
                        Msg msg = new Msg();
                        msg.SendRTXMsg(strUserCode, strMsg);
                    }
                    catch
                    {
                    }
                }
                else
                {
                    BT_CloseIMByPC.Visible = true;
                    BT_CloseIMByPC.ToolTip = ds.Tables[0].Rows.Count + " 条消息";

                    BT_OpenIMByPC.Visible = false;
                    BT_OpenIMByMobile.Visible = false;
                }
            }
            else
            {
                BT_OpenIMByMobile.Visible = true;
                BT_OpenIMByMobile.Attributes.Add("onclick", "javascript:window.open('TTCollaborationManage.aspx','_blank')");

                BT_OpenIMByPC.Visible = false;
                BT_CloseIMByPC.Visible = false;
            }
        }
        else
        {
            BT_OpenIMByPC.Visible = false;
            BT_CloseIMByPC.Visible = false;
            BT_OpenIMByMobile.Visible = false;
        }
    }



    //取得系统登录次数
    protected int GetLogonNumber()
    {
        string strHQL;
        strHQL = "Select * From T_LogonLog";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LogonLog");
        return ds.Tables[0].Rows.Count;
    }

    protected int GetActiveUserNumber(int intIntervalTime)
    {
        string strHQL;
        string strUserCode;
        int intActiveUserCount;

        intIntervalTime *= 3;

        strUserCode = Session["UserCode"].ToString();


        strHQL = "Select distinct UserCode,UserName from T_LogonLog  where  LastestTime+" + intIntervalTime.ToString() + "*'1 ms'::interval >= now() ";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_LogonLog");

        intActiveUserCount = ds.Tables[0].Rows.Count;

        return intActiveUserCount;
    }

    protected void SetLastestUseTime(int intIntervalTime)
    {
        string strHQL;
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        intIntervalTime *= 3;

        strHQL = "Update T_LogonLog Set LastestTime = now()+" + intIntervalTime.ToString() + "*'1 ms'::interval where UserCode = " + "'" + strUserCode + "'";
        strHQL += " and ID in ( select Max(ID) from T_LogonLog where UserCode = " + "'" + strUserCode + "'" + ")";
        ShareClass.RunSqlCommandForNOOperateLog(strHQL);
    }

}

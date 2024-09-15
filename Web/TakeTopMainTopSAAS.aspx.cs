using System;
using System.Collections;
using System.Data;
using System.Text;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TakeTopMainTopSAAS : System.Web.UI.Page
{
    int intRunNumber;

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
            if (Page.IsPostBack == false)
            {
                strUserName = ShareClass.GetUserName(strUserCode);
                LB_UserName.Text = strUserName;
                LB_SystemMsg.Text = Resources.lang.NiHao + "，" + Resources.lang.HuanYingNiShiYong + " " + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

                intRunNumber = 0;

                AsyncWork();
            }
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
        string strIsMobileDevice, strVerType, strSystemType, strIsOEMVersion, strCssDirectory, strMustInFrame;
        string strAutoSaveWFOperator;
        string strForbitModule;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        strUserType = Session["UserType"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();
        strSystemType = Session["SystemType"].ToString();
        strVerType = Session["SystemVersionType"].ToString();
        strCssDirectory = Session["CssDirectory"].ToString();
        strWebSite = System.Configuration.ConfigurationManager.AppSettings["WebSite"];
        strForbitModule = Session["ForbitModule"].ToString();
        strMustInFrame = Session["MustInFrame"].ToString();
        strAutoSaveWFOperator = Session["AutoSaveWFOperator"].ToString();

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
        lbl_CssDirectory.Text = strCssDirectory;
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
        int intIntervalTime;

        try
        {
            strUserCode = LB_CurrentUserCode.Text.Trim();
            strUserName = LB_CurrentUserName.Text.Trim();

            //应用会话对象，以保持在线连接
            Session["UserCode"] = LB_CurrentUserCode.Text.Trim();
            Session["UserName"] = LB_CurrentUserName.Text.Trim();
            Session["UserType"] = LB_CurrentUserType.Text.Trim();
            Session["IsMobileDevice"] = LB_IsMobileDevice.Text.Trim();
            Session["SystemType"] = LB_SystemType.Text.Trim();
            Session["SystemVersionType"] = LB_VerType.Text.Trim();
            Session["CssDirectory"] = lbl_CssDirectory.Text.Trim();
            Session["ForbitModule"] = LB_ForbitModule.Text.Trim();
            Session["MustInFrame"] = LB_MustInFrame.Text.Trim();
            Session["AutoSaveWFOperator"] = LB_AutoSaveWFOperator.Text.Trim();

            //取得系统登录次数
            lbl_LogonNumber.Text = GetLogonNumber().ToString();

            //更新用户在线时间
            intIntervalTime = int.Parse(System.Configuration.ConfigurationManager.AppSettings["TimerInterval"]);
            SetLastestUseTime(intIntervalTime);
        }
        catch (Exception err)
        {
            Response.Write(err.Message.ToString());
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

    protected void SetLastestUseTime(int intIntervalTime)
    {
        string strHQL;
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        intIntervalTime *= 3;

        strHQL = "Update T_LogonLog Set LastestTime = now()+" + intIntervalTime.ToString() + "*'1 ms'::interval where UserCode = " + "'" + strUserCode + "'";
        strHQL += " and ID in (select Max(ID) from T_LogonLog where UserCode = " + "'" + strUserCode + "'" + ")";
        ShareClass.RunSqlCommandForNOOperateLog(strHQL);
    }
}

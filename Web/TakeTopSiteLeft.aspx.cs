using System;
using System.Data;
using System.Web;
using System.Web.UI;
public partial class TakeTopSiteLeft : System.Web.UI.Page
{
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strModuleName, strHomeModuleName;

        strModuleName = Request.QueryString["ModuleName"];
        strHomeModuleName = Request.QueryString["HomeModuleName"];


        if (Session["LangCode"] != null)
        {
            strLangCode = Session["LangCode"].ToString();
        }
        else
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
        }

        if (Page.IsPostBack != true)
        {
            if (strHomeModuleName == "" | strHomeModuleName == null)
            {
                strHomeModuleName = Resources.lang.HomePage;
            }

            LB_HomeModuleName.Text = strHomeModuleName;

            if (strModuleName != null)
            {
                BindModuleData(strModuleName);
            }

        }
    }

    protected void BindModuleData(string strParentModule)
    {
        string strHtml = string.Empty;
        string strHQL;

        strHQL = "Select Distinct * From T_ProModuleLevel A Where ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and A.Visible = 'YES' and A.IsDeleted = 'NO' and A.ModuleType = 'SITE' ";
        strHQL += " and A.LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By A.SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count == 0 | ShareClass.IsMobileDeviceCheckAgent())
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "ChangeMenu(0);", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "ChangeMenu(1);", true);
        }

        strHQL = "Select Distinct * From T_ProModuleLevel A Where";
        strHQL += " A.Visible = 'YES' and A.IsDeleted = 'NO' and A.ModuleType = 'SITE' ";
        strHQL += " and A.LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By A.SortNumber ASC";
        DataTable dtModule = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "Module").Tables[0];
        DataView dvModule = new DataView(dtModule);
        dvModule.RowFilter = " ParentModule =  " + "'" + strParentModule + "'";

        bool isFirst = false;

        foreach (DataRowView row in dvModule)
        {
            strHtml += "<div class=\"box\">";

            string strModuleName = ShareClass.ObjectToString(row["ModuleName"]).Trim();
            string strHomeModuleName = ShareClass.ObjectToString(row["HomeModuleName"]).Trim();
            string strPageName = ShareClass.ObjectToString(row["PageName"]).Trim();
            string strIconURL = ShareClass.ObjectToString(row["IconURL"]);
            string strModuleType = ShareClass.ObjectToString(row["ModuleType"]).Trim();


            if (strIconURL.Trim() == "")
            {
                strIconURL = @"Logo/website/Images/ModuleIcon.png";
            }
            if (strPageName.IndexOf("?") >= 0)
            {
                strPageName = strPageName + "&ModuleName=" + strModuleName + "&HomeModuleName=" + strHomeModuleName + "&ModuleType=" + strModuleType;
            }
            else
            {
                strPageName = strPageName + "?ModuleName=" + strModuleName + "&HomeModuleName=" + strHomeModuleName + "&ModuleType=" + strModuleType;
            }

            strHtml += "<span name=\"parent1\" onmouseover=\"OnMouseOverEvent(this)\" onmouseout=\"OnMouseOutEvent(this)\"><span onclick=\"OnPlusEvent(this)\" class=\"plusSpan\"><img src=\'" + strIconURL + "' />&nbsp;<span onclick=\"OnMinusEvent(this)\" class=\"minusSpan\"><span class=\"titleSpan\" onclick=\"CreateTabModule('" + strHomeModuleName + "','" + strPageName + "',this)\" ondblclick=\"OnDoubleClickModule(this)\">" + "<a   href = " + strPageName + " target=SiteRightContainerFrame > <font color='#505050'>" + strHomeModuleName + "</font></a> " + " </span></span></span></span>";

            if (!isFirst)
            {
                HF_ClickValue.Value = strHomeModuleName;
                isFirst = true;
            }

            //增加儿子模组
            strHtml += "<div class=\"text\">";
            dvModule.RowFilter = "ParentModule='" + strModuleName + "'";

            strHtml += "<ul class=\"content\">";
            foreach (DataRowView rowChild in dvModule)
            {
                string strChildModuleName = ShareClass.ObjectToString(rowChild["ModuleName"]).Trim();
                string strChildHomeModuleName = ShareClass.ObjectToString(rowChild["HomeModuleName"]).Trim();
                string strChildPageName = ShareClass.ObjectToString(rowChild["PageName"]).Trim();
                string strChildModuleType = ShareClass.ObjectToString(rowChild["ModuleType"]).Trim();

                if (strChildPageName.IndexOf("?") >= 0)
                {
                    strChildPageName = strChildPageName + "&ModuleName=" + strChildModuleName + "&HomeModuleName=" + strChildHomeModuleName + "&ModuleType=" + strChildModuleType;
                }
                else
                {
                    strChildPageName = strChildPageName + "?ModuleName=" + strChildModuleName + "&HomeModuleName=" + strChildHomeModuleName + "&ModuleType=" + strChildModuleType;
                }

                //增加孙子模组
                dvModule.RowFilter = "ParentModule='" + strChildModuleName + "'";

                if (dvModule.Count > 0)
                {
                    strHtml += "<span class=\"titleSpan\" onmouseover=\"OnMouseOverEvent(this)\" onmouseout=\"OnMouseOutEvent(this)\"  ondblclick=\"OnDoubleClickModule(this)\"><span class=\"titleSpan\" onclick=\"CreateTabModule('" + strChildHomeModuleName + "','" + strChildPageName + "',this)\" >" + "<a  href = " + strChildPageName + " target=SiteRightContainerFrame ><font color='#505050'>" + strChildHomeModuleName + "</font></a>" + " </span></span>";
                }
                else
                {
                    strHtml += "<li><span class=\"titleSpan\" onmouseover=\"OnMouseOverEvent(this)\" onmouseout=\"OnMouseOutEvent(this)\" onclick=\"CreateTab('" + strChildHomeModuleName + "','" + strChildPageName + "',this)\">" + "<a   href = " + strChildPageName + " target=SiteRightContainerFrame ><font color='#505050'>" + strChildHomeModuleName + "</font></a>" + "</span></li>";
                }

                strHtml += "<div class=\"text\">";
                strHtml += "<ul class=\"content\">";
                foreach (DataRowView rowGrandSon in dvModule)
                {
                    string strGrandSonModuleName = ShareClass.ObjectToString(rowGrandSon["ModuleName"]).Trim();
                    string strGrandSonHomeModuleName = ShareClass.ObjectToString(rowGrandSon["HomeModuleName"]).Trim();
                    string strGrandSonPageName = ShareClass.ObjectToString(rowGrandSon["PageName"]).Trim();
                    string strGrandSonModuleType = ShareClass.ObjectToString(rowGrandSon["ModuleType"]).Trim();

                    if (strGrandSonPageName.IndexOf("?") >= 0)
                    {
                        strGrandSonPageName = strGrandSonPageName + "&ModuleName=" + strGrandSonModuleName + "&HomeModuleName=" + strGrandSonHomeModuleName + "&ModuleType=" + strGrandSonModuleType;
                    }
                    else
                    {
                        strGrandSonPageName = strGrandSonPageName + "?ModuleName=" + strGrandSonModuleName + "&HomeModuleName=" + strGrandSonHomeModuleName + "&ModuleType=" + strGrandSonModuleType;
                    }

                    strHtml += "<li><span class=\"titleSpan\" onmouseover=\"OnMouseOverEvent(this)\" onmouseout=\"OnMouseOutEvent(this)\" onclick=\"CreateTab('" + strGrandSonHomeModuleName + "','" + strGrandSonPageName + "',this)\">" + "<a   href = " + strGrandSonPageName + " target=SiteRightContainerFrame > <font color='#505050'>" + strGrandSonHomeModuleName + "</font></a> " + "</span></li>";

                }

                strHtml += "</ul>";
                strHtml += "</div>";
            }


            strHtml += "</ul>";
            strHtml += "</div>";
            strHtml += "</div>";
        }

        LT_Result.Text = strHtml + "<br /><br />";
    }

    protected void BT_MakeIM_Click(object sender, EventArgs e)
    {
        string strRandomID;
        string strJavaScriptFuntion;
        string strMessage;

        strRandomID = "IMMember";
        strMessage = "TTTakeTopIM.aspx";

        strJavaScriptFuntion = "opim(" + "'" + strRandomID + "'" + "," + "'" + strMessage + "'" + ");";
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);
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
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSTRMSG + "');</script>");

                            strHQL = "Insert Into T_UserLoginManageMsgRelatedUser(LoginID,UserCode,UserName)";
                            strHQL += " Values(" + strLoginID + ",'" + strUserCode + "','" + strUserName + "')";
                            ShareClass.RunSqlCommandForNOOperateLog(strHQL);
                        }

                        return false;
                    }
                    else
                    {
                        if (strMsg != "")
                        {
                            strHQL = "Select LoginID From T_UserLoginManageMsgRelatedUser Where LoginID = " + strLoginID + " and UserCode Like " + "'" + strUserCode + "'";
                            ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_UserLoginManage");
                            if (ds.Tables[0].Rows.Count == 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSTRMSG + "');</script>");

                                strHQL = "Insert Into T_UserLoginManageMsgRelatedUser(LoginID,UserCode,UserName)";
                                strHQL += " Values(" + strLoginID + ",'" + strUserCode + "','" + strUserName + "')";
                                ShareClass.RunSqlCommandForNOOperateLog(strHQL);
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

}
using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTSelectorProductModuleNew : System.Web.UI.Page
{

    public string strModuleIDs = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["MID"]))
            {
                strModuleIDs = ShareClass.ObjectToString(Request.QueryString["MID"]);
            }

            DataBinder();
        }
    }

    private void DataBinder()
    {
        string strModuleSQL = @"select ModuleType from T_ProductModuleType_YYUP
                        order by SortNumber asc ; 
                        select * from T_ProductModule_YYUP
                        order by SortNumber asc ;";
        DataSet dsModule = ShareClass.GetDataSetFromSql(strModuleSQL, "Module");

        string strShowHtml = string.Empty;
        if (dsModule != null)
        {
            if (dsModule.Tables[0] != null && dsModule.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow drModuleType in dsModule.Tables[0].Rows)
                {
                    string strModuleType = ShareClass.ObjectToString(drModuleType["ModuleType"]);
                    strShowHtml += "<tr><td><input id='" + strModuleType + "' type=\"checkbox\" onclick=\"ChooseTagAll('" + strModuleType + "',this)\" />" + strModuleType + "</td>";

                    //筛选出相应的模块名称

                    DataRow[] drModuleName = dsModule.Tables[1].Select("ModuleType='" + strModuleType + "'");//查询

                    string strModuleNameHtml = string.Empty;
                    if (drModuleName != null && drModuleName.Length > 0)
                    {
                        strModuleNameHtml = "<table>";
                        foreach (DataRow drRow in drModuleName)
                        {
                            string strModuleID = ShareClass.ObjectToString(drRow["ID"]);
                            if (("," + strModuleIDs).Contains("," + strModuleID + ","))
                            {
                                strModuleNameHtml += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<input id='" + strModuleID + "|" + ShareClass.ObjectToString(drRow["ModuleName"]) + "' tag=\"" + strModuleType + "\" type=\"checkbox\" name=\"dlCode\" checked=\"checked\" />" + ShareClass.ObjectToString(drRow["ModuleName"]) + "</td></tr>";
                            }
                            else {
                                strModuleNameHtml += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<input id='" + strModuleID + "|" + ShareClass.ObjectToString(drRow["ModuleName"]) + "' tag=\"" + strModuleType + "\" type=\"checkbox\" name=\"dlCode\" />" + ShareClass.ObjectToString(drRow["ModuleName"]) + "</td></tr>";
                            }
                        }
                        strModuleNameHtml += "</table>";
                    }
                    strShowHtml += "</tr>";
                    if (!string.IsNullOrEmpty(strModuleNameHtml))
                    {
                        strShowHtml += "<tr><td>" + strModuleNameHtml + "</td></tr>";
                    }
                    else {
                        strShowHtml += "<tr><td>无模块名称数据</td></tr>";
                    }
                }
            }
            else {
                strShowHtml = "<tr><td>无类型数据</td></tr>";
            }
        }
        else {
            strShowHtml = "<tr><td>无数据</td></tr>";
        }

        LT_ShowHtml.Text = strShowHtml;
    }
}
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTSelectorPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ProjectID"]))
            {
                string strProjectID = ShareClass.ObjectToString(Request.QueryString["ProjectID"]);

                HF_ProjectID.Value = strProjectID;

                DataDocumentBinder(strProjectID);
            }
        }
    }

    private void DataDocumentBinder(string strProjectID)
    {

        string strProjectHQL = string.Format(@"select * from T_Project
                    where ProjectID = {0};
                    select * from T_Project_YYUP
                    where ProjectID = {0};", strProjectID);

        DataSet dsProject = ShareClass.GetDataSetFromSql(strProjectHQL, "Project");
        if (dsProject != null)
        {
            string strProductLine = string.Empty;                               //产品线
            string strSubordinateIndustry = string.Empty;                       //行业
            decimal decimalProjectAmount = 0;                                   //项目额
            decimal decimalManHour = 0;                                         //工时
            string strModuleIDs = string.Empty;
            string strModuleNames = string.Empty;                               //模块

            if (dsProject.Tables[0] != null && dsProject.Tables[0].Rows.Count > 0)
            {
                DataRow drProject = dsProject.Tables[0].Rows[0];

                decimal.TryParse(ShareClass.ObjectToString(drProject["ProjectAmount"]), out decimalProjectAmount);
                decimal.TryParse(ShareClass.ObjectToString(drProject["ManHour"]), out decimalManHour);
            }

            if (dsProject.Tables[1] != null && dsProject.Tables[1].Rows.Count > 0)
            {
                DataRow drProject_YYUP = dsProject.Tables[1].Rows[0];

                strProductLine = ShareClass.ObjectToString(drProject_YYUP["ProductLine"]);
                strSubordinateIndustry = ShareClass.ObjectToString(drProject_YYUP["SubordinateIndustry"]);

                strModuleIDs = ShareClass.ObjectToString(drProject_YYUP["ModuleIDs"]);
                strModuleNames = ShareClass.ObjectToString(drProject_YYUP["ModuleNames"]);
            }


            string strPlanHQL = string.Format(@"select d.*,r.ModuleIDs,r.ModuleNames,r.StartAmount,r.EndAmount,r.StartPersonDay,r.EndPersonDay from T_ProjectModuleRelated_YYUP r
                        left join T_ProjectPlan_YYUP d on r.PlanID = d.ID
                        where r.ProductLine = '{0}'", strProductLine);

            DataTable dtPlan = ShareClass.GetDataSetFromSql(strPlanHQL, "Plan").Tables[0];

            DataTable dtNew = dtPlan.Copy();  //复制dt表数据结构
            dtNew.Clear();  //清楚数据

            if (dtPlan != null && dtPlan.Rows.Count > 0)
            {
                foreach (DataRow drPlan in dtPlan.Rows)
                {
                    //判断金额和工时
                    decimal decimalRelatedStartAmount = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drPlan["StartAmount"]), out decimalRelatedStartAmount);
                    decimal decimalRelatedEndAmount = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drPlan["EndAmount"]), out decimalRelatedEndAmount);
                    decimal decimalRelatedStartPersonDay = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drPlan["StartPersonDay"]), out decimalRelatedStartPersonDay);
                    decimal decimalRelatedEndPersonDay = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drPlan["EndPersonDay"]), out decimalRelatedEndPersonDay);

                    if (decimalProjectAmount > 0)
                    {
                        if (decimalProjectAmount < decimalRelatedStartAmount)
                        {
                            continue;
                        }
                        if (decimalRelatedEndAmount != 0 && decimalProjectAmount > decimalRelatedEndAmount)
                        {
                            continue;
                        }
                    }
                    if (decimalManHour > 0)
                    {
                        if (decimalManHour < decimalRelatedStartPersonDay)
                        {
                            continue;
                        }
                        if (decimalRelatedEndPersonDay != 0 && decimalManHour > decimalRelatedEndPersonDay)
                        {
                            continue;
                        }
                    }

                    string strRelatedModuleIDs = ShareClass.ObjectToString(drPlan["ModuleIDs"]);
                    string strRelatedModuleNames = ShareClass.ObjectToString(drPlan["ModuleNames"]);

                    bool IsYou = true;
                    string[] arrModuleID = strModuleIDs.Split(',');
                    for (int i = 0; i < arrModuleID.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrModuleID[i]))
                        {
                            if (!("," + strRelatedModuleIDs).Contains("," + arrModuleID[i] + ","))
                            {
                                IsYou = false;
                                break;
                            }
                        }
                    }
                    if (IsYou)
                    {
                        dtNew.ImportRow(drPlan);  //添加数据行
                    }

                }
            }

            DG_List.DataSource = dtNew;
            DG_List.DataBind();
        }


    }

    protected void BT_All_Click(object sender, EventArgs e)
    {
        string strPlanHQL = @"select * from T_ProjectPlan_YYUP ";

        DataTable dtPlan = ShareClass.GetDataSetFromSql(strPlanHQL, "Plan").Tables[0];

        DG_List.DataSource = dtPlan;
        DG_List.DataBind();
    }



    protected void DG_List_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {

            string cmdArges = e.CommandArgument.ToString();
            if (e.CommandName == "select")
            {
                

                //调用推送项目计划方法
                //到T_ProjectPlanRelated_YYUP表找到ProjectID，然后根据T_Project表去复制相应的计划                     TTProjectPlanCopy.aspx?ProjectID=项目号&TemProjectID=模板项目号
                //public string SendProjectPlanToNewProject(string strOldProjectID,string strNewProjectID){}

                try
                {
                    string strProjectPlanSQL = string.Format(@"select * from T_ProjectPlanRelated_YYUP where PlanID = {0}", cmdArges);
                    DataTable dtProjectPlan = ShareClass.GetDataSetFromSql(strProjectPlanSQL, "ProjectPlan").Tables[0];
                    if (dtProjectPlan != null && dtProjectPlan.Rows.Count > 0)
                    {
                        string strTemplateProjectID = ShareClass.ObjectToString(dtProjectPlan.Rows[0]["ProjectID"]);

                        string strSendPlanUrl = string.Format(@"TTProjectPlanCopy.aspx?ProjectID={0}&TemProjectID={1}", HF_ProjectID.Value, strTemplateProjectID);
                        //string strResult = CreateGetHttpResponse(strSendPlanUrl);



                        //添加到记录中
                        string strUpdateSQL = string.Format("update T_Project_YYUP set PlanID = {0},TemProjectID={2} where ProjectID = {1}", cmdArges, HF_ProjectID.Value, strTemplateProjectID);
                        ShareClass.RunSqlCommand(strUpdateSQL);


                        Response.Redirect(strSendPlanUrl); 
                    }

                }
                catch (Exception ex)
                {

                }

                //显示选择的实施工具供下载

                //Response.Redirect("TTDownloadPlanTools_YYUP.aspx?ProjectID=" + HF_ProjectID.Value);           //这个是正常使用的

            }

        }
    }



    /// <summary>  
    /// 创建GET方式的HTTP请求  
    /// </summary>  
    public static string CreateGetHttpResponse(string url)
    {
        HttpWebRequest request = null;


        request = WebRequest.Create(url) as HttpWebRequest;

        request.Method = "GET";

        HttpWebResponse res = request.GetResponse() as HttpWebResponse;



        return res.ToString();
    }

}
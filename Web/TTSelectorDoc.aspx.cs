using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTSelectorDoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ProjectID"]))
            {
                string strProjectID = ShareClass.ObjectToString(Request.QueryString["ProjectID"]);
                DataDocumentBinder(strProjectID);
            }
        }
    }

    private void DataDocumentBinder(string strProjectID)
    {

        string strProjectHQL = string.Format(@"select * from T_Project
                    where ProjectID = {0};
                    select * from T_Project_YYUP
                    where ProjectID = {0};" ,strProjectID);

        DataSet dsProject = ShareClass.GetDataSetFromSql(strProjectHQL, "Project");
        if (dsProject != null)
        {
            string strProductLine = string.Empty;                               //产品线
            string strSubordinateIndustry = string.Empty;                       //行业
            decimal decimalProjectAmount = 0;                             //项目额
            decimal decimalManHour = 0;                                   //工时
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

//            string strDocHQL = string.Format(@"select d.*,r.ModuleIDs,r.ModuleNames from T_DocModuleRelated r
//                        left join T_Document d on r.DocID = d.DocID
//                        where r.ProductLine = '{0}'
//                        and r.SubordinateIndustry = '{1}'
//                        and r.StartAmount <= {2}
//                        and r.EndAmount >= {2}
//                        and r.StartPersonDay <= {3}
//                        and r.EndPersonDay >= {3}", strProductLine, strSubordinateIndustry, decimalProjectAmount, decimalManHour);
            string strDocHQL = string.Format(@"select d.*,r.ModuleIDs,r.ModuleNames,r.StartAmount,r.EndAmount,r.StartPersonDay,r.EndPersonDay from T_DocModuleRelated r
                        left join T_Document d on r.DocID = d.DocID
                        where r.ProductLine = '{0}'
                        and r.SubordinateIndustry = '{1}'", strProductLine, strSubordinateIndustry);

            //加条件类型等于实施导航   where DocType= '实施导航'

            DataTable dtDoc = ShareClass.GetDataSetFromSql(strDocHQL, "Doc").Tables[0];


            DataTable dtNew = dtDoc.Copy();  //复制dt表数据结构
            dtNew.Clear();  //清楚数据

            if (dtDoc != null && dtDoc.Rows.Count > 0)
            {
                foreach (DataRow drDoc in dtDoc.Rows)
                {
                    //判断金额和工时
                    decimal decimalRelatedStartAmount = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drDoc["StartAmount"]), out decimalRelatedStartAmount);
                    decimal decimalRelatedEndAmount = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drDoc["EndAmount"]), out decimalRelatedEndAmount);
                    decimal decimalRelatedStartPersonDay = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drDoc["StartPersonDay"]), out decimalRelatedStartPersonDay);
                    decimal decimalRelatedEndPersonDay = 0;
                    decimal.TryParse(ShareClass.ObjectToString(drDoc["EndPersonDay"]), out decimalRelatedEndPersonDay);

                    if (decimalProjectAmount < decimalRelatedStartAmount)
                    {
                        break;
                    }
                    if (decimalRelatedEndAmount != 0 && decimalProjectAmount > decimalRelatedEndAmount)
                    {
                        break;
                    }
                    if (decimalManHour < decimalRelatedStartPersonDay)
                    {
                        break;
                    }
                    if (decimalRelatedEndPersonDay != 0 && decimalManHour > decimalRelatedEndPersonDay)
                    {
                        break;
                    }

                    string strRelatedModuleIDs = ShareClass.ObjectToString(drDoc["ModuleIDs"]);
                    string strRelatedModuleNames = ShareClass.ObjectToString(drDoc["ModuleNames"]);

                    bool IsYou = true;
                    string[] arrRelatedModuleID = strRelatedModuleIDs.Split(',');
                    for (int i = 0; i < arrRelatedModuleID.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrRelatedModuleID[i]))
                        {
                            if (!strModuleIDs.Contains(arrRelatedModuleID[i]))
                            {
                                IsYou = false;
                                break;
                            }
                        }
                    }
                    if (IsYou) {
                        dtNew.ImportRow(drDoc);  //添加数据行
                    }
                }
            }

            DG_List.DataSource = dtNew;
            DG_List.DataBind();
        }

        
    }

    protected void BT_All_Click(object sender, EventArgs e)
    {
        string strDocHQL = @"select * from T_Document ";
        //加条件类型等于实施导航   where DocType= '实施导航'
        DataTable dtDoc = ShareClass.GetDataSetFromSql(strDocHQL, "Doc").Tables[0];

        DG_List.DataSource = dtDoc;
        DG_List.DataBind();
    }
}
using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWFChartViewJS : System.Web.UI.Page
{
    public string strIdentifyString;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strTemName, strWFDefinition, strWLID, strGUID, strGUIDStep, strNewGUIDStep;
        string strIdentifyString;

        string strUserCode = Session["UserCode"].ToString();

        strWLID = Request.QueryString["WLID"];

        try
        {
            strWLID = Request.QueryString["WLID"];
            strTemName = ShareClass.GetWorkflowTemNameByWLID(strWLID);
        }
        catch
        {
            strWLID = "0";
            strTemName = Request.QueryString["TemName"];
        }

        strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);

        _WFDesignerFrame.Src = "WFDesigner/TTTakeTopWFChartViewJS.aspx?IdentifyString=" + strIdentifyString + "&WLID=" + strWLID;

        strHQL = "Select TemName,WFDefinition From T_WorkFlowTemplate Where TemName = " + "'" + strTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        strWFDefinition = ds.Tables[0].Rows[0][1].ToString().Trim();

        this.Title = Resources.lang.GongZuoLiu + ": " + strTemName + Resources.lang.LiuChengTu;


        if (Page.IsPostBack == false)
        {
            TB_CopyRight.Text = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];
            TB_WFIdentifyString.Text = strIdentifyString;
            TB_WFName.Text = strTemName;

            try
            {
                strHQL = "from WorkFlowTStep as workFlowTStep where workFlowTStep.TemName = " + "'" + strTemName + "'";
                strHQL += " Order by workFlowTStep.SortNumber ASC,workFlowTStep.StepName ASC";
                WorkFlowTStepBLL workFlowTStepBLL = new WorkFlowTStepBLL();
                IList lst = workFlowTStepBLL.GetAllWorkFlowTSteps(strHQL);
                WorkFlowTStep workFlowTStep;

                string strStepName, strNewStepName, strStatus, strSortNumber;
                int intStartIndex;
                for (int i = 0; i < lst.Count; i++)
                {
                    workFlowTStep = (WorkFlowTStep)lst[i];

                    strGUID = workFlowTStep.GUID.Trim();
                    strStepName = workFlowTStep.StepName.Trim();
                    strSortNumber = workFlowTStep.SortNumber.ToString();
                    strStatus = GetWorkFlowStepStatus(strWLID, strSortNumber);

                    if (CheckStepNameIsBelongToGUID(strGUID, strStepName, strWFDefinition))
                    {
                        intStartIndex = strWFDefinition.IndexOf(strGUID, 0) - 250;

                        if (intStartIndex < 0)
                        {
                            intStartIndex = 0;
                        }

                        strGUIDStep = strWFDefinition.Substring(intStartIndex, 250);

                        if (strStatus == "处理中")
                        {
                            //strNewStepName = strStepName + "【" + Resources.lang.JinXingZhong + "】";

                            strNewStepName = strStepName;
                            strNewGUIDStep = strGUIDStep.Replace(strStepName, strNewStepName);
                            strNewGUIDStep = strNewGUIDStep.Replace("attr:{", "attr:{fill:'yellow',");
                            strNewGUIDStep = strNewGUIDStep.Replace("text:{", "text:{fill:'red',");

                            strWFDefinition = strWFDefinition.Replace(strGUIDStep, strNewGUIDStep);
                        }

                        if (strStatus == "通过")
                        {
                            //strNewStepName = strStepName + "【" + Resources.lang.TongGuo + "】";

                            strNewStepName = strStepName;
                            strNewGUIDStep = strGUIDStep.Replace(strStepName, strNewStepName);
                            strNewGUIDStep = strNewGUIDStep.Replace("attr:{", "attr:{fill:'green',");
                            strNewGUIDStep = strNewGUIDStep.Replace("text:{", "text:{fill:'yellow',");

                            strWFDefinition = strWFDefinition.Replace(strGUIDStep, strNewGUIDStep);
                        }

                        if (strStatus == "驳回")
                        {
                            //strNewStepName = strStepName + "【" + Resources.lang.TongGuo + "】";

                            strNewStepName = strStepName;
                            strNewGUIDStep = strGUIDStep.Replace(strStepName, strNewStepName);
                            strNewGUIDStep = strNewGUIDStep.Replace("attr:{", "attr:{fill:'red',");

                            strWFDefinition = strWFDefinition.Replace(strGUIDStep, strNewGUIDStep);
                        }
                    }
                }
            }
            catch
            {
            }

            TB_WFXML.Text = strWFDefinition;
        }
    }

    //检查步骤是不是属于此GUID，防止步骤重命出错
    protected bool CheckStepNameIsBelongToGUID(string strGUID, string strStepName, string strWFDefinition)
    {
        string strGUIDStep;

        if (strWFDefinition.IndexOf(strGUID, 0) >= 0)
        {
            strGUIDStep = strWFDefinition.Substring(strWFDefinition.IndexOf(strGUID, 0), 250);

            if (strGUIDStep.IndexOf(strStepName, 0) >= 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    public string GetWorkFlowStepStatus(string strWLID, string strSortNumber)
    {
        string strHQL;
        string strStatus;
        DataSet ds1;

        strHQL = "Select Status From T_WorkFlowStep Where WLID = " + strWLID + " and SortNumber = " + strSortNumber;
        ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStep");
        if (ds1.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select Status From T_WorkFlowStepBackup Where WLID = " + strWLID + " and SortNumber = " + strSortNumber;
            ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBackup");
        }

        if (ds1.Tables[0].Rows.Count > 0)
        {
            strStatus = ds1.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            strStatus = "";
        }

        return strStatus;
    }
}
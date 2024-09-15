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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowDetailMain_DeiWei : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ID"];
        string strStepID;

        string strWLID;
        string strWLName;
        string strHQL;
        IList lst;

        //设置是否自定义工作流模组模式
        Session["DIYWFModule"] = "NO";

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        strHQL = "from WorkFlowStepDetail as workFlowStepDetail where workFlowStepDetail.ID = " + strID;
        WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();
        lst = workFlowStepDetailBLL.GetAllWorkFlowStepDetails(strHQL);
        WorkFlowStepDetail workFlowStepDetail = (WorkFlowStepDetail)lst[0];

        strStepID = workFlowStepDetail.StepID.ToString();
        strWLID = workFlowStepDetail.WLID.ToString().Trim();

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strWLName = workFlow.WLName.Trim();

        this.Title = Resources.lang.Workflow + ": " + strWLID + " " + strWLName + Resources.lang.ShenPi;
    }
}

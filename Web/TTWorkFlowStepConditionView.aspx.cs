using System; using System.Resources;
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

public partial class TTWorkFlowStepConditionView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strStepID = Request.QueryString["StepID"];

        WorkFlowTStepBLL workFlowTStepBLL = new WorkFlowTStepBLL();
        strHQL = "from WorkFlowTStep as workFlowTStep where workFlowTStep.StepID =" + strStepID;
        lst = workFlowTStepBLL.GetAllWorkFlowTSteps(strHQL);
        WorkFlowTStep workFlowTStep = (WorkFlowTStep)lst[0];

        //this.Title = "工作流步骤：" + strStepID + " " + workFlowTStep.StepName.Trim() + " 步序条件";

        string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack == false)
        {
            strHQL = "from WLTStepCondition as wlTStepCondition where wlTStepCondition.StepID = " + strStepID;
            WLTStepConditionBLL wlTStepConditionBLL = new WLTStepConditionBLL();
            lst = wlTStepConditionBLL.GetAllWLTStepConditions(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }
}

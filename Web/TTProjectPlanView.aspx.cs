using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectPlanView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strPlanID;
        string strHQL;
        IList lst;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        strPlanID = Request.QueryString["PlanID"];

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        if (lst.Count > 0)
        {
            WorkPlan workPlan = (WorkPlan)lst[0];
            //this.Title = Resources.lang.JiHua + ": " + strPlanID + " " + workPlan.Name.Trim() + " 详细内容!";
        }
        else
        {
            Response.Write("此计划不存在，可能已被删除,请检查!");
        }
    }
}

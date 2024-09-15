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

public partial class TTPlanView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPlanID, strPlanName;

        strPlanID = Request.QueryString["PlanID"];

        strHQL = "from Plan as plan where plan.PlanID = " + strPlanID;
        PlanBLL planBLL = new PlanBLL();
        lst = planBLL.GetAllPlans(strHQL);

        Plan plan = (Plan)lst[0];
        strPlanName = plan.PlanName.Trim();

        //this.Title = Resources.lang.JiHua + ": " + strPlanID + " " + strPlanName + " 处理";

         string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack == false)
        {
            DataList2.DataSource = lst;
            DataList2.DataBind();
        }
    }
}
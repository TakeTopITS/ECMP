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
using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strWLID, strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();

        strWLID = Request.QueryString["WLID"];

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack == false)
        {
            strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);

            if (lst.Count > 0)
            {
                DataList2.DataSource = lst;
                DataList2.DataBind();
            }
            else
            {
                Response.Write("此工作流不存在，可能已被删除，请检查！");
            }
        }
    }
}

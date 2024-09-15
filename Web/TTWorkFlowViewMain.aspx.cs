using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;

public partial class TTWorkFlowViewMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strWLName;
        string strHQL;
        IList lst;
        string strUserCode;

        string strWLID = Request.QueryString["WLID"];
        if (strWLID == "0")
        {
            return;
        }

        strUserCode = Session["UserCode"].ToString();

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        if (lst.Count == 0)
        {
            Response.Redirect("TTWorkFlowViewMainBackup.aspx?WLID=" + strWLID);
        }

        WorkFlow workFlow = (WorkFlow)lst[0];
        strWLName = workFlow.WLName.Trim();

        this.Title = Resources.lang.GongZuoLiu + strWLID + " " + strWLName;
    }
}

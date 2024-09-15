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

public partial class TTMyWorkDetailMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strWLID = Request.QueryString["WLID"];

        string strWLName;
        string strHQL;
        IList lst;

        //设置是否自定义工作流模组模式
        Session["DIYWFModule"] = "NO";

        string strUserCode, strCreatorCode;
        strUserCode = Session["UserCode"].ToString();

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strWLName = workFlow.WLName.Trim();

        this.Title = Resources.lang.WoDeGongZuoLiu + ": " + strWLID + " " + strWLName;

        strCreatorCode = workFlow.CreatorCode.Trim();

        if (strUserCode != strCreatorCode )
        {
            string strErrorMsg = Resources.lang.ZZJGNBSZLCDFQRBNCKCLCQJC;
            Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg=" + strErrorMsg);
        }
    }
}

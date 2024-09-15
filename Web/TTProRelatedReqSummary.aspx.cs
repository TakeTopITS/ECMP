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

public partial class TTProRelatedReqSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];

        string strHQL;
        IList lst;
        string strUserName;

        //this.Title = Resources.lang.Project + strProjectID + " 相关需求";

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack != true)
        {
            strHQL = "from Requirement as requirement where requirement.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID  = " + strProjectID + ")";
            RequirementBLL requirementBLL = new RequirementBLL();

            lst = requirementBLL.GetAllRequirements(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + Resources.lang.XuQiuBaoBiao;
            string strCmdText = "select Status as XName,count(*) as YNumber from T_Requirement ";
            strCmdText += " where ReqID in (select ReqID from T_RelatedReq where ProjectID  = " + strProjectID + ")  Group By Status";

            string strChartTitle = "ReportView";
            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            //ShareClass.CreateAnalystColumnChart(strCmdText, Chart1, SeriesChartType.Column, strChartTitle, "XName", "YNumber", "Default");
            //Chart1.Visible = true;
        }
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}

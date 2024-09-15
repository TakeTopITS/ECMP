using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using System.Text;

public partial class TTRCJProjectSummaryPerformance : System.Web.UI.Page
{
    private int ProjectId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);

        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();

            try
            {

                InitDataList();

            }
            catch (Exception exp)
            {
                lb_showMessage.Text = "错误提示：操作出现异常： " + exp.Message;
            }
        }
    }

    protected void InitDataList()
    {
        try
        {
            StringBuilder sb = new StringBuilder("From RCJProjectSummaryPerformance as rCJProjectSummaryPerformance where projectid=");
            sb.Append(ProjectId.ToString());
            sb.Append(" order by ProjectMonth");

            RCJProjectSummaryPerformanceBLL pspBll = new RCJProjectSummaryPerformanceBLL();
            IList list;
            list = pspBll.GetAllRCJProjectSummaryPerformances(sb.ToString());

            GridView1.DataSource = list;
            GridView1.DataBind();

            string strChartTitle = "ReportView";
            string strHQL;

            strHQL = "Select ProjectMonth as XName, ProjectBCWP as YNumber,ProjectACWP as ZNumber From T_RCJProjectSummaryPerformance  Where ProjectID = " + ProjectId.ToString() + " Order By ProjectMonth ASC";
            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        }
        catch (Exception exp)
        {
            lb_showMessage.Text = "错误提示：操作出现异常： " + exp.Message;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(ViewState["UrlReferrer"].ToString());
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int idx = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "RefreshButton")
        {
            try
            {
                //选择行进行刷新
                StringBuilder sb = new StringBuilder("exec Pro_TotalCostPerformance ");
                sb.Append(ProjectId.ToString());
                sb.Append(",");
                sb.Append(GridView1.Rows[idx].Cells[2].Text);
                sb.Append(",");
                sb.Append(GridView1.Rows[idx].Cells[3].Text);


                ShareClass.RunSqlCommand(sb.ToString());

                InitDataList();

            }
            catch (Exception exp)
            {
                lb_showMessage.ForeColor = System.Drawing.Color.Red;
                lb_showMessage.Text = "消息提示：" + exp.Message;
            }
        }
    }
}
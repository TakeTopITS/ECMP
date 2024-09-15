using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

public partial class TTRCJProjectWorkDetailsLog : System.Web.UI.Page
{
    private int ProjectId = 0;
    private int ItemType = 0;
    private int itemno = 0;
    private int AdjustId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        ItemType = Convert.ToInt32(Request.QueryString["itemtype"]);
        itemno = Convert.ToInt32(Request.QueryString["itemno"]);
        AdjustId = Convert.ToInt32(Request.QueryString["adjustid"]); 

        InitDataLog();
    }

    private void InitDataLog()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkDetailsLog where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(ItemType);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and AdjustId=");
        sql.Append(AdjustId.ToString());
        sql.Append(" order by ChangedTime desc");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkDetailsLog");

        gvConfirmWorkLog.DataSource = ds;
        gvConfirmWorkLog.DataBind();
    }
    protected void gvConfirmWorkLog_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }
    protected void gvConfirmWorkLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvConfirmWorkLog.PageIndex = e.NewPageIndex;
        gvConfirmWorkLog.SelectedIndex = -1;
        InitDataLog();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["UrlReferrer_Details"] != null)
            Response.Redirect(Session["UrlReferrer_Details"].ToString());
    }
}
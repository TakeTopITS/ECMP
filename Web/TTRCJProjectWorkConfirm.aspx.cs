using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTRCJProjectWorkConfirm : System.Web.UI.Page
{

    private int ProjectId = 0;
    private int ItemType = 0;
    private int itemno = 0;
    private int AdjustId = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        ItemType = Convert.ToInt32(Request.QueryString["itemtype"]);
        itemno = Convert.ToInt32(Request.QueryString["itemno"]);
        AdjustId = Convert.ToInt32(Request.QueryString["adjustid"]);

        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
                InitDataLog();
        }
    }

    private void InitDataLog()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkConfirmLog where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(ItemType);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and AdjustId=");
        sql.Append(AdjustId.ToString());
        sql.Append(" order by ChangedTime desc");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkConfirmLog");

        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.SelectedIndex = -1;
        InitDataLog();
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["UrlReferrer_Details"] != null)
            Response.Redirect(Session["UrlReferrer_Details"].ToString());
    }
}
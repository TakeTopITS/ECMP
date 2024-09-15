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

public partial class TTRCJProjectWorkMoney : System.Web.UI.Page
{
    private string UserCode = "";
    private int ProjectId = 0;
    private int ItemType = 0;
    private int itemno = 0;
    private decimal TotalBudget = 0;
    private decimal itemnum = 0;
    private int confirmID = 0;
    private string ItemName = string.Empty;
    private string ItemContent = string.Empty;
    private double workNum = 0; //已确认的工作量
    private int AdjustId = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        ItemType = Convert.ToInt32(Request.QueryString["itemtype"]);
        itemno = Convert.ToInt32(Request.QueryString["itemno"]);
        AdjustId = Convert.ToInt32(Request.QueryString["adjustid"]);

        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
                InitDataLog(itemno);
        }
    }

    private void InitDataLog(int itemno)
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkMoneyLog where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(ItemType);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and AdjustID=");
        sql.Append(AdjustId.ToString());
        sql.Append(" order by ChangedTime desc ");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkMoneyLog");

        GridView2.DataSource = ds;
        GridView2.DataBind();
    }



    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.SelectedIndex = -1;
        InitDataLog(itemno);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["UrlReferrer_Details"] != null)
            Response.Redirect(Session["UrlReferrer_Details"].ToString());
    }
}
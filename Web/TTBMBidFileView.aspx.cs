using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMBidFileView : System.Web.UI.Page
{
    string strBidPlanID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strBidPlanID = Request.QueryString["BidPlanID"];
        string strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadBMBidFileList(strBidPlanID);
        }
    }

    protected void LoadBMBidFileList(string strBidPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_BMBidFile Where BidPlanID='" + strBidPlanID + "' Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidFile");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = lbl_sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidFile");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}
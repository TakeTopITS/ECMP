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

public partial class TTBMBidTemplateFileView : System.Web.UI.Page
{
    string strBidPlanID;
    private string strSupplierType;

    protected void Page_Load(object sender, EventArgs e)
    {
        strBidPlanID = Request.QueryString["BidPlanID"];
        strSupplierType = Request.QueryString["SupplierType"];
        string strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadBMBidTemplateFileList(strBidPlanID,strSupplierType);
        }
    }

    protected void LoadBMBidTemplateFileList(string strBidPlanID,string strSupplierType)
    {
        string strHQL;


        strHQL = "Select * From T_BMBidTemplateFile Where SupplierType = '" + strSupplierType + "'";
        strHQL += " And BidPlanID = " + strBidPlanID;
        strHQL  +=  " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = lbl_sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidTemplateFile");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}
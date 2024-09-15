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

public partial class TTBMSupplierBidRecordFileView : System.Web.UI.Page
{
    string strSupplierBidID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strSupplierBidID = Request.QueryString["SupplierBidID"];

        string strUserCode = Session["UserCode"].ToString();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadBMBMSupplierBidRecordFileList(strSupplierBidID);
        }
    }

    protected void LoadBMBMSupplierBidRecordFileList(string strSupplierBidID)
    {
        string strHQL;

        strHQL = "Select * From T_BMSupplierBidRecordFile Where SupplierBidRecordID In (Select ID From T_BMSupplierBidRecord Where SupplierBidID = " + strSupplierBidID + ")";
        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBMSupplierBidRecordFile");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = lbl_sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBMSupplierBidRecordFile");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}
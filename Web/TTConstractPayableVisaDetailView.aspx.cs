using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTConstractPayableVisaDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strVisaID;

        strVisaID = Request.QueryString["VisaID"];

        LoadConstractPayableVisaDetail(strVisaID);
    }


    protected void LoadConstractPayableVisaDetail(string strVisaID)
    {
        string strHQL = "Select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}
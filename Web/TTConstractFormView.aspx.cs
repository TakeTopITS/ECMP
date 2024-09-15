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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTConstractFormView : System.Web.UI.Page
{
    string strConstractCode;

    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserCode = Session["UserCode"].ToString();


        //this.Title = "物料销售单";

        strConstractCode = Request.QueryString["ConstractCode"];

        if (Page.IsPostBack != true)
        {
            LoadConstract(strConstractCode);
        }
    }

    protected void LoadConstract(string strConstractCode)
    {
        string strHQL;

        strHQL = "Select * From T_Constract where ConstractCode = " + "'" + strConstractCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");

        DataList20.DataSource = ds;
        DataList20.DataBind();

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

}
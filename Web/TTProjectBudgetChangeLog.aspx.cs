using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTProjectBudgetChangeLog : System.Web.UI.Page
{
    string strBudgetID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strBudgetID = Request.QueryString["BudgetID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadProjectBudgetChangeLog(strBudgetID);

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
        }
    }

    protected void LoadProjectBudgetChangeLog(string strBudgetID)
    {
        string strHQL;
        
        strHQL = "Select * From T_ProjectBudgetChangeLog Where BudgetID = " + strBudgetID;
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectBudgetChangeLog");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}

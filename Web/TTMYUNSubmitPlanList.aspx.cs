using System; using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTMYUNSubmitPlanList : System.Web.UI.Page
{
    string strUserCode;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
      
        strUserCode = Session["UserCode"].ToString();


        //this.Title = "我到期没提交审核的计划";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            PlanBLL planBLL = new PlanBLL();

            strHQL = " Select * From T_Plan Where to_char(StartTime,'yyyymmdd') <= to_char(now(),'yyyymmdd') ";
            strHQL += " and  to_char(EndTime,'yyyymmdd') >= to_char(now(),'yyyymmdd')  and  SubmitTime = '' and Status = '新建'  ";
            strHQL += " and CreatorCode =  " + "'" + strUserCode + "'";
            strHQL += " Order By StartTime DESC,EndTime ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;
        }
    }
}
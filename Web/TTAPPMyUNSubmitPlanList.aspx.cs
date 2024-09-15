using ProjectMgt.BLL;
using System;
using System.Data;
using System.Web.UI;

public partial class TTAPPMyUNSubmitPlanList : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack == false)
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
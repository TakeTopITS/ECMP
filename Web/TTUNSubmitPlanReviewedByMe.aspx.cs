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

public partial class TTUNSubmitPlanReviewedByMe : System.Web.UI.Page
{
    string strUserCode;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();

        //this.Title = "待我审核但没提交的计划";
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            strHQL = " Select * From T_Plan Where to_char(StartTime,'yyyymmdd') <= to_char(now(),'yyyymmdd') ";
            strHQL += " and to_char(EndTime,'yyyymmdd') >= to_char(now(),'yyyymmdd') ";
            strHQL += " and (PlanID in (Select PlanID From T_Plan_RelatedLeader Where LeaderCode =  '" +strUserCode+ "') ";
            strHQL += " or UserCode in (Select UnderCode From T_MemberLevel Where UserCode ='" + strUserCode + "'))";
            strHQL += " and UserCode <> " + "'" +strUserCode+ "'" + " and SubmitTime = '' and Status = '新建' ";
            strHQL += " Order By StartTime DESC,EndTime ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;
        }
    }
}
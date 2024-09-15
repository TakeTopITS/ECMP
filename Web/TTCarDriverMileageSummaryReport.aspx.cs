using System; using System.Resources;
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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCarDriverMileageSummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "驾驶员出差里程报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","驾驶员出车里程报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            //strHQL = "Select * From V_CarDriverMileageSummary  where ";
            //strHQL += " DriverCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_CarDriverMileageSummary");
            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //LB_Sql.Text = strHQL;

            //strHQL = "Select TotalMileage From V_CarDriverMileageSummary  where ";
            //strHQL += " DriverCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_CarDriverMileageSummary");
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    LB_TotalMileage.Text = ds.Tables[0].Rows[0][0].ToString();
            //}
            //else
            //{
            //    LB_TotalMileage.Text = "0";
            //}
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
   
        string strDepartString, strStartTime, strEndTime;
        string strUserCode, strDriverName;


        strDriverName = TB_DriverName.Text.Trim();
        strDriverName = "%" + strDriverName + "%";

        strUserCode = LB_UserCode.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select * From V_CarDriverMileageSummary  where ";
        strHQL += " DriverCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " and DriverName like " + "'" + strDriverName + "'";
        strHQL += " and DepartDay > " + "'" + strStartTime + "'" + " and DepartDay <= " + "'" + strEndTime + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_CarDriverMileageSummary");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        strHQL = "Select TotalMileage From V_CarDriverMileageSummary  where ";
        strHQL += " DriverCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " and DriverName like " + "'" + strDriverName + "'";
        strHQL += " and DepartDay > " + "'" + strStartTime + "'" + " and DepartDay <= " + "'" + strEndTime + "'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "V_CarDriverMileageSummary");
        if (ds.Tables[0].Rows.Count > 0)
        {
            LB_TotalMileage.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            LB_TotalMileage.Text = "0";
        }
    }
  
}

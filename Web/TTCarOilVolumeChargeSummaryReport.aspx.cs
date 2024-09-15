using ProjectMgt.BLL;
using System;
using System.Data;
using System.Web.UI;

public partial class TTCarOilVolumeChargeSummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "车辆油耗统计报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = " 车辆油耗统计报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            //strHQL = "Select * From V_CarOilVolumeChargeSummary  where ";
            //strHQL += " CarCode in (Select CarCode From T_CarInformation Where BelongDepartCode in " + strDepartString + ")";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CarOilVolueChargeSummary");
            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //LB_Sql.Text = strHQL;

            //strHQL = "Select Sum(TotalOilCharge) / sum(TotalCurrentMileage) as TotalAverageEconomy From V_CarOilVolumeChargeSummary  where ";
            //strHQL += " CarCode in (Select CarCode From T_CarInformation Where BelongDepartCode in " + strDepartString + ")";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CarOilVolueChargeSummary");
            //LB_TotalAverageEconomy.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString, strStartTime, strEndTime;
        string strUserCode, strCarCode;

        strCarCode = TB_CarCode.Text.Trim();
        strCarCode = "%" + strCarCode + "%";

        strUserCode = LB_UserCode.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select * From V_CarOilVolumeChargeSummary  where ";
        strHQL += " CarCode in (Select CarCode From T_CarInformation Where BelongDepartCode in " + strDepartString + ")";
        strHQL += " and CarCode like " + "'" + strCarCode + "'";
        strHQL += " and DepartDay > " + "'" + strStartTime + "'" + " and DepartDay <= " + "'" + strEndTime + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CarOilVolueChargeSummary");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        strHQL = "Select Sum(TotalOilCharge) / sum(TotalCurrentMileage) as TotalAverageEconomy From V_CarOilVolumeChargeSummary  where ";
        strHQL += " CarCode in (Select CarCode From T_CarInformation Where BelongDepartCode in " + strDepartString + ")";
        strHQL += " and CarCode like " + "'" + strCarCode + "'";
        strHQL += " and DepartDay > " + "'" + strStartTime + "'" + " and DepartDay <= " + "'" + strEndTime + "'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_CarOilVolueChargeSummary");
        LB_TotalAverageEconomy.Text = ds.Tables[0].Rows[0][0].ToString();
    }

}

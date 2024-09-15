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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserAttendancePosition : System.Web.UI.Page
{
    string strUserCode, strUserName, strMemberUserCode, strAttendanceTime;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strMemberUserCode = Request.QueryString["MemberUserCode"].Trim();
        strAttendanceTime = Request.QueryString["AttendanceTime"].Trim();
        strAttendanceTime = DateTime.Parse(strAttendanceTime).ToString("yyyyMMdd");

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadMembersPosition(strMemberUserCode,strAttendanceTime);
        }
    }
    

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadMembersPosition(string strUserCode,string strAttendanceTime)
    {
        string strHQL;

        strHQL = "Select * From T_UserPositionByGPS Where UserCode = " + "'" + strUserCode + "'";
        strHQL += " And to_char(CreateTime,'yyyymmdd') = " + "'" + strAttendanceTime + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();


        LB_Sql.Text = strHQL;
    }


}

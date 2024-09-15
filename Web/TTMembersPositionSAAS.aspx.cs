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

public partial class TTMembersPositionSAAS : System.Web.UI.Page
{
    string strUserCode, strUserName;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012


        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

     
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Position", DataGrid1);

            LoadMembersPosition(strUserCode);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;


        strHQL = "Select * From T_UserPositionByGPS Where Usercode = " + "'" + strOperatorCode + "'";
        strHQL += " and LeaderCode = '" + strUserCode + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadMembersPosition(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_UserPositionByGPS Where Usercode in (Select UnderCode From T_MemberLevel Where UserCode = " + "'" + strUserCode + "') ";
        strHQL += " and LeaderCode = '" + strUserCode + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }
}

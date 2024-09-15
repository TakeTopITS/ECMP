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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAlluserPosition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        string strUserName, strDepartCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有成员位置", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "查看所有成员位置---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

          

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            strHQL = "from ProjectMember as projectMember ";
            strHQL += " Where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Order by projectMember.SortNumber ASC";
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LoadUserPositionByDepartString(strDepartString);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strDepartName;
        int intCount;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            intCount = ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);

            LB_DepartCode.Text = strDepartCode;

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" ;
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LoadUserPositionByDepartCode(strDepartCode);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        strHQL = "Select * From T_UserPositionByGPS Where Usercode = " + "'" + strOperatorCode + "'" + " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
      

        string strStartTime, strEndTime;
        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        DataGrid2.CurrentPageIndex = 0;
       
        string strUserCode = "%" + TB_UserCode.Text.Trim() + "%";
        string strUserName = "%" + TB_UserName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strHQL = "Select * From T_UserPositionByGPS where to_char(CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and UserCode Like " + "'" + strUserCode + "'" + " and UserName Like " + "'" + strUserName + "'";
        strHQL += " and UserCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
     
        LB_Sql.Text = strHQL;

        LB_DepartCode.Text = "";
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadUserPositionByDepartCode(string strDepartCode)
    {
        string strHQL;

        strHQL = "Select * From T_UserPositionByGPS Where Usercode in (Select UserCode From T_ProjectMember Where DepartCode = " + "'" + strDepartCode + "') Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadUserPositionByDepartString(string strDepartString)
    {
        string strHQL;

        strHQL = "Select * From T_UserPositionByGPS Where Usercode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ") Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserPositionByGPS");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected string GetUserStatus(string strUserCode)
    {
        string strHQL = "From SystemActiveUser as systemActiveUser where systemActiveUser.UserCode = '" + strUserCode.Trim() + "'";
        SystemActiveUserBLL systemActiveUserBLL = new SystemActiveUserBLL();
        IList lst = systemActiveUserBLL.GetAllSystemActiveUsers(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            return "已开通";
        }
        else
        {
            return "未开通";
        }
    }
}
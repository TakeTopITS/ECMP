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

public partial class TTAllCollaboration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有协作", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            LB_QueryScope.Text = Resources.lang.StatusAll;

            CollaborationBLL collaborationBLL = new CollaborationBLL();

            strHQL = "select * from T_Collaboration " ;
            strHQL += " Where CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by CoID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");  

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;

            HL_AllCollaborationBackup.NavigateUrl = "TTAllCollaborationBackup.aspx";
        }
    }

    protected void BT_AllCollaboration_Click(object sender, EventArgs e)
    {
        string strHQL;
      
        string strUserCode, strUserName;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();

        string strDepartString = LB_DepartString.Text.Trim();
        strHQL = "select * from T_Collaboration";
        strHQL += " Where CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " +  strDepartString + ")";
        strHQL += " Order by CoID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");         

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }
    

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");      

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }


    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }

  
}

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


public partial class TTAppCollaboration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "协作", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack != true)
        {
            CollaborationBLL collaborationBLL = new CollaborationBLL();

            strHQL = "select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
            strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
            strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
            strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
            strHQL += " UNION ";
            strHQL += " select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
            strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
            strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
            strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
            strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
            strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " )) Order by CoID DESC";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");
           
            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;

            strHQL = "from Collaboration as collaboration where ltrim(rtrim(collaboration.Status)) <> '关闭' and  collaboration.CoID in ";
            strHQL += "(Select collaborationMember.CoID from CollaborationMember as collaborationMember where collaborationMember.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " Order by collaboration.CoID DESC";
            lst = collaborationBLL.GetAllCollaborations(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;

            strHQL = "from Collaboration as collaboration where collaboration.CreatorCode =" + "'" + strUserCode + "'" + " Order By collaboration.CoID DESC";
            lst = collaborationBLL.GetAllCollaborations(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql3.Text = strHQL;
        }
    }

    protected void BT_MakeCollaboration_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTAppMakeCollaboration.aspx");
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;
        IList lst;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;
        IList lst;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
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
}

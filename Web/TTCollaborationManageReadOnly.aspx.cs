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

public partial class TTCollaborationManageReadOnly : System.Web.UI.Page
{
    //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)2013-5-18
    string strRelatedType, strRelatedID, strRelatedCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName;

        //this.Title = "我的协作---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "我的协作", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)2013-5-18
        strRelatedType = Request.QueryString["RelatedType"];
        if (strRelatedType == null)
        {
            strRelatedType = "OTHER";
        }

        strRelatedID = Request.QueryString["RelatedID"];
        if (strRelatedID == null)
        {
            strRelatedID = "0";
        }

        strRelatedCode = Request.QueryString["RelatedCode"];
        if (strRelatedCode == null)
        {
            strRelatedCode = "";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_QueryScope.Text = Resources.lang.StatusAll;

            CollaborationBLL collaborationBLL = new CollaborationBLL();

            strHQL = "select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
            strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
            strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
            strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
            if (!string.IsNullOrEmpty(strRelatedCode))
            {
                strHQL += " and RelatedCode = '" + strRelatedCode + "'";
            }
            strHQL += " UNION ";
            strHQL += " select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
            strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
            strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
            strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
            strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
            strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " )) ";
            if (!string.IsNullOrEmpty(strRelatedCode))
            {
                strHQL += " and RelatedCode = '" + strRelatedCode + "'";
            }
            strHQL += " Order by CoID DESC";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;

            strHQL = "from Collaboration as collaboration where ltrim(rtrim(collaboration.Status)) <> '关闭' and  collaboration.CoID in ";
            strHQL += "(Select collaborationMember.CoID from CollaborationMember as collaborationMember where collaborationMember.UserCode = " + "'" + strUserCode + "'" + ")";
            if (!string.IsNullOrEmpty(strRelatedCode))
            {
                strHQL += " and collaboration.RelatedCode = '" + strRelatedCode + "'";
            }
            strHQL += " Order by collaboration.CoID DESC";
            lst = collaborationBLL.GetAllCollaborations(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;

            strHQL = "from Collaboration as collaboration where collaboration.CreatorCode =" + "'" + strUserCode + "'";
            if (!string.IsNullOrEmpty(strRelatedCode))
            {
                strHQL += " and collaboration.RelatedCode =" + "'" + strRelatedCode + "'";
            }
            strHQL += " Order By collaboration.CoID DESC";
            lst = collaborationBLL.GetAllCollaborations(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql3.Text = strHQL;
        }
    }

    protected void BT_MakeCollaboration_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTMakeCollaboration.aspx?RelatedType=WORKFLOW&RelatedID=0&RelatedCode=" + strRelatedCode);
    }

    protected void BT_AllCollaboration_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strUserCode, strUserName;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        strHQL = "select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationMember A,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and A.UserCode not in (select C.UserCode from T_CollaborationLog C where C.CoID = B.CoID)) ";
        if (!string.IsNullOrEmpty(strRelatedCode))
        {
            strHQL += " and RelatedCode = '" + strRelatedCode + "'";
        }
        strHQL += " UNION ";
        strHQL += " select * from T_Collaboration where rtrim(ltrim(status)) <> '关闭' and  CoID in ( ";
        strHQL += " select A.CoID from T_CollaborationLog A ,T_CollaborationLog B ";
        strHQL += " where A.CoID = B.CoID and  A.CreateTime > B.CreateTime and A.UserCode <> B.UserCode ";
        strHQL += " and A.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and A.CreateTime> (select max(C.CreateTime) from T_CollaborationLog C where C.CoID = A.CoID  ";
        strHQL += " and C.UserCode= " + "'" + strUserCode + "'" + " ))  ";
        if (!string.IsNullOrEmpty(strRelatedCode))
        {
            strHQL += " and RelatedCode = '" + strRelatedCode + "'";
        }
        strHQL += " Order by CoID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "from Collaboration as collaboration where ltrim(rtrim(collaboration.Status)) <> '关闭' and collaboration.CoID in ";
        strHQL += "(Select collaborationMember.CoID from CollaborationMember as collaborationMember where collaborationMember.UserCode = " + "'" + strUserCode + "'" + ")";
        if (!string.IsNullOrEmpty(strRelatedCode))
        {
            strHQL += " and RelatedCode = '" + strRelatedCode + "'";
        }
        strHQL += " Order by collaboration.CoID DESC";
        lst = collaborationBLL.GetAllCollaborations(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;

        strHQL = "from Collaboration as collaboration where collaboration.CreatorCode =" + "'" + strUserCode + "'";
        if (!string.IsNullOrEmpty(strRelatedCode))
        {
            strHQL += " and RelatedCode = '" + strRelatedCode + "'";
        }
        strHQL += " Order By collaboration.CoID DESC";
        lst = collaborationBLL.GetAllCollaborations(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql3.Text = strHQL;
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
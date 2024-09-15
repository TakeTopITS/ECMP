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
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppCollaborationDetailList : System.Web.UI.Page
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

        string strCoID;
        string strCreatorCode;

        strCoID = Request.QueryString["CoID"];

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);
        Collaboration collaboration = (Collaboration)lst[0];

        strCreatorCode = collaboration.CreatorCode.Trim();

        Timer1.Interval = 3000;

        if (Page.IsPostBack == false)
        {
            LoadCollaborationLog(strCoID);
            LoadRelatedDoc(strCoID);

            LB_CoID.Text = strCoID;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        string strCoID;

        strCoID = LB_CoID.Text.Trim();

        LoadCollaborationLog(strCoID);
        LoadRelatedDoc(strCoID);
    }

    protected void LoadCollaborationLog(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CollaborationLog as collaborationLog where collaborationLog.CoID = " + strCoID + " Order by collaborationLog.LogID DESC";
        CollaborationLogBLL collaborationLogBLL = new CollaborationLogBLL();
        lst = collaborationLogBLL.GetAllCollaborationLogs(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();
    }

    protected void LoadRelatedDoc(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Document as document where document.RelatedType = '协作' and document.RelatedID = " + strCoID;
        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}

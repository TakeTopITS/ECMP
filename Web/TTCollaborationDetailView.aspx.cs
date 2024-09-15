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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCollaborationDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode;

        string strCoID;
        string strCreatorCode;

        strUserCode = Session["UserCode"].ToString();
        strCoID = Request.QueryString["CoID"];

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        Collaboration collaboration = (Collaboration)lst[0];

        strCreatorCode = collaboration.CreatorCode.Trim();

        //this.Title = "协作：" + strCoID + " " + collaboration.CollaborationName.Trim() + " 记录";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true); if (Page.IsPostBack == false)
        {
            LB_CollaborationName.Text = strCoID + " " + collaboration.CollaborationName.Trim();

            DataList2.DataSource = lst;
            DataList2.DataBind();
         
            LB_Creator.Text = collaboration.CreatorCode.Trim() + " " + collaboration.CreatorName.Trim();
            LB_CreateTime.Text = collaboration.CreateTime.ToString();
            LB_Status.Text = collaboration.Status.Trim();

            strHQL = "from CollaborationMember as collaborationMember where collaborationMember.CoID = " + strCoID;
            CollaborationMemberBLL collaborationMemberBLL = new CollaborationMemberBLL();
            lst = collaborationMemberBLL.GetAllCollaborationMembers(strHQL);
            RP_Attendant.DataSource = lst;
            RP_Attendant.DataBind();        

            LoadCollaborationLog(strCoID);
            LoadRelatedDoc(strCoID);
        }
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

    protected void UpdateLastLoginTime(string strUserCode, string strCoID)
    {
        string strHQL;
        IList lst;
        int intMemID;

        strHQL = "from CollaborationMember as collaborationMember where collaborationMember.CoID = " + strCoID + " and collaborationMember.UserCode = " + "'" + strUserCode + "'";
        CollaborationMemberBLL collaborationMemberBLL = new CollaborationMemberBLL();
        lst = collaborationMemberBLL.GetAllCollaborationMembers(strHQL);

        CollaborationMember collaborationMember = (CollaborationMember)lst[0];
        collaborationMember.LastLoginTime = DateTime.Now;
        intMemID = collaborationMember.MemID;

        try
        {
            collaborationMemberBLL.UpdateCollaborationMember(collaborationMember, intMemID);
        }
        catch
        {
        }
    }

    protected void UpdateCollaborationStatus(string strCoID)
    {
        string strHQL, strStatus;
        IList lst;

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        Collaboration collaboration = (Collaboration)lst[0];

        strStatus = collaboration.Status.Trim();

        if (strStatus == "新建")
        {
            collaboration.Status = "处理中";

            try
            {
                collaborationBLL.UpdateCollaboration(collaboration, int.Parse(strCoID));
            }
            catch
            {
            }
        }
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

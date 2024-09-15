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
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
public partial class TTTakeTopIMDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strPhotoURL;
        string strCoID, strChatterCode;

        strCoID = Request.QueryString["CoID"];
        strChatterCode = Request.QueryString["ChatterCode"];

        strUserCode = Session["UserCode"].ToString();

        Timer1.Interval = 3000;

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            LoadCollaborationLog(strCoID);
            LoadRelatedDoc(strCoID);
            LoadRelatedMember(strCoID);

            if (strCoID != "0")
            {
                LB_CoID.Text = strCoID;
                LoadCollaboration(strCoID);
            }
            else
            {
                LB_CoID.Text = "0";
            }

            strPhotoURL = GetUserPhotoURL(strChatterCode);
            if (strPhotoURL != "")
            {
                IM_MemberPhoto.ImageUrl = strPhotoURL;
            }
            else
            {
                IM_MemberPhoto.ImageUrl = "~/Images/DefaultUserPhoto.png";
            }

            LB_ChatterCode.Text = strChatterCode;
            LB_ChatterName.Text = ShareClass.GetUserName(strChatterCode);
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        string strUserCode;
        string strCoID, strChatterCode;
        string strPhotoURL;

        strUserCode = Session["UserCode"].ToString();
        strChatterCode = LB_ChatterCode.Text.Trim();

        strCoID = LB_CoID.Text.Trim();

        if (strCoID != "0")
        {
            strChatterCode = GetLastestChartterCode(strCoID, strUserCode, strChatterCode);
            strPhotoURL = GetUserPhotoURL(strChatterCode);
            if (strPhotoURL != "")
            {
                IM_MemberPhoto.ImageUrl = strPhotoURL;
            }
            else
            {
                IM_MemberPhoto.ImageUrl = "~/Images/DefaultUserPhoto.png";
            }

            LB_ChatterName.Text = ShareClass.GetUserName(strChatterCode);

            LoadCollaborationLog(strCoID);
            LoadRelatedDoc(strCoID);
            LoadRelatedMember(strCoID);
        }
    }

    protected string GetLastestChartterCode(string strCoID, string strUserCode, string strChatterCode)
    {
        string strHQL;

        strHQL = "Select UserCode From T_CollaborationLog Where CoID = " + strCoID;
        strHQL += " and  UserCode <> " + "'" + strUserCode + "'";
        strHQL += " Order By LogID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationLog");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return strChatterCode;
        }
    }

    protected void LoadCollaboration(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        DataList2.DataSource = lst;
        DataList2.DataBind();
    }

    protected string LoadCollaborationLog(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CollaborationLog as collaborationLog where collaborationLog.CoID = " + strCoID;
        strHQL += " and rtrim(ltrim(collaborationLog.LogContent)) <> '' ";
        strHQL += " Order by collaborationLog.LogID DESC";
        CollaborationLogBLL collaborationLogBLL = new CollaborationLogBLL();
        lst = collaborationLogBLL.GetAllCollaborationLogs(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();

        if (lst.Count > 0)
        {
            return ((CollaborationLog)lst[0]).UserCode;
        }
        else
        {
            return "";
        }
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

    protected void LoadRelatedMember(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CollaborationMember as collaborationMember where collaborationMember.CoID = " + strCoID;
        strHQL += " Order By MemID ASC";
        CollaborationMemberBLL collaborationMemberBLL = new CollaborationMemberBLL();
        lst = collaborationMemberBLL.GetAllCollaborationMembers(strHQL);

        RP_Attendant.DataSource = lst;
        RP_Attendant.DataBind();
    }

    protected Collaboration GetCollaboration(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        Collaboration collaboration = new Collaboration();

        if (lst.Count > 0)
        {
            DataList2.DataSource = lst;
            DataList2.DataBind();

            collaboration = (Collaboration)lst[0];
            return collaboration;
        }
        else
        {
            return null;
        }
    }

    protected string GetUserPhotoURL(string strUserCode)
    {
        string strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember.PhotoURL.Trim();
    }
}

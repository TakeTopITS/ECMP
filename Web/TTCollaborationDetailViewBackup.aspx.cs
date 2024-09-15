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

public partial class TTCollaborationDetailViewBackup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode;

        string strCoID;
        string strCreatorCode;

        strUserCode = Session["UserCode"].ToString();
        strCoID = Request.QueryString["CoID"];

        strHQL = "Select * from T_CollaborationBackup where CoID = " + strCoID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Collaboration");
        strCreatorCode = ds.Tables[0].Rows[0]["CreatorCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_CollaborationName.Text = strCoID + " " + ds.Tables[0].Rows[0]["CollaborationName"].ToString(); 

            DataList2.DataSource = ds;
            DataList2.DataBind();

            LB_Creator.Text = ds.Tables[0].Rows[0]["CreatorCode"].ToString().Trim() + " " + ds.Tables[0].Rows[0]["CreatorName"].ToString().Trim();
            LB_CreateTime.Text = ds.Tables[0].Rows[0]["CreateTime"].ToString();
            LB_Status.Text = ds.Tables[0].Rows[0]["Status"].ToString().Trim();

            strHQL = "Select * from T_CollaborationMemberBackup where CoID = " + strCoID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationMemberBackup");
            RP_Attendant.DataSource = ds;
            RP_Attendant.DataBind();

            LoadCollaborationLog(strCoID);
            LoadRelatedDoc(strCoID);
        }
    }

    protected void LoadCollaborationLog(string strCoID)
    {
        string strHQL;

        strHQL = "Select * from T_CollaborationLogBackup where CoID = " + strCoID + " Order by LogID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationLogr");

        DataList1.DataSource = ds;
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
}

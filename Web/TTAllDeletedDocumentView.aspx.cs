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

public partial class TTAllDeletedDocumentView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有项目", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); 
        if (Page.IsPostBack != true)
        {
            LoadDeletedDocument(strUserCode);
        }
    }

    protected void BT_HazyFind_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartCode = GetDepartCode(strUserCode);

        string strDocName = TB_HazyFind.Text.Trim();
        string strHQL;
        IList lst;

        if (strDocName == "")
        {
            LB_FindCondition.Text = Resources.lang.CXFWQSYSCDWD ;
        }
        else
        {
            LB_FindCondition.Text = Resources.lang.CXFWWJMBH + ": " + "'" + strDocName + "'" + Resources.lang.DSCWD;
        }

        strDocName = "%" + strDocName + "%";
        strHQL = "from Document as document where document.DocName like " + "'" + strDocName + "'";
        strHQL += " and document.Status = '删除' ";
        strHQL += " Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();
    }

    protected void BT_UploaderFind_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartCode = GetDepartCode(strUserCode);

        string strUploadManName = TB_UploaderName.Text.Trim();
        string strHQL;
        IList lst;

        if (strUploadManName == "")
        {
            LB_FindCondition.Text = Resources.lang.CXFWQSYSCDWD;
        }
        else
        {
            LB_FindCondition.Text = Resources.lang.SCZXMBH + ": "   + "'" + strUploadManName + "'" + Resources.lang.DSCWD ;
        }

        strUploadManName = "%" + strUploadManName + "%";
        strHQL = "from Document as document where document.UploadManName like " + "'" + strUploadManName + "'";
        strHQL += " and document.Status = '删除' ";
        strHQL += " Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strDocID = e.Item.Cells[0].Text;
        string strHQL, strUserCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();

        strHQL = "from Document as document where document.DocID = " + strDocID;
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        Document document = (Document)lst[0];

        document.Status = "处理中";

        try
        {
            documentBLL.UpdateDocument(document, int.Parse(strDocID));
            LoadDeletedDocument(strUserCode);
        }
        catch
        {
        }
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }

    protected string GetDepartCode(string strUserCode)
    {
        string strDepartCode, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strDepartCode = projectMember.DepartCode.Trim();
        return strDepartCode;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DocumentBLL documentBLL = new DocumentBLL();
        IList lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadDeletedDocument(string strUserCode)
    {
        string strHQL;
        IList lst;
        string strDepartCode = GetDepartCode(strUserCode);

        strHQL = "from Document as document where document.Status = '删除' Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        LB_Sql.Text = strHQL;
    }


}

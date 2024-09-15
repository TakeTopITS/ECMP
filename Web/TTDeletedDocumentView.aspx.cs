using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTDeletedDocumentView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
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

    protected void BT_UploaderFind_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        string strHQL;
        IList lst;

        string strUploadManName = TB_UploaderName.Text.Trim();
        string strDocName = TB_HazyFind.Text.Trim();

        strUploadManName = "%" + strUploadManName + "%";
        strDocName = "%" + strDocName + "%";

        strHQL = "from Document as document where ";
        strHQL += " document.UploadManName like " + "'" + strUploadManName + "'";
        strHQL += " and  document.DocName like " + "'" + strDocName + "'";
        strHQL += " and document.Status = '删除'";
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


    protected void LoadDeletedDocument(string strUserCode)
    {
        string strHQL;
        IList lst;
        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "from Document as document where ";
        strHQL += " document.UploadManCode = " + "'" + strUserCode + "'";
        strHQL += " and document.Status = '删除'";
        strHQL += " Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        LB_Sql.Text = strHQL;
    }

}

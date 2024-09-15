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


public partial class TTConstractRelatedDocView : System.Web.UI.Page
{
    string strConstractName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strConstractCode, strConstractID;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        strConstractID = Request.QueryString["RelatedID"];

        strHQL = "from Constract as constract where constract.ConstractID = " + strConstractID;
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        Constract constract = (Constract)lst[0];
        strConstractCode = constract.ConstractCode.Trim();
        strConstractName = constract.ConstractName.Trim();

        if (lst.Count > 0)
        {
            //this.Title = "合同：" + strConstractCode + " " + strConstractName + " 的相关文档";
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadRelatedDoc(strConstractCode);

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ConstractCode.Text = strConstractCode;
            LB_ConstractID.Text = strConstractID;
        }
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
        string strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember.DepartCode.Trim();
    }

    protected void LoadRelatedDoc(string strConstractCode)
    {
        string strHQL, strUserCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();

        strHQL = "from Document as document where ";
        strHQL += " (document.RelatedType = '合同' and document.RelatedID in (select constract.ConstractID from Constract as constract where constract.ConstractCode =" + "'" + strConstractCode + "'" + ")";
        strHQL += " or document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '合同' and workFlow.RelatedID in ( select constract.ConstractID from Constract as constract where constract.ConstractCode =" + "'" + strConstractCode + "'" + "))";
        strHQL += " or document.RelatedType = '协作' and document.RelatedID in (Select collaboration.CoID From Collaboration as collaboration Where collaboration.RelatedType = 'CONSTRACT' and collaboration.RelatedCode =" + "'" + strConstractCode + "'" + "))";
        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected string GetDocTypeName(string strDocTypeID)
    {
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        DocType docType = (DocType)lst[0];

        return docType.Type.Trim();
    }

    protected string GetConstractStatus(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        Constract constract = (Constract)lst[0];

        return constract.Status.Trim();
    }

}

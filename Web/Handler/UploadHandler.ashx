<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public class UploadHandler : IHttpHandler, IRequiresSessionState
{
    string strUserCode;

    public void ProcessRequest(HttpContext context)
    {
        strUserCode = context.Session["UserCode"].ToString();

        context.Response.ContentType = "text/plain";
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;

        SaveFile(context);
    }

    private void SaveFile(HttpContext context)
    {
        string strRelatedType = context.Request["relatedType"].Trim();
        string strRelatedID = context.Request["relatedID"].Trim();
        string strDocTypeID = context.Request["docTypeID"].Trim();
        string strDocType = context.Request["docType"].Trim();
        string strAuthor = context.Request["author"].Trim();
        string strUserVisible = context.Request["userVisible"].Trim();

        string strRelatedDepartCode;
        try
        {
            strRelatedDepartCode = context.Request["relatedDepartCode"].Trim();
        }
        catch
        {
                strRelatedDepartCode = "";
        }


        if (strDocType == "" | strUserVisible == "" | strAuthor == "" | strDocTypeID == "")
        {
            return;
        }

        string basePath = "../Doc/" + DateTime.Now.ToString("yyyyMM") + "/" + strUserCode + "/Doc/";

        basePath = System.Web.HttpContext.Current.Server.MapPath(basePath);
        HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
        if (!System.IO.Directory.Exists(basePath))
        {
            System.IO.Directory.CreateDirectory(basePath);
        }

        string strExtendName, strFileName2, strFileName3;
        string strFileName1;
        string strTimeString;

        strTimeString = DateTime.Now.ToString("yyyyMMddHHMMssff");
        strFileName1 = files[0].FileName;
        strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名
        strFileName2 = System.IO.Path.GetFileName(strFileName1);
        strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + strTimeString + strExtendName;


        //文件保存
        var full = basePath + strFileName3;
        files[0].SaveAs(full);

        MuitlUpload(strRelatedType, strRelatedID, strUserCode, strAuthor, strDocTypeID, strUserVisible, strRelatedDepartCode, files[0].FileName, strTimeString);

        var _result = "{\"jsonrpc\" : \"2.0\", \"result\" : null, \"id\" : \"" + strFileName3 + "\"}";
        System.Web.HttpContext.Current.Response.Write(_result);
    }


    protected void MuitlUpload(string strRelatedType, string strRelatedID, string strUserCode, string strAuthor, string strDocTypeID, string strVisible, string strRelatedDepartCode, string strFileName1, string strTimeString)
    {
        string strDocType = GetDocTypeName(strDocTypeID);
        string strDepartCode = GetDepartCode(strUserCode);

        string strExtendName, strFileName2, strFileName3;

        strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名
        strFileName2 = System.IO.Path.GetFileName(strFileName1);
        strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + strTimeString + strExtendName;


        DocumentBLL documentBLL = new DocumentBLL();
        Document document = new Document();

        document.RelatedType = strRelatedType;
        document.RelatedID = int.Parse(strRelatedID);

        document.DocTypeID = int.Parse(strDocTypeID);
        document.DocType = strDocType;
        document.Author = strAuthor;
        document.DocName = strFileName2;
        document.Address = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
        document.UploadManCode = strUserCode;
        document.UploadManName = GetUserName(strUserCode);
        document.UploadTime = DateTime.Now;
        document.Visible = strVisible;
        document.DepartCode = strDepartCode;
        document.DepartName = ShareClass.GetDepartName(strDepartCode);
        document.Status = "处理中";
        document.RelatedName = "";

        try
        {
            documentBLL.AddDocument(document);

            string strDocID = ShareClass.GetMyCreatedMaxDocID(strUserCode);
            if (strVisible == "公司")
            {
                string strHQL;
                strHQL = "Insert Into T_DocRelatedDepartment(DocID,DepartCode,DepartName) Values(" + strDocID + "," + "'" + strRelatedDepartCode + "'" + "," + "'" + ShareClass.GetDepartName(strRelatedDepartCode) + "'" + ")";

                ShareClass.RunSqlCommand(strHQL);
            }
        }
        catch
        {
        }
    }


    protected string GetDocRelatedDepartCode(string strDocID)
    {
        string strHQL;

        strHQL = "Select DepartCode T_DocRelatedDepartment Where DocID = " + strDocID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DocRelatedDepartment");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetDocRelatedDepartName(string strDocID)
    {
        string strHQL;

        strHQL = "Select DepartName_DocRelatedDepartment Where DocID = " + strDocID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DocRelatedDepartment");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }


    protected string GetDocTypeName(string strDocTypeID)
    {
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        DocType docType = (DocType)lst[0];

        return docType.Type.Trim();
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.Status.Trim();
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
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

using System.Text;
using System.IO;
using System.Web.Mail;
using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAPPRegularWLList : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strLangCode = Session["LangCode"].ToString();

        if (Page.IsPostBack == false)
        {
            LoadWorkflowTemplate(strUserCode);
        }
    }


    //生成常用工作流申请树
    public void LoadWorkflowTemplate(String strUserCode)
    {
        string strHQL;
        DataSet ds;

        string strDepartCode, strUnderDepartString, strParentDepartString;

        strParentDepartString = TakeTopCore.CoreShareClass.InitialParentDepartmentStringByAuthority(strUserCode);
        strUnderDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByAuthority(strUserCode);

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);


        strHQL = "Select HomeName,ID From T_WLType Where LangCode = " + "'" + strLangCode + "'";
        strHQL += " and Type In (Select Type From T_WorkFlowTemplate as workFlowTemplate Where XSNFile <> ''";
        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + ")))";
        strHQL += " Order by SortNumber ASC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        strHQL = "select * from T_WorkFlowTemplate as workFlowTemplate Where workFlowTemplate.PageFile <> ''";
        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + "))";
        strHQL += " Order by workFlowTemplate.SortNumber ASC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
    
}

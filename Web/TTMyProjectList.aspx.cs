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

public partial class TTMyProjectList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strRelatedType = Request.QueryString["RelatedType"].Trim();

        if (Page.IsPostBack != true)
        {
            if (strRelatedType == "Req" | strRelatedType == "Defect" | strRelatedType == "ProjectTask" | strRelatedType == "ProjectTask_JYX" | strRelatedType == "WorkFlow" | strRelatedType == "InAndOut" | strRelatedType == "ProjectCost" | strRelatedType == "ProjectCostCheck" | strRelatedType == "ProjectIncomeAndExpense")
            {
                ShareClass.InitialInvolvedProjectRelatedPageTree(TreeView1, strUserCode, strRelatedType);
            }

            if (strRelatedType == "ProjectDoc")
            {
                ShareClass.InitialInvolvedProjectDocTree(TreeView1, strUserCode);
            }

            if (strRelatedType == "Risk")
            {
                ShareClass.InitialMyTakeOverProjectTree(TreeView1, strUserCode);
            }

            if (strRelatedType == "ProjectCom")
            {
                ShareClass.InitialInvolvedProjectComTree(TreeView1, strUserCode);
            }
        }
    }
}
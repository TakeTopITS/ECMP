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

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopCore;

public partial class TTProjectWorkflowTemplateCopy : System.Web.UI.Page
{
    string strUserCode, strNewProjectID, strNewProjectName;


    protected void Page_Load(object sender, EventArgs e)
    {
        string strTemProjectID;

        strNewProjectID = Request.QueryString["ProjectID"];
        strNewProjectName = ShareClass.GetProjectName(strNewProjectID);

        strTemProjectID = Request.QueryString["TemProjectID"];
        strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            TakeTopPlan.InitialTemplatePrjectTreeForPlan(TreeView2, strUserCode, strTemProjectID, Resources.lang.ZongXiangMu, Resources.lang.ZZTSDSSFF, Resources.lang.MuBanXiangMu, Resources.lang.CommonProject);

            LoadRelatedWorkFlowTemplate(strNewProjectID);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        strProjectID = treeNode.Target.Trim();
        LB_OldProjectID.Text = strProjectID;

        strHQL = "from RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID;
        RelatedWorkFlowTemplateBLL relatedWorkFlowTemplateBLL = new RelatedWorkFlowTemplateBLL();
        lst = relatedWorkFlowTemplateBLL.GetAllRelatedWorkFlowTemplates(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        BT_CopyWorkflowTemplate.Enabled = true;
    }

    protected void BT_CopyWorkflowTemplate_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strOldProjectID = LB_OldProjectID.Text.Trim();

        try
        {
            //strHQL = "Delete From T_RelatedWorkFlowTemplate Where RelatedType Like '%Project%' And RelatedID = " + strNewProjectID;
            //ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_RelatedWorkFlowTemplate(RelatedType,RelatedID,WFTemplateName,IdentifyString)";
            strHQL += " Select 'Project'," + strNewProjectID + ",WFTemplateName,IdentifyString From T_RelatedWorkFlowTemplate Where RelatedType = 'Project' and RelatedID = " + strOldProjectID;
            strHQL += " and WFTemplateName not in (Select WFTemplateName From T_RelatedWorkFlowTemplate Where RelatedType = 'Project' and RelatedID = " + strNewProjectID + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadRelatedWorkFlowTemplate(strNewProjectID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;

        if (e.CommandName != "Page")
        {
            string strID = e.Item.Cells[0].Text.Trim();

            strHQL = "Delete from T_RelatedWorkFlowTemplate where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            LoadRelatedWorkFlowTemplate(strNewProjectID);
        }
    }

    protected void LoadRelatedWorkFlowTemplate(string strProjectID)
    {
        string strHQL = "from RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID;
        RelatedWorkFlowTemplateBLL relatedWorkFlowTemplateBLL = new RelatedWorkFlowTemplateBLL();
        relatedWorkFlowTemplateBLL = new RelatedWorkFlowTemplateBLL();
        IList lst = relatedWorkFlowTemplateBLL.GetAllRelatedWorkFlowTemplates(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }
}

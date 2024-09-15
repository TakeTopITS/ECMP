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

public partial class TTWorkFlowDesignerJS : System.Web.UI.Page
{
    string strIdentifyString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strTemName, strWFDefinition, strMakeUserCode;

        string strUserCode = Session["UserCode"].ToString();
        strIdentifyString = Request.QueryString["IdentifyString"];

        strHQL = "Select TemName,WFDefinition From T_WorkFlowTemplate Where DesignType = 'JS' and IdentifyString = " + "'" + strIdentifyString + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        if (ds.Tables[0].Rows.Count == 0)
        {
            return;
        }

        strTemName = ds.Tables[0].Rows[0][0].ToString().Trim();
        strWFDefinition = ds.Tables[0].Rows[0][1].ToString().Trim();
        strMakeUserCode = GetWFTemplateCreatorCode(strIdentifyString);

        if (Page.IsPostBack == false)
        {
            TB_WFIdentifyString.Text = strIdentifyString;
            TB_WFXML.Text = strWFDefinition;
            TB_WFName.Text = strTemName;

            if (Session["SuperWFAdmin"].ToString() == "YES" | strUserCode == strMakeUserCode)
            {
                BT_SaveWFDefinition.Enabled = true;
                
            }
            else
            {
                BT_SaveWFDefinition.Enabled = false;
            }

            try
            {
                DeleteWorkflowTStepByWFDefinition(strTemName, strWFDefinition);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected void BT_SaveWFDefinition_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strWFXML, strTemName;

        strWFXML = TB_WFXML.Text.Trim();
        try
        {
            WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
            strHQL = "From WorkFlowTemplate as workFlowTemplate Where workFlowTemplate.IdentifyString = " + "'" + strIdentifyString + "'";
            lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

            WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];

            workFlowTemplate.WFDefinition = strWFXML;

            strTemName = workFlowTemplate.TemName.Trim();

            workFlowTemplateBLL.UpdateWorkFlowTemplate(workFlowTemplate, strTemName);
            
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCCG + "');</script>");
        }
        catch
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCSB + "');</script>");
        }
    }

    //删除在流程图中不存在的步骤
    protected void DeleteWorkflowTStepByWFDefinition(string strTemName, string strWFDefinition)
    {
        string strHQL;
        IList lst;

        string strGUID, strStepID;

        strHQL = "from WorkFlowTStep as workFlowTStep where workFlowTStep.TemName =" + "'" + strTemName + "'" ;
        WorkFlowTStepBLL workFlowTStepBLL = new WorkFlowTStepBLL();
        lst = workFlowTStepBLL.GetAllWorkFlowTSteps(strHQL);
        WorkFlowTStep workFlowTStep = new WorkFlowTStep();

        for (int i = 0; i < lst.Count; i++)
        {
            workFlowTStep = (WorkFlowTStep)lst[i];
            strGUID = workFlowTStep.GUID.Trim();
            strStepID = workFlowTStep.StepID.ToString();

            if (strWFDefinition.IndexOf(strGUID) < 0)
            {
                workFlowTStepBLL.DeleteWorkFlowTStep(workFlowTStep);
            }
        }
    }

    protected string GetWFTemplateCreatorCode(string strIdentityString)
    {
        string strHQL;
        IList lst;

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.IdentifyString = " + "'" + strIdentityString + "'";
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];

        return workFlowTemplate.CreatorCode.Trim();
    }

}

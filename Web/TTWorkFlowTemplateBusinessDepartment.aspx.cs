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
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowTemplateBusinessDepartment : System.Web.UI.Page
{
    //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)
    string strRelatedType, strRelatedID, strRelatedCode;
    string strUserCode, strUserName;
    string strWFIdentifyString, strWFTemName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strPosition, strMakeUserCode;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strWFIdentifyString = Request.QueryString["IdentifyString"];

        strHQL = "Select TemName,WFDefinition,CreatorCode From T_WorkFlowTemplate Where IdentifyString = " + "'" + strWFIdentifyString + "'";
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        strWFTemName = ds.Tables[0].Rows[0][0].ToString().Trim();
        strMakeUserCode = ds.Tables[0].Rows[0][2].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView4, strUserCode);

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            strPosition = ShareClass.GetUserDuty(strUserCode);

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView4, strUserCode);

            LoadWorkFlowTemplateBusinessDepartment(strWFTemName);

            if (Session["SuperWFAdmin"].ToString() == "YES" | strUserCode == strMakeUserCode)
            {
                TreeView4.Enabled = true;
            }
            else
            {
                TreeView4.Enabled = false ;
            }
        }
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            strHQL = "Insert Into T_WorkFlowTemplateBusinessDepartment(TemName,DepartCode,DepartName) Values(" + "'" + strWFTemName + "'" + "," + "'" + strDepartCode + "'" + "," + "'" + strDepartName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowTemplateBusinessDepartment(strWFTemName);

        }
    }

    protected void RP_Attendant_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strSelectedDepartCode = ((Button)e.Item.FindControl("BT_DepartCode")).Text.Trim();

            strHQL = "Delete From T_WorkFlowTemplateBusinessDepartment Where TemName = " + "'" + strWFTemName + "'" + " And DepartCode = " + "'" + strSelectedDepartCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowTemplateBusinessDepartment(strWFTemName);
        }
    }


    protected void LoadWorkFlowTemplateBusinessDepartment(string strWFTemName)
    {
        string strHQL;

        strHQL = "Select * From T_WorkFlowTemplateBusinessDepartment Where TemName = " + "'" + strWFTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateBusinessDepartment");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();
    }

}

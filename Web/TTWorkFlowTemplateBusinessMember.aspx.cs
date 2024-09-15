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

public partial class TTWorkFlowTemplateBusinessMember : System.Web.UI.Page
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
            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            LoadWorkFlowTemplateBusinessUser(strWFTemName);

            if (Session["SuperWFAdmin"].ToString() == "YES" | strUserCode == strMakeUserCode)
            {
                DataGrid4.Enabled = true;
            }
            else
            {
                DataGrid4.Enabled = false;
            }
        }
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid4);
        }
    }

    protected void RP_Attendant_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strSelectedUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            strHQL = "Delete From T_WorkFlowTemplateBusinessMember Where TemName = " + "'" + strWFTemName + "'" + " And UserCode = " + "'" + strSelectedUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowTemplateBusinessUser(strWFTemName);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string struserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string struserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

        string strHQL = "Select * From T_WorkFlowTemplateBusinessMember Where UserCode = " + "'" + struserCode + "'" + " and TemName = " + "'" + strWFTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateBusinessMember");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFZJ + "')", true);
        }
        else
        {
            strHQL = "Insert Into T_WorkFlowTemplateBusinessMember(TemName,UserCode,UserName) Values(" + "'" +strWFTemName + "'" + "," + "'" + struserCode + "'" + "," + "'" + struserName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowTemplateBusinessUser(strWFTemName);
        }
    }

    protected void LoadWorkFlowTemplateBusinessUser(string strWFTemName)
    {
        string strHQL;

        strHQL = "Select * From T_WorkFlowTemplateBusinessMember Where TemName = " + "'" + strWFTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateBusinessMember");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();
    }

}

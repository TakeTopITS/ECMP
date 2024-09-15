using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;

public partial class TTWorkPlanRelatedResources : System.Web.UI.Page
{
    string strUserCode, strUserName, strPlanID, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartCode, strPosition;

        strPlanID = Request.QueryString["PlanID"];
        strProjectID = ShareClass.getProjectIDByPlanID(strPlanID);

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        //if (ShareClass.CheckUserCanAssignRecourceForPlan(strPlanID, strUserCode) == false)
        //{
        //    Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZCNJXZCZQJC + "'");
        //}
        
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView4, strUserCode);

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            strPosition = ShareClass.GetUserDuty(strUserCode);

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView4, strUserCode);

            LoadProjectMember(strProjectID);

            LoadProjectPlanMember(strPlanID);
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

    protected void BT_ProjectMember_Click(object sender, EventArgs e)
    {
        LoadProjectMember(strProjectID);
    }

    protected void RP_Attendant_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strSelectedUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            strHQL = "Delete From T_PlanMember Where PlanID = " + strPlanID + " And UserCode = " + "'" + strSelectedUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadProjectPlanMember(strPlanID);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string struserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string struserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

        string strHQL = "Select * From T_PlanMember Where UserCode = " + "'" + struserCode + "'" + " and PlanID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PlanMember");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFZJ + "')", true);
        }
        else
        {
            strHQL = "Insert Into T_PlanMember(PlanID,UserCode,UserName) Values(" + strPlanID + "," + "'" + struserCode + "'" + "," + "'" + struserName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadProjectPlanMember(strPlanID);
        }
    }

    protected void LoadProjectPlanMember(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_PlanMember Where PlanID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PlanMember");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();
    }


    protected void LoadProjectMember(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

        DataGrid4 .DataSource = lst;
        DataGrid4.DataBind();
    }

}



using System; using System.Resources;
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
using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTTakeTopIM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        LB_UserCode.Text = strUserCode;


        if (Page.IsPostBack != true)
        {
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView1, strUserCode);

            LoadActiveUserList();


            string strDocSavePath = "~\\Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Images\\";
            Session["FCKeditor:UserFilesPath"] = strDocSavePath;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            LB_UserType.Text = Resources.lang.BuMenChengYuan;
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);
        }
    }

    protected void BT_AllActiveUser_Click(object sender, EventArgs e)
    {
        LB_UserType.Text = Resources.lang.ZaiXianYongHu;
        LoadActiveUserList();
    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
            string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

            string strRandomID, strIMTitle;
            string strJavaScriptFuntion;
            string strMessage;

            strRandomID = strUserCode;
            strIMTitle = "TakeTopIM---" + strUserName;
            strMessage = "TTTakeTopIMMain.aspx?CoID=0&ChatterCode=" + strUserCode;

            strJavaScriptFuntion = "opim(" + "'" + strRandomID + "'" + "," + "'" + strIMTitle + "'" + "," + "'" + strMessage + "'" + ");";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strJavaScriptFuntion, true);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql1.Text.Trim();
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LogonLog");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strDepartCode = ((Button)e.Item.FindControl("BT_DepartCode")).Text.Trim();
            string strDepartName = ((Button)e.Item.FindControl("BT_DepartName")).Text.Trim();

            string strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }

    protected void LoadActiveUserList()
    {
        string strHQL;

        int intIntervalTime = int.Parse(System.Configuration.ConfigurationManager.AppSettings["TimerInterval"]) * 3;

        string strUserCode = Session["UserCode"].ToString();

        strHQL = "Select distinct UserCode,UserName from T_LogonLog where LastestTime+" + intIntervalTime.ToString() + "*'1 ms'::interval >= now() ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LogonLog");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }   

}


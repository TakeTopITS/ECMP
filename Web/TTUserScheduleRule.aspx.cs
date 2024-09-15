using System;
using System.Resources;
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
using System.IO;
using System.Drawing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserScheduleRule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
       
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            Response.Redirect("TTUserAttendanceRuleSAAS.aspx");
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
            string strSql = "select * from  T_UserSchedule Order by ID ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strSql, "T_UserSchedule");
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                ListItem li = new ListItem() { Text = dr["ScheduleName"].ToString(), Value = dr["ID"].ToString() };
                tb_Schedule.Items.Add(li);
            }
            tb_Schedule.Items.Insert(0, new ListItem() { Text = "请选择", Value = "0" });
        }
    }
   
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target;

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid2);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LoadUserAttendanceRule(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        BT_AddUserAttendanceRule.Enabled = true;
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        DataSet lst;

        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;


        strHQL = "Select * From T_UserScheduleRule Where ID = " + strID;

        lst = ShareClass.GetDataSetFromSql(strHQL, "T_UserScheduleRule");
       
        foreach (DataRow dr in lst.Tables[0].Rows)
        {
            LB_ID.Text = dr["ID"].ToString();
            LB_UserCode.Text = dr["UserCode"].ToString().Trim();
            LB_UserName.Text = dr["UserName"].ToString().Trim();
            tb_Date.Text = ((DateTime)dr["CreateDate"]).ToString("yyyy-MM-dd");
            tb_Schedule.SelectedValue = dr["ScheduleId"].ToString();
        }        
        BT_UpdateUserAttendanceRule.Enabled = true;
        BT_DeleteUserAttendanceRule.Enabled = true;
        BT_PaiBanRule.Enabled = true;
    }

    protected void BT_AddUserAttendanceRule_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strScheduleName;
        int intScheduleId;
        DateTime dtCreateDate;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();
        dtCreateDate= DateTime.Parse(tb_Date.Text);
        strScheduleName = tb_Schedule.SelectedItem.Text;
        intScheduleId = int.Parse(tb_Schedule.SelectedItem.Value);


        try
        {
            strHQL = "Insert into T_UserScheduleRule(UserCode,UserName,CreateDate,ScheduleId,ScheduleName) values('" + strUserCode + "','" + strUserName + "','" + dtCreateDate + "'," + intScheduleId + ",'" + strScheduleName + "')";
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule(strUserCode);

            BT_UpdateUserAttendanceRule.Enabled = true;
            BT_DeleteUserAttendanceRule.Enabled = true;


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXJSBJC + "')", true);
        }
    }

    protected void BT_UpdateUserAttendanceRule_Click(object sender, EventArgs e)
    {        
        string strHQL;
        string strID;
        string strUserCode, strUserName;
        string strScheduleName;
        int intScheduleId;
        DateTime dtCreateDate;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();
        dtCreateDate = DateTime.Parse(tb_Date.Text);
        strScheduleName = tb_Schedule.SelectedItem.Text.Trim();
        intScheduleId = int.Parse(tb_Schedule.SelectedItem.Value);

        strID = LB_ID.Text.Trim();

        try
        {
            strHQL = string.Format(@"Update T_UserScheduleRule set CreateDate=to_date('{0}', 'YYYY-MM-DD'), ScheduleId={1},ScheduleName='{2}' where ID={3}", dtCreateDate.ToString("yyyy-MM-dd"), intScheduleId, strScheduleName, strID);
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule(strUserCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (System.Exception err)
        {
            LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXGSBJC + "')", true);
        }
    }

    protected void BT_DeleteUserAttendanceRule_Click(object sender, EventArgs e)
    {
        string strID;
        string strHQL;

        string strUserCode = LB_UserCode.Text.Trim();

        strID = LB_ID.Text.Trim();
        strHQL = "Delete From T_UserScheduleRule Where ID = " + strID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule(strUserCode);

            BT_UpdateUserAttendanceRule.Enabled = false;
            BT_DeleteUserAttendanceRule.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSCSBJC + "')", true);
        }
    }

    protected void LoadUserAttendanceRule(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "Select * from T_UserScheduleRule Where UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order by ID DESC";
        ShareClass.DataGridBindingDataSet(strHQL, DataGrid3);
    }


    protected int GetUserNumber()
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }


    protected void BT_PaiBanRule_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTUserSchedule.aspx");
    }
}
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

public partial class TakeTopDataCheckForQuestionHandle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            TB_SQLCode.Text = "";

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (string.IsNullOrEmpty(TB_SQLCode.Text.Trim()) || TB_SQLCode.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSQLYJBNWKJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }
        if (!(TB_SQLCode.Text.Trim().ToLower().Contains("select") && TB_SQLCode.Text.Trim().ToLower().Contains("from")))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }
        if (TB_SQLCode.Text.Trim().ToLower().Contains("create ") || TB_SQLCode.Text.Trim().ToLower().Contains("execute ") || TB_SQLCode.Text.Trim().ToLower().Contains("delete ") || TB_SQLCode.Text.Trim().ToLower().Contains("update") || TB_SQLCode.Text.Trim().ToLower().Contains("drop ")
            || TB_SQLCode.Text.Trim().ToLower().Contains("insert ") || TB_SQLCode.Text.Trim().ToLower().Contains("alter "))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }

        try
        {
            strHQL = TB_SQLCode.Text.Trim();
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Sql");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_CopyNumber.Text = ds.Tables[0].Rows.Count.ToString();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
        }

        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
    }

    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = Resources.lang.ChaXunJeGuo + "" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";

                string strHQL = TB_SQLCode.Text.Trim();

                MSExcelHandler.DataTableToExcel(strHQL, fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }
}

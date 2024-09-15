using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserInforContractTitle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectMember();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        LoadProjectMember();
    }

    protected void LoadProjectMember()
    {
        string strHQL;

        strHQL = @"select * from T_ProjectMember
                    where CAST(now() + '1 month'::interval as char) >  COALESCE(ContractEndTime,CAST(NOW() AS CHAR))";

     
        if (!string.IsNullOrEmpty(TB_UserCode.Text.Trim()))
        {
            strHQL += " and UserCode like '"+TB_UserCode.Text.Trim()+"'";
        }
        if (!string.IsNullOrEmpty(TB_UserName.Text.Trim()))
        {
            strHQL += " and UserName like '"+TB_UserName.Text.Trim()+"'";
        }
        DataTable dtProjectMember = ShareClass.GetDataSetFromSql(strHQL, "User").Tables[0];

        DataGrid1.DataSource = dtProjectMember;
        DataGrid1.DataBind();
    }
}
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

public partial class TTAllConstractUnHandleReceivePay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有项目", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadConstractReceivables(strUserCode);
            LoadConstractPayable(strUserCode);
        }
    }

    protected void LoadConstractReceivables(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select * from T_ConstractReceivables as constractReceivables where constractReceivables.Status not in ('完成','取消') and to_char( constractReceivables.ReceivablesTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') ";
        strHQL += " and constractReceivables.ConstractCode in (Select constract.ConstractCode From T_Constract as constract where constract.RecorderCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " and constractReceivables.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status in ('归档','取消','删除'))";
        strHQL += " Order by constractReceivables.ID DESC";

    
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractReceivables");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadConstractPayable(string strUserCode)
    {
        string strHQL;

        string strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select * from T_ConstractPayable as constractPayable where constractPayable.Status not in ('完成','取消') and to_char(constractPayable.PayableTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd')";
        strHQL += " and constractPayable.ConstractCode in (Select constract.ConstractCode From T_Constract as constract where constract.RecorderCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " and constractPayable.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status  in ('归档','取消','删除'))";
        strHQL += " Order by constractPayable.ID DESC";


        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractReceivables");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

}

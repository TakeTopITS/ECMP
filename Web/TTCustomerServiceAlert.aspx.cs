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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCustomerServiceAlert : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","客户服务预警", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "客户服务预警";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            strHQL = "Select * from T_CustomerQuestion as customerQuestion where customerQuestion.OperatorCode = " + "'" + strUserCode + "'" + " and customerQuestion.OperatorStatus = '受理' ";
            strHQL += " and customerQuestion.ID in (Select customerQuestionHandleRecord.QuestionID From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord Where  to_char(customerQuestionHandleRecord.NextServiceTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') and customerQuestionHandleRecord.ID in (Select Max(customerQuestionHandleRecord1.ID) From T_CustomerQuestionHandleRecord as customerQuestionHandleRecord1 Group By customerQuestionHandleRecord1.QuestionID)) ";
            strHQL += " order by customerQuestion.ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;          
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
      
}

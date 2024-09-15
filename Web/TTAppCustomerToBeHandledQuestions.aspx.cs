using System;
using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppCustomerToBeHandledQuestions : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        //Session["UserCode"] = "C7094";
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "商机需求记录", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "Select * From T_CustomerQuestion ";
            strHQL += " Where ((RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " Or (FromWebSite in (Select WebSite From T_SiteCustomerServiceOperator Where UserCode = " + "'" + strUserCode + "'" + "))))";
            strHQL += " and OperatorCode = ''";
            strHQL += " Order By ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.OperatorCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
            strHQL += " order by customerQuestion.ID DESC";
            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

        }
    }

    protected void BT_MakeQuestion_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTAppCustomerQuestionRecord.aspx");
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        IList lst;

        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void BT_AllQuestion_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();

        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();

        strHQL = "from CustomerQuestion as customerQuestion ";
        strHQL += " where (((customerQuestion.RecorderCode in (select projectMember.UserCode  From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (customerQuestion.RecorderCode = ''))";
        strHQL += " and (customerQuestion.OperatorCode = ''))";
        strHQL += " order by customerQuestion.ID DESC";
        customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.OperatorCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
        strHQL += " order by customerQuestion.ID DESC";
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;
    }

}

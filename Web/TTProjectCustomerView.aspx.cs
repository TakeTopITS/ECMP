using System; using System.Resources;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Xml.Linq;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectCustomerView : System.Web.UI.Page
{
    string strProjectID;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"].Trim();

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        //this.Title = Resources.lang.Project + strProjectID + " " + project.ProjectName + "客户资料";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            LoadCustomerList(strProjectID);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode;

        if (e.CommandName != "Page")
        {
            strCustomerCode = ((Button)e.Item.FindControl("BT_CustomerCode")).Text;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from Customer as customer where customer.CustomerCode = " + "'" + strCustomerCode + "'";
            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);

            DataList2.DataSource = lst;
            DataList2.DataBind();

            HL_RelatedContactInfor.Enabled = true;
            HL_RelatedContactInfor.NavigateUrl = "TTContactListView.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;


            LoadCustomerQuestion(strCustomerCode);
        }
    }


    protected void LoadCustomerList(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Customer as customer where customer.CustomerCode in (select projectCustomer.CustomerCode from ProjectCustomer as projectCustomer where projectCustomer.ProjectID = " + strProjectID + ")";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadCustomerQuestion(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID in (Select customerRelatedQuestion.QuestionID From CustomerRelatedQuestion as customerRelatedQuestion Where customerRelatedQuestion.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        strHQL += " order by customerQuestion.ID DESC";
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }
}

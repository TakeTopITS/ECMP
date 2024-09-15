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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCustomerQuestionView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        string strHQL;
        IList lst;
   
        string strUserCode;
        string strQuestionID = Request.QueryString["ID"];
        

        strUserCode = Session["UserCode"].ToString();
        strQuestionID = Request.QueryString["ID"];

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];
    
        //this.Title = "客户问题：" + strQuestionID + " " + customerQuestion.Question.Trim() + " 内容";

         if (Page.IsPostBack == false)
        {
            DataList2.DataSource = lst;
            DataList2.DataBind();
        }

    }

  
}
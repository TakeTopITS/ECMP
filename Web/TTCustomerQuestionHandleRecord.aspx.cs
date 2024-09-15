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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCustomerQuestionHandleRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strQuestionID = Request.QueryString["QuestionID"];

        //this.Title = "客户问题：" + strQuestionID  + " 处理记录";

        string strUserCode = Session["UserCode"].ToString();
        if (Page.IsPostBack == false)
        {
            strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.QuestionID = " + strQuestionID + " Order by customerQuestionHandleRecord.ID DESC";
            CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
            lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);

            DataList3.DataSource = lst;
            DataList3.DataBind();
        }
    }
}
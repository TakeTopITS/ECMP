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

public partial class TTCustomerQuestionHandleRecordList : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strQuestionID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strRecorderCode, strStatus;
        string strOperatorCode, strOperatorStatus;


        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);
        strQuestionID = Request.QueryString["ID"];

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];
        strRecorderCode = customerQuestion.RecorderCode.Trim();
        strOperatorCode = customerQuestion.OperatorCode.Trim();
        strOperatorStatus = customerQuestion.OperatorStatus.Trim();
        strStatus = customerQuestion.Status.Trim();

        //this.Title = "客户问题：" + strQuestionID + " 处理记录";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DataList1.DataSource = lst;
            DataList1.DataBind();

            DataList2.DataSource = lst;
            DataList2.DataBind();

            LoadCustomerQuestionHandleRecord(strQuestionID);
            LoadRelatedDoc(strQuestionID);

            if (strStatus == "删除")
            {
                BT_CancelDelete.Visible = true;
            }


            HL_QuestionToCustomer.NavigateUrl = "TTQuestionToCustomer.aspx?QuestionID=" + strQuestionID;

            //列出直接成员
            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Operator);

            string strUserType = ShareClass.GetUserType(strUserCode);
            if (strUserType == "OUTER")
            {
                HL_QuestionToCustomer.Visible = false;
            }
        }
    }

    protected void BT_TransferOperator_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strOperatorCode = DL_Operator.SelectedValue.Trim();

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.Status = "处理中";
        customerQuestion.OperatorCode = strOperatorCode;
        customerQuestion.OperatorName = ShareClass.GetUserName(strOperatorCode);
        customerQuestion.OperatorStatus = "受理";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));

            LoadCustomerQuestion(strQuestionID);

            //推送消息给受理人
            Msg msg = new Msg();
            string strMsg = Resources.lang.FuWuXuQiu + ":" + customerQuestion.Question.Trim() + "," + Resources.lang.ZZYaoNiChuLi;
            msg.SendMSM("Message", strOperatorCode, strMsg, strUserCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZDCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZDSBJC + "')", true);
        }
    }

    protected void BT_CancelDelete_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.Status = "新建";
        customerQuestion.OperatorCode = "";
        customerQuestion.OperatorName = "";
        customerQuestion.OperatorStatus = "";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));
            LoadCustomerQuestion(strQuestionID);

            BT_CancelDelete.Visible = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXSCSBJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.OperatorCode = strUserCode;
        customerQuestion.OperatorName = strUserName;
        customerQuestion.OperatorStatus = "删除";
        customerQuestion.Status = "删除";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));
            LoadCustomerQuestion(strQuestionID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void LoadCustomerQuestion(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataList2.DataSource = lst;
        DataList2.DataBind();
    }

    protected void LoadCustomerQuestionHandleRecord(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.QuestionID = " + strQuestionID + " Order by customerQuestionHandleRecord.ID DESC";
        CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
        lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);

        DataList3.DataSource = lst;
        DataList3.DataBind();
    }

    protected void LoadRelatedDoc(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Document as document where document.RelatedType = '客服' and document.RelatedID = " + strQuestionID;
        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }


}

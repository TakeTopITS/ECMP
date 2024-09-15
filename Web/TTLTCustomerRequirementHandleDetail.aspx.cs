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


public partial class TTLTCustomerRequirementHandleDetail : System.Web.UI.Page
{
    string strUserCode, strUserName, strOperatorCode;
    string strQuestionID;
    string strProjectID;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strRecorderCode;
        string strOperatorStatus;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_CustomerComment);
        _FileBrowser.SetupCKEditor(HE_HandleDetail);


        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strQuestionID = Request.QueryString["ID"];


        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];
        strRecorderCode = customerQuestion.RecorderCode.Trim();
        strOperatorCode = customerQuestion.OperatorCode.Trim();
        strOperatorStatus = customerQuestion.OperatorStatus.Trim();

        //this.Title = "客户问题：" + strQuestionID + " " + customerQuestion.Question.Trim() + " 处理";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_CustomerComment.Visible = true;
                HT_HandleDetail.Visible = true;
            }
            else
            {
                HE_CustomerComment.Visible = true;
                HE_HandleDetail.Visible = true;
            }

            DataList2.DataSource = lst;
            DataList2.DataBind();

            TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
            TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();
            DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
            NB_PreDays.Amount = 5;
            DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

            if (strOperatorCode == "")
            {
                BT_Add.Enabled = false;
                BT_Finish.Enabled = false;
                BT_Delete.Enabled = false;

                BT_DeleteQuestion.Enabled = false;
                DL_IsImportant.Enabled = false;
                BT_TransferOperator.Enabled = false;

                HL_QuestionToCustomer.Enabled = false;
            }
            else
            {
                BT_Add.Enabled = true;
                BT_Finish.Enabled = true;

                DL_IsImportant.Enabled = true;
                BT_DeleteQuestion.Enabled = true;
                BT_TransferOperator.Enabled = true;
                HL_QuestionToCustomer.Enabled = true;
            }

            if (strOperatorCode != "" & strOperatorCode != strUserCode)
            {
                BT_Accept.Enabled = false;
                BT_Exit.Enabled = false;
                BT_Finish.Enabled = false;

                BT_Add.Enabled = false;
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                BT_DeleteQuestion.Enabled = false;
                DL_IsImportant.Enabled = false;
                BT_TransferOperator.Enabled = false;

                HL_QuestionToCustomer.Enabled = false;
            }
            else
            {
                BT_Exit.Enabled = true;
            }

            strProjectID = GetProjectIDByProExpenseQuestionID(strQuestionID);
            HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=" + strQuestionID;

            HL_RelatedDoc.NavigateUrl = "TTCustomerQuestionRelatedDoc.aspx?RelatedID=" + strQuestionID;
            HL_ResoveResultReview.NavigateUrl = "TTCustomerQuestionResultReviewWF.aspx?RelatedID=" + strQuestionID;
            HL_QuestionToCustomer.NavigateUrl = "TTQuestionToCustomer.aspx?QuestionID=" + strQuestionID;

            LoadCustomerQuestionHandleRecord(strQuestionID);
            LoadRelatedDoc(strQuestionID);
            LoadCustomerQuestionRelatedCandidate(strQuestionID);

            //列出直接成员
            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Operator);
        }
    }

    protected void BT_Accept_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.Status = "处理中";
        customerQuestion.OperatorCode = strUserCode;
        customerQuestion.OperatorName = strUserName;
        customerQuestion.OperatorStatus = "受理";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));

            LoadCustomerQuestion(strQuestionID);

            BT_Add.Enabled = true;
            BT_Finish.Enabled = true;

            DL_IsImportant.Enabled = true;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
        }
    }

    protected void BT_Exit_Click(object sender, EventArgs e)
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

            BT_Add.Enabled = false;
            BT_Finish.Enabled = false;

            DL_IsImportant.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
        }
    }


    protected void DL_IsImportant_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.IsImportant = DL_IsImportant.SelectedValue.Trim();

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));
            LoadCustomerQuestion(strQuestionID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
        }
    }

    protected void BT_Finish_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.OperatorCode = strUserCode;
        customerQuestion.OperatorName = strUserName;
        customerQuestion.OperatorStatus = "完成";
        customerQuestion.Status = "完成";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));
            LoadCustomerQuestion(strQuestionID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCSBJC + "')", true);
        }
    }

    protected void BT_DeleteQuestion_Click(object sender, EventArgs e)
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

    protected void BT_TransferOperator_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strOperatorCode = DL_Operator.SelectedValue.Trim();

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        customerQuestion.Status = "新建";
        customerQuestion.OperatorCode = strOperatorCode;
        customerQuestion.OperatorName = ShareClass.GetUserName(strOperatorCode);
        customerQuestion.OperatorStatus = "";

        try
        {
            customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));

            LoadCustomerQuestion(strQuestionID);

            BT_Add.Enabled = true;
            BT_Finish.Enabled = true;

            //推送消息给受理人
            Msg msg = new Msg();
            string strMsg = Resources.lang.FuWuXuQiu + ":" + customerQuestion.Question.Trim() + "," + Resources.lang.ZZYaoNiChuLi;
            msg.SendMSM("Message",strOperatorCode, strMsg, strUserCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZDCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZDSBJC + "')", true);
        }
    }

    protected void DL_ContactWay_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strContactWay;

        strContactWay = DL_HandleWay.SelectedValue.Trim();

        TB_HandleWay.Text = strContactWay;
    }

    protected void BT_Add_Click(object sender, EventArgs e)
    {
        string strRecordID, strHandleDetail, strStatus, strHandleWay, strTimeUnit, strCustomerComment, strCustomerAcceptor, strAcceptorContactWay;
        decimal deUsedTime;
        int intPreDays;
        DateTime dtNextServiceTime;

        if (strIsMobileDevice == "YES")
        {
            strHandleDetail = HT_HandleDetail.Text.Trim();
            strCustomerComment = HT_CustomerComment.Text.Trim();
        }
        else
        {
            strHandleDetail = HE_HandleDetail.Text.Trim();
            strCustomerComment = HE_CustomerComment.Text.Trim();
        }

        strStatus = DL_HandleStatus.SelectedValue.Trim();
        strHandleWay = TB_HandleWay.Text.Trim();
        strTimeUnit = DL_TimeUnit.SelectedValue.Trim();

        strCustomerAcceptor = TB_CustomerAcceptor.Text.Trim();
        strAcceptorContactWay = TB_AcceptorContactWay.Text.Trim();
        deUsedTime = NB_UsedTime.Amount;
        intPreDays = int.Parse(NB_PreDays.Amount.ToString());
        dtNextServiceTime = DateTime.Parse(DLC_NextServiceTime.Text);

        CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
        CustomerQuestionHandleRecord customerQuestionHandleRecord = new CustomerQuestionHandleRecord();

        customerQuestionHandleRecord.QuestionID = int.Parse(strQuestionID);
        customerQuestionHandleRecord.HandleDetail = strHandleDetail;
        customerQuestionHandleRecord.HandleStatus = strStatus;
        customerQuestionHandleRecord.HandleWay = strHandleWay;
        customerQuestionHandleRecord.TimeUnit = strTimeUnit;
        customerQuestionHandleRecord.CustomerComment = strCustomerComment;
        customerQuestionHandleRecord.CustomerAcceptor = strCustomerAcceptor;
        customerQuestionHandleRecord.AcceptorContactWay = strAcceptorContactWay;
        customerQuestionHandleRecord.UsedTime = deUsedTime;
        customerQuestionHandleRecord.HandleTime = DateTime.Now;
        customerQuestionHandleRecord.PreDays = intPreDays;
        customerQuestionHandleRecord.NextServiceTime = dtNextServiceTime;
        customerQuestionHandleRecord.OperatorCode = strUserCode;
        customerQuestionHandleRecord.OperatorName = ShareClass.GetUserName(strUserCode);

        customerQuestionHandleRecord.SumApplyTime = DateTime.Now;
        customerQuestionHandleRecord.CollectionTime = DateTime.Now;
        customerQuestionHandleRecord.NewTime = DateTime.Now;
        customerQuestionHandleRecord.RebatesTime = DateTime.Now;
        customerQuestionHandleRecord.UpDoorDate = DateTime.Now;


        try
        {
            customerQuestionHandleRecordBLL.AddCustomerQuestionHandleRecord(customerQuestionHandleRecord);
            strRecordID = ShareClass.GetMyCreatedMaxcustomerQuestionDetailID(strQuestionID);
            LB_ID.Text = strRecordID;


            BT_Update.Enabled = true;
            BT_Delete.Enabled = true;

            LoadCustomerQuestionHandleRecord(strQuestionID);
            LoadRelatedDoc(strQuestionID);


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strHandleDetail, strStatus, strHandleWay, strTimeUnit, strCustomerComment, strCustomerAcceptor, strAcceptorContactWay;
        decimal deUsedTime;
        int intPreDays;
        DateTime dtNextServiceTime;

        strID = LB_ID.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strHandleDetail = HT_HandleDetail.Text.Trim();
            strCustomerComment = HT_CustomerComment.Text.Trim();
        }
        else
        {
            strHandleDetail = HE_HandleDetail.Text.Trim();
            strCustomerComment = HE_CustomerComment.Text.Trim();
        }

        strStatus = DL_HandleStatus.SelectedValue.Trim();
        strHandleWay = TB_HandleWay.Text.Trim();
        strTimeUnit = DL_TimeUnit.SelectedValue.Trim();
        strCustomerAcceptor = TB_CustomerAcceptor.Text.Trim();

        strAcceptorContactWay = TB_AcceptorContactWay.Text.Trim();
        deUsedTime = NB_UsedTime.Amount;
        intPreDays = int.Parse(NB_PreDays.Amount.ToString());
        dtNextServiceTime = DateTime.Parse(DLC_NextServiceTime.Text);

        strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.ID = " + strID;
        CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
        lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);

        CustomerQuestionHandleRecord customerQuestionHandleRecord = (CustomerQuestionHandleRecord)lst[0];

        customerQuestionHandleRecord.QuestionID = int.Parse(strQuestionID);
        customerQuestionHandleRecord.HandleDetail = strHandleDetail;
        customerQuestionHandleRecord.HandleStatus = strStatus;
        customerQuestionHandleRecord.HandleWay = strHandleWay;
        customerQuestionHandleRecord.TimeUnit = strTimeUnit;
        customerQuestionHandleRecord.CustomerComment = strCustomerComment;
        customerQuestionHandleRecord.CustomerAcceptor = strCustomerAcceptor;
        customerQuestionHandleRecord.AcceptorContactWay = strAcceptorContactWay;
        customerQuestionHandleRecord.UsedTime = deUsedTime;
        customerQuestionHandleRecord.PreDays = intPreDays;
        customerQuestionHandleRecord.NextServiceTime = dtNextServiceTime;

        try
        {
            customerQuestionHandleRecordBLL.UpdateCustomerQuestionHandleRecord(customerQuestionHandleRecord, int.Parse(strID));

            LoadCustomerQuestionHandleRecord(strQuestionID);
            LoadRelatedDoc(strQuestionID);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID; ;

        strID = LB_ID.Text.Trim();

        strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.ID = " + strID;
        CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
        lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);
        CustomerQuestionHandleRecord customerQuestionHandleRecord = (CustomerQuestionHandleRecord)lst[0];

        try
        {
            customerQuestionHandleRecordBLL.DeleteCustomerQuestionHandleRecord(customerQuestionHandleRecord);

            LoadCustomerQuestionHandleRecord(strQuestionID);
            LoadRelatedDoc(strQuestionID);

            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        LoadCustomerQuestionHandleRecord(strQuestionID);
        LoadRelatedDoc(strQuestionID);
    }

    protected void DataList3_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strHandleTime, strNow;
        string strHQL;
        IList lst;

        if (e.CommandName == "Update")
        {
            for (int i = 0; i < DataList3.Items.Count; i++)
            {
                DataList3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.ID = " + strID;
            CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
            lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);
            CustomerQuestionHandleRecord customerQuestionHandleRecord = (CustomerQuestionHandleRecord)lst[0];

            LB_ID.Text = strID;
            if (strIsMobileDevice == "YES")
            {
                HT_HandleDetail.Text = customerQuestionHandleRecord.HandleDetail.Trim();
                HT_CustomerComment.Text = customerQuestionHandleRecord.CustomerComment.Trim();
            }
            else
            {
                HE_HandleDetail.Text = customerQuestionHandleRecord.HandleDetail.Trim();
                HE_CustomerComment.Text = customerQuestionHandleRecord.CustomerComment.Trim();
            }

            TB_HandleWay.Text = customerQuestionHandleRecord.HandleWay.Trim();
            HE_HandleDetail.Text = customerQuestionHandleRecord.HandleWay.Trim();
            DL_HandleStatus.SelectedValue = customerQuestionHandleRecord.HandleStatus.Trim();
            NB_UsedTime.Amount = customerQuestionHandleRecord.UsedTime;
            DL_TimeUnit.SelectedValue = customerQuestionHandleRecord.TimeUnit;
            TB_CustomerAcceptor.Text = customerQuestionHandleRecord.CustomerAcceptor.Trim();
            TB_AcceptorContactWay.Text = customerQuestionHandleRecord.AcceptorContactWay.Trim();

            NB_PreDays.Amount = customerQuestionHandleRecord.PreDays;
            DLC_NextServiceTime.Text = customerQuestionHandleRecord.NextServiceTime.ToString("yyyy-MM-dd");


            strHandleTime = customerQuestionHandleRecord.HandleTime.ToString("yyyyMMdd");

            strNow = DateTime.Now.ToString("yyyyMMdd");

            if (strNow != strHandleTime | strOperatorCode != strUserCode)
            {
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;


            }
            else
            {
                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strCandidateName = ((Button)e.Item.FindControl("BT_UserName")).Text;

        LB_CandidateName.Text = strCandidateName;

      
        LoadCollaborationLogWithCustomerQuestionCandidate(strQuestionID, strCandidateName);

        BT_SengCandidateLog.Enabled = true;
    }


    protected void BT_AddCandidate_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strCandidateName = TB_CandidateName.Text.Trim();

        strHQL = "Select * From T_CustomerQuestionRelatedCandidate Where QuestionID = " + strQuestionID + " and UserName = " + "'" + strCandidateName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestionRelatedCandidate");
        if(ds.Tables [0].Rows.Count > 0)
        {
            return;
        }

        CustomerQuestionRelatedCandidateBLL customerQuestionRelatedCandidateBLL = new CustomerQuestionRelatedCandidateBLL();
        CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate = new CustomerQuestionRelatedCandidate();

        customerQuestionRelatedCandidate.QuestionID = int.Parse(strQuestionID);
        customerQuestionRelatedCandidate.UserName = strCandidateName;

        try
        {
            customerQuestionRelatedCandidateBLL.AddCustomerQuestionRelatedCandidate(customerQuestionRelatedCandidate);


            LB_CandidateName.Text = strCandidateName;

            LoadCustomerQuestionRelatedCandidate(strQuestionID);
            LoadCollaborationLogWithCustomerQuestionCandidate(strQuestionID, strCandidateName);

            BT_SengCandidateLog.Enabled = true;
        }
        catch
        {

        }
    }

    protected void BT_DeleteCandidate_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strCandidateName = TB_CandidateName.Text.Trim();

        strHQL = "Delete From T_CustomerQuestionRelatedCandidate Where UserName = " + "'" + strCandidateName + "'" + " and QuestionID = " + strQuestionID;
        
        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadCustomerQuestionRelatedCandidate(strQuestionID);
            LoadCollaborationLogWithCustomerQuestionCandidate(strQuestionID, "");

            BT_SengCandidateLog.Enabled = false;
        }
        catch
        {
        }
    }


    protected void BT_SengCandidateLog_Click(object sender, EventArgs e)
    {
    
        string strComunicationLog = HE_ComunicationWithCandidateRecord.Text.Trim();
        String strCandidateName = LB_CandidateName.Text.Trim();

        CollaborationLogWithCustomerQuestionCandidateBLL collaborationLogWithCustomerQuestionCandidateBLL = new CollaborationLogWithCustomerQuestionCandidateBLL();
        CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate = new CollaborationLogWithCustomerQuestionCandidate();


        collaborationLogWithCustomerQuestionCandidate.QuestionID = int.Parse(strQuestionID);
        collaborationLogWithCustomerQuestionCandidate.LogContent = strComunicationLog;
        collaborationLogWithCustomerQuestionCandidate.UserName = strCandidateName;
        collaborationLogWithCustomerQuestionCandidate.CreateTime = DateTime.Now;

        try
        {
            collaborationLogWithCustomerQuestionCandidateBLL.AddCollaborationLogWithCustomerQuestionCandidate(collaborationLogWithCustomerQuestionCandidate);

            LoadCollaborationLogWithCustomerQuestionCandidate(strQuestionID, strCandidateName);
        }
        catch
        {
        }
    }


    protected void LoadCustomerQuestionRelatedCandidate(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestionRelatedCandidate as customerQuestionRelatedCandidate where customerQuestionRelatedCandidate.QuestionID = " + strQuestionID;
        CustomerQuestionRelatedCandidateBLL customerQuestionRelatedCandidateBLL = new CustomerQuestionRelatedCandidateBLL();
        lst = customerQuestionRelatedCandidateBLL.GetAllCustomerQuestionRelatedCandidates(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadCollaborationLogWithCustomerQuestionCandidate(string strQuestionID,string strCandidateName)
    {
        string strHQL;
        IList lst;

        strHQL = "Select * From T_CollaborationLogWithCustomerQuestionCandidate Where QuestionID = " + strQuestionID + " and UserName = " + "'" + strCandidateName + "'";
        strHQL += " Order By LogID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CollaborationLogWithCustomerQuestionCandidate");

        DataList1.DataSource = ds;
        DataList1.DataBind();
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

    protected void LoadRelatedDoc(string strCoID)
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

    protected string GetProjectIDByProExpenseQuestionID(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProExpense as proExpense where proExpense.QuestionID = " + strQuestionID;
        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        lst = proExpenseBLL.GetAllProExpenses(strHQL);

        if (lst.Count > 0)
        {
            ProExpense proExpense = (ProExpense)lst[0];
            return proExpense.ProjectID.ToString();
        }
        else
        {
            return "1";
        }
    }



}

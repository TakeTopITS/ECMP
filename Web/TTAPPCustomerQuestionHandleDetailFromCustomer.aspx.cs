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

public partial class TTAPPCustomerQuestionHandleDetailFromCustomer : System.Web.UI.Page
{
    string strUserCode, strUserName, strOperatorCode;
    string strQuestionID, strCustomerCode, strCustomerName;
    string strProjectID;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_CustomerComment);
        _FileBrowser.SetupCKEditor(HE_HandleDetail);

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strOperatorCode = strUserCode;

        strCustomerCode = Request.QueryString["CustomerCode"];
        strCustomerName = GetCustomerName(strCustomerCode);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            HT_HandleDetail.Visible = true;
            HT_CustomerComment.Visible = true;
            HT_Question.Visible = true;

            HT_HandleDetail.Toolbar = "";
            HT_CustomerComment.Toolbar = "";
            HT_Question.Toolbar = "";


            LoadCustomerQuestionCustomerStage();
            LoadCustomerQuestionStage();

            if (strIsMobileDevice == "YES")
            {
                HT_CustomerComment.Visible = true;
                HT_HandleDetail.Visible = true;

                HT_Question.Visible = true;
            }
            else
            {
                HE_CustomerComment.Visible = true;
                HE_HandleDetail.Visible = true;
            }

            DLC_ExpectedTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_AnswerTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            LB_Question.Text = ShareClass.GetCustomerNameFromCustomerCode(strCustomerCode);

            LoadCustomerQuestionType();
            //列出直接成员
            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Operator);

            strHQL = "from CustomerQuestion as customerQuestion where ";
            strHQL += " customerQuestion.RecorderCode = " + "'" + strUserCode + "'";
            strHQL += " and customerQuestion.ID in (Select Max(customerRelatedQuestion.QuestionID) From CustomerRelatedQuestion as customerRelatedQuestion Where customerRelatedQuestion.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
            strHQL += " Order By customerQuestion.ID DESC";
            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            if (lst.Count > 0)
            {
                CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];
                DL_CustomerQuestionType.SelectedValue = customerQuestion.Type.Trim();

                LB_QuestionID.Text = customerQuestion.ID.ToString();
                LB_Question.Text = customerQuestion.Question.Trim();
                TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
                TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();
                DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
                NB_PreDays.Amount = 5;
                DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

                //商机信息
                TB_BusinessName.Text = customerQuestion.BusinessName.Trim();
                DLC_ExpectedTime.Text = customerQuestion.ExpectedTime.ToString("yyyy-MM-dd");
                TB_CustomerName.Text = customerQuestion.CustomerName.Trim();
                TB_CustomerManager.Text = customerQuestion.CustomerManager.Trim();
                NB_ExpectedEarnings.Amount = customerQuestion.ExpectedEarnings;

                TB_BusinessSource.Text = customerQuestion.BusinessSource.Trim();
                TB_SucessKeyReason.Text = customerQuestion.SucessKeyReason.Trim();
                TB_FailedKeyReason.Text = customerQuestion.FailedKeyReason.Trim();
                TB_AgencyName.Text = customerQuestion.AgencyName.Trim();

                DL_Stage.SelectedValue = customerQuestion.Stage.Trim();
                DL_CustomerStage.SelectedValue = customerQuestion.CustomerStage.Trim();
                NB_Possibility.Amount = customerQuestion.Possibility;

                strQuestionID = customerQuestion.ID.ToString();
                strOperatorCode = customerQuestion.OperatorCode.Trim();

                if (strOperatorCode == "")
                {
                    BT_Finish.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_Finish.Enabled = true;

                    DL_IsImportant.Enabled = true;
                    BT_TransferOperator.Enabled = true;
                }

                if (strOperatorCode != "" & strOperatorCode != strUserCode)
                {
                    BT_Accept.Enabled = false;
                    BT_Exit.Enabled = false;
                    BT_Finish.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_Exit.Enabled = true;
                }

                strProjectID = GetProjectIDByProExpenseQuestionID(strQuestionID);
                HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=" + strQuestionID;
                HL_RelatedDoc.NavigateUrl = "TTCustomerQuestionRelatedDoc.aspx?RelatedID=" + strQuestionID;
                HL_ResoveResultReview.NavigateUrl = "TTCustomerQuestionResultReviewWF.aspx?RelatedID=" + strQuestionID;

                //HL_CustomerCollector.NavigateUrl = "TTRelatedDIYWorkflowForm.aspx?RelatedType=CustomerService&RelatedID=" + strQuestionID;

                string strUserType = ShareClass.GetUserType(strUserCode);
                if (strUserType == "OUTER")
                {
                    HL_Expense.Visible = false;
                    HL_ResoveResultReview.Visible = false;
                }

                LoadCustomerQuestionHandleRecord(strQuestionID);
                //LoadRelatedDoc(strQuestionID);

                //列出直接成员
                ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Operator);
            }
            else
            {
                HL_Expense.Enabled = false;
                HL_RelatedDoc.Enabled = false;
                HL_ResoveResultReview.Enabled = false;
            }

            //自动受理
            AgreeCustomerQuestion();

            InitialCustomerQuestionTree(strCustomerCode);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strStatus;

        if (e.CommandName != "Page")
        {
            IList lst;

            string strID, strNow, strHandleTime;

            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Detail")
            {
                try
                {
                    strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strID;
                    CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
                    lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

                    CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

                    try
                    {
                        DL_CustomerQuestionType.SelectedValue = customerQuestion.Type;
                    }
                    catch
                    {
                    }
                    DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

                    try
                    {
                        DL_CustomerQuestionTypeNew.SelectedValue = customerQuestion.Type;
                    }
                    catch
                    {
                    }
                    DL_IsImportantNew.SelectedValue = customerQuestion.IsImportant.Trim();

                    HT_Question.Text = customerQuestion.Question.Trim();


                    DLC_AnswerTime.Text = customerQuestion.AnswerTime.ToString("yyyy-MM-dd");
                    TB_Company.Text = customerQuestion.Company.Trim();

                    TB_ContactPerson.Text = customerQuestion.ContactPerson.Trim();
                    TB_PhoneNumber.Text = customerQuestion.PhoneNumber.Trim();
                    TB_EMail.Text = customerQuestion.EMail.Trim();
                    TB_Address.Text = customerQuestion.Address.Trim();
                    TB_PostCode.Text = customerQuestion.PostCode.Trim();

                    LB_ID.Text = customerQuestion.ID.ToString();

                    LoadCustomerQuestionHandleRecord(strID);

                    strHandleTime = customerQuestion.SummitTime.ToString("yyyyMMdd");
                    strNow = DateTime.Now.ToString("yyyyMMdd");

                    strStatus = customerQuestion.Status.Trim();

                    //商机信息
                    TB_BusinessName.Text = customerQuestion.BusinessName.Trim();
                    DLC_ExpectedTime.Text = customerQuestion.ExpectedTime.ToString("yyyy-MM-dd");
                    TB_CustomerName.Text = customerQuestion.CustomerName.Trim();
                    TB_CustomerManager.Text = customerQuestion.CustomerManager.Trim();
                    NB_ExpectedEarnings.Amount = customerQuestion.ExpectedEarnings;

                    TB_BusinessSource.Text = customerQuestion.BusinessSource.Trim();
                    TB_SucessKeyReason.Text = customerQuestion.SucessKeyReason.Trim();
                    TB_FailedKeyReason.Text = customerQuestion.FailedKeyReason.Trim();
                    TB_AgencyName.Text = customerQuestion.AgencyName.Trim();

                    DL_Stage.SelectedValue = customerQuestion.Stage.Trim();
                    DL_CustomerStage.SelectedValue = customerQuestion.CustomerStage.Trim();
                    NB_Possibility.Amount = customerQuestion.Possibility;
                }
                catch
                {
                }

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Detail")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
                }
            }
        }

        if (e.CommandName == "Delete")
        {
            IList lst;

            string strID, strHandleTime, strNow;

            strID = e.Item.Cells[2].Text.Trim();

            strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strID;
            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

            CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

            try
            {
                strStatus = customerQuestion.Status.Trim();
                strHandleTime = customerQuestion.SummitTime.ToString("yyyyMMdd");
                strNow = DateTime.Now.ToString("yyyyMMdd");

                strStatus = customerQuestion.Status.Trim();

                if (strNow == strHandleTime & strStatus == "新建")
                {
                    customerQuestionBLL.DeleteCustomerQuestion(customerQuestion);

                    LB_ID.Text = "";
                    HT_Question.Text = "";

                    DLC_AnswerTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    TB_Company.Text = "";
                    TB_ContactPerson.Text = "";
                    TB_PhoneNumber.Text = "";
                    TB_EMail.Text = "";
                    TB_Address.Text = "";
                    TB_PostCode.Text = "";


                    if (strCustomerCode == null)
                    {
                        InitialCustomerQuestionTree("");
                    }
                    else
                    {
                        InitialCustomerQuestionTree(strCustomerCode);
                    }

                    LoadCustomerQuestion(strID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBWTJLDTHMYBSLCKYSCJC + "')", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSCSBJC + "')", true);
            }
        }
    }


    protected void DL_Stage_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strStage;

        strStage = DL_Stage.SelectedValue.Trim();

        try
        {
            strHQL = "From CustomerQuestionStage as customerQuestionStage Where customerQuestionStage.Stage = '" + strStage + "'";
            CustomerQuestionStageBLL customerQuestionStageBLL = new CustomerQuestionStageBLL();
            lst = customerQuestionStageBLL.GetAllCustomerQuestionStages(strHQL);

            CustomerQuestionStage customerQuestionStage = (CustomerQuestionStage)lst[0];

            NB_Possibility.Amount = customerQuestionStage.Possibility;
        }
        catch
        {
            NB_Possibility.Amount = 0;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strNow, strHandleTime, strStatus;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strID = treeNode.Target.Trim();

        try
        {
            strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strID;
            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

            try
            {
                DL_CustomerQuestionType.SelectedValue = customerQuestion.Type;
            }
            catch
            {
            }

            DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();
            LB_Question.Text = customerQuestion.Question.Trim();
            LB_QuestionID.Text = customerQuestion.ID.ToString();

            TB_CustomerAcceptor.Text = customerQuestion.ContactPerson;
            TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();

            //商机信息
            TB_BusinessName.Text = customerQuestion.BusinessName.Trim();
            DLC_ExpectedTime.Text = customerQuestion.ExpectedTime.ToString("yyyy-MM-dd");
            TB_CustomerName.Text = customerQuestion.CustomerName.Trim();
            TB_CustomerManager.Text = customerQuestion.CustomerManager.Trim();
            NB_ExpectedEarnings.Amount = customerQuestion.ExpectedEarnings;


            TB_BusinessSource.Text = customerQuestion.BusinessSource.Trim();
            TB_SucessKeyReason.Text = customerQuestion.SucessKeyReason.Trim();
            TB_FailedKeyReason.Text = customerQuestion.FailedKeyReason.Trim();
            TB_AgencyName.Text = customerQuestion.AgencyName.Trim();

            DL_Stage.SelectedValue = customerQuestion.Stage.Trim();
            NB_Possibility.Amount = customerQuestion.Possibility;
            DL_CustomerStage.SelectedValue = customerQuestion.CustomerStage.Trim();

            LoadCustomerQuestionHandleRecord(strID);
            //LoadRelatedDoc(strID);

            strHandleTime = customerQuestion.SummitTime.ToString("yyyyMMdd");
            strNow = DateTime.Now.ToString("yyyyMMdd");

            strStatus = customerQuestion.Status.Trim();


            BT_TransferOperator.Enabled = true;
            if (strNow == strHandleTime | strStatus == "新建")
            {
                BT_NewRecord.Enabled = true;
            }
            else
            {
                BT_NewRecord.Enabled = false;
            }
        }
        catch
        {
        }
    }

    protected void DL_CustomerQuestionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strQuestionID = LB_QuestionID.Text.Trim();
        strOperatorCode = strUserCode;

        if (strQuestionID == "")
        {
            strQuestionID = "0";
        }

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        if (lst.Count > 0)
        {
            CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

            customerQuestion.Type = DL_CustomerQuestionType.SelectedValue.Trim();

            try
            {
                customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));
            }
            catch
            {
            }
        }
    }

    protected void BT_UpdateQuestion_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strQuestionID;

        strQuestionID = LB_QuestionID.Text.Trim();

        DL_CustomerQuestionTypeNew.SelectedValue = DL_CustomerQuestionType.SelectedValue;
        //DL_IsImportantNew.SelectedValue = DL_IsImportantNew.SelectedValue;
        HT_Question.Text = LB_Question.Text;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        try
        {
            DL_CustomerQuestionType.SelectedValue = customerQuestion.Type;
            DL_CustomerQuestionTypeNew.SelectedValue = customerQuestion.Type;
        }
        catch
        {
        }

        DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();
        DL_IsImportantNew.SelectedValue = customerQuestion.IsImportant.Trim();


        HT_Question.Text = customerQuestion.Question.Trim();



        LB_ID.Text = customerQuestion.ID.ToString();

        DLC_AnswerTime.Text = customerQuestion.AnswerTime.ToString("yyyy-MM-dd");
        TB_Company.Text = customerQuestion.Company.Trim();
        TB_ContactPerson.Text = customerQuestion.ContactPerson.Trim();
        TB_PhoneNumber.Text = customerQuestion.PhoneNumber.Trim();
        TB_EMail.Text = customerQuestion.EMail.Trim();
        TB_Address.Text = customerQuestion.Address.Trim();
        TB_PostCode.Text = customerQuestion.PostCode.Trim();


        //商机信息
        TB_BusinessName.Text = customerQuestion.BusinessName.Trim();
        DLC_ExpectedTime.Text = customerQuestion.ExpectedTime.ToString("yyyy-MM-dd");
        TB_CustomerName.Text = customerQuestion.CustomerName.Trim();
        TB_CustomerManager.Text = customerQuestion.CustomerManager.Trim();
        NB_ExpectedEarnings.Amount = customerQuestion.ExpectedEarnings;

        TB_BusinessSource.Text = customerQuestion.BusinessSource.Trim();
        TB_SucessKeyReason.Text = customerQuestion.SucessKeyReason.Trim();
        TB_FailedKeyReason.Text = customerQuestion.FailedKeyReason.Trim();
        TB_AgencyName.Text = customerQuestion.AgencyName.Trim();

        DL_Stage.SelectedValue = customerQuestion.Stage.Trim();
        DL_CustomerStage.SelectedValue = customerQuestion.CustomerStage.Trim();
        NB_Possibility.Amount = customerQuestion.Possibility;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }


    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_QuestionID.Text = "";

        Customer customer = GetCustomer(strCustomerCode);

        if (TB_Company.Text == "")
            TB_Company.Text = strCustomerName;

        if (TB_ContactPerson.Text == "")
            TB_ContactPerson.Text = customer.ContactName.Trim();

        if (TB_PhoneNumber.Text == "")
            TB_PhoneNumber.Text = customer.Tel1.Trim();

        if (TB_Address.Text == "")
            TB_Address.Text = customer.RegistrationAddressCN.Trim();

        if (TB_EMail.Text == "")
            TB_EMail.Text = customer.EmailAddress.Trim();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strQuestionID;

        strQuestionID = LB_QuestionID.Text.Trim();

        if (strQuestionID == "")
        {
            AddQuestion();
        }
        else
        {
            UpdateQuestion();
        }
    }

    protected void AddQuestion()
    {
        //自动受理
        AddCustomerQuestion();

        InitialCustomerQuestionTree(strCustomerCode);
    }

    protected void AddCustomerQuestion()
    {
        string strHQL;

        string strID, strCompany, strContactPerson, strPhoneNumber, strEMail, strAddress, strPostCode, strType, strQuestion;
        string strUserCode, strIsImportant;
        DateTime dtAnswerTime;

        strUserCode = LB_UserCode.Text.Trim();

        strCompany = TB_Company.Text.Trim();

        strContactPerson = TB_ContactPerson.Text.Trim();
        strPhoneNumber = TB_PhoneNumber.Text.Trim();
        strEMail = TB_EMail.Text.Trim();
        strAddress = TB_Address.Text.Trim();
        strPostCode = TB_PostCode.Text.Trim();
        strType = DL_CustomerQuestionType.SelectedValue.Trim();
        strIsImportant = DL_IsImportant.SelectedValue.Trim();


        strQuestion = HT_Question.Text.Trim();

        dtAnswerTime = DateTime.Parse(DLC_AnswerTime.Text);


        if (strCompany == "" | strContactPerson == "" | strPhoneNumber == "" | strQuestion == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDHXBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {

            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            CustomerQuestion customerQuestion = new CustomerQuestion();

            customerQuestion.Question = strQuestion;

            customerQuestion.Type = strType;
            customerQuestion.IsImportant = strIsImportant;

            customerQuestion.Company = strCompany;

            customerQuestion.ContactPerson = strContactPerson;
            customerQuestion.PhoneNumber = strPhoneNumber;
            customerQuestion.EMail = strEMail;
            customerQuestion.Address = strAddress;
            customerQuestion.PostCode = strPostCode;
            customerQuestion.Type = strType;
            customerQuestion.AnswerTime = dtAnswerTime;
            customerQuestion.RecorderCode = strUserCode;
            customerQuestion.SummitTime = DateTime.Now;
            customerQuestion.Status = "新建";

            customerQuestion.RecorderCode = strUserCode;

            customerQuestion.OperatorCode = "";
            customerQuestion.OperatorName = "";
            customerQuestion.OperatorStatus = "";
            customerQuestion.FromWebSite = "";

            //商机信息
            TB_CustomerName.Text = strCompany;
            TB_CustomerManager.Text = strContactPerson;
            TB_BusinessName.Text = strQuestion;

            customerQuestion.BusinessName = TB_BusinessName.Text.Trim();
            customerQuestion.ExpectedTime = DateTime.Parse(DLC_ExpectedTime.Text);
            customerQuestion.ExpectedEarnings = NB_ExpectedEarnings.Amount;
            customerQuestion.CustomerManager = TB_CustomerManager.Text.Trim();
            customerQuestion.CustomerName = TB_CustomerName.Text.Trim();
            customerQuestion.SucessKeyReason = TB_SucessKeyReason.Text.Trim();
            customerQuestion.FailedKeyReason = TB_FailedKeyReason.Text.Trim();
            customerQuestion.AgencyName = TB_AgencyName.Text.Trim();
            customerQuestion.BusinessSource = TB_BusinessSource.Text.Trim();
            customerQuestion.Possibility = int.Parse(NB_Possibility.Amount.ToString());

            customerQuestion.Stage = DL_Stage.SelectedValue.Trim();
            customerQuestion.CustomerStage = DL_CustomerStage.SelectedValue.Trim();


            try
            {
                customerQuestionBLL.AddCustomerQuestion(customerQuestion);

                strID = ShareClass.GetMyCreatedMaxCustomerQuestionID(strUserCode);
                LB_QuestionID.Text = strID;

                DL_CustomerQuestionType.SelectedValue = DL_CustomerQuestionTypeNew.SelectedValue;

                LB_Question.Text = HT_Question.Text;

                DL_IsImportant.SelectedValue = DL_IsImportantNew.SelectedValue;

                InitialCustomerQuestionTree(strCustomerCode);

                TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
                TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();
                DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
                NB_PreDays.Amount = 5;
                DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

                strQuestionID = customerQuestion.ID.ToString();
                strOperatorCode = customerQuestion.OperatorCode.Trim();

                if (strOperatorCode == "")
                {
                    BT_NewRecord.Enabled = false;
                    BT_Finish.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_NewRecord.Enabled = true;
                    BT_Finish.Enabled = true;

                    DL_IsImportant.Enabled = true;
                    BT_TransferOperator.Enabled = true;
                }

                if (strOperatorCode != "" & strOperatorCode != strUserCode)
                {
                    BT_Accept.Enabled = false;
                    BT_Exit.Enabled = false;
                    BT_Finish.Enabled = false;

                    BT_NewRecord.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_Exit.Enabled = true;
                }

                HL_Expense.Enabled = true;
                HL_RelatedDoc.Enabled = true;
                HL_ResoveResultReview.Enabled = true;

                strProjectID = GetProjectIDByProExpenseQuestionID(strQuestionID);
                HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=" + strQuestionID;
                HL_RelatedDoc.NavigateUrl = "TTCustomerQuestionRelatedDoc.aspx?RelatedID=" + strQuestionID;
                HL_ResoveResultReview.NavigateUrl = "TTCustomerQuestionResultReviewWF.aspx?RelatedID=" + strQuestionID;


                LoadCustomerQuestionHandleRecord(strQuestionID);
                //LoadRelatedDoc(strQuestionID);

                BT_TransferOperator.Enabled = true;

                strHQL = "Insert Into T_CustomerRelatedQuestion(QuestionID,CustomerCode) Values (" + strID + "," + "'" + strCustomerCode + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                LoadCustomerQuestion(strID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + ex.Message.ToString() + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            }
        }
    }

    protected void UpdateQuestion()
    {
        //自动受理
        UpdateCustomerQuestion();

        InitialCustomerQuestionTree(strCustomerCode);
    }

    protected void UpdateCustomerQuestion()
    {
        string strHQL;
        IList lst;
        string strID, strCompany, strContactPerson, strPhoneNumber, strEMail, strAddress, strPostCode, strType, strQuestion, strStatus, strUserCode, strHandleTime, strNow;
        string strIsImportant;

        DateTime dtAnswerTime;

        strUserCode = LB_UserCode.Text.Trim();

        strID = LB_ID.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strIsImportant = DL_IsImportant.SelectedValue.Trim();

        strContactPerson = TB_ContactPerson.Text.Trim();
        strPhoneNumber = TB_PhoneNumber.Text.Trim();
        strEMail = TB_EMail.Text.Trim();
        strAddress = TB_Address.Text.Trim();
        strPostCode = TB_PostCode.Text.Trim();
        strType = DL_CustomerQuestionType.SelectedValue.Trim();

        strQuestion = HT_Question.Text.Trim();

        dtAnswerTime = DateTime.Parse(DLC_AnswerTime.Text);

        if (strCompany == "" | strContactPerson == "" | strPhoneNumber == "" | strQuestion == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDHXBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strID;
            CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
            lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

            CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

            //try
            //{
            customerQuestion.Question = strQuestion;
            customerQuestion.Type = strType;
            customerQuestion.IsImportant = strIsImportant;
            customerQuestion.ContactPerson = strContactPerson;
            customerQuestion.Company = strCompany;

            customerQuestion.PhoneNumber = strPhoneNumber;
            customerQuestion.EMail = strEMail;
            customerQuestion.Address = strAddress;
            customerQuestion.PostCode = strPostCode;
            customerQuestion.Type = strType;
            customerQuestion.AnswerTime = dtAnswerTime;

            //商机信息
            TB_CustomerName.Text = strCompany;
            TB_CustomerManager.Text = strContactPerson;
            TB_BusinessName.Text = strQuestion;

            customerQuestion.BusinessName = TB_BusinessName.Text.Trim();
            customerQuestion.ExpectedTime = DateTime.Parse(DLC_ExpectedTime.Text);
            customerQuestion.ExpectedEarnings = NB_ExpectedEarnings.Amount;
            customerQuestion.CustomerManager = TB_CustomerManager.Text.Trim();
            customerQuestion.CustomerName = TB_CustomerName.Text.Trim();
            customerQuestion.SucessKeyReason = TB_SucessKeyReason.Text.Trim();
            customerQuestion.FailedKeyReason = TB_FailedKeyReason.Text.Trim();
            customerQuestion.AgencyName = TB_AgencyName.Text.Trim();
            customerQuestion.BusinessSource = TB_BusinessSource.Text.Trim();
            customerQuestion.Possibility = int.Parse(NB_Possibility.Amount.ToString());

            customerQuestion.Stage = DL_Stage.SelectedValue.Trim();
            customerQuestion.CustomerStage = DL_CustomerStage.SelectedValue.Trim();

            customerQuestion.RecorderCode = strUserCode;

            customerQuestion.CustomerArea = "";
            customerQuestion.UserIP = "";
            customerQuestion.UserPosition = "";

            strStatus = customerQuestion.Status.Trim();
            strHandleTime = customerQuestion.SummitTime.ToString("yyyyMMdd");
            strNow = DateTime.Now.ToString("yyyyMMdd");

            strStatus = customerQuestion.Status.Trim();


            try
            {
                customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strID));

                DL_CustomerQuestionType.SelectedValue = DL_CustomerQuestionTypeNew.SelectedValue;

                LB_Question.Text = HT_Question.Text;

                DL_IsImportant.SelectedValue = DL_IsImportantNew.SelectedValue;

                InitialCustomerQuestionTree(strCustomerCode);

                TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
                TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();
                DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
                NB_PreDays.Amount = 5;
                DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

                strQuestionID = customerQuestion.ID.ToString();
                strOperatorCode = customerQuestion.OperatorCode.Trim();

                if (strOperatorCode == "")
                {
                    BT_NewRecord.Enabled = false;
                    BT_Finish.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_NewRecord.Enabled = true;
                    BT_Finish.Enabled = true;

                    DL_IsImportant.Enabled = true;
                    BT_TransferOperator.Enabled = true;
                }

                if (strOperatorCode != "" & strOperatorCode != strUserCode)
                {
                    BT_Accept.Enabled = false;
                    BT_Exit.Enabled = false;
                    BT_Finish.Enabled = false;

                    BT_NewRecord.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_Exit.Enabled = true;
                }

                HL_Expense.Enabled = true;
                HL_RelatedDoc.Enabled = true;
                HL_ResoveResultReview.Enabled = true;

                strProjectID = GetProjectIDByProExpenseQuestionID(strQuestionID);
                HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=" + strQuestionID;
                HL_RelatedDoc.NavigateUrl = "TTCustomerQuestionRelatedDoc.aspx?RelatedID=" + strQuestionID;
                HL_ResoveResultReview.NavigateUrl = "TTCustomerQuestionResultReviewWF.aspx?RelatedID=" + strQuestionID;

                LoadCustomerQuestionHandleRecord(strQuestionID);
                //LoadRelatedDoc(strQuestionID);

                BT_TransferOperator.Enabled = true;

                strHQL = "Insert Into T_CustomerRelatedQuestion(QuestionID,CustomerCode) Values (" + strQuestionID + "," + "'" + strCustomerCode + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                LoadCustomerQuestion(strID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + ex.Message.ToString() + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            }

        }
    }

    protected void BT_Accept_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strQuestionID = LB_QuestionID.Text.Trim();
        strOperatorCode = strUserCode;

        if (strQuestionID == "")
        {
            strQuestionID = "0";
        }

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        if (lst.Count > 0)
        {
            CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

            customerQuestion.Status = "处理中";
            customerQuestion.OperatorCode = strUserCode;
            customerQuestion.OperatorName = strUserName;
            customerQuestion.OperatorStatus = "受理";

            try
            {
                customerQuestionBLL.UpdateCustomerQuestion(customerQuestion, int.Parse(strQuestionID));

                BT_NewRecord.Enabled = true;
                BT_Finish.Enabled = true;

                DL_IsImportant.Enabled = true;

                BT_TransferOperator.Enabled = true;

                LoadCustomerQuestion(strQuestionID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
            }
        }
    }

    protected void AgreeCustomerQuestion()
    {
        string strHQL;
        IList lst;

        strQuestionID = LB_QuestionID.Text.Trim();
        strOperatorCode = strUserCode;

        if (strQuestionID == "")
        {
            strQuestionID = "0";
        }

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        if (lst.Count == 0)
        {
            string strID, strType, strQuestion;
            string strIsImportant;
            DateTime dtAnswerTime;

            strType = DL_CustomerQuestionType.SelectedValue.Trim();
            strIsImportant = DL_IsImportant.SelectedValue.Trim();
            strOperatorCode = strUserCode;

            strQuestion = LB_Question.Text.Trim();
            dtAnswerTime = DateTime.Now;

            ProjectMember projectMember = GetProjectMember(strUserCode);

            Customer customer = GetCustomer(strCustomerCode);

            CustomerQuestion customerQuestion = new CustomerQuestion();

            customerQuestion.Question = strQuestion;
            customerQuestion.Type = strType;
            customerQuestion.IsImportant = strIsImportant;

            customerQuestion.Company = strCustomerName;
            customerQuestion.ContactPerson = customer.ContactName.Trim();
            customerQuestion.PhoneNumber = customer.Tel1.Trim();
            customerQuestion.EMail = customer.Tel1;
            customerQuestion.Address = customer.RegistrationAddressCN;
            customerQuestion.PostCode = "";
            customerQuestion.AnswerTime = dtAnswerTime;
            customerQuestion.RecorderCode = strUserCode;
            customerQuestion.SummitTime = DateTime.Now;
            customerQuestion.Status = "处理中";

            customerQuestion.OperatorCode = strUserCode;
            customerQuestion.OperatorName = ShareClass.GetUserName(strUserCode);
            customerQuestion.OperatorStatus = "受理";
            customerQuestion.FromWebSite = "";


            //商机信息
            TB_CustomerName.Text = strCustomerName;
            TB_CustomerManager.Text = customer.ContactName.Trim();
            TB_BusinessName.Text = strQuestion;

            customerQuestion.BusinessName = TB_BusinessName.Text.Trim();
            customerQuestion.ExpectedTime = DateTime.Parse(DLC_ExpectedTime.Text);
            customerQuestion.ExpectedEarnings = NB_ExpectedEarnings.Amount;
            customerQuestion.CustomerManager = TB_CustomerManager.Text.Trim();
            customerQuestion.CustomerName = TB_CustomerName.Text.Trim();
            customerQuestion.SucessKeyReason = TB_SucessKeyReason.Text.Trim();
            customerQuestion.FailedKeyReason = TB_FailedKeyReason.Text.Trim();
            customerQuestion.AgencyName = TB_AgencyName.Text.Trim();
            customerQuestion.BusinessSource = TB_BusinessSource.Text.Trim();
            customerQuestion.Possibility = int.Parse(NB_Possibility.Amount.ToString());

            customerQuestion.Stage = DL_Stage.SelectedValue.Trim();
            customerQuestion.CustomerStage = DL_CustomerStage.SelectedValue.Trim();

            try
            {
                customerQuestionBLL.AddCustomerQuestion(customerQuestion);

                strID = ShareClass.GetMyCreatedMaxCustomerQuestionID(strUserCode);
                LB_QuestionID.Text = strID;

                InitialCustomerQuestionTree(strCustomerCode);

                TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
                TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();
                DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
                NB_PreDays.Amount = 5;
                DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();

                strQuestionID = customerQuestion.ID.ToString();
                strOperatorCode = customerQuestion.OperatorCode;

                if (strOperatorCode == "")
                {
                    BT_NewRecord.Enabled = false;
                    BT_Finish.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_NewRecord.Enabled = true;
                    BT_Finish.Enabled = true;

                    DL_IsImportant.Enabled = true;
                    BT_TransferOperator.Enabled = true;
                }

                if (strOperatorCode != "" & strOperatorCode != strUserCode)
                {
                    BT_Accept.Enabled = false;
                    BT_Exit.Enabled = false;
                    BT_Finish.Enabled = false;

                    BT_NewRecord.Enabled = false;

                    DL_IsImportant.Enabled = false;
                    BT_TransferOperator.Enabled = false;
                }
                else
                {
                    BT_Exit.Enabled = true;
                }

                HL_Expense.Enabled = true;
                HL_RelatedDoc.Enabled = true;
                HL_ResoveResultReview.Enabled = true;

                strProjectID = GetProjectIDByProExpenseQuestionID(strQuestionID);
                HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=" + strQuestionID;
                HL_RelatedDoc.NavigateUrl = "TTCustomerQuestionRelatedDoc.aspx?RelatedID=" + strQuestionID;
                HL_ResoveResultReview.NavigateUrl = "TTCustomerQuestionResultReviewWF.aspx?RelatedID=" + strQuestionID;


                LoadCustomerQuestionHandleRecord(strQuestionID);
                //LoadRelatedDoc(strQuestionID);

                LoadCustomerQuestion(strQuestionID);


                BT_TransferOperator.Enabled = true;

                strHQL = "Insert Into T_CustomerRelatedQuestion(QuestionID,CustomerCode) Values (" + strID + "," + "'" + strCustomerCode + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJCG + "')", true);
            }
            catch
            {
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJSBJC + "')", true);
            }
        }
    }

    protected ProjectMember GetProjectMember(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectMember as projectMember Where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        ProjectMember projectMember = (ProjectMember)lst[0];

        return projectMember;
    }

    protected void BT_Exit_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strQuestionID = LB_QuestionID.Text.Trim();
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


            BT_NewRecord.Enabled = false;
            BT_Finish.Enabled = false;

            DL_IsImportant.Enabled = false;

            BT_TransferOperator.Enabled = false;

            LoadCustomerQuestion(strQuestionID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTCSLCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTCSLSBJC + "')", true);
        }
    }

    protected void DL_IsImportant_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strQuestionID = LB_QuestionID.Text.Trim();
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

        strQuestionID = LB_QuestionID.Text.Trim();

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

    protected void BT_TransferOperator_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strOperatorCode = DL_Operator.SelectedValue.Trim();
        strQuestionID = LB_QuestionID.Text.Trim();

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

            BT_NewRecord.Enabled = true;
            BT_Finish.Enabled = true;

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

    protected void DL_ContactWay_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strContactWay;

        strContactWay = DL_HandleWay.SelectedValue.Trim();

        TB_HandleWay.Text = strContactWay;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }


    protected void BT_CreateRecord_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        BT_NewRecord.Enabled = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false') ", true);
    }

    protected void BT_NewRecord_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddRecord();
        }
        else
        {
            UpdateRecord();
        }
    }

    protected void AddRecord()
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

        strQuestionID = LB_QuestionID.Text.Trim();

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


            BT_NewRecord.Enabled = true;

            LoadCustomerQuestionHandleRecord(strQuestionID);
            //LoadRelatedDoc(strQuestionID);


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void UpdateRecord()
    {
        string strHQL;
        IList lst;

        string strID, strHandleDetail, strStatus, strHandleWay, strTimeUnit, strCustomerComment, strCustomerAcceptor, strAcceptorContactWay;
        decimal deUsedTime;
        int intPreDays;
        DateTime dtNextServiceTime;

        strID = LB_ID.Text.Trim();
        strQuestionID = LB_QuestionID.Text.Trim();

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
            //LoadRelatedDoc(strQuestionID);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_DeleteRecord_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID; ;

        strID = LB_ID.Text.Trim();
        strQuestionID = LB_QuestionID.Text.Trim();

        strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.ID = " + strID;
        CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
        lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);
        CustomerQuestionHandleRecord customerQuestionHandleRecord = (CustomerQuestionHandleRecord)lst[0];

        try
        {
            customerQuestionHandleRecordBLL.DeleteCustomerQuestionHandleRecord(customerQuestionHandleRecord);

            LoadCustomerQuestionHandleRecord(strQuestionID);
            //LoadRelatedDoc(strQuestionID);

            BT_NewRecord.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        LoadCustomerQuestionHandleRecord(strQuestionID);
        //LoadRelatedDoc(strQuestionID);
    }

    protected void DataList3_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strHandleTime, strNow;
        string strHQL;
        IList lst;

        strID = ((Label)e.Item.FindControl("BT_ID")).Text.Trim();

        if (e.CommandName == "Update")
        {
            for (int i = 0; i < DataList3.Items.Count; i++)
            {
                DataList3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

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
            HE_HandleDetail.Text = customerQuestionHandleRecord.HandleDetail.Trim();
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
                BT_NewRecord.Enabled = false;
            }
            else
            {
                BT_NewRecord.Enabled = true;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void InitialCustomerQuestionTree(string strCustomerCode)
    {
        string strHQL, strUserCode, strID, strQuestion, strSummitTime, strType;

        DataSet ds2, ds3, ds4;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();
        TreeNode node3 = new TreeNode();
        TreeNode node4 = new TreeNode();

        node1.Text = "<B>" + Resources.lang.KeHu + ": " + GetCustomerName(strCustomerCode) + Resources.lang.FuWuJiLu + "</B>";
        node1.Target = "客户服务需求列表";
        node1.Expanded = false;
        TreeView1.Nodes.Add(node1);

        strUserCode = Session["UserCode"].ToString();

        strHQL = "select  Distinct to_char(SummitTime,'yyyy-mm-dd') as SummitTime from T_CustomerQuestion where RecorderCode = " + "'" + strUserCode + "'";
        strHQL += " and ID in (Select QuestionID From T_CustomerRelatedQuestion Where CustomerCode = " + "'" + strCustomerCode + "'" + ")";

        strHQL += " Order by SummitTime DESC limit 30 ";

        ds2 = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestion");

        for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
        {
            strSummitTime = ds2.Tables[0].Rows[i][0].ToString();

            node2 = new TreeNode();
            node2.Text = strSummitTime;
            node2.Target = strSummitTime;
            node2.Expanded = false;

            if (strCustomerCode == "")
            {
                strHQL = "select Distinct Type from T_CustomerQuestion where RecorderCode = " + "'" + strUserCode + "'";
            }
            else
            {
                strHQL = "select Distinct Type from T_CustomerQuestion where RecorderCode = " + "'" + strUserCode + "'";
                strHQL += " and ID in (Select QuestionID From T_CustomerRelatedQuestion Where CustomerCode = " + "'" + strCustomerCode + "'" + ")";
            }
            strHQL += " and to_char(SummitTime,'yyyy-mm-dd') = " + "'" + strSummitTime + "'";
            strHQL += " Order by Type DESC";

            ds3 = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestionRecord");
            for (int j = 0; j < ds3.Tables[0].Rows.Count; j++)
            {
                node3 = new TreeNode();

                strType = ds3.Tables[0].Rows[j][0].ToString();

                node3.Text = strType;
                node3.Target = strType;
                node3.Expanded = false;

                if (strCustomerCode == "")
                {
                    strHQL = "select ID,Question from T_CustomerQuestion where RecorderCode = " + "'" + strUserCode + "'";
                }
                else
                {
                    strHQL = "select ID,Question from T_CustomerQuestion where RecorderCode = " + "'" + strUserCode + "'";
                    strHQL += " and ID in (Select QuestionID From T_CustomerRelatedQuestion Where CustomerCode = " + "'" + strCustomerCode + "'" + ")";
                }
                strHQL += " and Type = " + "'" + strType + "'" + " and to_char(SummitTime,'yyyy-mm-dd') = " + "'" + strSummitTime + "'";
                strHQL += " Order by SummitTime DESC";

                ds4 = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestionRecord");
                for (int k = 0; k < ds4.Tables[0].Rows.Count; k++)
                {
                    node4 = new TreeNode();

                    strID = ds4.Tables[0].Rows[k][0].ToString();
                    strQuestion = ds4.Tables[0].Rows[k][1].ToString().Trim();

                    node4.Text = strID + " " + strQuestion;
                    node4.Target = strID;
                    node4.Expanded = false;

                    node3.ChildNodes.Add(node4);
                }

                node2.ChildNodes.Add(node3);
            }

            node1.ChildNodes.Add(node2);
        }

        TreeView1.DataBind();
        TreeView1.ExpandAll();
    }

    protected void LoadCustomerQuestion(string strQuestionID)
    {
        string strHQL;
        IList lst;

        //strHQL = "from CustomerQuestion as customerQuestion where ";
        //strHQL += " customerQuestion.RecorderCode = " + "'" + strUserCode + "'";
        //strHQL += " and customerQuestion.ID in (Select Max(customerRelatedQuestion.QuestionID) From CustomerRelatedQuestion as customerRelatedQuestion Where customerRelatedQuestion.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        //strHQL += " Order By customerQuestion.ID DESC";

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;

        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
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


    protected void LoadCustomerQuestionType()
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestionType as customerQuestionType Order By customerQuestionType.SortNumber ASC";
        CustomerQuestionTypeBLL customerQuestionTypeBLL = new CustomerQuestionTypeBLL();
        lst = customerQuestionTypeBLL.GetAllCustomerQuestionTypes(strHQL);

        DL_CustomerQuestionType.DataSource = lst;
        DL_CustomerQuestionType.DataBind();

        DL_CustomerQuestionTypeNew.DataSource = lst;
        DL_CustomerQuestionTypeNew.DataBind();
    }

    protected string GetCustomerName(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Customer as customer Where customer.CustomerCode = " + "'" + strCustomerCode + "'";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        Customer customer = (Customer)lst[0];

        return customer.CustomerName.Trim();
    }


    protected Customer GetCustomer(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Customer as customer Where customer.CustomerCode = " + "'" + strCustomerCode + "'";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        Customer customer = (Customer)lst[0];

        return customer;
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


    protected void LoadCustomerQuestionStage()
    {
        string strHQL;

        strHQL = "Select * From T_CustomerQuestionStage Order By Possibility ASc";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestionStage");

        DL_Stage.DataSource = ds;
        DL_Stage.DataBind();

        DL_Stage.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadCustomerQuestionCustomerStage()
    {
        string strHQL;

        strHQL = "Select * From T_CustomerQuestionCustomerStage Order By SortNumber ASc";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerQuestionCustomerStage");

        DL_CustomerStage.DataSource = ds;
        DL_CustomerStage.DataBind();

        DL_CustomerStage.Items.Insert(0, new ListItem("--Select--", ""));
    }

}

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
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppCustomerQuestionHandleDetailForMembers : System.Web.UI.Page
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
        strUserName = Session["UserName"].ToString();

        strQuestionID = Request.QueryString["ID"];

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];
        strRecorderCode = customerQuestion.RecorderCode.Trim();
        strOperatorCode = customerQuestion.OperatorCode.Trim();
        strOperatorStatus = customerQuestion.OperatorStatus.Trim();

        LB_ServiceID.Text = strQuestionID;
        LB_ServiceName.Text = customerQuestion.Question.Trim();
        LB_CompanyName.Text = customerQuestion.Company.Trim();
        LB_Type.Text = customerQuestion.Type.Trim();

        LB_ContactPerson.Text = customerQuestion.ContactPerson.Trim();

        HL_PhoneNumber.NavigateUrl = "tel:" + customerQuestion.PhoneNumber.Trim();
        HL_PhoneNumber.Text = customerQuestion.PhoneNumber.Trim();

        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_HandleDetail.Visible = true;
                HT_CustomerComment.Visible = true;

                HT_HandleDetail.Toolbar = "";
                HT_CustomerComment.Toolbar = "";
            }
            else
            {
                HE_HandleDetail.Visible = true;
                HE_CustomerComment.Visible = true;
            }

            DataList2.DataSource = lst;
            DataList2.DataBind();

            TB_CustomerAcceptor.Text = customerQuestion.ContactPerson.Trim();
            TB_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();

            HL_AcceptorContactWay.NavigateUrl = "tel:" + customerQuestion.PhoneNumber.Trim();
            HL_AcceptorContactWay.Text = customerQuestion.PhoneNumber.Trim();

            DLC_NextServiceTime.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");

            DL_IsImportant.SelectedValue = customerQuestion.IsImportant.Trim();
            NB_PreDays.Amount = 5;

            if (strOperatorCode == "")
            {
                BT_Add.Enabled = false;
                BT_Finish.Enabled = false;
                DL_IsImportant.Enabled = false;

                BT_DeleteQuestion.Enabled = false;
                DL_IsImportant.Enabled = false;
                BT_TransferOperator.Enabled = false;
            }
            else
            {
                BT_Add.Enabled = true;
                BT_Finish.Enabled = true;
                DL_IsImportant.Enabled = true;

                BT_DeleteQuestion.Enabled = true;
                DL_IsImportant.Enabled = true;
                BT_TransferOperator.Enabled = true;
            }

            if (strOperatorCode != "" & strOperatorCode != strUserCode)
            {
                BT_Accept.Enabled = false;
                BT_Exit.Enabled = false;
                BT_Finish.Enabled = false;

                BT_Add.Enabled = false;
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                DL_IsImportant.Enabled = false;
                BT_DeleteQuestion.Enabled = false;
                BT_TransferOperator.Enabled = false;
                BtnUP.Enabled = false;
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

            BT_TransferOperator.Enabled = true;

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

            BT_TransferOperator.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('退出" + Resources.lang.ZZSLCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('退出" + Resources.lang.ZZSLSBJC + "')", true);
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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void BtnUP_Click(object sender, EventArgs e)
    {
        if (AttachFile.HasFile)
        {
            string strFileName1, strExtendName;

            strFileName1 = this.AttachFile.FileName;//获取上传文件的文件名,包括后缀

            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);
            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;
            string strDocSavePath = Server.MapPath("Doc") + "\\UserPhoto\\";

            string strPhotoURL = "<p><img src=Doc/UserPhoto/" + strFileName3 + " width=100 height=100 /></p>";


            FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

            if (fi.Exists)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "');</script>");
            }
            else
            {

                try
                {
                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);

                    if (strExtName.ToUpper().IndexOf("JPG|JPEG|PNG|BMP|GIF") >= 0)
                    {
                        //缩小尺寸，便于上传
                        ShareClass.ReducesPic(strDocSavePath, strFileName3, 640, 480, 3);
                    }

                    HT_HandleDetail.Text += strPhotoURL;
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSCSBJC + "');</script>");
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZZYSCDWJ + "');</script>");
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }


    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        BT_New.Enabled = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
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


            BT_New.Enabled = true;

            LoadCustomerQuestionHandleRecord(strQuestionID);
            //LoadRelatedDoc(strQuestionID);


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
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


            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        LoadCustomerQuestionHandleRecord(strQuestionID);

    }


    protected void DataList3_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strHandleTime, strNow;
        string strHQL;
        IList lst;

        strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

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
                BT_New.Enabled = false;
            }
            else
            {
                BT_New.Enabled = true;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }

        if (e.CommandName == "Delete")
        {
            strHQL = "from CustomerQuestionHandleRecord as customerQuestionHandleRecord where customerQuestionHandleRecord.ID = " + strID;
            CustomerQuestionHandleRecordBLL customerQuestionHandleRecordBLL = new CustomerQuestionHandleRecordBLL();
            lst = customerQuestionHandleRecordBLL.GetAllCustomerQuestionHandleRecords(strHQL);
            CustomerQuestionHandleRecord customerQuestionHandleRecord = (CustomerQuestionHandleRecord)lst[0];

            try
            {
                customerQuestionHandleRecordBLL.DeleteCustomerQuestionHandleRecord(customerQuestionHandleRecord);

                LoadCustomerQuestionHandleRecord(strQuestionID);
                //LoadRelatedDoc(strQuestionID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            }

            LoadCustomerQuestionHandleRecord(strQuestionID);
            //LoadRelatedDoc(strQuestionID);
        }
    }


    protected void DataList31_ItemCommand(object sender, DataListCommandEventArgs e)
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

            if (strNow != strHandleTime | strUserCode != strOperatorCode)
            {
                BT_Update.Enabled = false;
                BT_Delete.Enabled = false;

                BtnUP.Enabled = false;
            }
            else
            {
                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;

                BtnUP.Enabled = true;
            }

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

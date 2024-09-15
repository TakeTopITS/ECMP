using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTContactListSAAS : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == "Project")
        {
            strRelatedType = "项目";
            string strHQL = "Select ProjectCode,ProjectName From T_Project Where ProjectID = " + strRelatedID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string strProjectCode = ds.Tables[0].Rows[0][0].ToString().Trim();
                string strProjectName = ds.Tables[0].Rows[0][1].ToString().Trim();

                string strURL = Context.Request.Url.AbsoluteUri;
                strURL = strURL.Substring(0, strURL.LastIndexOf("/"));

                TB_Message.Text = Resources.lang.NiHao + "，" + strUserName + Resources.lang.YaoQingNiCanYuXiangMu + "： " + strProjectName + ", " + Resources.lang.QYDNDLZD + ": " + strURL + " ," +  Resources.lang.QYDNDLZCDLJRPTZZBLDJXMGLMG + " " + strProjectCode + " " + Resources.lang.JiaRu;
            }
        }

        if (strRelatedType == "Attendance")
        {
            strRelatedType = Resources.lang.KaoQing;
            TB_Message.Text = Resources.lang.NiHao + "，" + strUserName + Resources.lang.YQNCYQDKQQGZWXGZHTDGLB + strUserCode + Resources.lang.JiaRu;
        }

        if (strRelatedType == "Customer")
        {
            strRelatedType = "客户";
        }

        if (strRelatedType == "Vendor")
        {
            strRelatedType = "供应商";
        }

        if (strRelatedType == "Other")
        {
            strRelatedType = "其它";
        }

        if (strRelatedType == null)
        {
        }

        LB_UserCode.Text = strUserCode;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadContactList(strUserCode);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();
        string strCreatorCode;

        string strID = e.Item.Cells[2].Text.Trim();

        if (e.CommandName == "Update")
        {

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from ContactInfor as contactInfor where contactInfor.ID = " + strID;
            ContactInforBLL contactInforBLL = new ContactInforBLL();
            lst = contactInforBLL.GetAllContactInfors(strHQL);

            ContactInfor contactInfor = (ContactInfor)lst[0];

            LB_ID.Text = contactInfor.ID.ToString();
            TB_FirstName.Text = contactInfor.FirstName;

            DL_Type.SelectedValue = contactInfor.Type.Trim();
            DL_Gender.SelectedValue = contactInfor.Gender.Trim();
            NB_Age.Amount = contactInfor.Age;
            TB_EMail1.Text = contactInfor.Email1;
            //TB_EMail2.Text = contactInfor.Email2;
            TB_WebSite.Text = contactInfor.WebSite;
            TB_OfficePhone.Text = contactInfor.OfficePhone;
            TB_HomePhone.Text = contactInfor.HomePhone;
            TB_MobilePhone.Text = contactInfor.MobilePhone;
            //TB_Msn.Text = contactInfor.Msn;
            //TB_Ysn.Text = contactInfor.Ysn;
            TB_QQ.Text = contactInfor.QQ;
            TB_Company.Text = contactInfor.Company;
            TB_Department.Text = contactInfor.Department;
            TB_Duty.Text = contactInfor.Duty;
            TB_CompanyAddress.Text = contactInfor.CompanyAddress;
            TB_Country.Text = contactInfor.Country;
            TB_State.Text = contactInfor.State;
            TB_City.Text = contactInfor.City;
            TB_PostCode.Text = contactInfor.PostCode;
            TB_HomeAddress.Text = contactInfor.HomeAddress;

            strCreatorCode = contactInfor.UserCode.Trim();

            if (strUserCode == strCreatorCode)
            {
                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;
            }
            else
            {
                //BT_Update.Enabled = false;
                //BT_Delete.Enabled = false;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }

        if (e.CommandName == "Delete")
        {
            strHQL = "from ContactInfor as contactInfor where contactInfor.ID = " + strID;
            ContactInforBLL contactInforBLL = new ContactInforBLL();
            lst = contactInforBLL.GetAllContactInfors(strHQL);

            ContactInfor contactInfor = (ContactInfor)lst[0];

            try
            {
                contactInforBLL.DeleteContactInfor(contactInfor);

                LoadContactList(strUserCode);

                //BT_Update.Enabled = false;
                //BT_Delete.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
            }
        }
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ContactInforBLL contactInforBLL = new ContactInforBLL();
        IList lst = contactInforBLL.GetAllContactInfors(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddContact();
        }
        else
        {
            UpdateContact();
        }
    }

    protected void AddContact()
    {
        string strFirstName, strLastName, strType, strGender, strAge, strEmail1, strEmail2, strEmail3, strMsn, strYsn, strQQ;
        string strOfficePhone, strHomePhone, strMobilePhone, strCompany, strDepartment, strDuty, strCompanyAddress;
        string strCountry, strState, strCity, strPostCode, strHomeAddress;

        string strUserCode = LB_UserCode.Text.Trim();

        strFirstName = TB_FirstName.Text.Trim();
        strLastName = "";
        strType = DL_Type.SelectedValue;
        strGender = DL_Gender.SelectedValue;
        strAge = NB_Age.Amount.ToString();
        strEmail1 = TB_EMail1.Text.Trim();
        //strEmail2 = TB_EMail2.Text.Trim();
        strEmail3 = TB_WebSite.Text.Trim();
        //strMsn = TB_Msn.Text.Trim();
        //strYsn = TB_Ysn.Text.Trim();
        strQQ = TB_QQ.Text.Trim();
        strOfficePhone = TB_OfficePhone.Text.Trim();
        strHomePhone = TB_HomePhone.Text.Trim();
        strMobilePhone = TB_MobilePhone.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strDepartment = TB_Department.Text.Trim();
        strDuty = TB_Duty.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strDepartment = TB_Department.Text.Trim();
        strDuty = TB_Duty.Text.Trim();
        strCompanyAddress = TB_CompanyAddress.Text.Trim();
        strCountry = TB_Country.Text.Trim();
        strState = TB_State.Text.Trim();
        strCity = TB_City.Text.Trim();
        strPostCode = TB_PostCode.Text.Trim();
        strHomeAddress = TB_HomeAddress.Text.Trim();

        if (strFirstName != "" & strMobilePhone != "" & strEmail1 != "")
        {
            ContactInforBLL contactInforBLL = new ContactInforBLL();
            ContactInfor contactInfor = new ContactInfor();

            contactInfor.FirstName = strFirstName;
            contactInfor.LastName = strLastName;
            contactInfor.Type = strType;
            contactInfor.Gender = strGender;
            contactInfor.Age = int.Parse(strAge);
            contactInfor.Email1 = strEmail1;
            contactInfor.Email2 = "";
            contactInfor.WebSite = strEmail3;
            contactInfor.OfficePhone = strOfficePhone;
            contactInfor.HomePhone = strHomePhone;
            contactInfor.MobilePhone = strMobilePhone;
            contactInfor.Msn = "";
            contactInfor.Ysn = "";
            contactInfor.QQ = strQQ;
            contactInfor.Company = strCompany;
            contactInfor.Department = strDepartment;
            contactInfor.Duty = strDuty;
            contactInfor.CompanyAddress = strCompanyAddress;
            contactInfor.Country = strCountry;
            contactInfor.State = strState;
            contactInfor.City = strCity;
            contactInfor.HomeAddress = strHomeAddress;
            contactInfor.PostCode = strPostCode;
            contactInfor.UserCode = strUserCode;
            contactInfor.RelatedType = strRelatedType;
            contactInfor.RelatedID = strRelatedID;

            try
            {
                contactInforBLL.AddContactInfor(contactInfor);

                LB_ID.Text = ShareClass.GetMyCreatedMaxContactInforID(strUserCode);

                LoadContactList(strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click4", "alert('" + Resources.lang.ZZYHDMYHMCMMZWEMAILDBNWKJC + "')", true);
        }
    }

    protected void UpdateContact()
    {
        string strFirstName, strLastName, strType, strGender, strAge, strEmail1, strEmail2, strEmail3, strMsn, strYsn, strQQ;
        string strOfficePhone, strHomePhone, strMobilePhone, strCompany, strDepartment, strDuty, strCompanyAddress;
        string strCountry, strState, strCity, strPostCode, strHomeAddress;

        string strUserCode = LB_UserCode.Text.Trim();
        string strID = LB_ID.Text.Trim();

        string strHQL = "from ContactInfor as contactInfor where contactInfor.ID = " + strID;
        ContactInforBLL contactInforBLL = new ContactInforBLL();
        IList lst = contactInforBLL.GetAllContactInfors(strHQL);

        ContactInfor contactInfor = (ContactInfor)lst[0];

        strFirstName = TB_FirstName.Text.Trim();
        strLastName = "";
        strType = DL_Type.SelectedValue;
        strGender = DL_Gender.SelectedValue;
        strAge = NB_Age.Amount.ToString();
        strEmail1 = TB_EMail1.Text.Trim();
        //strEmail2 = TB_EMail2.Text.Trim();
        strEmail3 = TB_WebSite.Text.Trim();
        //strMsn = TB_Msn.Text.Trim();
        //strYsn = TB_Ysn.Text.Trim();
        strQQ = TB_QQ.Text.Trim();
        strOfficePhone = TB_OfficePhone.Text.Trim();
        strHomePhone = TB_HomePhone.Text.Trim();
        strMobilePhone = TB_MobilePhone.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strDepartment = TB_Department.Text.Trim();
        strDuty = TB_Duty.Text.Trim();
        strCompany = TB_Company.Text.Trim();
        strDepartment = TB_Department.Text.Trim();
        strDuty = TB_Duty.Text.Trim();
        strCompanyAddress = TB_CompanyAddress.Text.Trim();
        strCountry = TB_Country.Text.Trim();
        strState = TB_State.Text.Trim();
        strCity = TB_City.Text.Trim();
        strPostCode = TB_PostCode.Text.Trim();
        strHomeAddress = TB_HomeAddress.Text.Trim();

        if (strFirstName != "" & strMobilePhone != "" & strEmail1 != "")
        {
            contactInfor.FirstName = strFirstName;
            contactInfor.LastName = strLastName;
            contactInfor.Type = strType;
            contactInfor.Gender = strGender;
            contactInfor.Age = int.Parse(strAge);
            contactInfor.Email1 = strEmail1;
            contactInfor.Email2 = "";
            contactInfor.WebSite = strEmail3;
            contactInfor.OfficePhone = strOfficePhone;
            contactInfor.HomePhone = strHomePhone;
            contactInfor.MobilePhone = strMobilePhone;
            contactInfor.Msn = "";
            contactInfor.Ysn = "";
            contactInfor.QQ = strQQ;
            contactInfor.Company = strCompany;
            contactInfor.Department = strDepartment;
            contactInfor.Duty = strDuty;
            contactInfor.CompanyAddress = strCompanyAddress;
            contactInfor.Country = strCountry;
            contactInfor.State = strState;
            contactInfor.City = strCity;
            contactInfor.HomeAddress = strHomeAddress;
            contactInfor.PostCode = strPostCode;
            contactInfor.UserCode = strUserCode;
            //contactInfor.RelatedType = strRelatedType;
            //contactInfor.RelatedID = strRelatedID;

            try
            {
                contactInforBLL.UpdateContactInfor(contactInfor, int.Parse(strID));

                LoadContactList(strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click4", "alert('" + Resources.lang.ZZYHDMYHMCMMZWEMAILDBNWKJC + "')", true);
        }
    }


    protected void DL_ContactType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType, strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strType = DL_ContactType.SelectedValue.Trim();

        if (strRelatedType == "其它" | strRelatedType == null)
        {
            strHQL = "from ContactInfor as contactInfor where contactInfor.UserCode= " + "'" + strUserCode + "'" + " and contactInfor.Type = " + "'" + strType + "'" + " order by contactInfor.ID DESC";
        }
        else
        {
            strHQL = "from ContactInfor as contactInfor where contactInfor.Type = " + "'" + strType + "'" + " and contactInfor.RelatedType=" + "'" + strRelatedType + "'" + " and contactInfor.RelatedID= " + "'" + strRelatedID + "'" + " order by contactInfor.ID DESC";
        }

        ContactInforBLL contactInforBLL = new ContactInforBLL();
        lst = contactInforBLL.GetAllContactInfors(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strContactName, strCompanyName, strContactType;

        string strUserCode = LB_UserCode.Text.Trim();

        strContactType = "%" + DL_ContactType.SelectedValue.Trim() + "%";
        strContactName = "%" + TB_ContactName.Text.Trim() + "%";
        strCompanyName = "%" + TB_CompanyName.Text.Trim() + "%";

        ContactInforBLL contactInforBLL = new ContactInforBLL();


        if (strRelatedType == "其它" | strRelatedType == null)
        {
            strHQL = "from ContactInfor as contactInfor where contactInfor.UserCode = " + "'" + strUserCode + "'";
            strHQL += " and contactInfor.FirstName Like " + "'" + strContactName + "'";
            strHQL += " and contactInfor.Company like " + "'" + strCompanyName + "'";
            strHQL += " and contactInfor.Type Like " + "'" + strContactType + "'";
            strHQL += " order by contactInfor.ID DESC";
        }
        else
        {
            strHQL = "from ContactInfor as contactInfor where contactInfor.Type Like " + "'" + strContactType + "'";
            strHQL += " and contactInfor.FirstName Like " + "'" + strContactName + "'";
            strHQL += " and contactInfor.Company like " + "'" + strCompanyName + "'";
            strHQL += " and contactInfor.RelatedType=" + "'" + strRelatedType + "'";
            strHQL += " and contactInfor.RelatedID= " + "'" + strRelatedID + "'";
            strHQL += " order by contactInfor.ID DESC";
        }


        lst = contactInforBLL.GetAllContactInfors(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        int j;
        string strMobilePhone, strEMail, strMsg, strSendUserCode;

        strSendUserCode = Session["UserCode"].ToString().Trim();

        SMSSendDIYBLL smsSendDIYBLL = new SMSSendDIYBLL();
        SMSSendDIY smsSendDIY = new SMSSendDIY();
        Msg msg = new Msg();
        strMsg = TB_Message.Text.Trim();

        for (j = 0; j < DataGrid1.Items.Count; j++)
        {
            strMobilePhone = DataGrid1.Items[j].Cells[5].Text;
            strEMail = DataGrid1.Items[j].Cells[10].Text;

            if (strMsg == "")
            {
                continue;
            }

            if (((CheckBox)DataGrid1.Items[j].FindControl("CB_Select")).Checked)
            {
                try
                {
                    new System.Threading.Thread(delegate ()
                    {
                        try
                        {
                            msg.SendMailByEmail(strEMail, "拓鼎项目宝", strMsg, "ADMIN");
                        }
                        catch
                        {
                        }

                        try
                        {
                            //发送信息
                            msg.SendMSM("Message",strMobilePhone, strMsg, strSendUserCode);
                        }
                        catch
                        {
                        }

                        try
                        {
                            //有短信接口的话，直接推送短信
                            msg.SendPhoneMSMBySP(strMobilePhone, strMsg, strSendUserCode);
                        }
                        catch
                        {
                        }


                    }).Start();

                    smsSendDIY.Message = strMsg;
                    smsSendDIY.UserCode = strSendUserCode;
                    smsSendDIY.UserName = ShareClass.GetUserName(strSendUserCode);
                    smsSendDIY.SendTime = DateTime.Now;
                    smsSendDIY.Status = "已发";

                    try
                    {
                        smsSendDIYBLL.AddSMSSendDIY(smsSendDIY);
                    }
                    catch
                    {

                    }
                }
                catch
                {
                }
            }
        }

        LoadSMSSendDIYList(strSendUserCode);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXYTSGSMSXRYDEMAILHSJQJSTXTM + "')", true);
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID, strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text;

            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From SMSSendDIY as smsSendDIY Where smsSendDIY.ID = " + strID;
            SMSSendDIYBLL smsSendDIYBLL = new SMSSendDIYBLL();
            lst = smsSendDIYBLL.GetAllSMSSendDIYs(strHQL);

            SMSSendDIY smsSendDIY = (SMSSendDIY)lst[0];

            LB_ID.Text = smsSendDIY.ID.ToString();
            TB_Message.Text = smsSendDIY.Message.Trim();

            BT_Send.Enabled = true;
        }
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql4.Text.Trim();
        IList lst;

        SMSSendDIYBLL smsSendDIYBLL = new SMSSendDIYBLL();
        lst = smsSendDIYBLL.GetAllSMSSendDIYs(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadSMSSendDIYList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From SMSSendDIY as smsSendDIY Where smsSendDIY.UserCode = " + "'" + strUserCode + "'" + " Order By smsSendDIY.ID DESC";
        SMSSendDIYBLL smsSendDIYBLL = new SMSSendDIYBLL();
        lst = smsSendDIYBLL.GetAllSMSSendDIYs(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadContactList(string strUserCode)
    {
        string strHQL;
        IList lst;


        //if (strRelatedType == "其它" | strRelatedType == null)
        //{
        strHQL = "from ContactInfor as contactInfor where contactInfor.UserCode = " + "'" + strUserCode + "'" + " order by contactInfor.FirstName ASC";
        //}
        //else
        //{
        //    strHQL = "from ContactInfor as contactInfor where contactInfor.RelatedType=" + "'" + strRelatedType + "'" + " and contactInfor.RelatedID= " + "'" + strRelatedID + "'" + " order by contactInfor.ID ASC";
        //}

        ContactInforBLL contactInforBLL = new ContactInforBLL();
        lst = contactInforBLL.GetAllContactInfors(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }
}

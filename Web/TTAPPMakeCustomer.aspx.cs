using System;
using System.Resources;
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

public partial class TTAPPMakeCustomer : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strRelatedType, strRelatedID;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strLangCode = Session["LangCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadIndustryType(DL_IndustryType);
            LoadIndustryType(DL_IndustryTypeFind);
            LoadIndustryType(DL_FindAgencyIndustryType);

            ShareClass.LoadCurrencyType(DL_CurrencyType);

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_GoodsType.DataSource = lst;
            DL_GoodsType.DataBind();
            DL_GoodsType.Items.Insert(0, new ListItem("--Select--", ""));

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadCustomerList(strRelatedType, strRelatedID);

            strHQL = "Select GroupName From T_ActorGroup Where Type <>'部分' and GroupName not in ('个人','部门','公司','集团','所有')";
            strHQL += " and (BelongDepartCode in " + strDepartString + " Or Type = '超级'";
            strHQL += " Or MakeUserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and LangCode = " + "'" + strLangCode + "'";
            strHQL += " Order by SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ActorGroup");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            LB_BelongDepartCode.Text = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            LB_BelongDepartName.Text = ShareClass.GetDepartName(LB_BelongDepartCode.Text);

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView3, strUserCode);

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strProductType != "ERP" & strProductType != "CRM" & strProductType != "SIMP" & strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "DEMO")
                {
                    TabPanel4.Visible = false;
                    TabPanel5.Visible = false;
                    TabPanel6.Visible = false;
                    TabPanel8.Visible = false;
                }
            }
            catch
            {
            }

            //如果自动产生客户编码，禁用客户代码输入框 
            if(ShareClass. GetCodeRuleStatusByType("CustomerCode") == "YES")
            {
                TB_CustomerCode.Enabled = false;
                TB_CustomerCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }

            //BusinessForm,列出业务表单类型 
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);
        }
    }

    //BusinessForm，定义后期是否可编辑此表单
    protected void DL_AllowUpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strcCustomerID, strAllowUpdate;

        strAllowUpdate = DL_AllowUpdate.SelectedValue;
        strcCustomerID = LB_CustomerID.Text.Trim();

        try
        {
            strHQL = "Update T_RelatedBusinessForm Set AllowUpdate = '" + strAllowUpdate + "'  Where RelatedType = 'Customer' and RelatedID = " + strcCustomerID;
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        //BusinessForm，隐藏业务表单元素
        Panel_RelatedBusiness.Visible = false;

        LB_CustomerID.Text = "";
        LB_CustomerCode.Text = "";
        TB_CustomerCode.Text = "";


        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strIndustryType, strCustomerCode, strCustomerName, strDepartString;
        string strState, strCity, strAreaAddress, strAgencyName;

        strDepartString = LB_DepartString.Text;

        strCustomerCode = "%" + TB_CustCode.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustName.Text.Trim() + "%";
        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";
        strState = "%" + TB_FindState.Text.Trim() + "%";
        strCity = "%" + TB_FindCity.Text.Trim() + "%";
        strAreaAddress = "%" + TB_FindArea.Text.Trim() + "%";
        strAgencyName = "%" + TB_AgencyName.Text.Trim() + "%";

        strHQL = "from Customer as customer where 1=1 ";
        strHQL += " and customer.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and customer.CustomerCode like " + "'" + strCustomerCode + "'";
        strHQL += " and customer.CustomerName like  " + "'" + strCustomerName + "'";
        strHQL += " and customer.BelongAgencyName Like " + "'" + strAgencyName + "'";
        strHQL += " and customer.State Like " + "'" + strState + "'";
        strHQL += " and customer.City Like " + "'" + strCity + "'";
        strHQL += " and customer.AreaAddress Like " + "'" + strAreaAddress + "'";
        strHQL += " and customer.CreatorCode = " + "'" + strUserCode + "'";
        //strHQL += " and customer.BelongDepartCode in " + strDepartString;
        strHQL += " Order By customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode, strCustomerID;

        if (e.CommandName != "Page")
        {
            strCustomerCode = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from Customer as customer where customer.CustomerCode = " + "'" + strCustomerCode + "'";
                CustomerBLL customerBLL = new CustomerBLL();
                lst = customerBLL.GetAllCustomers(strHQL);

                Customer customer = (Customer)lst[0];

                LB_CustomerID.Text = getCustomerID(strCustomerCode);
                TB_CustomerCode.Text = customer.CustomerCode;
                TB_CustomerName.Text = customer.CustomerName;
                TB_CustomerEnglishName.Text = customer.CustomerEnglishName;
                TB_Type.Text = customer.Type.Trim();
                TB_ContactName.Text = customer.ContactName;
                TB_SalePerson.Text = customer.SalesPerson;
                TB_EMailAddress.Text = customer.EmailAddress;
                TB_WebSite.Text = customer.WebSite;
                TB_Tel1.Text = customer.Tel1;
                TB_Tel2.Text = customer.Tel2;
                TB_ZP.Text = customer.ZP;
                TB_Fax.Text = customer.Fax;
                TB_InvoiceAddress.Text = customer.InvoiceAddress;
                TB_Bank.Text = customer.Bank;
                TB_BankAccount.Text = customer.BankAccount;
                DL_CurrencyType.SelectedValue = customer.Currency.Trim();
                TB_Country.Text = customer.Country;
                TB_State.Text = customer.State;
                TB_City.Text = customer.City;
                TB_AreaAddress.Text = customer.AreaAddress;


                TB_AddressCN.Text = customer.RegistrationAddressCN;
                TB_AddressEN.Text = customer.RegistrationAddressEN;
                LB_CreateDate.Text = customer.CreateDate.ToString();
                TB_Comment.Text = customer.Comment;

                LB_BelongDepartCode.Text = customer.BelongDepartCode;
                LB_BelongDepartName.Text = customer.BelongDepartName;

                LB_BelongAgencyCode.Text = customer.BelongAgencyCode;
                LB_BelongAgencyName.Text = customer.BelongAgencyName;

                NB_CreditRate.Amount = customer.CreditRate;
                NB_Discount.Amount = customer.Discount;

                LB_ReviewStatus.Text = customer.ReviewStatus;

                LoadProjectList(strCustomerCode);
                LoadCustomerRelatedUser(strCustomerCode);

                LoadCustomerQuestion(strCustomerCode);

                LoadRelatedConstract(strCustomerCode);
                LoadCustomerRelatedGoodsSaleOrder(strCustomerCode);
                LoadCustomerRelatedGoodsReturnOrder(strCustomerCode);
                LoadGoodsSaleQuotationOrder(strCustomerCode);

                LoadCustomerGoodsAfterService(strCustomerCode);

                HL_RelatedContactInfor.Enabled = true;
                HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;

                HL_TransferProject.Enabled = true;
                HL_TransferProject.NavigateUrl = "TTMakeProjectFromOther.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;

                LB_CustomerCode.Text = strCustomerCode;

                LoadCustomerRelatedGoodsList(strCustomerCode);

                strCustomerID = getCustomerID(strCustomerCode);

                //BusinessForm，列出关联表单模板
                try
                {
                    Panel_RelatedBusiness.Visible = true;

                    string strTemName;
                    strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = 'Customer' and RelatedID = " + strCustomerID;
                    strHQL += " Order By CreateTime DESC";

                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();

                        DL_WLType.SelectedValue = ShareClass.GetWorkTemplateType(strTemName);
                        ShareClass.LoadWFTemplate(strUserCode, DL_WLType.SelectedValue.Trim(), DL_WFTemplate);
                        DL_WFTemplate.SelectedValue = strTemName;

                        DL_AllowUpdate.SelectedValue = ds.Tables[0].Rows[0]["AllowUpdate"].ToString().Trim();
                    }
                }
                catch
                {
                }

                //BusinessForm,装载关联信息
                //TabContainer4.ActiveTabIndex = 0;
                ShareClass.LoadBusinessForm("Customer", strCustomerID, DL_WFTemplate.SelectedValue.Trim(), IFrame_RelatedInformation);


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                strHQL = "Select * From T_CustomerRelatedQuestion Where CustomerCode = " + "'" + strCustomerCode + "'";
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_CustomerRelatedQuestion");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCZKFJLBNSCJC + "')", true);
                    return;
                }

                CustomerBLL customerBLL = new CustomerBLL();
                Customer customer = new Customer();

                customer.CustomerCode = strCustomerCode;

                try
                {
                    customerBLL.DeleteCustomer(customer);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);

                    if (strRelatedType == "TASK")
                    {
                        strHQL = "Delete From T_CustomerRelatedTask Where CustomerCode = " + "'" + strCustomerCode + "'" + " and TaskID = " + strRelatedID;
                        ShareClass.RunSqlCommand(strHQL);
                    }

                    LoadCustomerList(strRelatedType, strRelatedID);
                    LoadGoodsSaleQuotationOrder("");

                    HL_RelatedContactInfor.Enabled = false;
                    HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
                }
            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode, strProjectID;

        if (e.CommandName != "Page")
        {
            strCustomerCode = TB_CustomerCode.Text.Trim();
            strProjectID = e.Item.Cells[0].Text.Trim();

            strHQL = "from ProjectCustomer as projectCustomer where projectCustomer.ProjectID = " + strProjectID + " and projectCustomer.CustomerCode = " + "'" + strCustomerCode + "'";
            ProjectCustomerBLL projectCustomerBLL = new ProjectCustomerBLL();
            lst = projectCustomerBLL.GetAllProjectCustomers(strHQL);

            ProjectCustomer projectCustomer = (ProjectCustomer)lst[0];

            try
            {
                projectCustomerBLL.DeleteProjectCustomer(projectCustomer);
                LoadProjectList(strCustomerCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DL_IndustryType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_IndustryType.SelectedValue.Trim();

        TB_Type.Text = strType;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strCustomerCode;

        strCustomerCode = LB_CustomerCode.Text.Trim();

        if (strCustomerCode == "")
        {
            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("CustomerCode") == "YES")
            {
                TB_CustomerCode.Enabled = false;
                TB_CustomerCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }
            AddCustomer();
        }
        else
        {
            UpdateCustomer();
        }
    }

    protected void AddCustomer()
    {
        string strCustomerCode, strCustomerName, strType, strContactName, strSalesPerson, strBelongDepartCode, strBelongDepartName;
        string strInvoiceAddress, strBankAccount, strCurrency, strBank, strTel1, strTel2, strFax, strEmailAddress;
        string strWebSite, strZP, strCountry, strState, strCity, strAreaAddress, strRegistrationAddressCN, strRegistrationAddressEN;
        string strCustomerEnglishName, strComment, strBelongAgencyCode, strBelongAgencyName;
        DateTime dtCreateDate;
        decimal deCreditRate, deDiscount;

        strCustomerCode = TB_CustomerCode.Text.Trim();
        strCustomerName = TB_CustomerName.Text.Trim();
        strCustomerEnglishName = TB_CustomerEnglishName.Text.Trim();
        strType = TB_Type.Text.Trim();
        strContactName = TB_ContactName.Text.Trim();
        strSalesPerson = TB_SalePerson.Text.Trim();
        strInvoiceAddress = TB_InvoiceAddress.Text.Trim();
        strBank = TB_Bank.Text.Trim();
        strBankAccount = TB_BankAccount.Text.Trim();
        strCurrency = DL_CurrencyType.SelectedValue;
        strTel1 = TB_Tel1.Text.Trim();
        strTel2 = TB_Tel2.Text.Trim();
        strFax = TB_Fax.Text.Trim();
        strEmailAddress = TB_EMailAddress.Text.Trim();
        strWebSite = TB_WebSite.Text.Trim();
        strZP = TB_ZP.Text.Trim();
        strCountry = TB_Country.Text.Trim();
        strState = TB_State.Text.Trim();
        strCity = TB_City.Text.Trim();
        strAreaAddress = TB_AreaAddress.Text.Trim();
        strRegistrationAddressCN = TB_AddressCN.Text.Trim();
        strRegistrationAddressEN = TB_AddressEN.Text.Trim();

        strBelongDepartCode = LB_BelongDepartCode.Text;
        strBelongDepartName = LB_BelongDepartName.Text;

        strBelongAgencyCode = LB_BelongAgencyCode.Text;
        strBelongAgencyName = LB_BelongAgencyName.Text;

        dtCreateDate = DateTime.Now;

        deDiscount = NB_Discount.Amount;
        deCreditRate = NB_CreditRate.Amount;

        strComment = TB_Comment.Text.Trim();

        if (strCustomerCode != "" | strCustomerName != "" | strType != "")
        {
            CustomerBLL customerBLL = new CustomerBLL();
            Customer customer = new Customer();

            customer.CustomerCode = strCustomerCode;
            customer.CustomerName = strCustomerName;
            customer.CustomerEnglishName = strCustomerEnglishName;
            customer.CustomerEnglishName = strCustomerEnglishName;
            customer.Type = strType;
            customer.ContactName = strContactName;
            customer.SalesPerson = strSalesPerson;
            customer.InvoiceAddress = strInvoiceAddress;
            customer.Bank = strBank;
            customer.BankAccount = strBankAccount;
            customer.Currency = strCurrency;
            customer.Tel1 = strTel1;
            customer.Tel2 = strTel2;
            customer.Fax = strFax;
            customer.EmailAddress = strEmailAddress;
            customer.WebSite = strWebSite;
            customer.ZP = strZP;
            customer.Country = strCountry;
            customer.State = strState;
            customer.City = strCity;
            customer.AreaAddress = strAreaAddress;
            customer.RegistrationAddressCN = strRegistrationAddressCN;
            customer.RegistrationAddressEN = strRegistrationAddressEN;
            customer.CreateDate = DateTime.Now;
            customer.CreditRate = deCreditRate;
            customer.Discount = deDiscount;
            customer.CreatorCode = strUserCode;
            customer.CreatorName = ShareClass.GetUserName(strUserCode);

            customer.BelongDepartCode = strBelongDepartCode;
            customer.BelongDepartName = strBelongDepartName;

            customer.BelongAgencyCode = strBelongAgencyCode;
            customer.BelongAgencyName = strBelongAgencyName;

            customer.Comment = strComment;
            customer.ReviewStatus = "SUCCESS";

            try
            {
                customerBLL.AddCustomer(customer);

                string strCustomerID = GetMyCreatedMaxCustomerID(strUserCode);
                string strNewCustomerCode = ShareClass.GetCodeByRule("CustomerCode", "", strCustomerID);
                if (strNewCustomerCode != "")
                {
                    TB_CustomerCode.Text = strNewCustomerCode;
                    string strHQL = "Update T_Customer Set CustomerCode = " + "'" + strNewCustomerCode + "'" + " Where CustomerID = " + strCustomerID;
                    ShareClass.RunSqlCommand(strHQL);

                    strCustomerCode = strNewCustomerCode;
                }
                LB_CustomerCode.Text = strCustomerCode;

                if (strRelatedType == "GOODS")
                {
                    string strHQL = "Insert Into T_CustomerRelatedGoods(CustomerCode,GoodsSN) Values (" + "'" + strCustomerCode + "'" + ",'" + strRelatedID + "')"; ;
                    ShareClass.RunSqlCommand(strHQL);
                }

                LoadCustomerList(strRelatedType, strRelatedID);

                LoadProjectList(strCustomerCode);
                LoadCustomerRelatedUser(strCustomerCode);
                LoadCustomerQuestion(strCustomerCode);
                LoadGoodsSaleQuotationOrder(strCustomerCode);

                HL_RelatedContactInfor.Enabled = true;
                HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Customer&RelatedID=" + strCustomerCode;
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKHDMMCHLXBNWKJC + "')", true);
        }
    }

    public static string GetMyCreatedMaxCustomerID(string strUserCode)
    {
        string strHQL;

        strHQL = "Select Max(CustomerID) From T_Customer";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected void UpdateCustomer()
    {
        string strHQL;
        IList lst;

        string strCustomerCode, strCustomerName, strType, strContactName, strSalesPerson, strBelongDepartCode, strBelongDepartName;
        string strInvoiceAddress, strBankAccount, strCurrency, strBank, strTel1, strTel2, strFax, strEmailAddress;
        string strWebSite, strZP, strCountry, strState, strCity, strAreaAddress, strRegistrationAddressCN, strRegistrationAddressEN;
        string strCustomerEnglishName, strComment, strBelongAgencyCode, strBelongAgencyName;
        DateTime dtCreateDate;
        decimal deCreditRate, deDiscount;

        strCustomerCode = TB_CustomerCode.Text.Trim();
        strCustomerName = TB_CustomerName.Text.Trim();
        strCustomerEnglishName = TB_CustomerEnglishName.Text.Trim();
        strType = TB_Type.Text.Trim();
        strContactName = TB_ContactName.Text.Trim();
        strSalesPerson = TB_SalePerson.Text.Trim();
        strInvoiceAddress = TB_InvoiceAddress.Text.Trim();
        strBank = TB_Bank.Text.Trim();
        strBankAccount = TB_BankAccount.Text.Trim();
        strCurrency = DL_CurrencyType.SelectedValue;
        strTel1 = TB_Tel1.Text.Trim();
        strTel2 = TB_Tel2.Text.Trim();
        strFax = TB_Fax.Text.Trim();
        strEmailAddress = TB_EMailAddress.Text.Trim();
        strWebSite = TB_WebSite.Text.Trim();
        strZP = TB_ZP.Text.Trim();
        strCountry = TB_Country.Text.Trim();
        strState = TB_State.Text.Trim();
        strCity = TB_City.Text.Trim();
        strAreaAddress = TB_AreaAddress.Text.Trim();
        strRegistrationAddressCN = TB_AddressCN.Text.Trim();
        strRegistrationAddressEN = TB_AddressEN.Text.Trim();

        strBelongDepartCode = LB_BelongDepartCode.Text;
        strBelongDepartName = LB_BelongDepartName.Text;

        strBelongAgencyCode = LB_BelongAgencyCode.Text;
        strBelongAgencyName = LB_BelongAgencyName.Text;

        dtCreateDate = DateTime.Now;

        deDiscount = NB_Discount.Amount;
        deCreditRate = NB_CreditRate.Amount;

        strComment = TB_Comment.Text.Trim();

        if (strCustomerCode != "" | strCustomerName != "" | strType != "")
        {
            strHQL = "from Customer as customer where customer.CustomerCode=" + "'" + strCustomerCode + "'";
            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);
            Customer customer = (Customer)lst[0];

            customer.CustomerName = strCustomerName;
            customer.CustomerEnglishName = strCustomerEnglishName;
            customer.CustomerEnglishName = strCustomerEnglishName;
            customer.Type = strType;
            customer.ContactName = strContactName;
            customer.SalesPerson = strSalesPerson;
            customer.InvoiceAddress = strInvoiceAddress;
            customer.Bank = strBank;
            customer.BankAccount = strBankAccount;
            customer.Currency = strCurrency;
            customer.Tel1 = strTel1;
            customer.Tel2 = strTel2;
            customer.Fax = strFax;
            customer.EmailAddress = strEmailAddress;
            customer.WebSite = strWebSite;
            customer.ZP = strZP;
            customer.Country = strCountry;
            customer.State = strState;
            customer.City = strCity;
            customer.AreaAddress = strAreaAddress;
            customer.RegistrationAddressCN = strRegistrationAddressCN;
            customer.RegistrationAddressEN = strRegistrationAddressEN;
            customer.CreditRate = deCreditRate;
            customer.Discount = deDiscount;
            customer.Comment = strComment;
            customer.CreatorCode = strUserCode;
            customer.CreatorName = ShareClass.GetUserName(strUserCode);
            customer.BelongDepartCode = strBelongDepartCode;
            customer.BelongDepartName = strBelongDepartName;

            customer.BelongAgencyCode = strBelongAgencyCode;
            customer.BelongAgencyName = strBelongAgencyName;

            string strCustomerID = getCustomerID(strCustomerCode);

            try
            {
                customerBLL.UpdateCustomer(customer, strCustomerCode);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                //BusinessForm，关联相应的业务表单模板
                ShareClass.SaveRelatedBusinessForm("Customer", strCustomerID, DL_WFTemplate.SelectedValue, DL_AllowUpdate.SelectedValue, strUserCode);

                LoadCustomerList(strRelatedType, strRelatedID);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKHDMMCHLXBNWKJC + "')", true);
        }
    }

    //BusinessForm,工作流类型查询
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Visible = 'YES' and Authority = '所有'";
        strHQL += " Order by SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();

        DL_WFTemplate.Items.Add(new ListItem(""));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    //BusinessForm,启动关联的业务表单
    protected void BT_StartupBusinessForm_Click(object sender, EventArgs e)
    {
        string strURL;
        string strTemName, strIdentifyString;
        strTemName = DL_WFTemplate.SelectedValue.Trim();
        strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);

        string strCustomerID;
        strCustomerID = LB_CustomerID.Text.Trim();

        if (strCustomerID == "")
        {
            strCustomerID = "0";
        }

        //strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);


        strURL = "TTRelatedDIYBusinessForm.aspx?RelatedType=Customer&RelatedID=" + strCustomerID + "&IdentifyString=" + strIdentifyString;
        IFrame_RelatedInformation.Attributes.Add("src", strURL);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    //BusinessForm,删除关联的业务表单
    protected void BT_DeleteBusinessForm_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strTemName;
        strTemName = DL_WFTemplate.SelectedValue.Trim();

        string strCustomerID;
        strCustomerID = LB_CustomerID.Text.Trim();

        strHQL = "Delete From T_RelatedBusinessForm Where RelatedType = 'Customer' and RelatedID = " + strCustomerID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_RelatedProject_Click(object sender, EventArgs e)
    {
        string strProjectID;
        string strCustomerCode, strDepartString;

        strDepartString = LB_DepartString.Text;

        strProjectID = TB_ProjectID.Text.Trim();
        strCustomerCode = TB_CustomerCode.Text.Trim();

        //判断项目是不是存在其管理范围
        if (checkProjectIsValid(strProjectID, LB_DepartString.Text))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSJBCZJC + "')", true);
            return;
        }

        ProjectCustomerBLL projectCustomerBLL = new ProjectCustomerBLL();
        ProjectCustomer projectCustomer = new ProjectCustomer();

        projectCustomer.ProjectID = int.Parse(strProjectID);
        projectCustomer.CustomerCode = strCustomerCode;

        try
        {
            projectCustomerBLL.AddProjectCustomer(projectCustomer);
            LoadProjectList(strCustomerCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGLCCJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    //判断项目是不是存在其管理范围
    protected bool checkProjectIsValid(string strProjectID, string strDepartString)
    {
        string strHQL;

        strHQL = "Select * From T_Project Where ProjectID = " + strProjectID;
        strHQL += " and BelongDepartCode in " + strDepartString;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode, strOperatorCode;

        strCustomerCode = TB_CustomerCode.Text.Trim();

        if (strCustomerCode != "")
        {
            strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            CustomerRelatedUserBLL customerRelatedUserBLL = new CustomerRelatedUserBLL();
            CustomerRelatedUser customerRelatedUser = new CustomerRelatedUser();

            customerRelatedUser.CustomerCode = strCustomerCode;
            customerRelatedUser.UserCode = strOperatorCode;
            customerRelatedUser.UserName = ShareClass.GetUserName(strOperatorCode);

            try
            {
                customerRelatedUserBLL.AddCustomerRelatedUser(customerRelatedUser);

                strHQL = "from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.CustomerCode = " + "'" + strCustomerCode + "'";
                lst = customerRelatedUserBLL.GetAllCustomerRelatedUsers(strHQL);

                RP_CustomerMember.DataSource = lst;
                RP_CustomerMember.DataBind();
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZHTCNZJCY + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void RP_CustomerMember_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

            string strHQL, strCustomerCode;
            IList lst;

            strCustomerCode = TB_CustomerCode.Text.Trim();
            strHQL = "from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.CustomerCode = " + "'" + strCustomerCode + "'" + " and customerRelatedUser.UserName = " + "'" + strUserName + "'";
            CustomerRelatedUserBLL customerRelatedUserBLL = new CustomerRelatedUserBLL();
            lst = customerRelatedUserBLL.GetAllCustomerRelatedUsers(strHQL);

            CustomerRelatedUser customerRelatedUser = (CustomerRelatedUser)lst[0];

            customerRelatedUserBLL.DeleteCustomerRelatedUser(customerRelatedUser);

            LoadCustomerRelatedUser(strCustomerCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void BT_FindGroup_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGroupName = TB_ActorGroupName.Text.Trim();
        strGroupName = "%" + strGroupName + "%";

        strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
        strHQL += " and GroupName Like " + "'" + strGroupName + "'";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);
        Repeater1.DataSource = lst;
        Repeater1.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            int i = 0;
            string strCustomerCode, strGroupName;
            string strUserCode;

            strGroupName = ((Button)e.Item.FindControl("BT_GroupName")).Text.Trim();


            TB_ActorGroupName.Text = strGroupName;

            strCustomerCode = TB_CustomerCode.Text.Trim();

            CustomerRelatedUserBLL customerRelatedUserBLL = new CustomerRelatedUserBLL();
            CustomerRelatedUser customerRelatedUser = new CustomerRelatedUser();


            ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
            ActorGroupDetail actorGroupDetail = new ActorGroupDetail();

            if (strCustomerCode != "")
            {
                strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'";
                lst = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);

                for (i = 0; i < lst.Count; i++)
                {
                    actorGroupDetail = (ActorGroupDetail)lst[i];

                    strUserCode = actorGroupDetail.UserCode.Trim();

                    customerRelatedUser.CustomerCode = strCustomerCode;
                    customerRelatedUser.UserCode = strUserCode;
                    customerRelatedUser.UserName = ShareClass.GetUserName(strUserCode);


                    try
                    {
                        customerRelatedUserBLL.AddCustomerRelatedUser(customerRelatedUser);
                    }
                    catch
                    {
                    }
                }

                LoadCustomerRelatedUser(strCustomerCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZKHCNZJCY + "')", true);
            }

        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGoodsSN = ((Button)e.Item.FindControl("BT_GoodsSN")).Text.Trim();

            for (int i = 0; i < DataGrid9.Items.Count; i++)
            {
                DataGrid9.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsAfterSaleTask(strGoodsSN);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strTaskID = ((Button)e.Item.FindControl("BT_TaskID")).Text.Trim();

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsApplicationDetail("AfterSale", strTaskID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strCustomerCode;
            IList lst;

            strID = e.Item.Cells[2].Text;
            LB_ID.Text = strID;

            strCustomerCode = TB_CustomerCode.Text.Trim();

            for (int i = 0; i < DataGrid12.Items.Count; i++)
            {
                DataGrid12.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            if (e.CommandName == "Update")
            {
                strHQL = "from CustomerRelatedGoodsInfor as customerRelatedGoodsInfor Where customerRelatedGoodsInfor.CustomerCode = " + "'" + strCustomerCode + "'";

                CustomerRelatedGoodsInforBLL customerRelatedGoodsInforBLL = new CustomerRelatedGoodsInforBLL();
                lst = customerRelatedGoodsInforBLL.GetAllCustomerRelatedGoodsInfors(strHQL);
                CustomerRelatedGoodsInfor customerRelatedGoodsInfor = (CustomerRelatedGoodsInfor)lst[0];

                TB_GoodsCode.Text = customerRelatedGoodsInfor.GoodsCode;
                TB_GoodsName.Text = customerRelatedGoodsInfor.GoodsName;
                TB_ModelNumber.Text = customerRelatedGoodsInfor.ModelNumber;
                TB_Spec.Text = customerRelatedGoodsInfor.Spec;
                TB_Brand.Text = customerRelatedGoodsInfor.Brand;

                DL_GoodsType.SelectedValue = customerRelatedGoodsInfor.Type;
                DL_Unit.SelectedValue = customerRelatedGoodsInfor.Unit;

                NB_Price.Amount = customerRelatedGoodsInfor.Price;

                DL_Unit.SelectedValue = customerRelatedGoodsInfor.Unit;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                CustomerRelatedGoodsInforBLL customerRelatedGoodsInforBLL = new CustomerRelatedGoodsInforBLL();
                strHQL = "from CustomerRelatedGoodsInfor as customerRelatedGoodsInfor where customerRelatedGoodsInfor.ID = " + strID;
                lst = customerRelatedGoodsInforBLL.GetAllCustomerRelatedGoodsInfors(strHQL);
                CustomerRelatedGoodsInfor customerRelatedGoodsInfor = (CustomerRelatedGoodsInfor)lst[0];

                try
                {
                    customerRelatedGoodsInforBLL.DeleteCustomerRelatedGoodsInfor(customerRelatedGoodsInfor);

                    LoadCustomerRelatedGoodsList(strCustomerCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }


    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid14.Items.Count; i++)
            {
                DataGrid14.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Item as item where ItemCode = " + "'" + strItemCode + "'";
            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);

            if (lst.Count > 0)
            {
                Item item = (Item)lst[0];

                TB_GoodsCode.Text = item.ItemCode;
                TB_GoodsName.Text = item.ItemName;
                try
                {
                    DL_GoodsType.SelectedValue = item.SmallType;
                }
                catch
                {

                }
                TB_ModelNumber.Text = item.ModelNumber;
                DL_Unit.SelectedValue = item.Unit;
                TB_Spec.Text = item.Specification;
                TB_Brand.Text = item.Brand;

                NB_Price.Amount = item.PurchasePrice;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
        }
    }


    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strGoodsCode;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            for (int i = 0; i < DataGrid13.Items.Count; i++)
            {
                DataGrid13.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Goods as goods where goods.ID = " + strID;
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            if (lst.Count > 0)
            {
                Goods goods = (Goods)lst[0];

                TB_GoodsCode.Text = goods.GoodsCode;
                TB_GoodsName.Text = goods.GoodsName;
                TB_ModelNumber.Text = goods.ModelNumber;
                DL_Unit.SelectedValue = goods.UnitName;
                TB_Spec.Text = goods.Spec;
                TB_Brand.Text = goods.Manufacturer;

                DL_GoodsType.SelectedValue = goods.Type;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
        }
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;


        //TabContainer1.ActiveTabIndex = 0;

        strType = DL_GoodsType.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strType = "%" + strType + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select * From T_Goods as goods Where goods.GoodsCode Like " + "'" + strGoodsCode + "'" + " and goods.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and goods.Type Like " + "'" + strType + "'" + " and goods.ModelNumber Like " + "'" + strModelNumber + "'" + " and goods.Spec Like " + "'" + strSpec + "'";
        strHQL += " Order by goods.Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid13.DataSource = ds;
        DataGrid13.DataBind();

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid14.DataSource = ds;
        DataGrid14.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }


    protected void BT_CreateGoodsList_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }


    protected void BT_SaveGoods_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddGoods();
        }
        else
        {
            UpdateGoods();
        }
    }

    protected void AddGoods()
    {
        string strRecordID, strCustomerCode, strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strStatus;
        string strUnitName;

        decimal dePrice;


        strCustomerCode = TB_CustomerCode.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();

        strSpec = TB_Spec.Text.Trim();
        dePrice = NB_Price.Amount;


        if (strType == "" | strGoodsName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popGoodsListWindow','false') ", true);

        }
        else
        {
            CustomerRelatedGoodsInforBLL customerRelatedGoodsInforBLL = new CustomerRelatedGoodsInforBLL();
            CustomerRelatedGoodsInfor customerRelatedGoodsInfor = new CustomerRelatedGoodsInfor();

            customerRelatedGoodsInfor.CustomerCode = strCustomerCode;
            customerRelatedGoodsInfor.Type = strType;
            customerRelatedGoodsInfor.GoodsCode = strGoodsCode;
            customerRelatedGoodsInfor.GoodsName = strGoodsName;

            customerRelatedGoodsInfor.ModelNumber = strModelNumber;
            customerRelatedGoodsInfor.Spec = strSpec;
            customerRelatedGoodsInfor.Brand = TB_Brand.Text;

            customerRelatedGoodsInfor.Number = 0;
            customerRelatedGoodsInfor.Unit = strUnitName;
            customerRelatedGoodsInfor.Price = dePrice;


            try
            {
                customerRelatedGoodsInforBLL.AddCustomerRelatedGoodsInfor(customerRelatedGoodsInfor);

                strRecordID = ShareClass.GetMyCreatedMaxCustomerRelatedGoodsInforID(strCustomerCode);
                LB_ID.Text = strRecordID;

                LoadCustomerRelatedGoodsList(strCustomerCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

            }
        }
    }


    protected void UpdateGoods()
    {
        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;
        string strUnitName;

        decimal dePrice, deNumber;

        string strID, strCustomerCode;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strCustomerCode = TB_CustomerCode.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;


        if (strType == "" | strGoodsName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popGoodsListWindow','false') ", true);

        }
        else
        {
            CustomerRelatedGoodsInforBLL customerRelatedGoodsInforBLL = new CustomerRelatedGoodsInforBLL();
            strHQL = "from CustomerRelatedGoodsInfor as customerRelatedGoodsInfor where customerRelatedGoodsInfor.ID = " + strID;
            lst = customerRelatedGoodsInforBLL.GetAllCustomerRelatedGoodsInfors(strHQL);
            CustomerRelatedGoodsInfor customerRelatedGoodsInfor = (CustomerRelatedGoodsInfor)lst[0];

            customerRelatedGoodsInfor.CustomerCode = strCustomerCode;
            customerRelatedGoodsInfor.Type = strType;
            customerRelatedGoodsInfor.GoodsCode = strGoodsCode;
            customerRelatedGoodsInfor.GoodsName = strGoodsName;
            customerRelatedGoodsInfor.ModelNumber = strModelNumber;
            customerRelatedGoodsInfor.Spec = strSpec;
            customerRelatedGoodsInfor.Brand = TB_Brand.Text;

            customerRelatedGoodsInfor.Number = 0;
            customerRelatedGoodsInfor.Unit = strUnitName;
            customerRelatedGoodsInfor.Price = dePrice;



            try
            {
                customerRelatedGoodsInforBLL.UpdateCustomerRelatedGoodsInfor(customerRelatedGoodsInfor, int.Parse(strID));

                LoadCustomerRelatedGoodsList(strCustomerCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

            }
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            LB_BelongDepartCode.Text = strDepartCode;
            LB_BelongDepartName.Text = ShareClass.GetDepartName(strDepartCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void BT_BelongAgency_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popFindAgencyWindow') ", true);
    }

    protected void DL_FindAgencyIndustryType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_FindAgencyIndustryType.SelectedValue.Trim();

        TB_FindAgencyIndustryType.Text = strType;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popFindAgencyWindow') ", true);
    }

    protected void BT_FindAgency_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strIndustryType, strCustomerCode, strCustomerName, strDepartString;

        strDepartString = LB_DepartString.Text;

        strCustomerCode = "%" + TB_FindAgencyCode.Text.Trim() + "%";
        strCustomerName = "%" + TB_FindAgencyName.Text.Trim() + "%";
        strIndustryType = "%" + TB_FindAgencyIndustryType.Text.Trim() + "%";

        strHQL = "from Customer as customer where 1=1 ";
        strHQL += " and customer.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and customer.CustomerCode like " + "'" + strCustomerCode + "'";
        strHQL += " and customer.CustomerName like  " + "'" + strCustomerName + "'";
        strHQL += " and customer.CreatorCode = " + "'" + strUserCode + "'";
        //strHQL += " and customer.BelongDepartCode in " + strDepartString;
        strHQL += " Order By customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid15.DataSource = lst;
        DataGrid15.DataBind();

        LB_Sql15.Text = strHQL;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popFindAgencyWindow') ", true);
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            for (int i = 0; i < DataGrid15.Items.Count; i++)
            {
                DataGrid15.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            string strAgencyCode = e.Item.Cells[1].Text.Trim();
            string strAgencyName = ShareClass.GetCustomerNameFromCustomerCode(strAgencyCode);

            string strUserCode = LB_UserCode.Text.Trim();

            LB_BelongAgencyCode.Text = strAgencyCode;
            LB_BelongAgencyName.Text = strAgencyName;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid15_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql15.Text;
        IList lst;

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid15.DataSource = lst;
        DataGrid15.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popFindAgencyWindow') ", true);
    }


    protected void LoadCustomerRelatedGoodsList(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        CustomerRelatedGoodsInforBLL customerRelatedGoodsInforBLL = new CustomerRelatedGoodsInforBLL();
        strHQL = "from CustomerRelatedGoodsInfor as customerRelatedGoodsInfor where customerRelatedGoodsInfor.CustomerCode = " + "'" + strCustomerCode + "'";
        lst = customerRelatedGoodsInforBLL.GetAllCustomerRelatedGoodsInfors(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }

    protected void LoadGoodsSaleQuotationOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleQuotationOrder as goodsSaleQuotationOrder where ";
        strHQL += " goodsSaleQuotationOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by goodsSaleQuotationOrder.QOID DESC";
        GoodsSaleQuotationOrderBLL goodsSaleQuotationOrderBLL = new GoodsSaleQuotationOrderBLL();
        lst = goodsSaleQuotationOrderBLL.GetAllGoodsSaleQuotationOrders(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
    }

    protected void LoadGoodsAfterSaleTask(string strGoodsSN)
    {
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectTask as projectTask where projectTask.GoodsSN = " + "'" + strGoodsSN + "'" + " Order by projectTask.TaskID ASC";
        ProjectTask projectTask = new ProjectTask();
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid10.DataSource = lst;
        DataGrid10.DataBind();
    }

    protected void LoadGoodsApplicationDetail(string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where ";
        strHQL += " goodsApplicationDetail.AAID in (Select goodsApplication.AAID From GoodsApplication as goodsApplication Where goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID + ")";

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }

    protected void LoadCustomerRelatedUser(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.CustomerCode = " + "'" + strCustomerCode + "'";
        CustomerRelatedUserBLL customerRelatedUserBLL = new CustomerRelatedUserBLL();
        lst = customerRelatedUserBLL.GetAllCustomerRelatedUsers(strHQL);

        RP_CustomerMember.DataSource = lst;
        RP_CustomerMember.DataBind();
    }

    protected void LoadCustomerRelatedProject(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID in ( select customerRelatedProject.ProjectID from  CustomerRelatedProject as customerRelatedProject where customerRelatedProject.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadCustomerRelatedGoodsSaleOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadCustomerRelatedGoodsReturnOrder(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsReturnOrder as goodsReturnOrder where goodsReturnOrder.CustomerCode = " + "'" + strCustomerCode + "'";
        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DL_IndustryTypeFind_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_IndustryTypeFind.SelectedValue.Trim();

        TB_IndustryTypeFind.Text = strType;

    }

    protected void LoadIndustryType(DropDownList DL_Type)
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Order By industryType.SortNumber ASC";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        DL_Type.DataSource = lst;
        DL_Type.DataBind();

        DL_Type.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadCustomerList(string strRelatedType, string strRelatedID)
    {
        string strHQL;

        strHQL = "Select * from T_Customer where CreatorCode =" + "'" + strUserCode + "'";
        if (strRelatedType == "GOODS")
        {
            strHQL += " and CustomerCode in (Select CustomerCode From T_CustomerRelatedGOODS Where GoodsSN ='" + strRelatedID + "')";
        }
        strHQL += " Order by CreateDate DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadProjectList(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID in (select projectCustomer.ProjectID from ProjectCustomer as projectCustomer where projectCustomer.CustomerCode = " + "'" + strCustomerCode + "'" + ")";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
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

    protected void LoadRelatedConstract(string strCustomerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.Status <> '归档'";
        strHQL += " and constract.RelatedCustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by constract.SignDate DESC";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid8.DataSource = lst;
        DataGrid8.DataBind();
    }

    protected void LoadCustomerGoodsAfterService(string strCustomerCode)
    {
        string strHQL;


        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where CustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Or FinalCustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");

        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();
    }

    //取得客户ID
    protected string getCustomerID(string strCustomerCode)
    {
        string strHQL;

        strHQL = "Select CustomerID From T_Customer Where CustomerCode = '" + strCustomerCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        return ds.Tables[0].Rows[0][0].ToString();
    }
}

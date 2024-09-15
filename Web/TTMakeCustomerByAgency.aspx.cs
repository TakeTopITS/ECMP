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
using TakeTopGantt.models;

public partial class TTMakeCustomerByAgency : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strRelatedType, strRelatedID;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        strLangCode = Session["LangCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadIndustryType();
            ShareClass.LoadCurrencyType(DL_CurrencyType);

            LoadCustomerList(strRelatedType, strRelatedID);

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            LB_DepartString.Text = strDepartString;

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

            TB_CustomerCode.Text = "CS" + strUserCode;

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

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

            string strUserType;
            strUserType = ShareClass.GetUserType(strUserCode);
            if(strUserType == "OUTER")
            {
                TabPanel3.Visible = false;
            }


            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("CustomerCode") == "YES")
            {
                TB_CustomerCode.Enabled = false;
                TB_CustomerCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode;
        string strReviewStatus;

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

                TB_SimpleName.Text = customer.SimpleName.Trim();
                TB_WorkSiteURL.Text = customer.WorkSiteURL.Trim();

                LB_BelongDepartCode.Text = customer.BelongDepartCode;
                LB_BelongDepartName.Text = customer.BelongDepartName;

                NB_CreditRate.Amount = customer.CreditRate;
                NB_Discount.Amount = customer.Discount;

                LB_ReviewStatus.Text = customer.ReviewStatus;

                strReviewStatus = customer.ReviewStatus.Trim();

                //if (strReviewStatus != "SUCCESS")
                //{
                //    BT_SubmitReview.Enabled = true;
                //}

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

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "SubmitReview")
            {
                if (strCustomerCode != "")
                {
                    strHQL = "from Customer as customer where customer.CustomerCode=" + "'" + strCustomerCode + "'";
                    CustomerBLL customerBLL = new CustomerBLL();
                    lst = customerBLL.GetAllCustomers(strHQL);
                    Customer customer = (Customer)lst[0];

                    strReviewStatus = customer.ReviewStatus.Trim();

                    if (strReviewStatus == "SUCCESS")
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYJBACGQBYCFTJ + "')", true);
                        return;
                    }

                    customer.ReviewStatus = "WAITING";

                    try
                    {
                        customerBLL.UpdateCustomer(customer, strCustomerCode);

                        LB_ReviewStatus.Text = "WAITING";

                        LoadCustomerList(strRelatedType, strRelatedID);

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBACG + "')", true);

                        //推送信息给客服主管
                        try
                        {
                            string strLeaderCode = GetMemberLeaderUserCode(strUserCode);
                            if (strLeaderCode == "")
                            {
                                return;
                            }
                            string strNofiInfo = "你有一个代理商提交的客户备案要审批，请关注！";
                            Action action = new Action(delegate ()
                            {
                                try
                                {
                                    Msg msg = new Msg();
                                    msg.SendMSM("Message", strUserCode, strNofiInfo, "ADMIN");
                                }
                                catch (Exception ex)
                                {
                                }
                            });
                            System.Threading.Tasks.Task.Factory.StartNew(action);
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBACG + "')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBASBQJC + "')", true);
                }

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


                    //BT_SubmitReview.Enabled = false;

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

    protected void BT_SortByAreaAddress_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strSortName = LB_UpDown.Text.Trim();

        strHQL = "Select * from T_Customer where CreatorCode =" + "'" + strUserCode + "'";
        if (strRelatedType == "GOODS")
        {
            strHQL += " and CustomerCode in (Select CustomerCode From T_CustomerRelatedGOODS Where GoodsSN ='" + strRelatedID + "')";
        }

        if (strSortName == "UP")
        {
            strHQL += " Order by AreaAddress DESC";
            LB_UpDown.Text = "DOWN";
        }
        else
        {
            strHQL += " Order by AreaAddress ASC";
            LB_UpDown.Text = "UP";

        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
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
        string strCustomerEnglishName, strComment, strSimpleName, strWorkSiteURL;
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

        strSimpleName = TB_SimpleName.Text.Trim();
        strWorkSiteURL = TB_WorkSiteURL.Text.Trim();

        strBelongDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strBelongDepartName = ShareClass.GetDepartName(strBelongDepartCode);

        dtCreateDate = DateTime.Now;

        deDiscount = NB_Discount.Amount;
        deCreditRate = NB_CreditRate.Amount;

        strComment = TB_Comment.Text.Trim();

        if (strCustomerCode != "" | strCustomerName != "" | strSimpleName != "" | strType != "")
        {
            if (CheckCustomerNameIsExist(strCustomerCode, strCustomerName, strSimpleName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click1111", "alert('" + Resources.lang.ZZJGCZXTMTDKHQJC + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }

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

            customer.SimpleName = TB_SimpleName.Text.Trim();
            customer.WorkSiteURL = TB_WorkSiteURL.Text.Trim();

            customer.BelongDepartCode = strBelongDepartCode;
            customer.BelongDepartName = strBelongDepartName;

            customer.BelongAgencyCode = strBelongDepartCode;
            customer.BelongAgencyName = strBelongDepartName;

            customer.ReviewStatus = "";
            customer.Comment = strComment;

            try
            {
                customerBLL.AddCustomer(customer);

                string strCustomerID = GetMyCreatedMaxCustomerID(strUserCode);
                string strNewCustomerCode = ShareClass.GetCodeByRule("CustomerCode", "", strCustomerID);
                if (strNewCustomerCode != "")
                {
                    strNewCustomerCode = strUserCode.Substring(0, 4) + strNewCustomerCode;
                    TB_CustomerCode.Text = strNewCustomerCode;
                    string strHQL = "Update T_Customer Set CustomerCode = " + "'" + strNewCustomerCode + "'" + " Where CustomerID = " + strCustomerID;
                    ShareClass.RunSqlCommand(strHQL);

                    strCustomerCode = strNewCustomerCode;
                }
                LB_CustomerCode.Text = strCustomerCode;

                LB_ReviewStatus.Text = "";

                //BT_SubmitReview.Enabled = true;

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
            catch
            {
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
        string strCustomerEnglishName, strComment, strSimpleName, strWorkSiteURL;
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

        strSimpleName = TB_SimpleName.Text.Trim();
        strWorkSiteURL = TB_WorkSiteURL.Text.Trim();

        strBelongDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strBelongDepartName = ShareClass.GetDepartName(strBelongDepartCode);

        dtCreateDate = DateTime.Now;

        deDiscount = NB_Discount.Amount;
        deCreditRate = NB_CreditRate.Amount;

        strComment = TB_Comment.Text.Trim();

        if (strCustomerCode != "" | strCustomerName != "" | strSimpleName != "" | strType != "")
        {
            if (CheckCustomerNameIsExist(strCustomerCode, strCustomerName, strSimpleName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click1111", "alert('" + Resources.lang.ZZJGCZXTMTDKHQJC + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }

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

            customer.SimpleName = TB_SimpleName.Text.Trim();
            customer.WorkSiteURL = TB_WorkSiteURL.Text.Trim();

            customer.BelongDepartCode = strBelongDepartCode;
            customer.BelongDepartName = strBelongDepartName;

            customer.BelongAgencyCode = strBelongDepartCode;
            customer.BelongAgencyName = strBelongDepartName;

            try
            {
                customerBLL.UpdateCustomer(customer, strCustomerCode);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                LoadCustomerList(strRelatedType, strRelatedID);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKHDMMCHLXBNWKJC + "')", true);
        }
    }

    protected void BT_SubmitReview_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strCustomerCode, strCustomerName, strType, strReviewStatus;
        string strCustomerEnglishName, strComment;
        strCustomerCode = TB_CustomerCode.Text.Trim();
        strCustomerName = TB_CustomerName.Text.Trim();
        strCustomerEnglishName = TB_CustomerEnglishName.Text.Trim();
        strType = TB_Type.Text.Trim();
        strComment = TB_Comment.Text.Trim();

        if (strCustomerCode != "" | strCustomerName != "" | strType != "")
        {
            strHQL = "from Customer as customer where customer.CustomerCode=" + "'" + strCustomerCode + "'";
            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);
            Customer customer = (Customer)lst[0];

            strReviewStatus = customer.ReviewStatus.Trim();

            if (strReviewStatus == "SUCCESS")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYJBACGQBYCFTJ + "')", true);
                return;
            }

            customer.Comment = strComment;
            customer.ReviewStatus = "WAITING";
            customer.CreateDate = DateTime.Now;

            try
            {
                customerBLL.UpdateCustomer(customer, strCustomerCode);

                LB_ReviewStatus.Text = "WAITING";

                LoadCustomerList(strRelatedType, strRelatedID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBACG + "')", true);

                //推送信息给客服主管
                try
                {
                    string strLeaderCode = GetMemberLeaderUserCode(strUserCode);
                    if (strLeaderCode == "")
                    {
                        return;
                    }
                    string strNofiInfo = "你有一个代理商提交的客户备案要审批，请关注！";
                    Action action = new Action(delegate ()
                    {
                        try
                        {
                            Msg msg = new Msg();
                            msg.SendMSM("Message", strUserCode, strNofiInfo, "ADMIN");
                        }
                        catch (Exception ex)
                        {
                        }
                    });
                    System.Threading.Tasks.Task.Factory.StartNew(action);
                }
                catch (Exception ex)
                {
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBACG + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJBASBQJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    //取得此成员直接上级代码
    protected string GetMemberLeaderUserCode(string strUserCode)
    {
        string strHQL;

        strHQL = "Select UserCode From T_MemberLevel Where UnderCode = " + "'" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    protected void BT_RelatedProject_Click(object sender, EventArgs e)
    {
        string strProjectID;
        string strCustomerCode;

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

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strIndustryType, strCustomerCode, strCustomerName;

        strCustomerCode = "%" + TB_CustCode.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustName.Text.Trim() + "%";
        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";

        strHQL = "from Customer as customer where ";
        strHQL += " customer.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and customer.CustomerCode like " + "'" + strCustomerCode + "'";
        strHQL += " and customer.CustomerName like  " + "'" + strCustomerName + "'";
        strHQL += " and customer.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " Order By customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_CustomerCode.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void DL_IndustryTypeFind_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_IndustryTypeFind.SelectedValue.Trim();

        TB_IndustryTypeFind.Text = strType;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void LoadIndustryType()
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Order By industryType.SortNumber ASC";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        DL_IndustryType.DataSource = lst;
        DL_IndustryType.DataBind();

        DL_IndustryTypeFind.DataSource = lst;
        DL_IndustryTypeFind.DataBind();

        DL_IndustryType.Items.Insert(0, new ListItem("--Select--", ""));
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


    //判断客户名称和简称是否存在
    protected bool CheckCustomerNameIsExist(string strCustomerCode, string strCustomerName, string strCustomerSimpleName)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From T_Customer Where (CustomerName = '{0}' or SimpleName = '{1}') and CustomerCode <> '{2}'", strCustomerName, strCustomerSimpleName, strCustomerCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }

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

using System;
using System.Resources;
using System.IO;
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
using System.Data.SqlClient;
using System.Data.OleDb;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCustomerInfoImport : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strDepartCode, strDepartName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartName = ShareClass.GetDepartName(ShareClass.GetDepartCodeFromUserCode(strUserCode));

        string strDepartString;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "客户档案导入", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from Customer as customer ";
            strHQL += " Where (customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
            strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " Order by customer.CreateDate DESC";

            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LoadIndustryType();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        string strIndustryType, strCustomerCode, strCustomerName, strContactPerson;

        strDepartString = LB_DepartString.Text.Trim();

        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";
        strCustomerCode = "%" + TB_CustCode.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustName.Text.Trim() + "%";
        strContactPerson = "%" + TB_ContactPerson.Text.Trim() + "%";

        strHQL = "from Customer as customer where ";
        strHQL += " customer.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and customer.CustomerCode like " + "'" + strCustomerCode + "'";
        strHQL += " and customer.CustomerName like  " + "'" + strCustomerName + "'";
        strHQL += " and ((customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " or (customer.CustomerCode in (Select contactInfor.RelatedID From ContactInfor as contactInfor Where contactInfor.RelatedType = '客户' and contactInfor.FirstName Like " + "'" + strContactPerson + "'" + ")))";
        strHQL += " Order by customer.CustomerCode DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DL_IndustryTypeFind_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_IndustryTypeFind.SelectedValue.Trim();

        TB_IndustryTypeFind.Text = strType;
    }

    protected void btn_ExcelToDataTraining_Click(object sender, EventArgs e)
    {
        if (ExcelToDBTest() == -1)
        {
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC;
            return;
        }
        else
        {

            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
                return;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
                return;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                }
                else
                {
                    CustomerBLL customerBLL = new CustomerBLL();
                    Customer customer = new Customer();

                    for (int i = 0; i < dr.Length; i++)
                    {
                        if (dr[i]["代码"].ToString().Trim() != "")
                        {
                            string strCustomerCode = dr[i]["代码"].ToString().Trim();

                            try
                            {
                                customer.CustomerCode = dr[i]["代码"].ToString().Trim();
                                customer.CustomerName = dr[i]["名称"].ToString().Trim();
                                customer.Type = dr[i]["行业类型"].ToString().Trim();
                                customer.ContactName = dr[i]["联系人"].ToString().Trim();
                                customer.Tel1 = dr[i]["电话"].ToString().Trim();
                                customer.EmailAddress = dr[i]["EMail"].ToString().Trim();
                                customer.RegistrationAddressCN = dr[i]["中文地址"].ToString().Trim();
                                customer.RegistrationAddressEN = dr[i]["英文地址"].ToString().Trim();
                                customer.Bank = dr[i]["结算银行"].ToString().Trim();
                                customer.BankAccount = dr[i]["银行帐号"].ToString().Trim();
                                customer.Currency = dr[i]["结算币别"].ToString().Trim();

                                customer.AreaAddress = dr[i]["区域"].ToString().Trim();
                                customer.State = dr[i]["省份"].ToString().Trim();
                                customer.City = dr[i]["城市"].ToString().Trim();

                                customer.BelongAgencyCode = dr[i]["分管经销商代码"].ToString().Trim();
                                customer.BelongAgencyName = dr[i]["分管经销商名称"].ToString().Trim();

                                customer.BelongDepartCode = dr[i]["归属部门代码"].ToString().Trim();
                                customer.BelongDepartName = dr[i]["归属部门名称"].ToString().Trim();

                                customer.CreateDate = DateTime.Now;
                                customer.SalesPerson = strUserName;

                                customer.CreatorCode = strUserCode;
                                customer.CreatorName = strUserName;

                                customer.CustomerEnglishName = "";
                                customer.CustomerEnglishName = "";

                                customer.SalesPerson = "";
                                customer.InvoiceAddress = "";

                                customer.Tel2 = "";
                                customer.Fax = "";

                                customer.WebSite = "";
                                customer.ZP = "";


                                customer.CreditRate = 1;
                                customer.Discount = 0;

                                customer.SimpleName = "";
                                customer.WorkSiteURL = "";

                                customer.Comment = "";
                                customer.ReviewStatus = "SUCCESS";

                                customerBLL.AddCustomer(customer);
                            }
                            catch (Exception err)
                            {
                                LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strCustomerCode + " : " + err.Message.ToString() + "<br/>"; ;

                                LogClass.WriteLogFile(this.GetType().BaseType.Name + "：" + Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strCustomerCode + " : " + err.Message.ToString());
                            }
                        }
                    }

                    LoadCustomerList(strUserCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click5335", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click4446", "displayWaitingImage('none');", true);
                }
            }
        }
    }

    protected int ExcelToDBTest()
    {
        string strHQL;

        string strCustomerCode;

        int j = 0;

        IList lst;

        try
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ;
                j = -1;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
                j = -1;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
                j = -1;
            }
            else
            {
                FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
                string strpath = strDocSavePath + newfilename;

                //DataSet ds = ExcelToDataSet(strpath, filename);
                //DataRow[] dr = ds.Tables[0].Select();
                //DataRow[] dr = ds.Tables[0].Select();//定义一个DataRow数组
                //int rowsnum = ds.Tables[0].Rows.Count;

                DataTable dt = MSExcelHandler.ReadExcelToDataTable(strpath, filename);
                DataRow[] dr = dt.Select();                        //定义一个DataRow数组
                int rowsnum = dt.Rows.Count;
                if (rowsnum == 0)
                {
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ;
                    j = -1;
                }
                else
                {
                    CustomerBLL customerBLL = new CustomerBLL();
                    Customer customer = new Customer();

                    for (int i = 0; i < dr.Length; i++)
                    {
                        strCustomerCode = dr[i]["代码"].ToString().Trim();

                        if (strCustomerCode != "")
                        {
                            strHQL = "From Customer as customer Where customer.CustomerCode = " + "'" + strCustomerCode + "'";
                            lst = customerBLL.GetAllCustomers(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {
                                LB_ErrorText.Text += dr[i]["名称"].ToString().Trim() + Resources.lang.ZZYCZDRSBQJC;
                                j = -1;
                            }
                            else//新增
                            {
                                customer.CustomerCode = dr[i]["代码"].ToString().Trim();
                                customer.CustomerName = dr[i]["名称"].ToString().Trim();

                                if (CheckIndustryType(dr[i]["行业类型"].ToString().Trim()))
                                {
                                    customer.Type = dr[i]["行业类型"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += dr[i]["行业类型"].ToString().Trim() + " 行业类型不存在，请检查！";
                                    j = -1;
                                }

                                if (CheckCurrencyType(dr[i]["结算币别"].ToString().Trim()))
                                {
                                    customer.Currency = dr[i]["结算币别"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += dr[i]["结算币别"].ToString().Trim() + Resources.lang.ZZBBBCZQZCSSZMKSZ;
                                    j = -1;
                                }
                            }

                            continue;
                        }
                    }
                }
            }
        }
        catch (Exception err)
        {
            LB_ErrorText.Text += err.Message.ToString() + "<br/>"; ;

            j = -1;
        }

        return j;
    }

    protected bool CheckIndustryType(string strType)
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Where industryType.Type = '" + strType + "'";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        if (lst.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    public bool CheckCurrencyType(string strCurrencyType)
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Where currencyType.Type = '" + strCurrencyType + "'";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        if (lst.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void LoadIndustryType()
    {
        string strHQL;
        IList lst;

        strHQL = "From IndustryType as industryType Order By industryType.SortNumber ASC";
        IndustryTypeBLL industryTypeBLL = new IndustryTypeBLL();
        lst = industryTypeBLL.GetAllIndustryTypes(strHQL);

        DL_IndustryTypeFind.DataSource = lst;
        DL_IndustryTypeFind.DataBind();

        DL_IndustryTypeFind.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadCustomerList(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text;

        strHQL = "from Customer as customer ";
        strHQL += " Where (customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order by customer.CustomerCode DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }
}

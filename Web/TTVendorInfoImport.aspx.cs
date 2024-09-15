using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI;

public partial class TTVendorInfoImport : System.Web.UI.Page
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

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有供应商", strUserCode);

        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from Vendor as vendor ";
            strHQL += " Where vendor.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " Order by vendor.CreateDate DESC";

            VendorBLL vendorBLL = new VendorBLL();
            lst = vendorBLL.GetAllVendors(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LoadIndustryType();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strIndustryType, strVendorName, strVendorCode;

        string strDepartString = LB_DepartString.Text.Trim();

        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";
        strVendorName = "%" + TB_CustName.Text.Trim() + "%";
        strVendorCode = "%" + TB_CustCode.Text.Trim() + "%";

        strHQL = "from Vendor as vendor where ";
        strHQL += " vendor.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and vendor.VendorName like  " + "'" + strVendorName + "'";
        strHQL += " and vendor.VendorCode like " + "'" + strVendorCode + "'";
        strHQL += " and vendor.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by vendor.CreateDate DESC";
        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

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
            LB_ErrorText.Text += Resources.lang.ZZDRSBEXECLBLDSJYCJC ;
            return;
        }
        else
        {
            if (FileUpload_Training.HasFile == false)
            {
                LB_ErrorText.Text += Resources.lang.ZZJGNZEXCELWJ ;
                return;
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
            if (IsXls != ".xls" & IsXls != ".xlsx")
            {
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ ;
                return;
            }
            string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
            string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
            FileInfo fi = new FileInfo(strDocSavePath + newfilename);
            if (fi.Exists)
            {
                LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB ;
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
                    LB_ErrorText.Text += Resources.lang.ZZJGEXCELBWKBWSJ ;
                }
                else
                {
                    VendorBLL vendorBLL = new VendorBLL();
                    Vendor vendor = new Vendor();

                    for (int i = 0; i < dr.Length; i++)
                    {
                        if (dr[i]["代码"].ToString().Trim() != "")
                        {
                            string strVendorCode = dr[i]["代码"].ToString().Trim();

                            try
                            {
                                vendor.VendorCode = dr[i]["代码"].ToString().Trim();
                                vendor.VendorName = dr[i]["名称"].ToString().Trim();
                                vendor.Type = dr[i]["行业类型"].ToString().Trim();
                                vendor.ContactName = dr[i]["联系人"].ToString().Trim();
                                vendor.Tel1 = dr[i]["电话"].ToString().Trim();
                                vendor.EmailAddress = dr[i]["EMail"].ToString().Trim();
                                vendor.RegistrationAddressCN = dr[i]["中文地址"].ToString().Trim();
                                vendor.RegistrationAddressEN = dr[i]["英文地址"].ToString().Trim();
                                vendor.Bank = dr[i]["结算银行"].ToString().Trim();
                                vendor.BankAccount = dr[i]["银行帐号"].ToString().Trim();
                                vendor.Currency = dr[i]["结算币别"].ToString().Trim();
                                try
                                {
                                    vendor.DeviceName = dr[i]["设备名称"].ToString().Trim();
                                }
                                catch
                                {
                                    vendor.DeviceName = "";
                                }

                                vendor.CreateDate = DateTime.Now;
                                vendor.SalesPerson = strUserName;

                                vendor.CreatorCode = strUserCode;

                                vendor.VendorEnglishName = "";
                                vendor.VendorEnglishName = "";

                                vendor.SalesPerson = "";
                                vendor.InvoiceAddress = "";


                                vendor.Tel2 = "";
                                vendor.Fax = "";

                                vendor.WebSite = "";
                                vendor.ZP = "";
                                vendor.Country = "";
                                vendor.State = "";
                                vendor.City = "";

                                vendor.CreditRate = 1;
                                vendor.Discount = 0;
                                vendor.ClearingForm = "";

                                vendor.BelongDepartCode = strDepartCode;
                                vendor.BelongDepartName = strDepartName;

                                vendor.Comment = "";

                                vendorBLL.AddVendor(vendor);
                            }
                            catch (Exception err)
                            {
                                LB_ErrorText.Text += Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strVendorCode + " : " + err.Message.ToString() + "<br/>"; ;

                                LogClass.WriteLogFile(this.GetType().BaseType.Name + "：" + Resources.lang.ZZJGDRSBJC + " : " + Resources.lang.HangHao + ": " + (i + 2).ToString() + " , " + Resources.lang.DaiMa + ": " + strVendorCode + " : " + err.Message.ToString());
                            }
                        }
                    }

                    LoadVendorList(strUserCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZEXCLEBDRCG + "')", true);
                }
            }
        }
    }

    protected int ExcelToDBTest()
    {
        string strHQL;

        string strVendorCode;

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
                LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ ;
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
                    j = -1;
                }
                else
                {
                    VendorBLL vendorBLL = new VendorBLL();
                    Vendor vendor = new Vendor();

                    for (int i = 0; i < dr.Length; i++)
                    {
                        strVendorCode = dr[i]["代码"].ToString().Trim();

                        if (strVendorCode != "")
                        {
                            strHQL = "From Vendor as vendor Where vendor.VendorCode = " + "'" + strVendorCode + "'";
                            lst = vendorBLL.GetAllVendors(strHQL);
                            if (lst != null && lst.Count > 0)//存在，则不操作
                            {
                                LB_ErrorText.Text += dr[i]["名称"].ToString().Trim() + Resources.lang.ZZYCZDRSBQJC;
                                j = -1;
                            }
                            else//新增
                            {
                                vendor.VendorCode = dr[i]["代码"].ToString().Trim();
                                vendor.VendorName = dr[i]["名称"].ToString().Trim();

                                if (CheckIndustryType(dr[i]["行业类型"].ToString().Trim()))
                                {
                                    vendor.Type = dr[i]["行业类型"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += dr[i]["行业类型"].ToString().Trim() + " 行业类型不存在，请在参数设置模块设置！";
                                    j = -1;
                                }

                                if (CheckCurrencyType(dr[i]["结算币别"].ToString().Trim()))
                                {
                                    vendor.Currency = dr[i]["结算币别"].ToString().Trim();
                                }
                                else
                                {
                                    LB_ErrorText.Text += dr[i]["结算币别"].ToString().Trim() + Resources.lang.ZZBBBCZQZCSSZMKSZ;
                                    j = -1;
                                }
                            }
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
    }

    protected void LoadVendorList(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text;

        strHQL = "from Vendor as vendor ";
        strHQL += " Where (vendor.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " or (vendor.VendorCode in (Select vendorRelatedUser.VendorCode from VendorRelatedUser as vendorRelatedUser where vendorRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order by vendor.VendorCode DESC";

        VendorBLL vendorBLL = new VendorBLL();
        lst = vendorBLL.GetAllVendors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


}

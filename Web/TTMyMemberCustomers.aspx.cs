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

public partial class TTMyMemberCustomers : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "直接成员客户", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "CustomerService", DataGrid1);
            LoadIndustryType();

            strHQL = "from Customer as customer ";
            strHQL += " Where customer.CreatorCode  in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.CustomerServiceVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " Order by customer.CustomerCode DESC";
            CustomerBLL customerBLL = new CustomerBLL();
            lst = customerBLL.GetAllCustomers(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql2.Text = strHQL;
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        LoadMemberCustomerList(strOperatorCode);
    }


    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;
        IList lst;

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    //protected void BT_SortByAreaAddress_Click(object sender, EventArgs e)
    //{
    //    string strHQL;
    //    IList lst;

    //    string strSortName = LB_UpDown.Text.Trim();

    //    strHQL = "from Customer as customer ";
    //    strHQL += " Where customer.CreatorCode  in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.CustomerServiceVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
    //    if (strSortName == "UP")
    //    {
    //        strHQL += " Order by customer.AreaAddress ASC";
    //        LB_UpDown.Text = "DOWN";
    //    }
    //    else
    //    {
    //        strHQL += " Order by customer.AreaAddress DESC";
    //        LB_UpDown.Text = "UP";
    //    }

    //    CustomerBLL customerBLL = new CustomerBLL();
    //    lst = customerBLL.GetAllCustomers(strHQL);

    //    DataGrid2.DataSource = lst;
    //    DataGrid2.DataBind();
    //}

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        string strIndustryType, strCustomerCode, strCustomerName;

        strDepartString = LB_DepartString.Text.Trim();

        string strState, strCity, strAreaAddress, strAgencyName;

        strCustomerCode = "%" + TB_CustCode.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustName.Text.Trim() + "%";
        strIndustryType = "%" + TB_IndustryTypeFind.Text.Trim() + "%";
        strState = "%" + TB_State.Text.Trim() + "%";
        strCity = "%" + TB_City.Text.Trim() + "%";
        strAreaAddress = "%" + TB_AreaAddress.Text.Trim() + "%";
        strAgencyName = "%" + TB_AgencyName.Text.Trim() + "%";

        strHQL = "from Customer as customer where ";
        strHQL += " customer.Type like  " + "'" + strIndustryType + "'";
        strHQL += " and customer.CustomerCode like " + "'" + strCustomerCode + "'";
        strHQL += " and customer.CustomerName like  " + "'" + strCustomerName + "'";
        strHQL += " and customer.BelongAgencyName Like " + "'" + strAgencyName + "'";
        strHQL += " and customer.State Like " + "'" + strState + "'";
        strHQL += " and customer.City Like " + "'" + strCity + "'";
        strHQL += " and customer.AreaAddress Like " + "'" + strAreaAddress + "'";
        strHQL += " and customer.CreatorCode  in (select memberLevel.UnderCode  From MemberLevel as memberLevel Where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order by customer.CustomerCode DESC";
        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
    }

    protected void DL_IndustryTypeFind_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = DL_IndustryTypeFind.SelectedValue.Trim();

        TB_IndustryTypeFind.Text = strType;
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

    protected void LoadMemberCustomerList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Customer as customer ";
        strHQL += " Where customer.CreatorCode  = " + "'" + strUserCode + "'";
        strHQL += " Order by customer.CustomerCode DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
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
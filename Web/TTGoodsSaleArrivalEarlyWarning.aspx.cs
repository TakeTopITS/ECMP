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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsSaleArrivalEarlyWarning : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
      
        string strDepartString;
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadCustomer(DL_Customer, strUserCode);

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "Select * From T_GoodsSAleRecord A,T_GoodsSaleOrder B";
            strHQL += " Where A.SOID = B.SOID";
            strHQL += " and B.SalesCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " and B.ArrivalTime < now()";
            strHQL += " and A.Number > A.DeliveryNumber";
            strHQL += " Order By B.ArrivalTime DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            LB_PageIndex.Text = "1";
            LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        }
    }


    protected void DL_Customer_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strCustomerName = DL_Customer.SelectedItem.Text.Trim();

        TB_CustomerName.Text = strCustomerName;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStartTime, strEndTime, strCustomerName;
        string strSalesName;
        string strDepartString;
        string strUserCode = LB_UserCode.Text.Trim();

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();

        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strSOName = TB_SOName.Text.Trim();

        strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strSalesName = TB_SalesName.Text.Trim();
        strSalesName = "%" + strSalesName + "%";

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strSOName = "%" + strSOName + "%";

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "Select * From T_GoodsSAleRecord A,T_GoodsSaleOrder B";
        strHQL += " Where A.SOID = B.SOID";
        strHQL += " and SalesCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " and to_char(B.SaleTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(B.SaleTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and B.SalesName like " + "'" + strSalesName + "'";
        strHQL += " and B.CustomerName Like " + "'" + strCustomerName + "'";
        strHQL += " and A.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and A.ModelNumber like " + "'" + strModelNumber + "'";
        strHQL += " and A.Spec Like " + "'" + strSpec + "'";
        strHQL += " and A.Number > A.DeliveryNumber";
        strHQL += " and B.ArrivalTime < now()";
        strHQL += " and B.SOName Like " + "'" + strSOName + "'";
        strHQL += " Order By B.ArrivalTime DESC";

        LB_Sql.Text = strHQL;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }
    protected void LoadCustomer(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from Customer as customer ";
        strHQL += " Where (customer.CreatorCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Or customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode In  " + strDepartString + ")";
        strHQL += " Order by customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DL_Customer.DataSource = lst;
        DL_Customer.DataBind();

        DL_Customer.Items.Insert(0, new ListItem("--Select--", ""));
    }

}

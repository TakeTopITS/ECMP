using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTConstractGoodsUnHandleReceiptedAndDelivered : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","合同收发货预警", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            LoadConstractGoodsReceiptPlan(strUserCode);
            LoadConstractGoodsDeliveryPlan(strUserCode);
        }
    }

    protected void BT_FindReceiptedFind_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strSalesName, strPayer, strPartBOperator;
        decimal deReceiptNumber = 0, deReceiptedNumber = 0,  deUNReceiveNumber = 0;

        strUserCode = Session["UserCode"].ToString();
        strSalesName = TB_ReceiptedSalesName.Text.Trim();
       
        strPartBOperator = TB_PartBOperator.Text.Trim();

        strSalesName = "%" + strSalesName + "%";
      
        strPartBOperator = "%" + strPartBOperator + "%";

        strHQL = "Select * from T_ConstractGoodsReceiptPlan as constractGoodsReceiptPlan where constractGoodsReceiptPlan.Status not in ('完成','取消') and to_char( constractGoodsReceiptPlan.ReceiptTime,'yyyymmdd') <= to_char(now()+PreDay*'1 day'::interval,'yyyymmdd') ";
        strHQL += " and constractGoodsReceiptPlan.ConstractCode in ( Select constractRelatedUser.ConstractCode from T_ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
       
        if (strSalesName != "%%")
        {
            strHQL += " and constractGoodsReceiptPlan.ConstractCode in (Select constractSales.ConstractCode From T_ConstractSales as constractSales Where constractSales.SalesName Like " + "'" + strSalesName + "'" + ")";
        }
        strHQL += " and constractGoodsReceiptPlan.ConstractCode in (Select constract.ConstractCode from T_Constract as constract where constract.PartBOperator Like " + "'" + strPartBOperator + "'" + ")";
        strHQL += " and constractGoodsReceiptPlan.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status in ('归档','取消','删除'))";

        strHQL += " and constractGoodsReceiptPlan.ConstractCode != ''";
        strHQL += " Order by constractGoodsReceiptPlan.ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractGoodsReceiptPlan");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deReceiptNumber += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString());
            deReceiptedNumber += decimal.Parse(ds.Tables[0].Rows[i]["ReceiptedNumber"].ToString());
            deUNReceiveNumber += decimal.Parse(ds.Tables[0].Rows[i]["UNReceiptedNumber"].ToString());
        }

        LB_ReceiptNumber.Text = deReceiptNumber.ToString();
        LB_ReceiptedNumber.Text = deReceiptedNumber.ToString();
        LB_UNReceiveNumber.Text = deUNReceiveNumber.ToString();

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void BT_FindPayerFind_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strSalesName,strPartAOperator;
        decimal deDeliveryNumber = 0, deDeliveredNumber = 0,  deUNDeliveredNumber = 0;

        strUserCode = Session["UserCode"].ToString();
        strSalesName = "%" + TB_PayerSalesName.Text.Trim() + "%";
     
        strPartAOperator = "%" + TB_PartAOperator.Text.Trim() + "%";

        strHQL = "Select * from T_ConstractGoodsDeliveryPlan as constractGoodsDeliveryPlan where  to_char(constractGoodsDeliveryPlan.DeliveryTime,'yyyymmdd') <= to_char(now()+PreDay*'1 day'::interval,'yyyymmdd')";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode in ( Select constractRelatedUser.ConstractCode from T_ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
       
        if (strSalesName != "%%")
        {
            strHQL += " and constractGoodsDeliveryPlan.ConstractCode in (Select constractSales.ConstractCode From T_ConstractSales as constractSales Where constractSales.SalesName Like " + "'" + strSalesName + "'" + ")";
        }
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode in (Select constract.ConstractCode from T_Constract as constract where constract.PartAOperator Like " + "'" + strPartAOperator + "'" + ")";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status  in ('归档','取消','删除'))";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode != ''";
        strHQL += " Order by constractGoodsDeliveryPlan.ID DESC";
     
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractGoodsDeliveryPlan");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deDeliveryNumber += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString());
            deDeliveredNumber += decimal.Parse(ds.Tables[0].Rows[i]["DeliveredNumber"].ToString());
            deUNDeliveredNumber += decimal.Parse(ds.Tables[0].Rows[i]["UNDeliveredNumber"].ToString());
        }

        LB_DeliveryNumber.Text = deDeliveryNumber.ToString();
        LB_DeliveredNumber.Text = deDeliveredNumber.ToString();
        LB_UNDeliveredNumber.Text = deUNDeliveredNumber.ToString();

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadConstractGoodsReceiptPlan(string strUserCode)
    {
        string strHQL;
        IList lst;

        decimal deReceiptNumber = 0, deReceiptedNumber = 0,  deUNReceiveNumber = 0;


        strHQL = "Select * from T_ConstractGoodsReceiptPlan as constractGoodsReceiptPlan where constractGoodsReceiptPlan.Status not in ('完成','取消') and constractGoodsReceiptPlan.Status not in ('完成','取消') and to_char( constractGoodsReceiptPlan.ReceiptTime,'yyyymmdd') <= to_char(now()+PreDay*'1 day'::interval,'yyyymmdd') ";
        strHQL += " and constractGoodsReceiptPlan.ConstractCode in ( Select constractRelatedUser.ConstractCode from T_ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and constractGoodsReceiptPlan.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status in ('归档','取消','删除'))";
        strHQL += " and constractGoodsReceiptPlan.ConstractCode != ''";
        strHQL += " Order by constractGoodsReceiptPlan.ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractGoodsReceiptPlan");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deReceiptNumber += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString());
            deReceiptedNumber += decimal.Parse(ds.Tables[0].Rows[i]["ReceiptedNumber"].ToString());
            deUNReceiveNumber += decimal.Parse(ds.Tables[0].Rows[i]["UNReceiptedNumber"].ToString());
        }

        LB_ReceiptNumber.Text = deReceiptNumber.ToString();
        LB_ReceiptedNumber.Text = deReceiptedNumber.ToString();
        LB_UNReceiveNumber.Text = deUNReceiveNumber.ToString();

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadConstractGoodsDeliveryPlan(string strUserCode)
    {
        string strHQL;
        IList lst;

        decimal deDeliveryNumber = 0, deDeliveredNumber = 0,  deUNDeliveredNumber = 0;

        strHQL = "Select * from T_ConstractGoodsDeliveryPlan as constractGoodsDeliveryPlan where constractGoodsDeliveryPlan.Status not in ('完成','取消') and  to_char(constractGoodsDeliveryPlan.DeliveryTime,'yyyymmdd') <= to_char(now()+PreDay*'1 day'::interval,'yyyymmdd')";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode in ( Select constractRelatedUser.ConstractCode from T_ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode not in (Select constract.ConstractCode from T_Constract as constract where constract.Status  in ('归档','取消','删除'))";
        strHQL += " and constractGoodsDeliveryPlan.ConstractCode != ''";
        strHQL += " Order by constractGoodsDeliveryPlan.ID DESC";
     
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractGoodsDeliveryPlan");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deDeliveryNumber += decimal.Parse(ds.Tables[0].Rows[i]["Number"].ToString());
            deDeliveredNumber += decimal.Parse(ds.Tables[0].Rows[i]["DeliveredNumber"].ToString());
            deUNDeliveredNumber += decimal.Parse(ds.Tables[0].Rows[i]["UNDeliveredNumber"].ToString());
        }

        LB_DeliveryNumber.Text = deDeliveryNumber.ToString();
        LB_DeliveredNumber.Text = deDeliveredNumber.ToString();
        LB_UNDeliveredNumber.Text = deUNDeliveredNumber.ToString();

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }


}

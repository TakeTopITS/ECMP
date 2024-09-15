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

public partial class TTConstractToTimeTitle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","合同到期提提醒", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        //this.Title = "合同到期提提醒";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            LoadConstractReceivables(strUserCode);

        }
    }

    protected void BT_FindReceiverFind_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strSalesName, strPayer, strPartBOperator;
        decimal deReceivablesAccount = 0, deReceiverAccount = 0, deReceiverInvoiceAccount = 0, deUNReceiveAmount = 0;

        strUserCode = Session["UserCode"].ToString();
        strSalesName = TB_ReceiverSalesName.Text.Trim();
        strPayer = TB_Payer.Text.Trim();
        strPartBOperator = TB_PartBOperator.Text.Trim();

        strSalesName = "%" + strSalesName + "%";
        strPayer = "%" + strPayer + "%";
        strPartBOperator = "%" + strPartBOperator + "%";

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.Status not in ('完成','取消') and to_char( constractReceivables.ReceivablesTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') ";
        strHQL += " and constractReceivables.ConstractCode in ( Select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and constractReceivables.Payer Like " + "'" + strPayer + "'";
        if (strSalesName != "%%")
        {
            strHQL += " and constractReceivables.ConstractCode in (Select constractSales.ConstractCode From ConstractSales as constractSales Where constractSales.SalesName Like " + "'" + strSalesName + "'" + ")";
        }
        strHQL += " and constractReceivables.ConstractCode in (Select constract.ConstractCode from Constract as constract where constract.PartBOperator Like " + "'" + strPartBOperator + "'" + ")";
        strHQL += " and constractReceivables.ConstractCode not in (Select constract.ConstractCode from Constract as constract where constract.Status in ('归档','取消','删除'))";

        strHQL += " and constractReceivables.ConstractCode != ''";
        strHQL += " Order by constractReceivables.ID DESC";
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        ConstractReceivables constractReceivables = new ConstractReceivables();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivables = (ConstractReceivables)lst[i];
            deReceivablesAccount += constractReceivables.ReceivablesAccount;
            deReceiverAccount += constractReceivables.ReceiverAccount;
            deReceiverInvoiceAccount += constractReceivables.InvoiceAccount;
            deUNReceiveAmount += constractReceivables.UNReceiveAmount;
        }


        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadConstractReceivables(string strUserCode)
    {
        string strHQL;
        IList lst;

        decimal deReceivablesAccount = 0, deReceiverAccount = 0, deReceiverInvoiceAccount = 0, deUNReceiveAmount = 0;


        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.Status not in ('完成','取消') and to_char( constractReceivables.ReceivablesTime,'yyyymmdd') <= to_char(now()+PreDays*'1 day'::interval,'yyyymmdd') ";
        strHQL += " and constractReceivables.ConstractCode in ( Select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and constractReceivables.ConstractCode not in (Select constract.ConstractCode from Constract as constract where constract.Status in ('归档','取消','删除'))";
        strHQL += " and constractReceivables.ConstractCode != ''";
        strHQL += " Order by constractReceivables.ID DESC";
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        ConstractReceivables constractReceivables = new ConstractReceivables();
        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivables = (ConstractReceivables)lst[i];
            deReceivablesAccount += constractReceivables.ReceivablesAccount;
            deReceiverAccount += constractReceivables.ReceiverAccount;
            deReceiverInvoiceAccount += constractReceivables.InvoiceAccount;
            deUNReceiveAmount += constractReceivables.UNReceiveAmount;
        }

  

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


  
}
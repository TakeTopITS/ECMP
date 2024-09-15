using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractReceivablesRecordReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";


        //this.Title = "合同付款情况表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_PayableEndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_PayableStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            //strHQL = "Select * from  V_ConstractPayableReport Where";
            //strHQL += " ((DepartCode in " + strDepartString + ")";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " Order by ID DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractPayableReport");

            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //CountAmount(ds);

            //LB_Sql.Text = strHQL;
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStartTime, strEndTime;
        string strPartA, strOperatorName, strPartAOperator, strConstractCode, strConstractName, strReceiver;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_PayableStartTime.Text;
        strEndTime = DLC_PayableEndTime.Text;

        strPartA = TB_PartA.Text.Trim();
        strPartA = "%" + strPartA + "%";

        strPartAOperator = "%" + TB_PartAOperator.Text.Trim() + "%";

        strOperatorName = TB_OperatorName.Text.Trim();
        strOperatorName = "%" + strOperatorName + "%";

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strConstractName = TB_ConstractName.Text.Trim();
        strConstractName = "%" + strConstractName + "%";

        strReceiver = TB_Receiver.Text.Trim();
        strReceiver = "%" + strReceiver + "%";

        strHQL = "select * from V_ConstractPayableReport where ";
        strHQL += "  PartA like  " + "'" + strPartA + "'";
        strHQL += " and ConstractCode like  " + "'" + strConstractCode + "'";
        if (strOperatorName != "%%")
        {
            strHQL += " and ( ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName like  " + "'" + strOperatorName + "'" + "))";
        }
        strHQL += " and (ConstractCode in (Select ConstractCode From T_Constract Where PartAOperator like  " + "'" + strPartAOperator + "'" + "))";
        strHQL += " and (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))";
        strHQL += " and ConstractName like  " + "'" + strConstractName + "'";
        strHQL += " and Receiver like  " + "'" + strReceiver + "'";
        strHQL += " and to_char(PayableTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(PayableTime,'yyyymmdd') <=" + "'" + strEndTime + "'";
        strHQL += " and DepartCode in " + strDepartString;
        strHQL += " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        CountAmount(ds);

        LB_Sql.Text = strHQL;
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayable");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal dePayableAccount = 0, deOutOfPocketAccount = 0, deInvoiceAccount = 0, deUNPayAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            dePayableAccount += decimal.Parse(ds.Tables[0].Rows[i]["PayableAccount"].ToString());
            deOutOfPocketAccount += decimal.Parse(ds.Tables[0].Rows[i]["OutOfPocketAccount"].ToString());
            deUNPayAmount += decimal.Parse(ds.Tables[0].Rows[i]["UNPayAmount"].ToString());
            deInvoiceAccount += decimal.Parse(ds.Tables[0].Rows[i]["InvoiceAccount"].ToString());
        }

        LB_PayableAmount.Text = dePayableAccount.ToString();
        LB_OutOfPocketAmount.Text = deOutOfPocketAccount.ToString();
        LB_UNPayAmount.Text = deUNPayAmount.ToString();
        LB_InvoiceAmount.Text = deInvoiceAccount.ToString();
    }

}
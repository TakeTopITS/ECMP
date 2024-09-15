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


using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractReceivablesReportForMe : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";

        //this.Title = "合同收款情况表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ReceivablesEndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ReceivablesStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            //strHQL = "Select * from  V_ConstractReceivablesReportSummary where";
            //strHQL += "  ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")";
            //strHQL += " Order by ReceivablesTime,ConstractCode DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractReceivablesReport");
            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //CountAmount(ds);

            //LB_Sql.Text = strHQL;

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
            LB_CurrencyType.Text = ShareClass.GetHomeCurrencyType();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strReceivablesStartTime, strReceivablesEndTime;
        string strConstractCode, strConstractName, strPartA, strPartAOperator;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartA = "%" + strPartA + "%";

        strPartAOperator = "%" + TB_PartAOperator.Text.Trim() + "%";

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strConstractName = TB_ConstractName.Text.Trim();
        strConstractName = "%" + strConstractName + "%";

        strReceivablesStartTime = DateTime.Parse(DLC_ReceivablesStartTime.Text).ToString("yyyyMMdd");
        strReceivablesEndTime = DateTime.Parse(DLC_ReceivablesEndTime.Text).ToString("yyyyMMdd");

        strHQL = "select * from V_ConstractReceivablesReportSummary where ";
        strHQL += " PartA like  " + "'" + strPartA + "'";
        strHQL += " and ((ConstractCode in (Select ConstractCode From T_Constract Where PartAOperator like  " + "'" + strLikeUserCode + "'" + "))";
        strHQL += " or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and  ConstractCode like  " + "'" + strConstractCode + "'";
        strHQL += " and  ConstractName like  " + "'" + strConstractName + "'";
        strHQL += " and ReceivablesTime >= " + "'" + strReceivablesStartTime + "'";
        strHQL += " and ReceivablesTime <=" + "'" + strReceivablesEndTime + "'";
        strHQL += " Order by ReceivablesTime,ConstractCode DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractReceiverReport");


        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        CountAmount(ds);

        LB_Sql.Text = strHQL;

        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractReceivables");


        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal deReceivablesAccount = 0, deReceiverAccount = 0, deInvoiceAccount = 0, deUNReceiveAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deReceivablesAccount += decimal.Parse(ds.Tables[0].Rows[i]["ReceivablesAccount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
            deReceiverAccount += decimal.Parse(ds.Tables[0].Rows[i]["ReceiverAccount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
            deUNReceiveAmount += decimal.Parse(ds.Tables[0].Rows[i]["UNReceiveAmount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
            deInvoiceAccount += decimal.Parse(ds.Tables[0].Rows[i]["InvoiceAccount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
        }

        LB_ReceivablesAmount.Text = deReceivablesAccount.ToString();
        LB_ReceiverAmount.Text = deReceiverAccount.ToString();
        LB_UNReceiveAmount.Text = deUNReceiveAmount.ToString();
        //LB_InvoiceAmount.Text = deInvoiceAccount.ToString();
    }
}

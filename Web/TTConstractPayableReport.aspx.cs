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

public partial class TTConstractPayableReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_PayableEndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_PayableStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            //strHQL = "Select * from  V_ConstractPayableReportSummary Where";
            //strHQL += " ((DepartCode in " + strDepartString + ")";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " Order by PayableTime,ConstractCode DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractPayableReport");

            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //CountAmount(ds);

            //LB_Sql.Text = strHQL;

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            DL_CurrencyType.Items.Insert(0, new ListItem("--Select--", ""));

            LB_CurrencyType.Text = ShareClass.GetHomeCurrencyType();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStartTime, strEndTime;
        string strPartA, strPartAOperator, strConstractCode, strConstractName, strReceiver, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_PayableStartTime.Text.Replace("-", "");
        strEndTime = DLC_PayableEndTime.Text.Replace("-", "");

        strPartA = TB_PartA.Text.Trim();

        strPartAOperator = TB_PartAOperator.Text.Trim();
        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractName = TB_ConstractName.Text.Trim();
        strReceiver = TB_Receiver.Text.Trim();

        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";

        strHQL = "select * from V_ConstractPayableReportSummary where 1=1 ";

        if (!string.IsNullOrEmpty(strPartA))
        {
            strPartA = "%" + strPartA + "%";
            strHQL += " and PartA like  " + "'" + strPartA + "'";
        }
        if (!string.IsNullOrEmpty(strConstractCode))
        {
            strConstractCode = "%" + strConstractCode + "%";
            strHQL += " and ConstractCode like  " + "'" + strConstractCode + "'";
        }

        if (!string.IsNullOrEmpty(strPartAOperator))
        {
            strPartAOperator = "%" + strPartAOperator + "%";
            strHQL += " and (ConstractCode in (Select ConstractCode From T_Constract Where PartAOperator like  " + "'" + strPartAOperator + "'" + "))";
        }
        strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))) ";
        if (!string.IsNullOrEmpty(strConstractName))
        {
            strConstractName = "%" + strConstractName + "%";
            strHQL += " and ConstractName like  " + "'" + strConstractName + "'";
        }
        if (!string.IsNullOrEmpty(strReceiver))
        {
            strReceiver = "%" + strReceiver + "%";
            strHQL += " and Receiver like  " + "'" + strReceiver + "'";
        }
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and PayableTimeString >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and PayableTimeString <= " + "'" + strEndTime + "'";
        }
        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";

        strHQL += " Order by PayableTime,ConstractCode DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        CountAmount(ds);

        LB_Sql.Text = strHQL;

        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
    }


    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = Resources.lang.HeTongFuKuanQingKuangBaoBiao + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
                CreateExcel(fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }

    private void CreateExcel(string fileName)
    {
        string strHQL;
        string strStartTime, strEndTime;
        string strPartA, strPartAOperator, strConstractCode, strConstractName, strReceiver, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_PayableStartTime.Text.Replace("-", "");
        strEndTime = DLC_PayableEndTime.Text.Replace("-", "");

        strPartA = TB_PartA.Text.Trim();

        strPartAOperator = TB_PartAOperator.Text.Trim();
        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractName = TB_ConstractName.Text.Trim();
        strReceiver = TB_Receiver.Text.Trim();

        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";


        strHQL = "select  BillCode 原始单号,ConstractCode 合同代码,ConstractName 合同名称,PayableAccount 应付金额,to_char(PayableTime,'yyyy/mm/dd') 应付时间,OutOfPocketAccount 实付金额,HandlingCharge 手续费,UNPayAmount 未付金额,Receiver 收款方,PartA 甲方单位,PartAOperator 负责人,CurrencyType 币别 from V_ConstractPayableReportSummary where 1=1 ";

        if (!string.IsNullOrEmpty(strPartA))
        {
            strPartA = "%" + strPartA + "%";
            strHQL += " and PartA like  " + "'" + strPartA + "'";
        }
        if (!string.IsNullOrEmpty(strConstractCode))
        {
            strConstractCode = "%" + strConstractCode + "%";
            strHQL += " and ConstractCode like  " + "'" + strConstractCode + "'";
        }

        if (!string.IsNullOrEmpty(strPartAOperator))
        {
            strPartAOperator = "%" + strPartAOperator + "%";
            strHQL += " and (ConstractCode in (Select ConstractCode From T_Constract Where PartAOperator like  " + "'" + strPartAOperator + "'" + "))";
        }
        strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))) ";
        if (!string.IsNullOrEmpty(strConstractName))
        {
            strConstractName = "%" + strConstractName + "%";
            strHQL += " and ConstractName like  " + "'" + strConstractName + "'";
        }
        if (!string.IsNullOrEmpty(strReceiver))
        {
            strReceiver = "%" + strReceiver + "%";
            strHQL += " and Receiver like  " + "'" + strReceiver + "'";
        }
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and PayableTimeString >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and PayableTimeString <= " + "'" + strEndTime + "'";
        }
        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";

        strHQL += " Order by PayableTime,ConstractCode DESC";

        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractPayableReportSummary");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal dePayableAccount = 0, deOutOfPocketAccount = 0, deInvoiceAccount = 0, deUNPayAmount = 0;
  
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            dePayableAccount += decimal.Parse(ds.Tables[0].Rows[i]["PayableAccount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
            deOutOfPocketAccount += decimal.Parse(ds.Tables[0].Rows[i]["OutOfPocketAccount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());
            deUNPayAmount += decimal.Parse(ds.Tables[0].Rows[i]["UNPayAmount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["CurrencyType"].ToString());

        }

        LB_PayableAmount.Text = dePayableAccount.ToString();
        LB_OutOfPocketAmount.Text = deOutOfPocketAccount.ToString();
        LB_UNPayAmount.Text = deUNPayAmount.ToString();
    }

}

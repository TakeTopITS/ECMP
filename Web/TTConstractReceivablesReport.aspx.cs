using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTConstractReceivablesReport : System.Web.UI.Page
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
            //strHQL += " ((DepartCode in " + strDepartString + ")";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " Order by ReceivablesTime,ConstractCode DESC";
            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractReceivablesReport");
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
        string strReceivablesStartTime, strReceivablesEndTime;
        string strOperatorName, strConstractCode, strConstractName, strPayer, strPartA, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartA = "%" + strPartA + "%";

        strOperatorName = TB_OperatorName.Text.Trim();
        strOperatorName = "%" + strOperatorName + "%";

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strConstractName = TB_ConstractName.Text.Trim();
        strConstractName = "%" + strConstractName + "%";

        strPayer = TB_Payer.Text.Trim();
        strPayer = "%" + strPayer + "%";

        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";

        strReceivablesStartTime = DateTime.Parse(DLC_ReceivablesStartTime.Text).ToString("yyyyMMdd");
        strReceivablesEndTime = DateTime.Parse(DLC_ReceivablesEndTime.Text).ToString("yyyyMMdd");

        strHQL = "Select * from  V_ConstractReceivablesReportSummary where 1=1 ";
        strHQL += " and PartA like  " + "'" + strPartA + "'";
        if (strOperatorName != "%%")
        {
            strHQL += " and ( ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName like  " + "'" + strOperatorName + "'" + "))";
        }

        strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and  ConstractCode like  " + "'" + strConstractCode + "'";
        strHQL += " and  ConstractName like  " + "'" + strConstractName + "'";
        strHQL += " and  Payer like  " + "'" + strPayer + "'";

        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";

        strHQL += " and to_char(ReceivablesTime,'yyyymmdd') >= " + "'" + strReceivablesStartTime + "'";
        strHQL += " and to_char(ReceivablesTime,'yyyymmdd') <=" + "'" + strReceivablesEndTime + "'";

        strHQL += " Order by ReceivablesTime,ConstractCode DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractReceiverReport");


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
                string fileName = Resources.lang.HeTongShouKuanQingKuangBaoBiao + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
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
        string strReceivablesStartTime, strReceivablesEndTime;
        string strOperatorName, strConstractCode, strConstractName, strPayer, strPartA, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartA = "%" + strPartA + "%";

        strOperatorName = TB_OperatorName.Text.Trim();
        strOperatorName = "%" + strOperatorName + "%";

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strConstractName = TB_ConstractName.Text.Trim();
        strConstractName = "%" + strConstractName + "%";

        strPayer = TB_Payer.Text.Trim();
        strPayer = "%" + strPayer + "%";

        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";

        strReceivablesStartTime = DateTime.Parse(DLC_ReceivablesStartTime.Text).ToString("yyyyMMdd");
        strReceivablesEndTime = DateTime.Parse(DLC_ReceivablesEndTime.Text).ToString("yyyyMMdd");

        strHQL = "Select BillCode 原始单号,ConstractCode 合同代码,ConstractName 合同名称,ReceivablesAccount 应收金额,to_char(ReceivablesTime,'yyyy/mm/dd') 应收时间,ReceiverAccount 实收金额,UNReceiveAmount 未收金额,Payer 付款方,PartA 甲方单位,PartAOperator 负责人,CurrencyType 币别 from  V_ConstractReceivablesReportSummary where 1=1 ";
        strHQL += " and PartA like  " + "'" + strPartA + "'";
        if (strOperatorName != "%%")
        {
            strHQL += " and ( ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName like  " + "'" + strOperatorName + "'" + "))";
        }

        strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and  ConstractCode like  " + "'" + strConstractCode + "'";
        strHQL += " and  ConstractName like  " + "'" + strConstractName + "'";
        strHQL += " and  Payer like  " + "'" + strPayer + "'";

        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";

        strHQL += " and to_char(ReceivablesTime,'yyyymmdd') >= " + "'" + strReceivablesStartTime + "'";
        strHQL += " and to_char(ReceivablesTime,'yyyymmdd') <=" + "'" + strReceivablesEndTime + "'";

        strHQL += " Order by ReceivablesTime,ConstractCode DESC";

        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractReceivablesReportSummary");

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

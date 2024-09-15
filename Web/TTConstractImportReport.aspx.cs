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


public partial class TTConstractImportReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";


        //this.Title = "进口一览表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;


            //strHQL = "Select * from  V_ConstractImportReport Where";
            //strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where  DepartCode in " + strDepartString + ")";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " Order by ReportDate DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractImportReport");

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
        string strCustoms, strEntryCode, strConstractClass, strConstractCode, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";
        strCustoms = "%" + TB_Customs.Text.Trim()+ "%";
        strEntryCode = "%" + TB_EntryCode.Text.Trim() + "%";
        strConstractClass = "%" + DDL_ConstractClass.SelectedValue + "%";
        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";

        strHQL = "Select ConstractCode,Customs,EntryCode,PreEntryCode,Currency,ExchangeRate,TotalAmount,TotalEntryTax,TotalAddedValueTax,ConstractClass,to_char(ImportDate,'yyyy-mm-dd hh:mi:ss.ms') as ImportDate,to_char(ReportDate,'yyyy-mm-dd hh:mi:ss.ms') as ReportDate  from  V_ConstractImportReport Where";
        strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where  DepartCode in " + strDepartString + ")";
        strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and Customs Like " + "'" + strCustoms + "'";
        strHQL += " and EntryCode Like " + "'" + strEntryCode + "'";
        strHQL += " and Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and ConstractClass like " + "'" + strConstractClass + "'";
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and ReportDate >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and ReportDate <=" + "'" + strEndTime + "'";
        }
        strHQL += " Order by ReportDate DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractImportReport");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        CountAmount(ds);

        LB_ConstractNumber.Text = ds.Tables[0].Rows.Count.ToString();

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
                string fileName = Resources.lang.HeTongJinKouYiLanBiao + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
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
        string strCustoms, strEntryCode, strConstractClass, strConstractCode, strCurrencyType;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";
        strCustoms = "%" + TB_Customs.Text.Trim() + "%";
        strEntryCode = "%" + TB_EntryCode.Text.Trim() + "%";
        strConstractClass = "%" + DDL_ConstractClass.SelectedValue + "%";
        strCurrencyType = "%" + DL_CurrencyType.SelectedValue.Trim() + "%";

        strHQL = "Select ConstractCode 合同代码,TotalAmount 申报金额,ImportDate 进口日期,Customs 进口口岸,ReportDate 申报日期,EntryCode 报关单号,EntryCode 报关单号,PreEntryCode 预录单号,Currency 币别,ExchangeRate 汇率,TotalEntryTax 关税,TotalAddedValueTax 增值税 from  V_ConstractImportReport Where";
        strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where  DepartCode in " + strDepartString + ")";
        strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and Customs Like " + "'" + strCustoms + "'";
        strHQL += " and EntryCode Like " + "'" + strEntryCode + "'";
        strHQL += " and Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and ConstractClass like " + "'" + strConstractClass + "'";
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and ReportDate >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and ReportDate <=" + "'" + strEndTime + "'";
        }
        strHQL += " Order by ReportDate DESC";

        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractBankReport");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal deTotalAmount = 0, deTotalEntryTaxAmount = 0, deTotalAddedValueTaxAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalAmount += decimal.Parse(ds.Tables[0].Rows[i]["TotalAmount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
            deTotalEntryTaxAmount += decimal.Parse(ds.Tables[0].Rows[i]["TotalEntryTax"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
            deTotalAddedValueTaxAmount += decimal.Parse(ds.Tables[0].Rows[i]["TotalAddedValueTax"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();
        LB_TotalEntryTaxAmount.Text = deTotalEntryTaxAmount.ToString();
        LB_TotalAddedTaxAmount.Text = deTotalAddedValueTaxAmount.ToString();

    }

}

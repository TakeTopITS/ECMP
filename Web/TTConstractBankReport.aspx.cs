using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTConstractBankReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";

        //this.Title = "银行报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.LoadBankForDropDownList(DL_Bank);

            //strHQL = "Select BillCode, OperateTime,Bank,ConstractCode,Currency, sum(ReciverAmount) as ReciverAmount,sum(PayableAmount) as PayableAmount,sum(Balance) as Balance,UnitName,sum(HandlingCharge) as HandlingCharge from  V_ConstractBankReport Where";
            //strHQL += " ((ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + "))";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += "  Group By BillCode, ConstractCode,Bank,UnitName,OperateTime,Currency";
            //strHQL += " Order by OperateTime DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractBankReport");

            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //CountAmount(ds);

            //LB_Sql.Text = strHQL;

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");

            LB_CurrencyType.Text = ShareClass.GetHomeCurrencyType();
        }
    }


    protected void DL_Bank_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strBankName;

        strBankName = DL_Bank.SelectedValue.Trim();

        TB_Bank.Text = strBankName;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStartTime, strEndTime;
        string strBank, strConstractCode, strUnitName;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strBank = TB_Bank.Text.Trim();
        strBank = "%" + strBank + "%";

        strUnitName = TXT_UnitName.Text.Trim();

        strHQL = "Select BillCode,OperateTime,Bank,ConstractCode,Currency, sum(ReciverAmount) as ReciverAmount,sum(PayableAmount) as PayableAmount,sum(HomePayableAmount) as HomePayableAmount,sum(Balance) as Balance,UnitName,sum(HandlingCharge) as HandlingCharge  from  V_ConstractBankReport Where";
        strHQL += " ((ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + "))";
        strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and Bank Like " + "'" + strBank + "'";
        if (!string.IsNullOrEmpty(strUnitName))
        {
            strHQL += " and UnitName Like '%" + strUnitName + "%'";
        }
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and OperateTimeString >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and OperateTimeString <=" + "'" + strEndTime + "'";
        }
        strHQL += " Group By BillCode,ConstractCode,Bank,UnitName,OperateTime,Currency";
        strHQL += " Order by OperateTime DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractBankReport");

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
                string fileName = Resources.lang.YinHangBaoBiao + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
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
        string strBank, strConstractCode, strUnitName;

        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strBank = TB_Bank.Text.Trim();
        strBank = "%" + strBank + "%";

        strUnitName = TXT_UnitName.Text.Trim();
        strHQL = "Select to_char(OperateTime, 'yyyy/mm/dd') 时间,Bank 银行,BillCode 原始单号,ConstractCode 合同代码,Currency 币别, sum(ReciverAmount) 收入 ,sum(PayableAmount) 支出,UnitName 单位,sum(HandlingCharge) 手续费,sum(Balance) 每日现金余额  from V_ConstractBankReport Where";
        strHQL += " ((ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + "))";
        strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and Bank Like " + "'" + strBank + "'";
        if (!string.IsNullOrEmpty(strUnitName))
        {
            strHQL += " and UnitName Like '%" + strUnitName + "%'";
        }
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and OperateTimeString >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and OperateTimeString <=" + "'" + strEndTime + "'";
        }
        strHQL += " Group By BillCode,ConstractCode,Bank,UnitName,OperateTime,Currency";
        strHQL += " Order by OperateTime DESC";


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
        decimal dePayableAmount = 0, deReciverAmount = 0, deBalanceAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deReciverAmount += decimal.Parse(ds.Tables[0].Rows[i]["ReciverAmount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
            dePayableAmount += decimal.Parse(ds.Tables[0].Rows[i]["PayableAmount"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
            deBalanceAmount += decimal.Parse(ds.Tables[0].Rows[i]["Balance"].ToString()) * ShareClass.GetExchangeRateByCurrencyType(ds.Tables[0].Rows[i]["Currency"].ToString());
        }

        LB_ReciverAmount.Text = deReciverAmount.ToString();
        LB_PayableAmount.Text = (0 - dePayableAmount).ToString();
        LB_BalanceAmount.Text = deBalanceAmount.ToString();
    }

}

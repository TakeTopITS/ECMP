using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTConstractIncomeExpenseReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";

        //this.Title = "合同收支报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            //strHQL = "Select * from  V_ConstractIncomeExpenseReport Where";
            //strHQL += " ( ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + ")";
            //strHQL += " Or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " and Status <> '删除'";


            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractIncomeExpenseReport");

            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();

            //LB_Sql.Text = strHQL;

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strPartA, strConstractCode;
        string strDepartString;
        string strStartTime, strEndTime;


        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strDepartString = LB_DepartString.Text.Trim();

        strConstractCode = "%" + TB_ConstractCode.Text.Trim() + "%";
        strPartA = "%" + TB_PartA.Text.Trim() + "%";

        strHQL = "Select * from V_ConstractIncomeExpenseReport Where";
        strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + ")";
        strHQL += " Or ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))";
        strHQL += " and PartA Like " + "'" + strPartA + "'";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and SignDateString >= " + "'" + strStartTime + "'" + "and SignDateString <= " + "'" + strEndTime + "'";
        strHQL += " and Status <> '删除'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractBankReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        strHQL = "Select SUM(ReceivablesAmount),SUM(TotalReceiverAmount),SUM(PayableAmount),SUM(TotalOutOfPocketAmount),SUM(TotalOutOfPocketAmountHome) from V_ConstractIncomeExpenseReport Where";
        strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + ")";
        strHQL += " Or ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))";
        strHQL += " and PartA Like " + "'" + strPartA + "'";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and SignDate >= " + "'" + strStartTime + "'" + "and SignDate <= " + "'" + strEndTime + "'";
        strHQL += " and Status <> '删除'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractBankReport");

        LB_ReceivablesAmount.Text = ds.Tables[0].Rows[0][0].ToString();
        LB_TotalReceiverAmount.Text = ds.Tables[0].Rows[0][1].ToString();

        LB_PayableAmount.Text = ds.Tables[0].Rows[0][2].ToString();
        LB_TotalOutOfPocketAmount.Text = ds.Tables[0].Rows[0][3].ToString();

        LB_TotalOutOfPocketAmountHome .Text = ds.Tables[0].Rows[0][4].ToString();

        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    }


    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = Resources.lang.HeTongShouZhiBaoBiao + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";
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
        string strPartA, strConstractCode;
        string strDepartString;
        string strStartTime, strEndTime;


        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strDepartString = LB_DepartString.Text.Trim();

        strConstractCode = "%" + TB_ConstractCode.Text.Trim() + "%";
        strPartA = "%" + TB_PartA.Text.Trim() + "%";

        strHQL = "Select to_char(SignDate,'yyyy/mm/dd') 签订日期,PartA 甲方,ConstractCode 合同代码,ReceivablesAmount 应收总额,TotalReceiverAmount 实收总额,TotalRecInvoiceAmount 开发票总额,PayableAmount 应付总额,TotalOutOfPocketAmount 实付总额,TotalOutOfPocketAmountHOme 实付总额本币,TotalPayInvoiceAmount 收发票总额,TotalEntryTax 关税,TotalAddedValueTax 增值税,Profits 参考净利润,Currency 合同币别 from   V_ConstractIncomeExpenseReport Where";
        strHQL += " (ConstractCode in (Select ConstractCode From T_Constract Where DepartCode in " + strDepartString + ")";
        strHQL += " Or ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + "))";
        strHQL += " and PartA Like " + "'" + strPartA + "'";
        strHQL += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and SignDateString >= " + "'" + strStartTime + "'" + "and SignDateString <= " + "'" + strEndTime + "'";
        strHQL += " and Status <> '删除'";

        MSExcelHandler.DataTableToExcel(strHQL, fileName);
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractBankReport");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}

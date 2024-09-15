using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using ProjectMgt.BLL;
using ProjectMgt.Model;


public partial class TTAccountReceiveRecordSummarySAAS : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "收款明细汇总表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadAccountForDDL(ddl_Account);

            ShareClass.LoadCurrencyForDropDownList(DL_Currency);

            LoadConstractReceivablesRecord(strUserCode);
        }
    }

    protected string GetAccountName(string strAccountCode)
    {
        string flag = "";
        string strHQL = "Select AccountName From T_Account where AccountCode='" + strAccountCode + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_Account").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            flag = dt.Rows[0]["AccountName"].ToString();
        }
        else
        {
            flag = "";
        }
        return flag;
    }

    protected void ddl_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = ddl_Account.SelectedValue.Trim();

        TB_Account.Text = GetAccountName(strAccountCode);
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        decimal deReceiverAccount = 0;

        string strAccountName, strCurrencyType, strPayer, strProjectID;
        string strStartTime, strEndTime;
        string strDepartString;

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strAccountName = "%" + TB_Account.Text.Trim() + "%";
        strCurrencyType = "%" + DL_Currency.SelectedValue.Trim() + "%";
        strPayer = "%" + TB_Payer.Text.Trim() + "%";

        strDepartString = LB_DepartString.Text.Trim();
        strProjectID = TB_RelatedProjectID.Text.Trim();

        if (strProjectID == "")
        {
            strHQL = "from ConstractReceivablesRecord  as constractReceivablesRecord ";
            strHQL += " Where constractReceivablesRecord.ReceivablesID in (Select constractReceivables.ID From ConstractReceivables as constractReceivables Where constractReceivables.Account Like " + "'" + strAccountName + "'" + ")";
            strHQL += " and constractReceivablesRecord.Currency Like " + "'" + strCurrencyType + "'";
            strHQL += " and constractReceivablesRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and to_char(constractReceivablesRecord.OperateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(constractReceivablesRecord.OperateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and constractReceivablesRecord.Payer Like " + "'" + strPayer + "'";
            strHQL += " Order By constractReceivablesRecord.ID DESC";
        }
        else
        {
            strHQL = "from ConstractReceivablesRecord  as constractReceivablesRecord ";
            strHQL += " Where constractReceivablesRecord.ReceivablesID in (Select constractReceivables.ID From ConstractReceivables as constractReceivables Where constractReceivables.Account Like " + "'" + strAccountName + "'" + ")";
            strHQL += " and constractReceivablesRecord.Currency Like " + "'" + strCurrencyType + "'";
            strHQL += " and constractReceivablesRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and to_char(constractReceivablesRecord.OperateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(constractReceivablesRecord.OperateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and constractReceivablesRecord.Payer Like " + "'" + strPayer + "'";
            strHQL += " and constractReceivablesRecord.RelatedProjectID = " + strProjectID;
            strHQL += " Order By constractReceivablesRecord.ID DESC";
        }


        ConstractReceivablesRecordBLL constractReceivablesRecordBLL = new ConstractReceivablesRecordBLL();
        lst = constractReceivablesRecordBLL.GetAllConstractReceivablesRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ConstractReceivablesRecord constractReceivablesRecord = new ConstractReceivablesRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivablesRecord = (ConstractReceivablesRecord)lst[i];

            deReceiverAccount += constractReceivablesRecord.ReceiverAccount * constractReceivablesRecord.ExchangeRate;
        }

        LB_ReceiverAmount.Text = deReceiverAccount.ToString();

        LB_Sql1.Text = strHQL;

        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select Account as XName,Sum(ReceiverAccount * ExchangeRate) as YNumber From T_ConstractReceivables";
        strHQL += " Where Account Like " + "'" + strAccountName + "'" ;
        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";
        strHQL += " and OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and to_char(ReceiverTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(ReceiverTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and Payer Like " + "'" + strPayer + "'";
        strHQL += " Group By Account";

        string strChartTitle;

        strChartTitle = Resources.lang.SSKMJEFBT + "(" + ShareClass.GetHomeCurrencyType() + ")";
        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql2.Text = strHQL;

        strChartTitle = Resources.lang.TQSJSFKDBT + "(" + ShareClass.GetHomeCurrencyType() + ")";


        strHQL = @"Select  COALESCE(A.ReceiverTime,B.OutOfPocketTime) as XName,
                 COALESCE(B.PayMoney,0) AS YNumber,COALESCE(A.ReceiverMoney,0) AS ZNumber,
                 COALESCE(A.ReceiverMoney,0)- COALESCE(B.PayMoney,0) AS HNumber 
                 From (SELECT to_char(ReceiverTime,'yyyymm') ReceiverTime,SUM(COALESCE(ReceiverAccount * ExchangeRate,0)) ReceiverMoney 
                 FROM T_ConstractReceivablesRecord ";

        strHQL += " Where ReceivablesID IN (Select ID From T_ConstractReceivables Where Account Like " + "'" + strAccountName + "'" + ")";
        strHQL += " AND Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and to_char(ReceiverTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(ReceiverTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and Payer Like " + "'" + strPayer + "'";

        strHQL += @" GROUP BY to_char(ReceiverTime,'yyyymm')) A 
                 full JOIN (SELECT to_char(OutOfPocketTime,'yyyymm') OutOfPocketTime,SUM(COALESCE(OutOfPocketAccount * ExchangeRate,0)) PayMoney
                 from T_ConstractPayableRecord ";

        strHQL += " Where PayableID IN (Select ID From T_ConstractPayable Where Account Like " + "'" + strAccountName + "'" + ")";
        strHQL += " AND Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and to_char(OutOfPocketTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(OutOfPocketTime,'yyyymmdd') <= " + "'" + strEndTime + "'";


        strHQL += @" GROUP BY to_char(OutOfPocketTime,'yyyymm')) B 
                 ON A.ReceiverTime=B.OutOfPocketTime ";


        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column3&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql3.Text = strHQL;
    }


    protected void LoadConstractReceivablesRecord(string strDepartString)
    {
        string strHQL;
        IList lst;

        decimal deReceiverAccount = 0;

        strHQL = "from ConstractReceivablesRecord  as constractReceivablesRecord ";
        strHQL += " Where constractReceivablesRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " Order By constractReceivablesRecord.ID DESC";
        ConstractReceivablesRecordBLL constractReceivablesRecordBLL = new ConstractReceivablesRecordBLL();
        lst = constractReceivablesRecordBLL.GetAllConstractReceivablesRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ConstractReceivablesRecord constractReceivablesRecord = new ConstractReceivablesRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivablesRecord = (ConstractReceivablesRecord)lst[i];

            deReceiverAccount += constractReceivablesRecord.ReceiverAccount * constractReceivablesRecord.ExchangeRate;
        }

        LB_ReceiverAmount.Text = deReceiverAccount.ToString();

        LB_Sql1.Text = strHQL;

        strHQL = "Select Account as XName,Sum(ReceiverAccount * ExchangeRate) as YNumber From T_ConstractReceivables";
        strHQL += " Where OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " Group By Account";

        string strChartTitle;

        strChartTitle = Resources.lang.SSKMJEFBT + "(" + ShareClass.GetHomeCurrencyType() + ")";
        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql2.Text = strHQL;

        strChartTitle = Resources.lang.TQSJSFKDBT + "(" + ShareClass.GetHomeCurrencyType() + ")";

        strHQL = @"Select  COALESCE(A.ReceiverTime,OutOfPocketTime) as XName,
                 COALESCE(PayMoney,0) AS YNumber,COALESCE(ReceiverMoney,0) AS ZNumber,
                 COALESCE(ReceiverMoney,0)- COALESCE(PayMoney,0) AS HNumber 
                 From (SELECT to_char(ReceiverTime,'yyyymm') ReceiverTime,SUM(COALESCE(ReceiverAccount * ExchangeRate,0)) ReceiverMoney 
                 FROM T_ConstractReceivablesRecord";

        strHQL += " WHERE ReceiverTime > now() - '13 month'::interval " + " and OperatorCode = " + "'" + strUserCode + "'";

        strHQL += @" GROUP BY to_char(ReceiverTime,'yyyymm')) A 
                 full JOIN (SELECT to_char(OutOfPocketTime,'yyyymm') OutOfPocketTime,SUM(COALESCE(OutOfPocketAccount * ExchangeRate,0)) PayMoney
                 from T_ConstractPayableRecord ";

        strHQL += " WHERE OutOfPocketTime > now() - '13 month'::interval" + " and OperatorCode = " + "'" + strUserCode + "'";

        strHQL += @" GROUP BY to_char(OutOfPocketTime,'yyyymm')) B 
                 ON A.ReceiverTime=B.OutOfPocketTime ";


        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column3&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql3.Text = strHQL;
    }
    

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;

        string strChartTitle = "ReportView";

        strChartTitle = Resources.lang.SSKMJEFBT;
        strHQL = LB_Sql2.Text.Trim();
        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


        strChartTitle = Resources.lang.TQSJSFKDBT;
        strHQL = LB_Sql3.Text.Trim();
        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


        strHQL = LB_Sql1.Text.Trim();
        ConstractReceivablesRecordBLL constractReceivablesRecordBLL = new ConstractReceivablesRecordBLL();
        IList lst = constractReceivablesRecordBLL.GetAllConstractReceivablesRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


}
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

public partial class TTAccountPayRecordSummarySAAS : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "付款明细汇总表", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadAccountForDDL(ddl_Account);

            ShareClass.LoadCurrencyForDropDownList(DL_Currency);

            LoadConstractPayableRecord(strUserCode);
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

        decimal deOutOfPocketAmount = 0;

        string strAccountName, strCurrencyType, strProjectID;
        string strStartTime, strEndTime;
        string strDepartString;

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");


        strCurrencyType = "%" + DL_Currency.SelectedValue.Trim() + "%";
        strAccountName = "%" + TB_Account.Text.Trim() + "%";

        strDepartString = LB_DepartString.Text.Trim();
        strProjectID = TB_RelatedProjectID.Text.Trim();

        if (strProjectID == "")
        {
            strHQL = "from ConstractPayableRecord as constractPayableRecord";
            strHQL += " Where constractPayableRecord.PayableID in (Select constractPayable.ID From ConstractPayable as constractPayable Where constractPayable.Account Like " + "'" + strAccountName + "'" + ")";
            strHQL += " and constractPayableRecord.Currency Like " + "'" + strCurrencyType + "'";
            strHQL += " and constractPayableRecord.OperatorCode = '" + strUserCode + "'";
            strHQL += " and to_char(constractPayableRecord.OperateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(constractPayableRecord.OperateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " Order By constractPayableRecord.ID DESC";
        }
        else
        {
            strHQL = "from ConstractPayableRecord as constractPayableRecord";
            strHQL += " Where constractPayableRecord.PayableID in (Select constractPayable.ID From ConstractPayable as constractPayable Where constractPayable.Account Like " + "'" + strAccountName + "'" + ")";
            strHQL += " and constractPayableRecord.Currency Like " + "'" + strCurrencyType + "'";
            strHQL += " and constractPayableRecord.OperatorCode = '" + strUserCode + "'";
            strHQL += " and to_char(constractPayableRecord.OperateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(constractPayableRecord.OperateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and constractPayableRecord.RelatedProjectID = " + strProjectID;
            strHQL += " Order By constractPayableRecord.ID DESC";
        }

    

        ConstractPayableRecordBLL constractPayableRecordBLL = new ConstractPayableRecordBLL();
        lst = constractPayableRecordBLL.GetAllConstractPayableRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ConstractPayableRecord constractPayableRecord = new ConstractPayableRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayableRecord = (ConstractPayableRecord)lst[i];

            deOutOfPocketAmount += constractPayableRecord.OutOfPocketAccount;
        }

        LB_OutOfPocketAmount.Text = deOutOfPocketAmount.ToString();

        LB_Sql1.Text = strHQL;

        strHQL = "Select Account as XName,COALESCE(Sum(OutOfPocketAccount),0) as YNumber from T_ConstractPayable";
        strHQL += " Where Account Like " + "'" + strAccountName + "'";
        strHQL += " and CurrencyType Like " + "'" + strCurrencyType + "'";
        strHQL += " and OperatorCode = '" + strUserCode + "'";
        strHQL += " and to_char(OperateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(OperateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Group By Account";

        string strChartTitle;

        strChartTitle = Resources.lang.SFKMJEFBT;
        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql2.Text = strHQL;

        strChartTitle = Resources.lang.TQSJSFKDBT;
        strHQL = @"Select COALESCE(A.OutOfPocketTime, B.ReceiverTime) as XName,
            COALESCE(A.PayMoney, 0) AS YNumber, COALESCE(B.ReceiverMoney, 0) AS ZNumber,
            COALESCE(A.PayMoney, 0)-COALESCE(B.ReceiverMoney, 0) AS HNumber
            From (SELECT to_char( OutOfPocketTime, 'yyyymm') OutOfPocketTime, SUM(COALESCE(OutOfPocketAccount * ExchangeRate, 0)) PayMoney
            from T_ConstractPayableRecord ";

        strHQL += " WHERE OutOfPocketTime > now() - '6 month'::interval and OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and PayableID IN(Select ID From T_ConstractPayable Where Account Like " + "'" + strAccountName + "')";
        strHQL += " AND Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and to_char(OutOfPocketTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(OutOfPocketTime,'yyyymmdd') <= " + "'" + strEndTime + "'";

        strHQL += @" GROUP BY to_char( OutOfPocketTime, 'yyyymm')) A
            full JOIN (SELECT to_char( ReceiverTime, 'yyyymm') ReceiverTime, SUM(COALESCE(ReceiverAccount * ExchangeRate, 0)) ReceiverMoney
                FROM T_ConstractReceivablesRecord ";

        strHQL += " Where ReceivablesID IN (Select ID From T_ConstractReceivables Where Account Like " + "'" + strAccountName + "')";
        strHQL += " AND Currency Like " + "'" + strCurrencyType + "'";
        strHQL += " and  OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and to_char(ReceiverTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(ReceiverTime,'yyyymmdd') <= " + "'" + strEndTime + "'";

        strHQL += @" GROUP BY to_char( ReceiverTime, 'yyyymm')) B
                ON B.ReceiverTime = A.OutOfPocketTime";


        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql3.Text = strHQL;
    }

    protected void LoadConstractPayableRecord(string strUserCode)
    {
        string strHQL;
        IList lst;

        decimal deOutOfPocketAmount = 0;

        strHQL = "from ConstractPayableRecord as constractPayableRecord";
        strHQL += " Where constractPayableRecord.OperatorCode = '" + strUserCode + "'";
        strHQL += " Order By constractPayableRecord.ID DESC";
        ConstractPayableRecordBLL constractPayableRecordBLL = new ConstractPayableRecordBLL();
        lst = constractPayableRecordBLL.GetAllConstractPayableRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ConstractPayableRecord constractPayableRecord = new ConstractPayableRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayableRecord = (ConstractPayableRecord)lst[i];

            deOutOfPocketAmount += constractPayableRecord.OutOfPocketAccount;
        }

        LB_OutOfPocketAmount.Text = deOutOfPocketAmount.ToString();

        LB_Sql1.Text = strHQL;

        string strChartTitle;

        strChartTitle = Resources.lang.SFKMJEFBT;
        strHQL = "Select Account as XName,COALESCE(Sum(OutOfPocketAccount),0) as YNumber from T_ConstractPayable";
        strHQL += " Where OperatorCode = '" + strUserCode + "'";
        strHQL += " Group By Account";

        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql2.Text = strHQL;

        strChartTitle = Resources.lang.TQSJSFKDBT;

        strHQL = @"Select COALESCE(A.OutOfPocketTime, B.ReceiverTime) as XName,
            COALESCE(A.PayMoney, 0) AS YNumber, COALESCE(B.ReceiverMoney, 0) AS ZNumber,
            COALESCE(A.PayMoney, 0)-COALESCE(B.ReceiverMoney, 0) AS HNumber
            From (SELECT to_char( OutOfPocketTime, 'yyyymm') OutOfPocketTime, SUM(COALESCE(OutOfPocketAccount * ExchangeRate, 0)) PayMoney
            from T_ConstractPayableRecord ";

        strHQL += " WHERE OutOfPocketTime > now() - '13 month'::interval and OperatorCode = " + "'" + strUserCode + "'";

        strHQL += @" GROUP BY to_char( OutOfPocketTime, 'yyyymm')) A
            full JOIN (SELECT to_char( ReceiverTime, 'yyyymm') ReceiverTime, SUM(COALESCE(ReceiverAccount * ExchangeRate, 0)) ReceiverMoney
                FROM T_ConstractReceivablesRecord ";

        strHQL += " WHERE ReceiverTime > now() - '13 month'::interval and OperatorCode = " + "'" + strUserCode + "'";

        strHQL += @" GROUP BY to_char( ReceiverTime, 'yyyymm')) B
                ON B.ReceiverTime = A.OutOfPocketTime";



        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_Sql3.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;

        string strChartTitle;

        strChartTitle = Resources.lang.SFKMJEFBT;
        strHQL = LB_Sql2.Text.Trim();
        IFrame_Chart_Pie.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


        strChartTitle = Resources.lang.TQSJSFKDBT;
        strHQL = LB_Sql3.Text.Trim();
        IFrame_Chart_PayAndReceive.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


        strHQL = LB_Sql1.Text.Trim();
        ConstractPayableRecordBLL constractPayableRecordBLL = new ConstractPayableRecordBLL();
        IList lst = constractPayableRecordBLL.GetAllConstractPayableRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


}
using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Data;

public partial class TTWZStorePrintPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["StockCode"]) || !string.IsNullOrEmpty(Request.QueryString["Year"]) || !string.IsNullOrEmpty(Request.QueryString["Month"]))
            {
                string strStockCode = Request.QueryString["StockCode"].ToString();
                string strYear = Request.QueryString["Year"].ToString();
                string strMonth = Request.QueryString["Month"].ToString();

                DataBinder(strStockCode, strYear, strMonth);

                LT_StockCode.Text = strStockCode;
                LT_YearMonth.Text = strYear +"-" + strMonth;
                LT_CurrentTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
    }

    private void DataBinder(string strStockCode, string strYear,string strMonth)
    {
        int intYear = 0;
        int.TryParse(strYear, out intYear);
        int intMonth = 0;
        int.TryParse(strMonth, out intMonth);

        int intPreviousMonth = intMonth - 1;

        string strPreviousMonth = string.Empty;
        string strPreviousYear = string.Empty;
        if (intPreviousMonth <= 0)
        {
            strPreviousMonth = "12";
            strPreviousYear = (intYear - 1).ToString();
        }
        else
        {
            strPreviousMonth = intPreviousMonth.ToString();
            strPreviousYear = intYear.ToString();
        }

        int intNextMonth = intMonth + 1;

        string strNextMonth = string.Empty;
        string strNextYear = string.Empty;

        if (intNextMonth >= 13)
        {
            strNextMonth = "1";
            strNextYear = (intYear + 1).ToString();
        }
        else
        {
            strNextMonth = intNextMonth.ToString();
            strNextYear = intYear.ToString();
        }

        string strHQL = string.Format(@"select 
                        y.DLCode,
                        l.DLName,
                        上期结额 = y.上期结额,
                        本期收额 = y.本期收额,
                        累计收额 = y.累计收额,
                        本期发额 = y.本期发额,
                        累计发额 = y.累计发额,
                        本期结额 = y.本期结额,
                        平均占用 = (y.上期结额 + y.本期结额) / 2
                        from
                        (
                        select 
                        DLCode,
                        上期结额 = x.上期结额,
                        本期收额 = x.本期收额,
                        累计收额 = x.累计收额,
                        本期发额 = x.本期发额,
                        累计发额 = x.累计发额,
                        本期结额 = x.上期结额 + x.本期收额 - x.本期发额
                        from
                        (
                        select 
                        DLCode,
                        上期结额 = t.初始金额+t.上月末之前有效收料单的实购金额总和-t.上月末之前有效发料单的计划金额总和,
                        本期收额 = t.本月有效收料单的实购金额总和,
                        累计收额 = t.本年度有效收料单的实购金额总和,
                        本期发额 = t.本月有效发料单的计划金额总和,
                        累计发额 = t.本年度有效发料单的计划金额总和
                        from
                        (
                        select a.DLCode,
                        COALESCE(SumYearMoney,0) as 初始金额, 
                        COALESCE(b.ActualMoney,0) as 上月末之前有效收料单的实购金额总和,
                        COALESCE(c.PlanMoney,0) as 上月末之前有效发料单的计划金额总和,
                        COALESCE(d.ActualMoney,0) as 本月有效收料单的实购金额总和,
                        COALESCE(e.ActualMoney,0) as 本年度有效收料单的实购金额总和,
                        COALESCE(f.PlanMoney,0) as 本月有效发料单的计划金额总和,
                        COALESCE(g.PlanMoney,0) as 本年度有效发料单的计划金额总和
                        from
                        (
                        select SUBSTRING(ObjectCode, 0, 3) as DLCode,
                        SumYearMoney = SUM(YearMoney)
                        from T_WZStore
                        where StockCode like '%{0}%'
                        group by SUBSTRING(ObjectCode, 0, 3)
                        ) a
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(ActualMoney) as ActualMoney
                        from T_WZCollect
                        where IsMark = -1
                        and to_char( CollectTime::timestamp, 'yyyy-mm-dd' ) < cast( {1} as varchar(4))||'-'||cast({2} as varchar(2))||'-01'
                        group by SUBSTRING(ObjectCode,0,3)
                        ) b
                        on a.DLCode = b.DLCode
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(PlanMoney) as PlanMoney
                        from T_WZSend
                        where IsMark = -1
                        and to_char( SendTime::timestamp, 'yyyy-mm-dd' ) < cast({1} as varchar(4))||'-'||cast({2} as varchar(2))||'-01'
                        group by SUBSTRING(ObjectCode,0,3)
                        ) c
                        on a.DLCode = c.DLCode
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(ActualMoney) as ActualMoney
                        from T_WZCollect
                        where IsMark = -1
                        and to_char( CollectTime::timestamp, 'yyyy-mm-dd' ) > cast({5} as varchar(4))||'-'||cast( {3} as varchar(2))||'-01'
                        and to_char( CollectTime::timestamp, 'yyyy-mm-dd' ) < cast({6} as varchar(4))||'-'||cast( {4} as varchar(2))||'-01'
                        group by SUBSTRING(ObjectCode,0,3)
                        ) d
                        on a.DLCode = d.DLCode
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(ActualMoney) as ActualMoney
                        from T_WZCollect
                        where IsMark = -1
                        and extract(year from CollectTime::timestamp) =  {1}
                        group by SUBSTRING(ObjectCode,0,3)
                        ) e
                        on a.DLCode = e.DLCode
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(PlanMoney) as PlanMoney
                        from T_WZSend
                        where IsMark = -1
                        and to_char( SendTime::timestamp, 'yyyy-mm-dd' ) > cast({5} as varchar(4))||'-'||cast({3} as varchar(2))||'-01'
                        and to_char( SendTime::timestamp, 'yyyy-mm-dd' ) < cast({6} as varchar(4))||'-'||cast({4} as varchar(2))||'-01'
                        group by SUBSTRING(ObjectCode,0,3)
                        ) f
                        on a.DLCode = f.DLCode
                        left join
                        (
                        select SUBSTRING(ObjectCode,0,3) as DLCode,
                        SUM(PlanMoney) as PlanMoney
                        from T_WZSend
                        where IsMark = -1
                        and extract(year from SendTime::timestamp) = {1}
                        group by SUBSTRING(ObjectCode,0,3)
                        ) g
                        on a.DLCode = g.DLCode
                        ) t 
                        ) x
                        ) y
                        left join T_WZMaterialDL l on y.DLCode = l.DLCode", strStockCode, strYear, strPreviousMonth, strMonth, strNextMonth, strPreviousYear, strNextYear);

        DataTable dtStore = ShareClass.GetDataSetFromSql(strHQL, "Store").Tables[0];

        decimal decimalPreviousMoney = 0;               //上期结额
        decimal decimalCurrentCollectMoney = 0;         //本期收额
        decimal decimalTotalCollectMoney = 0;           //累计收额
        decimal decimalCurrentSendMoney = 0;            //本期发额
        decimal decimalTotalSendMoney = 0;              //累计发额
        decimal decimalCurrentMoney = 0;                //本期结额
        decimal decimalAvgMoney = 0;                         //平均占用

        foreach (DataRow drStore in dtStore.Rows)
        {
            decimal decimalStorePreviousMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["上期结额"]), out decimalStorePreviousMoney);
            decimalPreviousMoney += decimalStorePreviousMoney;

            decimal decimalStoreCurrentCollectMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["本期收额"]), out decimalStoreCurrentCollectMoney);
            decimalCurrentCollectMoney += decimalStoreCurrentCollectMoney;

            decimal decimalStoreTotalCollectMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["累计收额"]), out decimalStoreTotalCollectMoney);
            decimalTotalCollectMoney += decimalStoreTotalCollectMoney;

            decimal decimalStoreCurrentSendMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["本期发额"]), out decimalStoreCurrentSendMoney);
            decimalCurrentSendMoney += decimalStoreCurrentSendMoney;

            decimal decimalStoreTotalSendMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["累计发额"]), out decimalStoreTotalSendMoney);
            decimalTotalSendMoney += decimalStoreTotalSendMoney;

            decimal decimalStoreCurrentMoney = 0;
            decimal.TryParse(ShareClass.ObjectToString(drStore["本期结额"]), out decimalStoreCurrentMoney);
            decimalCurrentMoney += decimalStoreCurrentMoney;
        }

        decimalAvgMoney = (decimalPreviousMoney + decimalCurrentMoney) / 2;


        LT_PreviousMoney.Text = decimalPreviousMoney.ToString() +"";
        LT_CurrentCollectMoney.Text = decimalCurrentCollectMoney.ToString() + "";
        LT_TotalCollectMoney.Text = decimalTotalCollectMoney.ToString() + "";
        LT_CurrentSendMoney.Text = decimalCurrentSendMoney.ToString();
        LT_TotalSendMoney.Text = decimalTotalSendMoney.ToString();
        LT_CurrentMoney.Text = decimalCurrentMoney.ToString();
        LT_AvgMoney.Text = decimalAvgMoney.ToString();


        RT_List.DataSource = dtStore;
        RT_List.DataBind();
    }

    protected void RT_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
}
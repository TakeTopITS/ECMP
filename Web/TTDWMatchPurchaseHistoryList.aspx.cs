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
using System.Drawing;

public partial class TTDWMatchPurchaseHistoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataYearMonthBinder();

            DataMatchTypeBinder();

            DataMatchPriceBinder();
            

        }
    }


    private void DataMatchPriceBinder()
    {
        string strYear = DDL_Year.SelectedValue;
        string strMatchType = DDL_MatchType.SelectedValue;
        string strMatchName = TXT_MatchName.Text.Trim();



        string strDWMatchPriceHQL = string.Format(@"
                    select MatchName,SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),0,5) as TotalYear,
                    MonthTotal1 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '01' then MaterialPrice else 0 end),
                    MonthTotal2 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '02' then MaterialPrice else 0 end),
                    MonthTotal3 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '03' then MaterialPrice else 0 end),
                    MonthTotal4 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '04' then MaterialPrice else 0 end),
                    MonthTotal5 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '05' then MaterialPrice else 0 end),
                    MonthTotal6 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '06' then MaterialPrice else 0 end),
                    MonthTotal7 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '07' then MaterialPrice else 0 end),
                    MonthTotal8 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '08' then MaterialPrice else 0 end),
                    MonthTotal9 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '09' then MaterialPrice else 0 end),
                    MonthTotal10 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '10' then MaterialPrice else 0 end),
                    MonthTotal11 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '11' then MaterialPrice else 0 end),
                    MonthTotal12 = sum(case when SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),6,2) = '12' then MaterialPrice else 0 end)
                    from T_DWMatchHistory
                    where to_char( CreateTime, 'yyyy-mm-dd' ) like '{0}%'
                    ", strYear);
        if (!string.IsNullOrEmpty(strMatchType))
        {
            strDWMatchPriceHQL += " and MatchType = " + strMatchType ;
        }
        if (!string.IsNullOrEmpty(strMatchName))
        {
            strDWMatchPriceHQL += " and MatchName like '" + strMatchName + "%'";
        }
        strDWMatchPriceHQL += " group by MatchName,SUBSTRING(to_char( CreateTime, 'yyyy-mm-dd' ),0,5)";

        DataTable dtMatch = ShareClass.GetDataSetFromSql(strDWMatchPriceHQL, "MatchPrice").Tables[0];

        DG_MatchHistory.DataSource = dtMatch;
        DG_MatchHistory.DataBind();
        
    }

    private void DataMatchTypeBinder()
    {
        DWMatchTypeBLL dWMatchTypeBLL = new DWMatchTypeBLL();
        string strDWMatchTypeHQL = "from DWMatchType as dWMatchType order by dWMatchType.ID desc";
        IList listDWMatchType = dWMatchTypeBLL.GetAllDWMatchTypes(strDWMatchTypeHQL);

        DDL_MatchType.DataSource = listDWMatchType;
        DDL_MatchType.DataBind();

        DDL_MatchType.Items.Insert(0, new ListItem("全部", ""));

    }


    private void DataYearMonthBinder()
    {
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_Year.SelectedValue = DateTime.Now.Year.ToString();

        
    }


    protected void BT_Search_Click(object sender, EventArgs e)
    {
        DataMatchPriceBinder();
    }
}
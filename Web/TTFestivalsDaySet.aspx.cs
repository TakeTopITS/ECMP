using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTFestivalsDaySet : System.Web.UI.Page
{
    Boolean isX = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;
        strUserCode = Session["UserCode"].ToString();
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "建立与分派项目", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!IsPostBack)
        {
            List<String> years = new List<String>();
            for (int i = -1; i < 5; i++)
            {
                years.Add(DateTime.Now.Year + i + "");
            }

            ddl_year.DataSource = years;
            ddl_year.DataBind();
            ddl_copy.DataSource = years;
            ddl_copy.DataBind();

            GetFestivalsType();

            ddl_year.SelectedValue = DateTime.Now.Year.ToString();
            ddl_moths.SelectedValue = DateTime.Now.Month.ToString();
            hid_year_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadFestivalsByYear(ddl_year.SelectedValue));
            hid_exchange_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadExchangeDayByYear(ddl_year.SelectedValue));
        }
        else
        {
            cal_days.SelectedDate = DateTime.MinValue;
            cal_exchange.SelectedDate = DateTime.MinValue;
        }
    }

    private void GetFestivalsType()
    {
        LoadFestivalsTypeByYear(lb_festivals);
    }

    protected void ddl_year_SelectedIndexChanged(object sender, EventArgs e)
    {
        cal_days.TodaysDate = new DateTime(int.Parse(ddl_year.SelectedValue), int.Parse(ddl_moths.SelectedValue), 1);
        hid_year_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadFestivalsByYear(ddl_year.SelectedValue));

        cal_exchange.TodaysDate = new DateTime(int.Parse(ddl_year.SelectedValue), int.Parse(ddl_moths.SelectedValue), 1);
        hid_exchange_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadExchangeDayByYear(ddl_year.SelectedValue));

        lb_festivals_SelectedIndexChanged(null, null);
    }

    protected void ddl_moths_SelectedIndexChanged(object sender, EventArgs e)
    {
        cal_days.TodaysDate = new DateTime(int.Parse(ddl_year.SelectedValue), int.Parse(ddl_moths.SelectedValue), 1);
        cal_exchange.TodaysDate = new DateTime(int.Parse(ddl_year.SelectedValue), int.Parse(ddl_moths.SelectedValue), 1);
    }

    protected void lb_festivals_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, List<DateTime>> fs = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, List<DateTime>>>(hid_year_date.Value);
        if (lb_festivals.SelectedItem != null && fs.Keys.Contains(lb_festivals.SelectedItem.Text))
        {
            SelectDate = fs[lb_festivals.SelectedItem.Text];
            if (SelectDate.Count > 0)
            {
                cal_days.TodaysDate = SelectDate[0];
                cal_exchange.TodaysDate = SelectDate[0];
                ddl_moths.SelectedValue = cal_days.TodaysDate.Month.ToString();
            }
        }
        else
        {
            SelectDate = new List<DateTime>();
        }

        Dictionary<string, List<DateTime>> exc = Newtonsoft.Json.JsonConvert.DeserializeObject<Dictionary<string, List<DateTime>>>(hid_exchange_date.Value);
        if (lb_festivals.SelectedItem != null && exc.Keys.Contains(lb_festivals.SelectedItem.Text))
        {
            ExchangeDate = exc[lb_festivals.SelectedItem.Text];
            if (ExchangeDate.Count > 0)
            {
                //cal_exchange.TodaysDate = ExchangeDate[0];
                //ddl_moths.SelectedValue = cal_days.TodaysDate.Month.ToString();
            }
        }
        else
        {
            ExchangeDate = new List<DateTime>();
        }
    }

    public List<DateTime> SelectDate
    {
        set
        {
            ViewState["sd"] = value;
        }
        get
        {
            if (ViewState["sd"] == null)
                ViewState["sd"] = new List<DateTime>();
            return (List<DateTime>)ViewState["sd"];
        }
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        List<DateTime> selectDate = SelectDate;
        if (selectDate.Contains(e.Day.Date))
        {
            e.Cell.BackColor = System.Drawing.Color.Silver;
            e.Cell.ForeColor = System.Drawing.Color.White;
        }
        else
        {
            e.Cell.BackColor = System.Drawing.Color.White;
            e.Cell.ForeColor = System.Drawing.Color.Black;
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        List<DateTime> lst = SelectDate;
        if (lst.Contains(cal_days.SelectedDate))
        {
            lst.Remove(cal_days.SelectedDate);
            CancelFestivals(cal_days.SelectedDate, lb_festivals.SelectedItem.Text);
            SelectDate = lst;
            hid_year_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadFestivalsByYear(ddl_year.SelectedValue));
        }
        else
        {
            lst.Add(cal_days.SelectedDate);
            SetFestivals(cal_days.SelectedDate, lb_festivals.SelectedItem.Text);
            SelectDate = lst;
            hid_year_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadFestivalsByYear(ddl_year.SelectedValue));
        }
    }

    public List<DateTime> ExchangeDate
    {
        set
        {
            ViewState["exc"] = value;
        }
        get
        {
            if (ViewState["exc"] == null)
                ViewState["exc"] = new List<DateTime>();
            return (List<DateTime>)ViewState["exc"];
        }
    }
    protected void cal_exchange_DayRender(object sender, DayRenderEventArgs e)
    {
        List<DateTime> selectDate = ExchangeDate;
        if (selectDate.Contains(e.Day.Date))
        {
            e.Cell.BackColor = System.Drawing.Color.Silver;
            e.Cell.ForeColor = System.Drawing.Color.White;
        }
        else
        {
            e.Cell.BackColor = System.Drawing.Color.White;
            e.Cell.ForeColor = System.Drawing.Color.Black;
        }
    }
    protected void cal_exchange_SelectionChanged(object sender, EventArgs e)
    {
        List<DateTime> lst = ExchangeDate;
        if (lst.Contains(cal_exchange.SelectedDate))
        {
            lst.Remove(cal_exchange.SelectedDate);
            CancelExchange(cal_exchange.SelectedDate, lb_festivals.SelectedItem.Text);
            ExchangeDate = lst;
            hid_exchange_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadExchangeDayByYear(ddl_year.SelectedValue));
        }
        else
        {
            lst.Add(cal_exchange.SelectedDate);
            SetExchange(cal_exchange.SelectedDate, lb_festivals.SelectedItem.Text);
            ExchangeDate = lst;
            hid_exchange_date.Value = Newtonsoft.Json.JsonConvert.SerializeObject(LoadExchangeDayByYear(ddl_year.SelectedValue));
        }
    }

    protected void btn_copy_Click(object sender, EventArgs e)
    {
        if (int.Parse( this.ddl_year.SelectedValue) < int.Parse(this.ddl_copy.SelectedValue))
        {
            CopyFestivalsDayToYear(this.ddl_year.SelectedValue, this.ddl_copy.SelectedValue);
            CopyExchangeDayToYear(this.ddl_year.SelectedValue, this.ddl_copy.SelectedValue);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "Script2", "alert('提示，复制成功！')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "Script1", "alert('警告，复制到的年份不能等于或小于被复制的年份，请检查！')", true);
        }

    }

    #region 节假日操作类

    public static void LoadFestivalsTypeByYear(ListBox DL_Visible)
    {
        string sqlstr = string.Format("SELECT * FROM T_FestivalsType ORDER BY SortNumber");
        DataSet ds = ShareClass.GetDataSetFromSql(sqlstr, "T_FestivalsType");
        DL_Visible.DataSource = ds;
        DL_Visible.DataBind();
    }

    public static Dictionary<string, List<DateTime>> LoadFestivalsByYear(string year)
    {
        Dictionary<string, List<DateTime>> fs = new Dictionary<string, List<DateTime>>();
        string sqlstr = string.Format("SELECT FestivalsName,FestivalsDate FROM T_FestivalsDaySet where FestivalsYear = {0}", year);
        DataSet ds = ShareClass.GetDataSetFromSql(sqlstr, "T_FestivalsDaySet");
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            string name = row["FestivalsName"].ToString();
            if (fs.Keys.Contains(name))
            {
                fs[name].Add(Convert.ToDateTime(row["FestivalsDate"]));
            }
            else
            {
                fs[name] = new List<DateTime>();
                fs[name].Add(Convert.ToDateTime(row["FestivalsDate"]));
            }
        }
        return fs;
    }

    public static void SetFestivals(DateTime dt, string name)
    {
        string sqlstr = string.Format("INSERT into T_FestivalsDaySet (FestivalsYear,FestivalsName,FestivalsDate)values({0},'{1}','{2}')", dt.Year, name, dt.ToString("yyyy-MM-dd"));
        ShareClass.RunSqlCommand(sqlstr);
    }

    public static void CancelFestivals(DateTime dt, string name)
    {
        string sqlstr = string.Format("Delete T_FestivalsDaySet where FestivalsYear = {0} and FestivalsName = '{1}' and FestivalsDate = '{2}'", dt.Year, name, dt.ToString("yyyy-MM-dd"));
        ShareClass.RunSqlCommand(sqlstr);
    }

    public static void CopyFestivalsDayToYear(string year, string toYear)
    {
        string sqlstr = string.Format("Delete T_FestivalsDaySet where FestivalsYear = {0};INSERT INTO T_FestivalsDaySet (FestivalsYear,FestivalsName,FestivalsDate) SELECT '{0}' FestivalsYear,FestivalsName,FestivalsDate FROM T_FestivalsDaySet WHERE FestivalsYear = {1}", toYear, year);
        ShareClass.RunSqlCommand(sqlstr);
    }

    #endregion

    #region 调休日操作类

    public static Dictionary<string, List<DateTime>> LoadExchangeDayByYear(string year)
    {
        Dictionary<string, List<DateTime>> fs = new Dictionary<string, List<DateTime>>();
        string sqlstr = string.Format("SELECT FestivalsName,ExchangeDate FROM T_FestivalsExchangeDaySet where FestivalsYear = {0}", year);
        DataSet ds = ShareClass.GetDataSetFromSql(sqlstr, "T_FestivalsExchangeDaySet");
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            string name = row["FestivalsName"].ToString();
            if (fs.Keys.Contains(name))
            {
                fs[name].Add(Convert.ToDateTime(row["ExchangeDate"]));
            }
            else
            {
                fs[name] = new List<DateTime>();
                fs[name].Add(Convert.ToDateTime(row["ExchangeDate"]));
            }
        }
        return fs;
    }

    public static void SetExchange(DateTime dt, string name)
    {
        string sqlstr = string.Format("INSERT into T_FestivalsExchangeDaySet (FestivalsYear,FestivalsName,ExchangeDate)values({0},'{1}','{2}')", dt.Year, name, dt.ToString("yyyy-MM-dd"));
        ShareClass.RunSqlCommand(sqlstr);
    }

    public static void CancelExchange(DateTime dt, string name)
    {
        string sqlstr = string.Format("Delete T_FestivalsExchangeDaySet where FestivalsYear = {0} and FestivalsName = '{1}' and ExchangeDate = '{2}'", dt.Year, name, dt.ToString("yyyy-MM-dd"));
        ShareClass.RunSqlCommand(sqlstr);
    }

    public static void CopyExchangeDayToYear(string year, string toYear)
    {
        string sqlstr = string.Format("Delete T_FestivalsExchangeDaySet where FestivalsYear = {0};INSERT INTO T_FestivalsExchangeDaySet (FestivalsYear,FestivalsName,ExchangeDate) SELECT '{0}' FestivalsYear,FestivalsName,ExchangeDate FROM T_FestivalsExchangeDaySet WHERE FestivalsYear = {1}", toYear, year);
        ShareClass.RunSqlCommand(sqlstr);
    }

    #endregion
}
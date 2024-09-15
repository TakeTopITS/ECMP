using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Web;
using DayPilot.Utils;
using DayPilot.Web.Ui.Data;
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Events.Bubble;
using DayPilot.Web.Ui.Events.Month;
using TimeRangeMenuClickEventArgs = DayPilot.Web.Ui.Events.Month.TimeRangeMenuClickEventArgs;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppMonthSchedule : System.Web.UI.Page
{
    private DataTable table;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = HttpContext.Current.Session["UserCode"].ToString();
        strUserName = HttpContext.Current.Session["UserName"].ToString();

        if (Session["AllFeatures"] == null)
        {
            Session["AllFeatures"] = DataGeneratorCalendar.GetData();
        }
        table = (DataTable)Session["AllFeatures"];
        DayPilotMonth1.DataSource = Session["AllFeatures"];
        DayPilotNavigator1.DataSource = Session["AllFeatures"];

        if (!IsPostBack)
        {
            DataBind();
            DayPilotMonth1.UpdateWithMessage("Welcome!");
        }
    }

    protected void DayPilotCalendar1_EventMenuClick(object sender, EventMenuClickEventArgs e)
    {
        if (e.Command == "Delete")
        {
            #region Simulation of database update
            DataRow dr = table.Rows.Find(e.Id);

            if (dr != null)
            {
                table.Rows.Remove(dr);
                table.AcceptChanges();

                string strHQL;
                strHQL = string.Format(@"Delete From t_schedule where id = '{0}'", e.Id);
                ShareClass.RunSqlCommand(strHQL);
            }
            #endregion

            DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
            DayPilotMonth1.DataBind();
            DayPilotMonth1.Update();
        }
    }
    protected void DayPilotMonth1_EventMove(object sender, EventMoveEventArgs e)
    {
        #region Simulation of database update

        DataRow dr = table.Rows.Find(e.Id);
        if (dr != null)
        {
            dr["start"] = e.NewStart;
            dr["end"] = e.NewEnd;
            //dr["column"] = e.NewResource;
            table.AcceptChanges();
        }
        else // moved from outside
        {
            dr = table.NewRow();
            dr["start"] = e.NewStart;
            dr["end"] = e.NewEnd;
            dr["id"] = e.Id;
            dr["name"] = e.Text;
            //dr["column"] = e.NewResource;

            table.Rows.Add(dr);
            table.AcceptChanges();

            string strHQL = string.Format(@"Update t_schedule Set start = cast('{0}' as timestamp without time zone),""end"" = cast('{1}' as timestamp without time zone) Where id = '{2}'", e.NewStart, e.NewEnd, e.Id);
            ShareClass.RunSqlCommand(strHQL);
        }

        #endregion

        DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
        DayPilotMonth1.DataBind();
        DayPilotMonth1.UpdateWithMessage("Event moved.");

    }
    protected void DayPilotMonth1_EventResize(object sender, EventResizeEventArgs e)
    {
        #region Simulation of database update

        DataRow dr = table.Rows.Find(e.Id);
        if (dr != null)
        {
            dr["start"] = e.NewStart;
            dr["end"] = e.NewEnd;
            table.AcceptChanges();

            string strHQL = string.Format(@"Update t_schedule Set start = cast('{0}' as timestamp without time zone),""end"" = cast('{1}' as timestamp without time zone) Where id = '{2}'", e.NewStart, e.NewEnd, e.Id);
            ShareClass.RunSqlCommand(strHQL);
        }

        #endregion

        DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
        DayPilotMonth1.DataBind();
        DayPilotMonth1.UpdateWithMessage("Event resized");
    }

    protected void DayPilotMonth1_EventClick(object sender, EventClickEventArgs e)
    {
        #region Simulation of database update

        DataRow dr = table.Rows.Find(e.Id);
        if (dr != null)
        {
            dr["name"] = "Event clicked at " + DateTime.Now;
            table.AcceptChanges();
        }

        #endregion

        DayPilotMonth1.DataBind();
        DayPilotMonth1.Update();
    }

    protected void DayPilotMonth1_TimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
    {
        #region Simulation of database update

        DataRow dr = table.NewRow();
        dr["start"] = e.Start;
        dr["end"] = e.End;
        dr["id"] = Guid.NewGuid().ToString();
        dr["name"] = "New event";

        table.Rows.Add(dr);
        table.AcceptChanges();

        string strHQL = string.Format(@"Insert Into t_schedule(id,start,""end"",""name"",""column"",usercode,username,allday,color) values ('{0}',cast('{1}' as timestamp without time zone),cast('{2}' as timestamp without time zone),'{3}','{4}','{5}','{6}','{7}','{8}')", dr["id"], dr["start"], dr["end"], dr["name"], "", strUserCode, strUserName, '0', "green");
        ShareClass.RunSqlCommand(strHQL);
        #endregion

        DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
        DayPilotMonth1.DataBind();
        DayPilotMonth1.Update();
    }
    protected void DayPilotMonth1_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.Month.BeforeEventRenderEventArgs e)
    {
        string strID, strColor;

        string strHQL;
        strHQL = string.Format(@"Select id,color from t_schedule Where UserCode = '{0}'", strUserCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "t_schedule");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strID = ds.Tables[0].Rows[i]["id"].ToString().Trim();

            try
            {
                strColor = ds.Tables[0].Rows[i]["color"].ToString().Trim();
            }
            catch
            {
                strColor = "green";
            }

            if (e.Id == strID)
            {
                e.BorderColor = "#1AAFE0";
                e.BackgroundColor = strColor;

                if (strColor != "white" && strColor != "gold")
                {
                    e.FontColor = "white";
                }
                else
                {
                    e.FontColor = "black";
                }

            }
        }

    }

    protected void DayPilotBubble1_RenderContent(object sender, RenderEventArgs e)
    {
        if (e is RenderEventBubbleEventArgs)
        {
            RenderEventBubbleEventArgs re = e as RenderEventBubbleEventArgs;
            re.InnerHTML = "<b>Event details</b><br />Here is the right place to show details about the event with ID: " + re.Value + ". This text is loaded dynamically from the server.";
        }
    }

    protected void DayPilotNavigator1_VisibleRangeChanged(object sender, EventArgs e)
    {
        DayPilotNavigator1.DataSource = getData(DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
        DayPilotNavigator1.DataBind();
    }

    protected void DayPilotMonth1_Command(object sender, CommandEventArgs e)
    {

        switch (e.Command)
        {
            case "previous":
                DayPilotMonth1.StartDate = DayPilotMonth1.StartDate.AddMonths(-1);
                DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
                DayPilotMonth1.DataBind();
                DayPilotMonth1.Update();
                break;
            case "next":
                DayPilotMonth1.StartDate = DayPilotMonth1.StartDate.AddMonths(1);
                DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
                DayPilotMonth1.DataBind();
                DayPilotMonth1.Update();
                break;
            case "navigate":
                DayPilotMonth1.StartDate = (DateTime)e.Data["start"];
                DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
                DayPilotMonth1.DataBind();
                DayPilotMonth1.Update();
                break;
            case "filter":
                DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
                DayPilotMonth1.DataBind();
                DayPilotMonth1.Update();
                break;
            case "refresh":
                DayPilotMonth1.DataSource = getData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd, (string)DayPilotMonth1.ClientState["filter"]);
                DayPilotMonth1.DataBind();
                DayPilotMonth1.UpdateWithMessage("Refreshed.");
                break;
        }

    }

    /// <summary>
    /// This method should normally load the data from the database.
    /// We will load our copy from a Session, just simulating a database.
    /// </summary>
    /// <param name="start"></param>
    /// <param name="end"></param>
    /// <param name="filter"></param>
    /// <returns></returns>
    private DataTable getData(DateTime start, DateTime end, string filter)
    {
        String select;
        if (String.IsNullOrEmpty(filter))
        {
            select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}'))", start, end, filter);
        }
        else
        {
            select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}')) and [name] like '%{2}%'", start, end, filter);
            //            throw new Exception(select);
        }


        DataRow[] rows = table.Select(select);

        DataTable filtered = table.Clone();

        foreach (DataRow r in rows)
        {
            filtered.ImportRow(r);
        }

        return filtered;
    }

    /// <summary>
    /// Make sure a copy of the data is in the Session so users can try changes on their own copy.
    /// </summary>
    private void initData()
    {
        if (Session["MonthView"] == null)
        {
            Session["MonthView"] = DataGeneratorMonth.GetData();
        }

        table = (DataTable)Session["MonthView"];
    }

    protected void DayPilotMonth1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.Month.BeforeCellRenderEventArgs e)
    {
        e.CssClass = Week.WeekNrISO8601(e.Start) % 2 == 0 ? "even" : "odd";
    }

    protected void DayPilotMonth1_BeforeHeaderRender(object sender, BeforeHeaderRenderEventArgs e)
    {

    }

    protected void DayPilotMonth1_TimeRangeMenuClick(object sender, TimeRangeMenuClickEventArgs e)
    {

    }

}


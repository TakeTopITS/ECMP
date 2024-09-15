using System;
using System.Data;
using System.Web.UI;
public partial class TTMyScheduleEdit : System.Web.UI.Page
{
    private DataTable table;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataRow ev = loadEvent(Request.QueryString["id"]);

            TextBoxStart.Text = Convert.ToDateTime(ev["start"]).ToString();
            TextBoxEnd.Text = Convert.ToDateTime(ev["end"]).ToString();
            TextBoxName.Text = Convert.ToString(ev["name"]);
            try
            {
                RBColorSelector.SelectedValue = Convert.ToString(ev["color"]);
            }
            catch
            {
                RBColorSelector.SelectedValue = "white";
            }

            //TextBoxName.Focus();
        }
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
        DateTime start = Convert.ToDateTime(TextBoxStart.Text);
        DateTime end = Convert.ToDateTime(TextBoxEnd.Text);
        string name = TextBoxName.Text;
        string color = RBColorSelector.SelectedValue;

        dbUpdateEvent(Request.QueryString["id"], start, end, name, null,color);
        Modal.Close(this, "OK");
    }

    private string dbUpdateEvent(string id, DateTime start, DateTime end, string name, string resource,string color)
    {
        initData();

        #region Simulation of database update

        DataRow dr = loadEvent(id);
        dr["start"] = start;
        dr["end"] = end;
        dr["id"] = id;
        dr["name"] = name;
        dr["column"] = resource;
        dr["color"] = color;

        //table.Rows.Add(dr);
        table.AcceptChanges();
        #endregion

        string strHQL;

        strHQL = string.Format(@"Update t_schedule Set name = '{0}', start = cast('{1}' as timestamp without time zone),""end"" = cast('{2}' as timestamp without time zone),""column"" = '{3}',color='{4}' Where id = '{5}'", name, start, end, resource,color, id);
        ShareClass.RunSqlCommand(strHQL);

        return id;
    }

    protected void BT_Delete_Click(object sender, ImageClickEventArgs e)
    {
        DateTime start = Convert.ToDateTime(TextBoxStart.Text);
        DateTime end = Convert.ToDateTime(TextBoxEnd.Text);
        string name = TextBoxName.Text;
        string color = RBColorSelector.SelectedValue;

        dbDeleteEvent(Request.QueryString["id"], start, end, name, null, color);
        Modal.Close(this, "OK");
    }

    private void dbDeleteEvent(string id, DateTime start, DateTime end, string name, string resource, string color)
    {
        initData();

        DataRow dr = table.Rows.Find(id);
        if (dr != null)
        {
            table.Rows.Remove(dr);
            table.AcceptChanges();
        }

        string strHQL;
        strHQL = string.Format(@"Delete From t_schedule Where id = '{0}'", Request.QueryString["id"]);
        ShareClass.RunSqlCommand(strHQL);
    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Modal.Close(this);
    }

    private void initData()
    {
        string id = "AllFeatures";

        if (Session[id] == null)
        {
            Session[id] = DataGeneratorCalendar.GetData();
        }
        table = (DataTable)Session[id.Trim()];
    }

    private DataRow loadEvent(string id)
    {
        initData();

        return table.Rows.Find(id);

    }


}

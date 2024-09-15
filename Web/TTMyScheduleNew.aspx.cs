using System;
using System.Data;
using System.Web;

public partial class TTMyScheduleNew : System.Web.UI.Page
{
    private DataTable table;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = HttpContext.Current.Session["UserCode"].ToString();
        strUserName = HttpContext.Current.Session["UserName"].ToString();

        if (!IsPostBack)
        {
            TextBoxStart.Text = Convert.ToDateTime(Request.QueryString["start"]).ToString();
            TextBoxEnd.Text = Convert.ToDateTime(Request.QueryString["end"]).ToString();

            //TextBoxName.Focus();
        }
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
        DateTime start = Convert.ToDateTime(TextBoxStart.Text);
        DateTime end = Convert.ToDateTime(TextBoxEnd.Text);
        string name = TextBoxName.Text;
        string color = RBColorSelector.SelectedValue;

        dbInsertEvent(start, end, name, null,color);
        Modal.Close(this, "OK");
    }

    private string dbInsertEvent(DateTime start, DateTime end, string name, string resource,string color)
    {
        initData();

        string id = Guid.NewGuid().ToString();

        #region Simulation of database update

        DataRow dr = table.NewRow();
        dr["start"] = start;
        dr["end"] = end;
        dr["id"] = id;
        dr["name"] = name;
        dr["column"] = resource;
        dr["color"] = color;

        table.Rows.Add(dr);
        table.AcceptChanges();
        #endregion

        string strHQL;

        strHQL = string.Format(@"Insert Into t_schedule(id,start,""end"",""name"",""column"",usercode,username,allday,color) values ('{0}',cast('{1}' as timestamp without time zone),cast('{2}' as timestamp without time zone),'{3}','{4}','{5}','{6}','{7}','{8}')", id, start, end, name, resource,strUserCode,strUserName,'0',color);
        ShareClass.RunSqlCommand(strHQL);

        return id;
    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Modal.Close(this);
    }

    private void initData()
    {
        if (Session["AllFeatures"] == null)
        {
            Session["AllFeatures"] = DataGeneratorCalendar.GetData();
        }
        table = (DataTable)Session["AllFeatures"];
    }

}

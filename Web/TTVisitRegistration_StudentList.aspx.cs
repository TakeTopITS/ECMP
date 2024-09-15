using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTVisitRegistration_StudentList : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataVisitRegistrationBinder();

            DataYearMonthBinder();
        }
    }




    private void DataYearMonthBinder()
    {
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-2).Year.ToString(), DateTime.Now.AddYears(-2).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(-1).Year.ToString(), DateTime.Now.AddYears(-1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(1).Year.ToString(), DateTime.Now.AddYears(1).Year.ToString()));
        DDL_Year.Items.Add(new ListItem(DateTime.Now.AddYears(2).Year.ToString(), DateTime.Now.AddYears(2).Year.ToString()));
        DDL_Year.SelectedValue = DateTime.Now.Year.ToString();


        for (int i = 1; i <= 12; i++)
        {
            if (i < 10)
            {
                DDL_Month.Items.Add(new ListItem("0" + i, "0" + i));
            }
            else
            {
                DDL_Month.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
        string strCurrentMonth = DateTime.Now.Month.ToString();
        if (strCurrentMonth.Length > 1)
        {
            DDL_Month.SelectedValue = strCurrentMonth;
        }
        else
        {
            DDL_Month.SelectedValue = "0" + strCurrentMonth;
        }
    }


    private void DataVisitRegistrationBinder()
    {
        string strVisitRegistrationHQL = string.Format(@"select * from T_VisitRegistration_Student
                    where UserCode = '{0}' 
                    order by VisitStartTime desc ", strUserCode);

        DataTable dtVisitRegistration = ShareClass.GetDataSetFromSql(strVisitRegistrationHQL, "VisitRegistration").Tables[0];

        DataGrid1.DataSource = dtVisitRegistration;
        DataGrid1.DataBind();
    }







    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            DataGrid1.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        string cmdName = e.CommandName;
        if (cmdName == "edit")
        {
            //明细
            string cmdArges = e.CommandArgument.ToString();
            Response.Redirect("TTVisitRegistration_StudentEdit.aspx?ID=" + cmdArges);
        }
    }




    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strCompactHQL = LB_Sql.Text;
        DataTable dtCompact = ShareClass.GetDataSetFromSql(strCompactHQL, "Compact").Tables[0];

        DataGrid1.DataSource = dtCompact;
        DataGrid1.DataBind();

    }




    /// <summary>
    ///  重新加载列表
    /// </summary>
    protected void BT_RelaceLoad_Click(object sender, EventArgs e)
    {


        DataVisitRegistrationBinder();

    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strYearMonth = DDL_Year.SelectedValue + "-" + DDL_Month.SelectedValue;

        string strVisitRegistrationSQL = string.Format(@"select * from T_VisitRegistration_Student
                    where to_char( VisitStartTime, 'yyyy-mm-dd') like '%{0}%'
                    and UserCode = '{1}'", strYearMonth, strUserCode);
        DataTable dtVisitRegistration = ShareClass.GetDataSetFromSql(strVisitRegistrationSQL, "VisitRegistration").Tables[0];
        if (dtVisitRegistration != null && dtVisitRegistration.Rows.Count > 0)
        {

            //拜访记录

            Export3Excel(dtVisitRegistration, "document");


        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('没有找到相应的拜访记录！');", true);
            return;
        }
    }




    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();


        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "UTF-8";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=utf-8\"/>" + ostrwrite.ToString());
        Response.End();

    }


}
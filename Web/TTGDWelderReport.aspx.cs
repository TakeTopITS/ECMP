using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDWelderReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataBinder();

            LT_Time.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    private void DataBinder()
    {
        GDWeldersBLL gDWeldersBLL = new GDWeldersBLL();
        string strGDWeldersHQL = "from GDWelders as gDWelders";
        IList listGDWelders = gDWeldersBLL.GetAllGDWelderss(strGDWeldersHQL);
        rptList.DataSource = listGDWelders;
        rptList.DataBind();

        LT_Count.Text = listGDWelders.Count.ToString();
    }
}
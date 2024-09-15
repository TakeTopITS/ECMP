using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDSelectorPressureList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        string strPressureHQL = @"select * from T_GDPressure";
        DataTable dtPressure = ShareClass.GetDataSetFromSql(strPressureHQL, "Pressure").Tables[0];

        DG_List.DataSource = dtPressure;
        DG_List.DataBind();
    }
}
using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDSelectorWeldersList : System.Web.UI.Page
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
        string strWeldersHQL = @"select * from T_GDWelders";
        DataTable dtWelders = ShareClass.GetDataSetFromSql(strWeldersHQL, "Welders").Tables[0];

        DG_List.DataSource = dtWelders;
        DG_List.DataBind();
    }
}
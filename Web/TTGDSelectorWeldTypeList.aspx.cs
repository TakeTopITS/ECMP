using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDSelectorWeldTypeList : System.Web.UI.Page
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
        string strWeldTypeHQL = @"select * from T_GDWeldType";
        DataTable dtWeldType = ShareClass.GetDataSetFromSql(strWeldTypeHQL, "WeldType").Tables[0];

        DG_List.DataSource = dtWeldType;
        DG_List.DataBind();
    }
}
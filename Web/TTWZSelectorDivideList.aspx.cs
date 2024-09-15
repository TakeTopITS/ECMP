using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using System.Collections;

public partial class TTWZSelectorDivideList : System.Web.UI.Page
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
        WZDivideBLL wZDivideBLL = new WZDivideBLL();
        string strDivideHQL = "from WZDivide as wZDivide";
        IList listDivide = wZDivideBLL.GetAllWZDivides(strDivideHQL);

        DG_List.DataSource = listDivide;
        DG_List.DataBind();
    }
}
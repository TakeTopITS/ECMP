using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorStock : System.Web.UI.Page
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
        string strWZStockHQL = @"select s.*,p.UserName as SafekeepName,m.UserName as CheckerName from T_WZStock s
                                        left join T_ProjectMember p on s.Safekeep = p.UserCode
                                        left join T_ProjectMember m on s.Checker = m.UserCode
                                        order by s.StockCode";
        DataTable dtStock = ShareClass.GetDataSetFromSql(strWZStockHQL, "Stock").Tables[0];

        DG_List.DataSource = dtStock;
        DG_List.DataBind();
    }
}
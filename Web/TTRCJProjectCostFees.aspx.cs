using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTRCJProjectCostFees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //提取直接费用成本项
        string strUserCode = Session["UserCode"].ToString();

        //提取间接费用成本项 
    }
}
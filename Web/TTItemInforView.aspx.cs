using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Drawing;

using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTItemInforView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strItemCode = Request.QueryString["ItemCode"];

        if (Page.IsPostBack != true)
        {
            strHQL = "from Item as item where item.ItemCode = " + "'" + strItemCode + "'";

            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);

            Item item = (Item)lst[0];

            //this.Title = "物料：" + item.ItemCode + " " + item.ItemName + " 资料！";

            DataList1.DataSource = lst;
            DataList1.DataBind();
        }
    }
}

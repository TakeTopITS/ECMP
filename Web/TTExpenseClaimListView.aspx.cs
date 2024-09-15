using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
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

public partial class TTExpenseClaimListView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Title = "项目报销费用列表";

        string strUserCode = Session["UserCode"].ToString();
        string strRelatedID = Request.QueryString["RelatedID"];
        string strXMLFileURL = Request.QueryString["DetailXMLFile"];

        if (strXMLFileURL != null & strXMLFileURL != "")
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath(strXMLFileURL));

            DataGrid2.DataSource = ds;
            DataGrid2.DataBind();
        }
        else
        {
            string strHQL = "from ExpenseClaimDetail as expenseClaimDetail where expenseClaimDetail.ECID = " + strRelatedID;
            ExpenseClaimDetailBLL expenseClainDetailBLL = new ExpenseClaimDetailBLL();
            IList lst;

            lst = expenseClainDetailBLL.GetAllExpenseClaimDetails(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }
}

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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWZCompactListPrintDetail : System.Web.UI.Page
{
    string strCompactCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strCompactCode = Request.QueryString["CompactCode"];

        if (Page.IsPostBack != true)
        {
            DataCompactDetailBinder(strCompactCode);
        }
    }

    private void DataCompactDetailBinder(string strCompactCode)
    {
        string strWZCompactDetailHQL = string.Format(@"select d.*,o.ObjectName,o.Model,o.Grade,o.Criterion,p.PurchaseCode,l.PlanCode,s.UnitName from T_WZCompactDetail d
                            left join T_WZObject o on d.ObjectCode = o.ObjectCode 
                            left join T_WZPurchaseDetail p on d.PurchaseDetailID = p.ID
                            left join T_WZPickingPlanDetail l on d.PlanDetailID = l.ID
                            left join T_WZSpan s on o.Unit = s.ID
                            where d.CompactCode = '{0}'
                            order by o.DLCode,o.ObjectName,o.Model", strCompactCode);
        DataTable dtCompactDetail = ShareClass.GetDataSetFromSql(strWZCompactDetailHQL, "CompactDetail").Tables[0];

        DG_CompactDetail.DataSource = dtCompactDetail;
        DG_CompactDetail.DataBind();

        LB_CompactDetailSql.Text = strWZCompactDetailHQL;
    }

}

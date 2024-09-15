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

public partial class TTGoodsPurchaseOrderView : System.Web.UI.Page
{
    string strPOID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strPOID = Request.QueryString["POID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsPurchaseOrder(strPOID);

            string strWFID = GetRelatedWFID("物料采购", "物料", int.Parse(strPOID)).ToString();
            if (strWFID != "0")
            {
                LB_WorkFlowStatus.Text = GetStatusHomeNameByWorkflowStatus(strWFID);
            }
        }
    }

    protected void LoadGoodsPurchaseOrder(string strPOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        DataList18.DataSource = lst;
        DataList18.DataBind();

        LoadGoodsPurchaseOrderDetail(strPOID);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), goodsPurchaseOrder.GPOName.Trim(),200, 200);
    }

    //取得采购单号
    protected string getGoodsPurchaseOrderFormCode(string strPOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        return goodsPurchaseOrder.GPOName.Trim();
    }

    protected void LoadGoodsPurchaseOrderDetail(string strPOID)
    {
        string strHQL = "Select * from T_GoodsPurRecord where POID = " + strPOID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_TotalAmount.Text = GetGoodsPurchaseOrderTotalAmount(strPOID).ToString();
    }

    protected decimal GetGoodsPurchaseOrderTotalAmount(string strPOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        return goodsPurchaseOrder.Amount;
    }

    protected int GetRelatedWFID(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        if(lst.Count > 0)
        {
            WorkFlow workFlow = (WorkFlow)lst[0];
            return workFlow.WLID;
        }
        else
        {
            return 0;
        }
    }

    protected string GetStatusHomeNameByWorkflowStatus(string strWLID)
    {
        string strHQL;
        string strStatus;

        strHQL = "Select Status From T_WorkFlow Where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");

        strStatus = ds.Tables[0].Rows[0][0].ToString();

        return ShareClass.GetStatusHomeNameByWorkflowStatus(strStatus);
    }
}



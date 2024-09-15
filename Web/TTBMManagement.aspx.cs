using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMManagement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadBMAnnInvitationList();
        }
    }

    protected void LoadBMAnnInvitationList()
    {
        string strHQL;
        strHQL = "Select * From T_BMAnnInvitation Order By ID DESC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMAnnInvitation");
        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMAnnInvitation");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected string GetSupplierName(string strID)
    {
        string strHQL;
        IList lst;
        string result = "";
        //绑定招标计划
        strHQL = "From BMSupplierBid as bMSupplierBid Where bMSupplierBid.AnnInvitationID='" + strID + "' and bMSupplierBid.BidStatus='Y' ";
        BMSupplierBidBLL bMSupplierBidBLL = new BMSupplierBidBLL();
        lst = bMSupplierBidBLL.GetAllBMSupplierBids(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                BMSupplierBid bMSupplierBid = (BMSupplierBid)lst[i];
                strHQL = "From BMSupplierInfo as bMSupplierInfo Where bMSupplierInfo.ID='" + bMSupplierBid.SupplierCode.ToString() + "' ";
                BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
                lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
                if (lst.Count > 0 && lst != null)
                {
                    BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];
                    result += "(" + bMSupplierInfo.Code.Trim() + ")" + bMSupplierInfo.Name.Trim() + ";";
                }
            }
        }
        return result;
    }
}
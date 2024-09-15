using System; using System.Resources;
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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectGoodsPurchaseReport : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedType == "Project")
        {
            strRelatedType = "Project";
        }


        LB_ReportName.Text =  Resources.lang.LiaoPingCaiGou + Resources.lang.BaoBiao;

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.POID in (Select goodsPurchaseOrder.POID From GoodsPurchaseOrder as goodsPurchaseOrder Where goodsPurchaseOrder.RelatedType =  " + "'" +strRelatedType+ "'" + " and goodsPurchaseOrder.RelatedID = " + strRelatedID + ") Order by goodsPurRecord.ID DESC";
            //GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
            //lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);

            //DataGrid1.DataSource = lst;
            //DataGrid1.DataBind();

            //GoodsPurRecord goodsPurRecord = new GoodsPurRecord();

            //for (i = 0; i < lst.Count; i++)
            //{
            //    goodsPurRecord = (GoodsPurRecord)lst[i];
            //    deTotalNumber += goodsPurRecord.Number;
            //    deTotalAmount += goodsPurRecord.Number * goodsPurRecord.Price;
            //}

            //LB_TotalNumber.Text = deTotalNumber.ToString();
            //LB_TotalAmount.Text = deTotalAmount.ToString();

            //LB_Sql.Text = strHQL;
        }

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL, strStartTime, strEndTime;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strHQL = "from GoodsPurRecord as goodsPurRecord where to_char(goodsPurRecord.PurTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsPurRecord.PurTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and goodsPurRecord.POID in (Select goodsPurchaseOrder.POID From GoodsPurchaseOrder as goodsPurchaseOrder Where goodsPurchaseOrder.RelatedType =  " + "'" + strRelatedType + "'" + " and goodsPurchaseOrder.RelatedID = " + strRelatedID + ") Order by goodsPurRecord.ID DESC";
        GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
        lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        GoodsPurRecord goodsPurRecord = new GoodsPurRecord();

        for (i = 0; i < lst.Count; i++)
        {
            goodsPurRecord = (GoodsPurRecord)lst[i];
            deTotalNumber += goodsPurRecord.Number;
            deTotalAmount += goodsPurRecord.Number * goodsPurRecord.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
        IList lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }

}

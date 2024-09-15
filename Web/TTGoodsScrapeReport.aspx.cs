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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsScrapeReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strDepartString;

        //this.Title = "报废报表";

        LB_UserCode.Text = strUserCode;
        strUserName = GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料报废报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "  aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            //strHQL = "from GoodsScrape as goodsScrape where goodsScrape.ScrapeNumber > 0 ";
            //strHQL += " and goodsScrape.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            //strHQL += " Order by goodsScrape.ID DESC";
            //GoodsScrapeBLL goodsScrapeBLL = new GoodsScrapeBLL();
            //lst = goodsScrapeBLL.GetAllGoodsScrapes(strHQL);

            //DataGrid1.DataSource = lst;
            //DataGrid1.DataBind();

            //GoodsScrape goodsScrape = new GoodsScrape();

            //for (i = 0; i < lst.Count; i++)
            //{
            //    goodsScrape = (GoodsScrape)lst[i];

            //    deTotalAmount += goodsScrape.GetAmount;
            //}

            //LB_TotalNumber.Text = lst.Count.ToString();
            //LB_TotalAmount.Text = deTotalAmount.ToString();

            //LB_Sql.Text = strHQL;

        }

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        string strGoodsCode, strGoodsName, strOperatorName, strGoodsType, strStartTime, strEndTime;

        decimal deTotalAmount = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = TB_GoodsType.Text.Trim();
        strOperatorName = TB_OperatorName.Text.Trim();


        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strGoodsType = "%" + strGoodsType + "%";
        strOperatorName = "%" + strOperatorName + "%";


        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "from GoodsScrape as goodsScrape where ";
        strHQL += " goodsScrape.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and goodsScrape.GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and goodsScrape.Type Like " + "'" + strGoodsType + "'";
        strHQL += " and goodsScrape.OperatorName Like " + "'" + strOperatorName + "'";

        strHQL += " and to_char(goodsScrape.ScrapeTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsScrape.ScrapeTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and goodsScrape.ScrapeNumber > 0 ";
        strHQL += " and goodsScrape.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsScrape.ID DESC";
        GoodsScrapeBLL goodsScrapeBLL = new GoodsScrapeBLL();
        lst = goodsScrapeBLL.GetAllGoodsScrapes(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        GoodsScrape goodsScrape = new GoodsScrape();

        for (i = 0; i < lst.Count; i++)
        {
            goodsScrape = (GoodsScrape)lst[i];

            deTotalAmount += goodsScrape.GetAmount;
        }

        LB_TotalNumber.Text = lst.Count.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsCode, strGoodsName, strOperatorName, strGoodsType, strStartTime, strEndTime;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = TB_GoodsType.Text.Trim();
        strOperatorName = TB_OperatorName.Text.Trim();


        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strGoodsType = "%" + strGoodsType + "%";
        strOperatorName = "%" + strOperatorName + "%";


        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "Select * from T_GoodsScrape where ";
        strHQL += " GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and Type Like " + "'" + strGoodsType + "'";
        strHQL += " and OperatorName Like " + "'" + strOperatorName + "'";

        strHQL += " and to_char(ScrapeTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(ScrapeTime,'yyyymmdd') <= " + "'" + strEndTime + "'" + " and ScrapeNumber > 0 ";
        strHQL += " and OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsScrape");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料报废报表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
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

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

public partial class TTGoodsMantanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal  deTotalAmount = 0;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        //this.Title = "物料采购报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Textbool blVisible1 = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料维护报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        int i;
        decimal deTotalAmount = 0;

        string strGoodsCode, strGoodsName, strMTManName, strGoodsType, strStartTime, strEndTime;

        string strUserCode = LB_UserCode.Text.Trim();

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = TB_GoodsType.Text.Trim();
        strMTManName = TB_MTManName.Text.Trim();


        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strGoodsType = "%" + strGoodsType + "%";
        strMTManName = "%" + strMTManName + "%";

        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "from GoodsMTRecord as goodsMTRecord where ";
        strHQL += " goodsMTRecord.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and goodsMTRecord.GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and goodsMTRecord.MTManName Like " + "'" + strMTManName + "'";
        strHQL += " and to_char(goodsMTRecord.MTTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goodsMTRecord.MTTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and goodsMTRecord.MTManCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by goodsMTRecord.ID DESC";
        GoodsMTRecordBLL goodsMTRecordBLL = new GoodsMTRecordBLL();
        lst = goodsMTRecordBLL.GetAllGoodsMTRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();


        GoodsMTRecord goodsMTRecord = new GoodsMTRecord();

        for (i = 0; i < lst.Count; i++)
        {
            goodsMTRecord = (GoodsMTRecord)lst[i];

            deTotalAmount += goodsMTRecord.Cost;
        }


        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql.Text = strHQL;
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsCode, strGoodsName, strMTManName, strGoodsType, strStartTime, strEndTime;

        string strUserCode = LB_UserCode.Text.Trim();

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = TB_GoodsType.Text.Trim();
        strMTManName = TB_MTManName.Text.Trim();


        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strGoodsType = "%" + strGoodsType + "%";
        strMTManName = "%" + strMTManName + "%";

        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        strHQL = "Select * from T_GoodsMTRecord where ";
        strHQL += " GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and MTManName Like " + "'" + strMTManName + "'";
        strHQL += " and to_char(MTTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(MTTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and MTManCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsMTRecord");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料维护报表.xls");

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

}

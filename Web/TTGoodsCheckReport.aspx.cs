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

public partial class TTGoodsCheckReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "盘点报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料盘点报表", strUserCode);
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

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_WHName.Text = treeNode.Target.Trim();

            ShareClass.LoadWareHousePositions(TB_WHName.Text.Trim(),DL_WHPosition);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        DataGrid1.CurrentPageIndex = 0;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;


        string strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        string strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strPosition = TB_WHName.Text.Trim();

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strPosition = "%" + strPosition + "%";

        strHQL = "from Goods as goods where ";
        strHQL += " goods.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and goods.GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and goods.ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and goods.Spec Like " + "'" + strSpec + "'";
        strHQL += " and goods.Position like " + "'" + strPosition + "'";
        strHQL += " and goods.WHPosition  like " + "'%" + DL_WHPosition.SelectedValue.Trim()+ "%'";
        strHQL += " and goods.Status = '在用' ";
        strHQL += " and goods.Number > 0";
        strHQL += " and to_char(goods.BuyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(goods.BuyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and goods.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by goods.Number DESC,goods.ID DESC";
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();


        Goods goods = new Goods();

        for (i = 0; i < lst.Count; i++)
        {
            goods = (Goods)lst[i];
            deTotalNumber += goods.Number;
            deTotalAmount += goods.Number * goods.Price;
        }

        LB_TotalNumber.Text = deTotalNumber.ToString();
        LB_TotalAmount.Text = deTotalAmount.ToString();
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        DataGrid1.CurrentPageIndex = 0;
        decimal deTotalNumber = 0, deTotalAmount = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;


        string strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        string strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strPosition = TB_WHName.Text.Trim();

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strPosition = "%" + strPosition + "%";

        strHQL = "Select * from T_Goods where ";
        strHQL += " GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and Position like " + "'" + strPosition + "'";
        strHQL += " and Status = '在用' ";
        strHQL += " and Number > 0";
        strHQL += " and to_char(BuyTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(BuyTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and OwnerCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by Number DESC,ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataTable dtSaleOrder = ds.Tables[0];

        Export3Excel(dtSaleOrder, "物料盘点报表.xls");

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

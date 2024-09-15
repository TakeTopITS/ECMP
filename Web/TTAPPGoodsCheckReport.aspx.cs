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

using TakeTopCore;

public partial class TTAPPGoodsCheckReport : System.Web.UI.Page
{
    public SignModel signModel;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;
        decimal deTotalNumber = 0, deTotalAmount = 0;
        string strDepartString;

        string strUserName;
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        try
        {
            //扫码功能必须
            signModel = TakeTopCore.WXHelper.GetWXInfo(Request.Url.ToString());
			if(signModel!=null){
				if(signModel.appId==null){
					signModel.appId="";
				}
			}
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack != true)
        {
            ShareClass.LoadWareHouseListByAuthorityForDropDownList(strUserCode, DL_WareHouse);

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "from Goods as goods where goods.Status = '在用' ";
            strHQL += " and goods.Number > 0";
            strHQL += " and goods.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
            strHQL += " Order by goods.Number DESC,goods.ID DESC";

            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            Goods goods = new Goods();

            for (i = 0; i < lst.Count; i++)
            {
                goods = (Goods)lst[i];
                deTotalNumber += goods.Number;
                deTotalAmount += goods.Number * goods.Price;
            }

            LB_TotalNumber.Text = deTotalNumber.ToString();
            LB_TotalAmount.Text = deTotalAmount.ToString();

            //LB_PageIndex.Text = "1";
            //LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        }
    }

    protected void DL_WareHouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_Position.Text = DL_WareHouse.SelectedValue.Trim();
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

        string strGoodsCode = TB_GoodsSN.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();
        string strPosition = TB_Position.Text.Trim();

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
        strHQL += " and goods.Status = '在用' ";
        strHQL += " and goods.Number > 0";

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

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        //LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }
}

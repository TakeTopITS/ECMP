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


public partial class TTAPPGoodsSummaryReport : System.Web.UI.Page
{
    public SignModel signModel;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

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
            if (signModel != null)
            {
                if (signModel.appId == null)
                {
                    signModel.appId = "";
                }
            }
        }
        catch
        {
            signModel = new SignModel();
            signModel.appId = "";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "Select GoodsCode,GoodsName,Type,Spec,UnitName,TotalNumber,TotalAmount From V_GoodsCheckReport ";
            //strHQL += " Where TotalNumber > 0 ";
            strHQL += " where OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
            strHQL += " Order By GoodsCode";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckReport");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            //LB_PageIndex.Text = "1";
            //LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();


            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsType;

        DataGrid1.CurrentPageIndex = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strGoodsType = DL_Type.SelectedValue.Trim();
        strGoodsType = "%" + strGoodsType + "%";

        string strGoodsSN = TB_GoodsSN.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strGoodsSN = "%" + strGoodsSN + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select GoodsCode,GoodsName,Type,Spec,UnitName,TotalNumber,TotalAmount From V_GoodsCheckReport";
        strHQL += " Where Type Like " + "'" + strGoodsType + "'";
        strHQL += " and GoodsCode Like " + "'" + strGoodsSN + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and OwnerCode in  (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order By GoodsCode";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        //LB_PageIndex.Text = "1";
        //LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        //LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_GoodsCheckReport");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        //LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}

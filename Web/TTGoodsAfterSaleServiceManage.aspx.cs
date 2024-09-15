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


public partial class TTGoodsAfterSaleServiceManage : System.Web.UI.Page
{
    string strDepartString;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        string strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "售后管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadGoodsType();

            LB_GoodsOwner.Text = Resources.lang.SYLPLB;

            strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where char_length(SN) > 0 and ";
            strHQL += " OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strHQL += " Order by WarrantyEndTime DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            LB_PageIndex.Text = "1";
            LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = treeNode.Text.Trim();

            LB_GoodsOwner.Text = strDepartName + Resources.lang.DLPLB;

            strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where ";
            strHQL += " OperatorCode in (Select UserCode From T_ProjectMember Where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ")";
            strHQL += " Order by WarrantyEndTime DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            strHQL = "From Customer as customer Where customer.BelongDepartCode = " + "'" + strDepartCode + "'";
            CustomerBLL customerBll = new CustomerBLL();
            lst = customerBll.GetAllCustomers(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strStartTime, strEndTime;
        string strGoodsType;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strGoodsType = DL_GoodsType.SelectedValue.Trim();
        strGoodsType = "%" + strGoodsType + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");


        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where ";
        strHQL += " GoodsCode in (select GoodsCode From T_Goods Where Type Like " + "'" + strGoodsType + "'" + ")";
        strHQL += " and to_char(ShipTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(ShipTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and OperatorCode in (SelectUserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void BT_FindByGoodsSN_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsSN, strCustomerName;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strCustomerName = TB_CustomerName.Text.Trim();
        strCustomerName = "%" + strCustomerName + "%";

        strGoodsSN = TB_GoodsSN.Text.Trim();
        strGoodsSN = "%" + strGoodsSN + "%";


        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where ";
        strHQL += " GoodsSN Like " + "'" + strGoodsSN + "'" + " and CustomerName Like " + "'" + strCustomerName + "'";
        strHQL += " and OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;

        string strCustomerCode = ((Button)e.Item.FindControl("BT_CustomerCode")).Text.Trim();
        string strCustomerName = ((Button)e.Item.FindControl("BT_CustomerName")).Text.Trim();
        string strBelongDepartCode = ShareClass.GetDepartCodeFromCustomerCode(strCustomerCode);

        LB_GoodsOwner.Text = strCustomerName + Resources.lang.DLPLB;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where ";
        strHQL += " OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strHQL += " and ((RelatedType = 'GoodsSO' and RelatedID in (Select SOID From T_GoodsSaleOrder Where CustomerCode = " + "'" + strCustomerCode + "'" + "))";
        strHQL += " or (SourceType = 'GoodsSORecord' and SourceID in (Select ID From T_GoodsSaleRecord Where SOID in (Select SOID From T_GoodsSaleOrder Where CustomerCode = " + "'" + strCustomerCode + "'" + "))))";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
        DataGrid1.DataSource = ds;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGoodsSN = ((Button)e.Item.FindControl("BT_GoodsSN")).Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsAfterSaleTask(strGoodsSN);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            string strTaskID = ((Button)e.Item.FindControl("BT_TaskID")).Text.Trim();

            LoadGoodsApplicationDetail("AfterSale", strTaskID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    protected void LoadGoodsAfterSaleTask(string strGoodsSN)
    {
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectTask as projectTask where projectTask.GoodsSN = " + "'" + strGoodsSN + "'" + " Order by projectTask.TaskID DESC";
        ProjectTask projectTask = new ProjectTask();
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid10.DataSource = lst;
        DataGrid10.DataBind();

        LoadGoodsApplicationDetail("AfterSale", "0");
    }

    protected void LoadCustomerGoodsAfterService(string strCustomerCode)
    {
        string strHQL;

        strHQL = "Select * From V_GoodsListRelatedCustomerAfterSale  Where CustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Or FinalCustomerCode = " + "'" + strCustomerCode + "'";
        strHQL += " Order by WarrantyEndTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsListForCustomerAfterSale");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadGoodsApplicationDetail(string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where ";
        strHQL += " goodsApplicationDetail.AAID in (Select goodsApplication.AAID From GoodsApplication as goodsApplication Where goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID + ")";

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }


    protected void LoadGoodsType()
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        DL_GoodsType.DataSource = lst;
        DL_GoodsType.DataBind();
        DL_GoodsType.Items.Insert(0, new ListItem("--Select--", ""));
    }


}

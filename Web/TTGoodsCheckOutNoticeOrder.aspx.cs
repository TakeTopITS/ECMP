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

using TakeTopCore;


public partial class TTGoodsCheckOutNoticeOrder : System.Web.UI.Page
{
    string strUserCode, strUserName;

    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ApplyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_FinishTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_CheckOutTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from JNUnit as jnUnit Order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_GoodsType.DataSource = lst;
            DL_GoodsType.DataBind();
            DL_GoodsType.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.LoadCurrencyType(DL_CurrencyType);

            TB_ApplicantCode.Text = LB_UserCode.Text.Trim();
            LB_ApplicantName.Text = LB_UserName.Text.Trim();

            LoadGoodsSaleOrder(strUserCode);
            LoadGoodsProductionOrder(strUserCode);

            //物料领用
            ShareClass.LoadWFTemplate(strUserCode, "出货申请", DL_TemName);
            LoadGoodsCheckOutNoticeOrder(strUserCode, "SALE");

            ShareClass.InitialInvolvedProjectTree(TreeView2, strUserCode);
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            BT_Select.Visible = false;
            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "Project")
        {
            BT_Select.Visible = true;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();

            NB_RelatedID.Amount = int.Parse(strProjectID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strCOOID;
        IList lst;
        int intWLNumber = 0;

        if (e.CommandName != "Page")
        {
            strCOOID = e.Item.Cells[3].Text.Trim();

            intWLNumber = LoadRelatedWL("物料领用", "物料", int.Parse(strCOOID));
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_NewDetail.Visible = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
                BT_SubmitApply.Enabled = true;
            }

            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strCOOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strCOOID;
                GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
                lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);
                GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

                LB_COOID.Text = goodsCheckOutNoticeOrder.COOID.ToString();
                TB_COOName.Text = goodsCheckOutNoticeOrder.COOName.Trim();
                TB_ApplicantCode.Text = goodsCheckOutNoticeOrder.ApplicantCode.Trim();
                LB_ApplicantName.Text = goodsCheckOutNoticeOrder.ApplicantName.Trim();
                TB_ApplyReason.Text = goodsCheckOutNoticeOrder.ApplyReason.Trim();
                try
                {
                    DL_Type.SelectedValue = goodsCheckOutNoticeOrder.Type;
                }
                catch
                {
                }

                DLC_ApplyTime.Text = goodsCheckOutNoticeOrder.ApplyTime.ToString("yyyy-MM-dd");
                DLC_FinishTime.Text = goodsCheckOutNoticeOrder.FinishTime.ToString("yyyy-MM-dd");
                DL_Status.SelectedValue = goodsCheckOutNoticeOrder.Status.Trim();

                NB_TotalAmount.Amount = goodsCheckOutNoticeOrder.Amount;
                DL_CurrencyType.SelectedValue = goodsCheckOutNoticeOrder.CurrencyType;

                DL_RelatedType.SelectedValue = goodsCheckOutNoticeOrder.RelatedType.Trim();
                NB_RelatedID.Amount = goodsCheckOutNoticeOrder.RelatedID;

                LoadGoodsCheckOutNoticeOrderDetail(strCOOID);


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }


                if (e.CommandName == "Delete")
                {
                    strCOOID = LB_COOID.Text.Trim();

                    try
                    {
                        strHQL = "delete from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;
                        ShareClass.RunSqlCommand(strHQL);

                        strHQL = "delete from T_GoodsCheckOutNoticeOrderDetail where COOID = " + strCOOID;
                        ShareClass.RunSqlCommand(strHQL);

                        BT_SubmitApply.Enabled = false;

                        LoadGoodsCheckOutNoticeOrder(strUserCode, "SALE");

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                    }
                }
            }
        }
    }


    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_COOID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        string strNewCOOCode = ShareClass.GetCodeByRule("OutNoticeOrderCode", "OutNoticeOrderCode", "00");
        if (strNewCOOCode != "")
        {
            TB_COOName.Text = strNewCOOCode;
        }

        LoadGoodsCheckOutNoticeOrderDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strCOOID;

        strCOOID = LB_COOID.Text.Trim();

        if (strCOOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }
    }

    protected void AddMain()
    {
        string strCOOID, strCOOName, strApplyReason, strApplicantCode, strApplicantName;
        string strType, strStatus;
        DateTime dtApplyTime, dtFinishTime;

        string strUserCode = LB_UserCode.Text.Trim();

        strCOOName = TB_COOName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);
        strType = DL_Type.SelectedValue;
        strStatus = DL_Status.SelectedValue;

        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = new GoodsCheckOutNoticeOrder();

        goodsCheckOutNoticeOrder.COOName = strCOOName;
        goodsCheckOutNoticeOrder.ApplyReason = strApplyReason;
        goodsCheckOutNoticeOrder.ApplicantCode = strApplicantCode;
        goodsCheckOutNoticeOrder.ApplicantName = strApplicantName;
        goodsCheckOutNoticeOrder.ApplyTime = dtApplyTime;
        goodsCheckOutNoticeOrder.FinishTime = dtFinishTime;
        goodsCheckOutNoticeOrder.Type = strType;

        goodsCheckOutNoticeOrder.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        goodsCheckOutNoticeOrder.Amount = NB_TotalAmount.Amount;

        goodsCheckOutNoticeOrder.Status = strStatus;
        goodsCheckOutNoticeOrder.RelatedType = DL_RelatedType.SelectedValue.Trim();
        goodsCheckOutNoticeOrder.RelatedID = int.Parse(NB_RelatedID.Amount.ToString());

        try
        {
            goodsCheckOutNoticeOrderBLL.AddGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder);
            strCOOID = ShareClass.GetMyCreatedMaxGoodsCheckOutNoticeOrderID(strUserCode);
            LB_COOID.Text = strCOOID;

            string strNewCOOCode = ShareClass.GetCodeByRule("OutNoticeOrderCode", "OutNoticeOrderCode", strCOOID);
            if (strNewCOOCode != "")
            {
                TB_COOName.Text = strNewCOOCode;
                string strHQL = "Update T_GoodsCheckOutNoticeOrder Set COOName = " + "'" + strNewCOOCode + "'" + " Where COOID = " + strCOOID;
                ShareClass.RunSqlCommand(strHQL);
            }


            BT_SubmitApply.Enabled = true;


            LoadGoodsCheckOutNoticeOrder(strUserCode, "SALE");
            LoadRelatedWL("物料领用", "物料", int.Parse(strCOOID));


            DL_Status.SelectedValue = "新建";


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateMain()
    {
        string strCOOID, strCOOName, strApplyReason, strApplicantCode, strApplicantName;
        string strType, strStatus;
        DateTime dtApplyTime, dtFinishTime;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strCOOID = LB_COOID.Text.Trim();
        strCOOName = TB_COOName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);
        strType = DL_Type.SelectedValue;
        strStatus = DL_Status.SelectedValue;

        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strCOOID;
        lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);
        GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

        goodsCheckOutNoticeOrder.COOName = strCOOName;
        goodsCheckOutNoticeOrder.ApplyReason = strApplyReason;
        goodsCheckOutNoticeOrder.ApplicantCode = strApplicantCode;
        goodsCheckOutNoticeOrder.ApplicantName = strApplicantName;
        goodsCheckOutNoticeOrder.ApplyTime = dtApplyTime;
        goodsCheckOutNoticeOrder.FinishTime = dtFinishTime;
        goodsCheckOutNoticeOrder.Type = strType;

        goodsCheckOutNoticeOrder.Amount = NB_TotalAmount.Amount;
        goodsCheckOutNoticeOrder.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

        goodsCheckOutNoticeOrder.Status = strStatus;
        goodsCheckOutNoticeOrder.RelatedType = DL_RelatedType.SelectedValue.Trim();
        goodsCheckOutNoticeOrder.RelatedID = int.Parse(NB_RelatedID.Amount.ToString());

        try
        {
            goodsCheckOutNoticeOrderBLL.UpdateGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder, int.Parse(strCOOID));
            LoadGoodsCheckOutNoticeOrder(strUserCode, "SALE");


            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strCOOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select COOID as DetailCOOID, * from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strCOOID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }
    

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            int intWLNumber;
            string strStatus = DL_Status.SelectedValue.Trim();
            string strCOOID = LB_COOID.Text.Trim();


            intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strCOOID);
            if (intWLNumber > 0)
            {
            }
            else
            {
            }

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                string strHQL = " from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.ID = " + strID;
                GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
                IList lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);
                GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = (GoodsCheckOutNoticeOrderDetail)lst[0];

                LB_DetailID.Text = goodsCheckOutNoticeOrderDetail.ID.ToString();
                TB_GoodsCode.Text = goodsCheckOutNoticeOrderDetail.GoodsCode;
                TB_GoodsName.Text = goodsCheckOutNoticeOrderDetail.GoodsName.Trim();
                try
                {
                    DL_GoodsType.SelectedValue = goodsCheckOutNoticeOrderDetail.Type;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }

                TB_Spec.Text = goodsCheckOutNoticeOrderDetail.Spec.Trim();
                NB_Number.Amount = goodsCheckOutNoticeOrderDetail.Number;
                NB_Price.Amount = goodsCheckOutNoticeOrderDetail.Price;

                TB_Brand.Text = goodsCheckOutNoticeOrderDetail.Brand;

                DL_Unit.SelectedValue = goodsCheckOutNoticeOrderDetail.Unit;
                TB_ModelNumber.Text = goodsCheckOutNoticeOrderDetail.ModelNumber.Trim();

                TB_CustomerModelNumber.Text = goodsCheckOutNoticeOrderDetail.CustomerModelNumber; ;
                DL_FinishStatus.SelectedValue = goodsCheckOutNoticeOrderDetail.FinishStatus;
                TB_DeliveryAddress.Text = goodsCheckOutNoticeOrderDetail.DeliveryAddress;
                DLC_CheckOutTime.Text = goodsCheckOutNoticeOrderDetail.CheckOutTime.ToString("yyyy-MM-dd");

                NB_BoxNumber.Amount = goodsCheckOutNoticeOrderDetail.BoxNumber;

                TB_BarCode.Text = goodsCheckOutNoticeOrderDetail.BarCode;

                DL_PDName.SelectedValue = goodsCheckOutNoticeOrderDetail.PDID.ToString();

                TB_Comment.Text = goodsCheckOutNoticeOrderDetail.Comment;

                DL_RecordSourceType.SelectedValue = goodsCheckOutNoticeOrderDetail.SourceType.Trim();
                NB_RecordSourceID.Amount = goodsCheckOutNoticeOrderDetail.SourceID;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strHQL;
                IList lst;

                intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strCOOID);
                if (intWLNumber > 0)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }

                string strGoodsName = TB_COOName.Text.Trim();
                string strSpec = TB_Spec.Text.Trim();
                decimal deNumber = NB_Number.Amount;
                string strUnit = DL_Unit.SelectedValue;
                string strSourceType = DL_RecordSourceType.SelectedValue.Trim();
                int intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

                GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
                strHQL = "from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.ID = " + strID;
                lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);
                GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = (GoodsCheckOutNoticeOrderDetail)lst[0];

                try
                {
                    goodsCheckOutNoticeOrderDetailBLL.DeleteGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail);

                    NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strCOOID);
                    UpdateGoodsCheckOutNoticeOrderOrderAmount(strCOOID, NB_TotalAmount.Amount);

                    //更新销售订单的已通知出库量
                    UpdateGoodsSOOrSANumber(strSourceType, intSourceID.ToString());

                    LoadGoodsCheckOutNoticeOrderDetail(strCOOID);

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strCOOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select COOID as DetailCOOID, * from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strCOOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_GoodsCheckOutNoticeOrderDetail where COOID = " + strCOOID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    protected void DL_SourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSourceType;

        strSourceType = DL_SourceType.SelectedValue.Trim();

        if (strSourceType == "Other")
        {
            NB_SourceID.Amount = 0;
        }

        if (strSourceType == "GoodsSO")
        {
            TabContainer2.ActiveTabIndex = 2;

            BT_SelectSO.Visible = true;
        }
        else
        {
            BT_SelectSO.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;
            string strGoodsCode;

            strGoodsCode = ((Button)(e.Item.FindControl("BT_GoodsCode"))).Text.Trim();

            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From Goods as goods where goods.GoodsCode = " + "'" + strGoodsCode + "'";
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            Goods goods = (Goods)lst[0];

            TB_GoodsCode.Text = goods.GoodsCode.Trim();
            TB_GoodsName.Text = goods.GoodsName.Trim();

            try
            {
                DL_GoodsType.SelectedValue = goods.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = goods.ModelNumber.Trim();
            TB_Spec.Text = goods.Spec.Trim();

            DL_Unit.SelectedValue = goods.UnitName;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strSOID;

        if (e.CommandName != "Page")
        {
            strSOID = ((Button)e.Item.FindControl("BT_SOID")).Text.Trim();

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_SOID.Text = strSOID;

            NB_SourceID.Amount = int.Parse(strSOID);

            LoadGoodsSaleOrderDetail(strSOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void LoadGoodsSaleOrderDetail(string strSOID)
    {
        LB_GoodsOwner.Text = Resources.lang.XiaoShouDan + ":" + strSOID + Resources.lang.MingXi;

        if (strSOID != "")
        {
            string strHQL = "Select * from T_GoodsSaleRecord where SOID = " + strSOID + " Order by ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

            DataGrid7.DataSource = ds;
            DataGrid7.DataBind();

            LB_Sql7.Text = strHQL;
        }
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql3.Text;

        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsCode, strGoodsName, strGoodsType, strSpec, strModelNumber;

        TabContainer2.ActiveTabIndex = 0;
        DataGrid3.CurrentPageIndex = 0;

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = DL_GoodsType.SelectedValue.Trim();
        strSpec = TB_Spec.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strGoodsType = "%" + strGoodsType + "%";
        strSpec = "%" + strSpec + "%";
        strModelNumber = "%" + strModelNumber + "%";

        strHQL = "Select GoodsCode,GoodsName,Type,ModelNumber,Spec,Manufacturer,UnitName,Price, COALESCE(Sum(Number),0) as TotalNumber From T_Goods";
        strHQL += " Where GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and Type Like " + "'" + strGoodsType + "'";
        strHQL += " and ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and Spec Like " + "'" + strSpec + "'";
        strHQL += " Group By  GoodsCode,GoodsName,Type,ModelNumber,Spec,Manufacturer,UnitName,Price";
        strHQL += " Order By COALESCE(Sum(Number),0) Desc";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Sql3.Text = strHQL;

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";

        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        NB_Number.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid9.Items.Count; i++)
            {
                DataGrid9.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Item as item where ItemCode = " + "'" + strItemCode + "'";
            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);

            if (lst.Count > 0)
            {
                Item item = (Item)lst[0];

                TB_GoodsCode.Text = item.ItemCode;
                TB_GoodsName.Text = item.ItemName;
                try
                {
                    DL_GoodsType.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }
                DL_Unit.SelectedValue = item.Unit;
                TB_ModelNumber.Text = item.ModelNumber.Trim();
                TB_Spec.Text = item.Specification;
                TB_Brand.Text = item.Brand;

                NB_Price.Amount = item.SalePrice;
            }


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsSaleRecord as goodsSaleRecord where goodsSaleRecord.ID = " + strID;
            GoodsSaleRecordBLL goodsSaleRecordBLL = new GoodsSaleRecordBLL();
            lst = goodsSaleRecordBLL.GetAllGoodsSaleRecords(strHQL);

            if (lst.Count > 0)
            {
                try
                {
                    GoodsSaleRecord goodsSaleRecord = (GoodsSaleRecord)lst[0];

                    TB_GoodsCode.Text = goodsSaleRecord.GoodsCode;
                    TB_GoodsName.Text = goodsSaleRecord.GoodsName.Trim();

                    try
                    {
                        DL_GoodsType.SelectedValue = goodsSaleRecord.Type;
                    }
                    catch
                    {
                        DL_GoodsType.SelectedValue = "";
                    }

                    TB_ModelNumber.Text = goodsSaleRecord.ModelNumber.Trim();
                    TB_Spec.Text = goodsSaleRecord.Spec.Trim();
                    TB_Brand.Text = goodsSaleRecord.Brand;

                    NB_Number.Amount = goodsSaleRecord.Number - goodsSaleRecord.CheckOutNumber;
                    NB_Price.Amount = goodsSaleRecord.Price;
                    DL_Unit.SelectedValue = goodsSaleRecord.Unit;

                    LB_SourceRelatedID.Text = goodsSaleRecord.SOID.ToString();
                    DL_RecordSourceType.SelectedValue = "GoodsSORecord";
                    NB_RecordSourceID.Amount = goodsSaleRecord.ID;
                }
                catch
                {

                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strCOOID;

        strCOOID = LB_COOID.Text.Trim();

        if (strCOOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strCOOID = LB_COOID.Text.Trim();

        int intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strCOOID);
        if (intWLNumber > 0 & strToDoWLID == null)
        {
            BT_SubmitApply.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCZGLDGZLJLBNSCJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

            return;
        }
        else
        {
            BT_SubmitApply.Enabled = true;
        }

        string strDetailID;

        strDetailID = LB_ID.Text.Trim();

        if (strDetailID == "")
        {
            AddDetail();
        }
        else
        {
            UpdateDetail();
        }
    }


    protected void AddDetail()
    {
        string strID;
        string strCOOID = LB_COOID.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();
        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strGoodsType = DL_GoodsType.SelectedValue.Trim();
        string strSpec = TB_Spec.Text.Trim();
        decimal deNumber = NB_Number.Amount;
        decimal dePrice = NB_Price.Amount;
        string strUnit = DL_Unit.SelectedValue;
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        int intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());
        string strCustomerModelNumber = TB_CustomerModelNumber.Text.Trim();
        string strBarCode = TB_BarCode.Text.Trim();
        string strFinishStatus = DL_FinishStatus.SelectedValue.Trim();
        string strDeliveryAddress = TB_DeliveryAddress.Text.Trim();
        DateTime dtCheckOutTime = DateTime.Parse(DLC_CheckOutTime.Text);

        string strPDID, strPDName;
        try
        {
            strPDID = DL_PDName.SelectedValue;
            strPDName = DL_PDName.SelectedItem.Text.Trim();
        }
        catch
        {
            strPDID = "0";
            strPDName = "";
        }

        string strComment = TB_Comment.Text.Trim();

        GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
        GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = new GoodsCheckOutNoticeOrderDetail();

        goodsCheckOutNoticeOrderDetail.COOID = int.Parse(strCOOID);
        goodsCheckOutNoticeOrderDetail.GoodsCode = strGoodsCode;
        goodsCheckOutNoticeOrderDetail.GoodsName = strGoodsName;
        goodsCheckOutNoticeOrderDetail.Type = strGoodsType;
        goodsCheckOutNoticeOrderDetail.ModelNumber = strModelNumber;
        goodsCheckOutNoticeOrderDetail.CustomerModelNumber = strCustomerModelNumber;
        goodsCheckOutNoticeOrderDetail.BarCode = strBarCode;
        goodsCheckOutNoticeOrderDetail.Spec = strSpec;
        goodsCheckOutNoticeOrderDetail.Brand = TB_Brand.Text;

        goodsCheckOutNoticeOrderDetail.Number = deNumber;
        goodsCheckOutNoticeOrderDetail.BoxNumber = NB_BoxNumber.Amount;

        goodsCheckOutNoticeOrderDetail.Price = dePrice;
        goodsCheckOutNoticeOrderDetail.Amount = deNumber * dePrice;
        goodsCheckOutNoticeOrderDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

        goodsCheckOutNoticeOrderDetail.Unit = strUnit;
        goodsCheckOutNoticeOrderDetail.CheckOutNumber = 0;
        goodsCheckOutNoticeOrderDetail.CheckOutTime = dtCheckOutTime;

        goodsCheckOutNoticeOrderDetail.FinishStatus = strFinishStatus;
        goodsCheckOutNoticeOrderDetail.DeliveryAddress = strDeliveryAddress;
        goodsCheckOutNoticeOrderDetail.Comment = strComment;

        goodsCheckOutNoticeOrderDetail.PDID = int.Parse(strPDID);
        goodsCheckOutNoticeOrderDetail.PDName = strPDName;

        goodsCheckOutNoticeOrderDetail.SourceType = strSourceType;
        goodsCheckOutNoticeOrderDetail.SourceID = intSourceID;


        try
        {
            goodsCheckOutNoticeOrderDetailBLL.AddGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail);

            strID = ShareClass.GetMyCreatedMaxGoodsCheckOutNoticeOrderDetailID(strCOOID);
            LB_DetailID.Text = strID;

            NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strCOOID);
            UpdateGoodsCheckOutNoticeOrderOrderAmount(strCOOID, NB_TotalAmount.Amount);

            //更新销售订单的已通知出库量
            UpdateGoodsSOOrSANumber(strSourceType, intSourceID.ToString());

            LoadGoodsCheckOutNoticeOrderDetail(strCOOID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strCOOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select COOID as DetailCOOID, * from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strCOOID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_GoodsCheckOutNoticeOrderDetail where COOID = " + strCOOID;
                    ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void UpdateDetail()
    {
        string strHQL;
        IList lst;

        string strID = LB_DetailID.Text;
        string strCOOID = LB_COOID.Text.Trim();
        string strStatus = DL_Status.SelectedValue.Trim();
        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strGoodsType = DL_GoodsType.SelectedValue.Trim();
        string strSpec = TB_Spec.Text.Trim();
        decimal deNumber = NB_Number.Amount;
        decimal dePrice = NB_Price.Amount;
        string strUnit = DL_Unit.SelectedValue;
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        int intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());
        string strCustomerModelNumber = TB_CustomerModelNumber.Text.Trim();
        string strBarCode = TB_BarCode.Text.Trim();
        string strFinishStatus = DL_FinishStatus.SelectedValue.Trim();
        string strDeliveryAddress = TB_DeliveryAddress.Text.Trim();
        DateTime dtCheckOutTime = DateTime.Parse(DLC_CheckOutTime.Text);
        string strComment = TB_Comment.Text.Trim();

        string strPDID, strPDName;
        try
        {
            strPDID = DL_PDName.SelectedValue;
            strPDName = DL_PDName.SelectedItem.Text.Trim();
        }
        catch
        {
            strPDID = "0";
            strPDName = "";
        }


        GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
        strHQL = "from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.ID = " + strID;
        lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);
        GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = (GoodsCheckOutNoticeOrderDetail)lst[0];

        goodsCheckOutNoticeOrderDetail.COOID = int.Parse(strCOOID);
        goodsCheckOutNoticeOrderDetail.GoodsCode = strGoodsCode;
        goodsCheckOutNoticeOrderDetail.GoodsName = strGoodsName;
        goodsCheckOutNoticeOrderDetail.Type = strGoodsType;
        goodsCheckOutNoticeOrderDetail.ModelNumber = strModelNumber;
        goodsCheckOutNoticeOrderDetail.CustomerModelNumber = strCustomerModelNumber;
        goodsCheckOutNoticeOrderDetail.BarCode = strBarCode;
        goodsCheckOutNoticeOrderDetail.Spec = strSpec;
        goodsCheckOutNoticeOrderDetail.Brand = TB_Brand.Text;

        goodsCheckOutNoticeOrderDetail.Number = deNumber;
        goodsCheckOutNoticeOrderDetail.BoxNumber = NB_BoxNumber.Amount;
        goodsCheckOutNoticeOrderDetail.Price = dePrice;
        goodsCheckOutNoticeOrderDetail.Amount = deNumber * dePrice;
        goodsCheckOutNoticeOrderDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

        goodsCheckOutNoticeOrderDetail.Unit = strUnit;
        goodsCheckOutNoticeOrderDetail.CheckOutNumber = 0;

        goodsCheckOutNoticeOrderDetail.FinishStatus = strFinishStatus;
        goodsCheckOutNoticeOrderDetail.DeliveryAddress = strDeliveryAddress;
        goodsCheckOutNoticeOrderDetail.CheckOutTime = dtCheckOutTime;
        goodsCheckOutNoticeOrderDetail.Comment = strComment;

        goodsCheckOutNoticeOrderDetail.PDID = int.Parse(strPDID);
        goodsCheckOutNoticeOrderDetail.PDName = strPDName;

        goodsCheckOutNoticeOrderDetail.SourceType = strSourceType;
        goodsCheckOutNoticeOrderDetail.SourceID = intSourceID;

        try
        {
            goodsCheckOutNoticeOrderDetailBLL.UpdateGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail, int.Parse(strID));

            NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strCOOID);
            UpdateGoodsCheckOutNoticeOrderOrderAmount(strCOOID, NB_TotalAmount.Amount);

            //更新销售订单的已通知出库量
            UpdateGoodsSOOrSANumber(strSourceType, intSourceID.ToString());

            LoadGoodsCheckOutNoticeOrderDetail(strCOOID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strCOOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select COOID as DetailCOOID, * from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strCOOID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_GoodsCheckOutNoticeOrderDetail where COOID = " + strCOOID;
                    ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }
    

    protected decimal SumGoodsAppliationOrderAmount(string strAOID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.COOID = " + strAOID;
        GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
        lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);

        GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = new GoodsCheckOutNoticeOrderDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            goodsCheckOutNoticeOrderDetail = (GoodsCheckOutNoticeOrderDetail)lst[i];
            deAmount += goodsCheckOutNoticeOrderDetail.Number * goodsCheckOutNoticeOrderDetail.Price;
        }

        return deAmount;
    }

    protected void UpdateGoodsCheckOutNoticeOrderOrderAmount(string strAOID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strAOID;
        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);

        GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

        goodsCheckOutNoticeOrder.Amount = deAmount;

        try
        {
            goodsCheckOutNoticeOrderBLL.UpdateGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected string SubmitApply()
    {
        string strHQL;
        string strCOOName, strApplyReason, strCmdText;

        string strCOOID, strXMLFileName, strXMLFile2;
        IList lst;

        string strWLID, strTemName, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strCOOID = LB_COOID.Text.Trim();
        strCOOName = TB_COOName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();

        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
            return "0";
        }

        XMLProcess xmlProcess = new XMLProcess();
        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strCOOID;
        lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);
        GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

        goodsCheckOutNoticeOrder.Status = "处理中";

        try
        {
            goodsCheckOutNoticeOrderBLL.UpdateGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder, int.Parse(strCOOID));

            strXMLFileName = "物料领用" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = strCOOName;
            workFlow.WLType = "物料领用";
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
            workFlow.Description = strApplyReason;
            workFlow.XMLFile = strXMLFile2;
            workFlow.RelatedType = "物料";
            workFlow.RelatedID = goodsCheckOutNoticeOrder.COOID;
            workFlow.DIYNextStep = "Yes"; workFlow.IsPlanMainWorkflow = "NO";

            if (CB_SMS.Checked == true)
            {
                workFlow.ReceiveSMS = "Yes";
            }
            else
            {
                workFlow.ReceiveSMS = "No";
            }

            if (CB_Mail.Checked == true)
            {
                workFlow.ReceiveEMail = "Yes";
            }
            else
            {
                workFlow.ReceiveEMail = "No";
            }

            try
            {
                workFlowBLL.AddWorkFlow(workFlow);

                strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

                strCmdText = "select COOID as DetailCOOID,* from T_GoodsCheckOutNoticeOrder where COOID = " + strCOOID;

                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "T_GoodsCheckOutNoticeOrder", strXMLFile2);

                LoadRelatedWL("物料领用", "物料", int.Parse(strCOOID));
                
                DL_Status.SelectedValue = "处理中";

                BT_SubmitApply.Enabled = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPLYGZLSCCG + "')", true);
            }
            catch
            {
                strWLID = "0";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPLYGZLSSCSB + "')", true);
            }
        }
        catch
        {
            strWLID = "0";

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();
    }

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '物料领用'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strCOOID, strStatus;
        strCOOID = LB_COOID.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strCOOID != "")
        {
            strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strCOOID;
            GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
            lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);

            GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

            goodsCheckOutNoticeOrder.Status = strStatus;

            try
            {
                goodsCheckOutNoticeOrderBLL.UpdateGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder, int.Parse(strCOOID));
            }
            catch
            {
            }
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        IList lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    //更新销售订单的已通知出库量
    protected void UpdateGoodsSOOrSANumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "GoodsSORecord")
        {
            strHQL = "Select  COALESCE(Sum(Number),0) From T_GoodsCheckOutNoticeOrderDetail Where SourceType = 'GoodsSORecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckOutNoticeOrderDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_GoodsSaleRecord Set NoticeOutNumber = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void LoadGoodsCheckOutNoticeOrder(string strUserCode, string strType)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where  (goodsCheckOutNoticeOrder.ApplicantCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsCheckOutNoticeOrder.ApplicantCode  in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
        strHQL += " or goodsCheckOutNoticeOrder.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";

        strHQL += " and goodsCheckOutNoticeOrder.Type = " + "'" + strType + "'";
        strHQL += " Order by goodsCheckOutNoticeOrder.COOID DESC";


        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strWLBusinessID;
        }


        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadGoodsCheckOutNoticeOrderDetail(string strCOOID)
    {
        string strHQL;
        IList lst;


        //strHQL = "from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.COOID = " + strCOOID;
        //GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
        //lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);

        strHQL = "Select * From T_GoodsCheckOutNoticeOrderDetail Where COOID = " + strCOOID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckOutNoticeOrderDetail");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadGoodsSaleOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where ( goodsSaleOrder.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsSaleOrder.OperatorCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
        strHQL += " or goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or goodsSaleOrder.SalesCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected int LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        return lst.Count;
    }

    protected void LoadGoodsProductionOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsProductionOrder as goodsProductionOrder  Order by goodsProductionOrder.PDID DESC";
        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DL_PDName.DataSource = lst;
        DL_PDName.DataBind();

        DL_PDName.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    protected int GetRelatedWorkFlowNumber(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }

    protected string GetWorkFlowStatus(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        WorkFlow workFlow = (WorkFlow)lst[0];

        return workFlow.Status.Trim();
    }


}

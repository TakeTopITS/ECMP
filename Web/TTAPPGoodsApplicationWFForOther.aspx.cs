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


public partial class TTAPPGoodsApplicationWFForOther : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strHQL;
        IList lst;

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];
        if (strRelatedType == null)
        {
            strRelatedType = "Other";
            strRelatedID = "0";
        }

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ApplyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_FinishTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

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

            //物料领用
            ShareClass.LoadWFTemplate(strUserCode, "物料领用", DL_TemName);
            LoadGoodsApplication(strUserCode, strRelatedType, strRelatedID);
        }
    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            string strAAID;
            IList lst;
            int intWLNumber = 0;

            if (e.CommandName != "Page")
            {
                strAAID = e.Item.Cells[3].Text.Trim();

                intWLNumber = LoadRelatedWL("物料领用", "物料", int.Parse(strAAID));
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

                //从流程中打开的业务单
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
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

                    strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAAID;
                    GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
                    lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);
                    GoodsApplication goodsApplication = (GoodsApplication)lst[0];

                    LB_AAID.Text = goodsApplication.AAID.ToString();
                    TB_GAAName.Text = goodsApplication.GAAName.Trim();
                    TB_ApplicantCode.Text = goodsApplication.ApplicantCode.Trim();
                    LB_ApplicantName.Text = goodsApplication.ApplicantName.Trim();
                    TB_ApplyReason.Text = goodsApplication.ApplyReason.Trim();

                    DLC_ApplyTime.Text = goodsApplication.ApplyTime.ToString("yyyy-MM-dd");
                    DLC_FinishTime.Text = goodsApplication.FinishTime.ToString("yyyy-MM-dd");
                    DL_Status.SelectedValue = goodsApplication.Status.Trim();

                    NB_TotalAmount.Amount = goodsApplication.Amount;
                    DL_CurrencyType.SelectedValue = goodsApplication.CurrencyType;

                    LoadGoodsApplicationDetail(strAAID);

                    if (e.CommandName == "Update")
                    {
                        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    }

                    if (e.CommandName == "Assign")
                    {
                        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                    }
                }

                if (e.CommandName == "Delete")
                {
                    intWLNumber = LoadRelatedWL("物料领用", "物料", int.Parse(strAAID));
                    if (intWLNumber > 0)
                    {
                        return;
                    }

                    string strUserCode = LB_UserCode.Text.Trim();
                    strHQL = "delete from T_GoodsApplication where AAID = " + strAAID;

                    try
                    {
                        ShareClass.RunSqlCommand(strHQL);

                        LoadGoodsApplication(strUserCode, strRelatedType, strRelatedID);

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
        LB_AAID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        string strNewAOCode = ShareClass.GetCodeByRule("ApplicationOrderCode", "ApplicationOrderCode", "00");
        if (strNewAOCode != "")
        {
            TB_GAAName.Text = strNewAOCode;
        }

        LoadGoodsApplicationDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strAAID;

        strAAID = LB_AAID.Text.Trim();

        if (strAAID == "")
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
        string strAAID, strAAName, strApplyReason, strApplicantCode, strApplicantName;
        string strStatus;
        DateTime dtApplyTime, dtFinishTime;

        string strUserCode = LB_UserCode.Text.Trim();

        strAAName = TB_GAAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);

        strStatus = DL_Status.SelectedValue;

        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        GoodsApplication goodsApplication = new GoodsApplication();

        goodsApplication.GAAName = strAAName;
        goodsApplication.ApplyReason = strApplyReason;
        goodsApplication.ApplicantCode = strApplicantCode;
        goodsApplication.ApplicantName = strApplicantName;
        goodsApplication.ApplyTime = dtApplyTime;
        goodsApplication.FinishTime = dtFinishTime;
        goodsApplication.Type = strRelatedType;

        goodsApplication.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        goodsApplication.Amount = NB_TotalAmount.Amount;

        goodsApplication.Status = strStatus;
        goodsApplication.RelatedType = strRelatedType;
        goodsApplication.RelatedID = int.Parse(strRelatedID);

        try
        {
            goodsApplicationBLL.AddGoodsApplication(goodsApplication);
            strAAID = ShareClass.GetMyCreatedMaxGoodsApplicationID(strUserCode);
            LB_AAID.Text = strAAID;

            string strNewAOCode = ShareClass.GetCodeByRule("ApplicationOrderCode", "ApplicationOrderCode", strAAID);
            if (strNewAOCode != "")
            {
                TB_GAAName.Text = strNewAOCode;
                string strHQL = "Update T_GoodsApplication Set GAAName = " + "'" + strNewAOCode + "'" + " Where AAID = " + strAAID;
                ShareClass.RunSqlCommand(strHQL);
            }

            BT_SubmitApply.Enabled = true;


            LoadGoodsApplication(strUserCode, strRelatedType, strRelatedID);
            LoadRelatedWL("物料领用", "物料", int.Parse(strAAID));


            DL_Status.SelectedValue = "新建";


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void UpdateMain()
    {
        string strAAID, strAAName, strApplyReason, strApplicantCode, strApplicantName;
        string strType, strStatus;
        DateTime dtApplyTime, dtFinishTime;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strAAID = LB_AAID.Text.Trim();
        strAAName = TB_GAAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        strApplicantName = ShareClass.GetUserName(TB_ApplicantCode.Text.Trim());
        dtApplyTime = DateTime.Parse(DLC_ApplyTime.Text);
        dtFinishTime = DateTime.Parse(DLC_FinishTime.Text);
        strType = strRelatedType;
        strStatus = DL_Status.SelectedValue;

        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAAID;
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);
        GoodsApplication goodsApplication = (GoodsApplication)lst[0];

        goodsApplication.GAAName = strAAName;
        goodsApplication.ApplyReason = strApplyReason;
        goodsApplication.ApplicantCode = strApplicantCode;
        goodsApplication.ApplicantName = strApplicantName;
        goodsApplication.ApplyTime = dtApplyTime;
        goodsApplication.FinishTime = dtFinishTime;
        goodsApplication.Type = strType;

        goodsApplication.Amount = NB_TotalAmount.Amount;
        goodsApplication.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

        goodsApplication.Status = strStatus;
        goodsApplication.RelatedType = strRelatedType;
        goodsApplication.RelatedID = int.Parse(strRelatedID);

        try
        {
            goodsApplicationBLL.UpdateGoodsApplication(goodsApplication, int.Parse(strAAID));
            LoadGoodsApplication(strUserCode, strRelatedType, strRelatedID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select AAID as OtherAAID,AAID as DetailAAID, * from T_GoodsApplication where AAID = " + strAAID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strAAID);
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
        }
    }

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;
    }

    protected void DL_SourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSourceType;

        strSourceType = DL_SourceType.SelectedValue.Trim();

        if (strSourceType == "Other")
        {
            NB_SourceID.Amount = 0;
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID;

            strID = e.Item.Cells[0].Text.Trim();

            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            TB_GoodsCode.Text = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            Goods goods = ShareClass.GetGoods(TB_GoodsCode.Text);

            TB_GoodsName.Text = goods.GoodsName;

            TB_ModelNumber.Text = goods.ModelNumber;
            TB_Spec.Text = goods.Spec;
            TB_Brand.Text = goods.Manufacturer;

            DL_GoodsType.SelectedValue = goods.Type;
            NB_Number.Amount = goods.Number;
            DL_Unit.SelectedValue = goods.UnitName;
            NB_Price.Amount = goods.Price;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
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

        string strGoodsCode, strGoodsName, strSpec, strModelNumber, strGoodsType;


        DataGrid3.CurrentPageIndex = 0;

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strGoodsType = DL_GoodsType.SelectedValue.Trim();
        strSpec = TB_Spec.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();

        strGoodsType = "%" + strGoodsType + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
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
        strHQL += " and item.SmallType Like " + "'" + strGoodsType + "'";
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

        DL_GoodsType.SelectedValue = "";
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

                DL_Unit.SelectedValue = item.Unit;

                TB_ModelNumber.Text = item.ModelNumber.Trim();
                TB_Spec.Text = item.Specification.Trim();
                TB_Brand.Text = item.Brand;

                DL_GoodsType.SelectedValue = item.SmallType;
                NB_Price.Amount = item.SalePrice;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strStatus = DL_Status.SelectedValue.Trim();
            string strAAID = LB_AAID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strAAID);
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

            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
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

                string strHQL = " from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;

                GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
                IList lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);
                GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];

                LB_DetailID.Text = goodsApplicationDetail.ID.ToString();
                TB_GoodsCode.Text = goodsApplicationDetail.GoodsCode;
                TB_GoodsName.Text = goodsApplicationDetail.GoodsName.Trim();
                try
                {
                    DL_GoodsType.SelectedValue = goodsApplicationDetail.Type;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }


                TB_Spec.Text = goodsApplicationDetail.Spec.Trim();
                TB_Brand.Text = goodsApplicationDetail.Brand;

                NB_Number.Amount = goodsApplicationDetail.Number;
                NB_Price.Amount = goodsApplicationDetail.Price;

                DL_Unit.SelectedValue = goodsApplicationDetail.Unit;
                TB_ModelNumber.Text = goodsApplicationDetail.ModelNumber.Trim();

                DL_RecordSourceType.SelectedValue = goodsApplicationDetail.SourceType.Trim();
                NB_RecordSourceID.Amount = goodsApplicationDetail.SourceID;


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strAAID);

                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    return;
                }

                string strHQL;
                IList lst;

                string strGoodsName = TB_GAAName.Text.Trim();
                string strSpec = TB_Spec.Text.Trim();
                decimal deNumber = NB_Number.Amount;
                string strUnit = DL_Unit.SelectedValue;

                GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
                strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;
                lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);
                GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];


                try
                {
                    goodsApplicationDetailBLL.DeleteGoodsApplicationDetail(goodsApplicationDetail);

                    NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strAAID);
                    UpdateGoodsApplicationOrderAmount(strAAID, NB_TotalAmount.Amount);


                    LoadGoodsApplicationDetail(strAAID);

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AAID as OtherAAID,AAID as DetailAAID, * from T_GoodsApplication where AAID = " + strAAID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strAAID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_GoodsApplicationDetail where AAID = " + strAAID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);


                }
                catch
                {

                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }


    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_DetailID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strAAID;

        strAAID = LB_AAID.Text.Trim();

        if (strAAID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strAAID = LB_AAID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber("物料领用", "物料", strAAID);
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

        strDetailID = LB_DetailID.Text.Trim();

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
        string strAAID = LB_AAID.Text.Trim();
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

        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        GoodsApplicationDetail goodsApplicationDetail = new GoodsApplicationDetail();

        goodsApplicationDetail.AAID = int.Parse(strAAID);
        goodsApplicationDetail.GoodsCode = strGoodsCode;
        goodsApplicationDetail.GoodsName = strGoodsName;
        goodsApplicationDetail.Type = strGoodsType;
        goodsApplicationDetail.ModelNumber = strModelNumber;
        goodsApplicationDetail.Spec = strSpec;
        goodsApplicationDetail.Brand = TB_Brand.Text;

        goodsApplicationDetail.Number = deNumber;
        goodsApplicationDetail.Price = dePrice;
        goodsApplicationDetail.Amount = deNumber * dePrice;
        goodsApplicationDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

        goodsApplicationDetail.Unit = strUnit;
        goodsApplicationDetail.CheckOutNumber = 0;

        goodsApplicationDetail.SourceType = strSourceType;
        goodsApplicationDetail.SourceID = intSourceID;

        try
        {
            goodsApplicationDetailBLL.AddGoodsApplicationDetail(goodsApplicationDetail);

            strID = ShareClass.GetMyCreatedMaxGoodsApplicationDetailID(strAAID);
            LB_DetailID.Text = strID;


            NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strAAID);
            UpdateGoodsApplicationOrderAmount(strAAID, NB_TotalAmount.Amount);

            //BT_Update.Enabled = true;
            //BT_Delete.Enabled = true;

            LoadGoodsApplicationDetail(strAAID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select AAID as OtherAAID,AAID as DetailAAID, * from T_GoodsApplication where AAID = " + strAAID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strAAID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_GoodsApplicationDetail where AAID = " + strAAID;
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

        string strID = LB_DetailID.Text.Trim();
        string strAAID = LB_AAID.Text.Trim();
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


        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);
        GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];

        goodsApplicationDetail.AAID = int.Parse(strAAID);
        goodsApplicationDetail.GoodsCode = strGoodsCode;
        goodsApplicationDetail.GoodsName = strGoodsName;
        goodsApplicationDetail.Type = strGoodsType;
        goodsApplicationDetail.ModelNumber = strModelNumber;

        goodsApplicationDetail.Spec = strSpec;
        goodsApplicationDetail.Brand = TB_Brand.Text;

        goodsApplicationDetail.Number = deNumber;
        goodsApplicationDetail.Price = dePrice;
        goodsApplicationDetail.Amount = deNumber * dePrice;
        goodsApplicationDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        goodsApplicationDetail.Unit = strUnit;
        goodsApplicationDetail.SourceType = strSourceType;
        goodsApplicationDetail.SourceID = intSourceID;

        try
        {
            goodsApplicationDetailBLL.UpdateGoodsApplicationDetail(goodsApplicationDetail, int.Parse(strID));

            NB_TotalAmount.Amount = SumGoodsAppliationOrderAmount(strAAID);
            UpdateGoodsApplicationOrderAmount(strAAID, NB_TotalAmount.Amount);

            LoadGoodsApplicationDetail(strAAID);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料领用", "物料", strAAID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                strCmdText = "select AAID as OtherAAID,AAID as DetailAAID, * from T_GoodsApplication where AAID = " + strAAID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料领用", "物料", strAAID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_GoodsApplicationDetail where AAID = " + strAAID;
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

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.AAID = " + strAOID;
        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        GoodsApplicationDetail goodsApplicationDetail = new GoodsApplicationDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            goodsApplicationDetail = (GoodsApplicationDetail)lst[i];
            deAmount += goodsApplicationDetail.Number * goodsApplicationDetail.Price;
        }

        return deAmount;
    }

    protected void UpdateGoodsApplicationOrderAmount(string strAOID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAOID;
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        GoodsApplication goodsApplication = (GoodsApplication)lst[0];

        goodsApplication.Amount = deAmount;

        try
        {
            goodsApplicationBLL.UpdateGoodsApplication(goodsApplication, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected string SubmitApply()
    {
        string strHQL;
        string strAAName, strApplyReason, strCmdText;

        string strAAID, strXMLFileName, strXMLFile2;
        IList lst;

        string strWLID, strTemName, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strAAID = LB_AAID.Text.Trim();
        strAAName = TB_GAAName.Text.Trim();
        strApplyReason = TB_ApplyReason.Text.Trim();

        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
            return "0";
        }

        XMLProcess xmlProcess = new XMLProcess();
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAAID;
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);
        GoodsApplication goodsApplication = (GoodsApplication)lst[0];

        goodsApplication.Status = "处理中";

        try
        {
            goodsApplicationBLL.UpdateGoodsApplication(goodsApplication, int.Parse(strAAID));

            strXMLFileName = "物料领用" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = strAAName;
            workFlow.WLType = "物料领用";
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode);
            workFlow.Description = strApplyReason;
            workFlow.XMLFile = strXMLFile2;
            workFlow.RelatedType = "物料";
            workFlow.RelatedID = goodsApplication.AAID;
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

                strCmdText = "select AAID as DetailAAID,AAID as OtherAAID, * from T_GoodsApplication where AAID = " + strAAID;
                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "T_GoodsApplication", strXMLFile2);

                LoadRelatedWL("物料领用", "物料", int.Parse(strAAID));

                //BT_New.Enabled = false;
                //BT_Update.Enabled = false;
                //BT_Delete.Enabled = false;
                //BT_NewAA.Enabled = true;
                //BT_UpdateAA.Enabled = false;
                //BT_DeleteAA.Enabled = false;
                //DL_Status.SelectedValue = "处理中";

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

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location)", true);
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
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAAID, strStatus;
        strAAID = LB_AAID.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strAAID != "")
        {
            strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAAID;
            GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
            lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

            GoodsApplication goodsApplication = (GoodsApplication)lst[0];

            goodsApplication.Status = strStatus;

            try
            {
                goodsApplicationBLL.UpdateGoodsApplication(goodsApplication, int.Parse(strAAID));
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

        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        IList lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadGoodsApplication(string strApplicantCode, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode = " + "'" + strApplicantCode + "'";
        strHQL += " and goodsApplication.RelatedType = " + "'" + strRelatedType + "'" + " and goodsApplication.RelatedID = " + strRelatedID;
        strHQL += " Order by goodsApplication.AAID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strWLBusinessID;
        }
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadGoodsApplicationDetail(string strAAID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.AAID = " + strAAID;
        GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
        lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
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

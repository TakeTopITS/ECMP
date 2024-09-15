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

public partial class TTProjectMaterialPaymentApplicant : System.Web.UI.Page
{
    string strProjectID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID= Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        strProjectID = Request.QueryString["ProjectID"];
        if (strProjectID == null)
        {
            strProjectID = GetProjectMaterialPaymentApplicantProjectID(strWLBusinessID);
        }

        strUserCode = Session["UserCode"].ToString();
        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_OpenDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.LoadWFTemplate(strUserCode, DL_WFType.SelectedValue.Trim(), DL_TemName);

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            TB_CreatorCode.Text = strUserCode;
            LB_CreatorName.Text = strUserName;

            LoadProjectMaterialPaymentApplicant(strUserCode);

            LoadItemMainPlan(strUserCode);

            NB_RelatedID.Amount = int.Parse(strProjectID);

            //取得此项目关联的入库单
            LoadGoodsCheckInOrder(LB_UserCode.Text.Trim(), strProjectID, TB_PartA.Text.Trim());

            LoadProjectRelatedItem(strProjectID);

            ShareClass.InitialInvolvedProjectTree(TreeView2, strUserCode);
        }
    }

    protected void LoadGoodsCheckInOrder(string strUserCode, string strRelatedID, string strVendorName)
    {
        string strHQL;
        IList lst;

        string strPayStatus;

        strHQL = "From GoodsCheckInOrder as goodsCheckInOrder where (goodsCheckInOrder.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsCheckInOrder.CreatorCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and RelatedType = 'Project' and RelatedID = " + strRelatedID;
        strHQL += " and VendorName Like " + "'%" + strVendorName + "%'";
        strHQL += " Order By goodsCheckInOrder.PayStatus ASC";
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql3.Text = strHQL;

        //GoodsCheckInOrder goodsCheckInOrder;

        //for (int i = 0; i < lst.Count; i++)
        //{
        //    goodsCheckInOrder = (GoodsCheckInOrder)lst[i];

        //    //是否清帐
        //    try
        //    {
        //        strPayStatus = goodsCheckInOrder.PayStatus.Trim();
        //    }
        //    catch
        //    {
        //        strPayStatus = "NO";
        //    }

        //    try
        //    {

        //        if (strPayStatus == "YES")
        //        {
        //            ((CheckBox)DataGrid3.Items[i].FindControl("CB_ClearPay")).Checked = true;
        //        }
        //        else
        //        {
        //            ((CheckBox)DataGrid3.Items[i].FindControl("CB_ClearPay")).Checked = false;
        //        }
        //    }
        //    catch
        //    {
        //    }
        //}
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();
            LB_ProjectID.Text = strProjectID;

            NB_RelatedID.Amount = int.Parse(strProjectID);
            LoadProjectRelatedItem(strProjectID);

            //取得此项目关联的入库单
            LoadGoodsCheckInOrder(LB_UserCode.Text.Trim(), strProjectID, TB_PartA.Text.Trim());
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strCIOID;

            strCIOID = ((Button)e.Item.FindControl("BT_CheckInID")).Text.Trim();
            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LB_CheckInOrderID.Text = strCIOID;

            //取得入库单明细
            LoadGoodsCheckInOrderDetail(strCIOID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void DataGrid3_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            CheckBox cbClearPay = (CheckBox)e.Item.FindControl("CB_ClearPay");
            cbClearPay.CheckedChanged += new System.EventHandler(this.cbSelectClearPayChanged);
        }
    }

    //创建事件
    protected void cbSelectClearPayChanged(object sender, System.EventArgs e)
    {
        CheckBox cb = (CheckBox)sender;
        DataGridItem li = (DataGridItem)cb.Parent.Parent;

        string strHQL;

        string strCheckInID = li.Cells[1].Text;

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }

        li.ForeColor = Color.Red;

        LB_CheckInOrderID.Text = strCheckInID;

        //取得入库单明细
        LoadGoodsCheckInOrderDetail(strCheckInID);

        if (cb.Checked == true)
        {
            strHQL = "Update T_GoodsCheckInOrder Set PayStatus = 'YES' Where CheckInID = " + strCheckInID;
        }
        else
        {
            strHQL = "Update T_GoodsCheckInOrder Set PayStatus = 'NO'  Where CheckInID = " + strCheckInID;
        }

        ShareClass.RunSqlCommand(strHQL);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        string strHQL, strHQL2;
        IList lst, lst2;

        string strPayStatus, strID;

        strHQL = LB_Sql3.Text;

        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        //复选框判断
        GoodsCheckInOrder goodsCheckInOrder;
        int j = DataGrid3.Items.Count;

        for (int i = 0; i < j; i++)
        {
            strID = DataGrid3.Items[i].Cells[1].Text;

            strHQL2 = "From GoodsCheckOrder as goodsCheckOrder Where goodsCheckOrder.ID = " + strID;
            lst2 = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
            goodsCheckInOrder = (GoodsCheckInOrder)lst2[i];

            //是否清帐
            try
            {
                strPayStatus = goodsCheckInOrder.PayStatus.Trim();
            }
            catch
            {
                strPayStatus = "NO";
            }

            if (strPayStatus == "YES")
            {
                ((CheckBox)DataGrid3.Items[i].FindControl("CB_ClearPay")).Checked = true;
            }
            else
            {
                ((CheckBox)DataGrid3.Items[i].FindControl("CB_ClearPay")).Checked = false;
            }
        }
    }

    protected void LoadGoodsCheckInOrderDetail(string strCheckInID)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.CheckInID = " + strCheckInID;
            strHQL += " Order by goodsCheckInOrderDetail.Number DESC,goodsCheckInOrderDetail.ID DESC";
            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();
        }
        catch
        {
        }
    }

    protected void LoadGoodsCheckInOrderDetailByID(string strID)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + strID;
            strHQL += " Order by goodsCheckInOrderDetail.Number DESC,goodsCheckInOrderDetail.ID DESC";
            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();
        }
        catch
        {

        }
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode;

        strUserCode = LB_UserCode.Text;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + "'" + strID + "'";

            for (int i = 0; i < DataGrid15.Items.Count; i++)
            {
                DataGrid15.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
            GoodsCheckInOrderDetail goodsCheckInOrderDetail = (GoodsCheckInOrderDetail)lst[0];

            //LB_ID.Text = goodsCheckInOrderDetail.ID.ToString();
            TB_GoodsCode.Text = goodsCheckInOrderDetail.GoodsCode.Trim();

            TB_GoodsCode.Text = goodsCheckInOrderDetail.GoodsCode;
            TB_GoodsName.Text = goodsCheckInOrderDetail.GoodsName;

            NB_Number.Amount = SummaryNoApplyNumber("CheckInOrderRecord", strID);

            NB_Price.Amount = goodsCheckInOrderDetail.Price;
            DL_Unit.SelectedValue = goodsCheckInOrderDetail.UnitName;
            TB_Spec.Text = goodsCheckInOrderDetail.Spec;

            NB_Price.Amount = goodsCheckInOrderDetail.Price;

            DL_Type.SelectedValue = goodsCheckInOrderDetail.Type;
            TB_ModelNumber.Text = goodsCheckInOrderDetail.ModelNumber;

            TB_Manufacturer.Text = goodsCheckInOrderDetail.Manufacturer;

            NB_Amount.Amount = NB_Number.Amount * NB_Price.Amount;

            DL_RecordSourceType.SelectedValue = "CheckInOrderRecord";
            NB_RecordSourceID.Amount = int.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
        }
    }

    //计算出未申请付款数
    protected decimal SummaryNoApplyNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deAleadyNumber, deNumber;

        try
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_ProjectMaterialPaymentApplicantDetail Where SourceType= 'CheckInOrderRecord' and SourceID = " + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deAleadyNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deAleadyNumber = 0;
            }

            strHQL = "Select Number From T_GoodsCheckInOrderDetail Where ID = " + strSourceID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

            deNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

            return deNumber - deAleadyNumber;
        }
        catch
        {
            return 0;
        }
    }

    //计算出未申请付款额
    protected decimal SummaryNoApplyAmount(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deAleadyAmount, deAmount;

        try
        {
            strHQL = "Select COALESCE(Sum(Amount),0) From T_ProjectMaterialPaymentApplicantDetail Where SourceType= 'CheckInOrderRecord' and SourceID = " + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deAleadyAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deAleadyAmount = 0;
            }

            strHQL = "Select Amount From T_GoodsCheckInOrderDetail Where ID = " + strSourceID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

            deAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

            return deAmount - deAleadyAmount;
        }
        catch
        {
            return 0;
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            BT_SelectProject.Visible = false;

            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "Project")
        {
            BT_SelectProject.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_SelectProject.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_PaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_PaymentMethod.Text = DL_PaymentMethod.SelectedValue;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_Attachment_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_Attachment.Text += DL_Attachment.SelectedValue.Trim() + ",";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
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

            NB_RelatedID.Amount = int.Parse(strSOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strAOID;
            IList lst;
            int intWLNumber;

            strAOID = e.Item.Cells[3].Text.Trim();

            intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where projectMaterialPaymentApplicant.AOID = " + strAOID;
            ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
            lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);
            ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];


            if (e.CommandName == "Update" | e.CommandName == "Assign" | e.CommandName == "INVOICE")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;


                LB_AOID.Text = projectMaterialPaymentApplicant.AOID.ToString();
                TB_AOName.Text = projectMaterialPaymentApplicant.AOName.Trim();
                DLC_CreateTime.Text = projectMaterialPaymentApplicant.CreateTime.ToString("yyyy-MM-dd");

                NB_CurrentTotalPaymentAmount.Amount = projectMaterialPaymentApplicant.CurrentTotalPaymentAmount;
                DL_CurrencyType.SelectedValue = projectMaterialPaymentApplicant.CurrencyType;

                TB_BankCode.Text = projectMaterialPaymentApplicant.BankCode;
                TB_BankName.Text = projectMaterialPaymentApplicant.BankName;

                TB_ContractPayCondition.Text = projectMaterialPaymentApplicant.ContractPayCondition;

                TB_Attachment.Text = projectMaterialPaymentApplicant.Attachment;

                DL_AOStatus.SelectedValue = projectMaterialPaymentApplicant.Status.Trim();
                TB_CreatorCode.Text = projectMaterialPaymentApplicant.UserCode.Trim();
                LB_CreatorName.Text = projectMaterialPaymentApplicant.UserName.Trim();

                TB_PartA.Text = projectMaterialPaymentApplicant.PartA.Trim();
                TB_PartAContactInformation.Text = projectMaterialPaymentApplicant.PartAContactInformation;

                TB_PaymentMethod.Text = projectMaterialPaymentApplicant.PaymentMethod.Trim();

                NB_RelatedID.Amount = projectMaterialPaymentApplicant.ProjectID;

                LoadProjectMaterialPaymentApplicantDetail(strAOID);

                LoadVendorRelatedGoodsListByName(projectMaterialPaymentApplicant.PartA.Trim());

                TB_WLName.Text = Resources.lang.XiangMuWuZhiCaiGouShengQing + projectMaterialPaymentApplicant.AOName.Trim() + Resources.lang.FuKuan;

                LoadRelatedWL(DL_WFType.SelectedValue.Trim(), "项目", projectMaterialPaymentApplicant.AOID);

                if (DL_RelatedType.SelectedValue == "Project")
                {
                    LoadProjectRelatedItem(NB_RelatedID.Amount.ToString());
                    LB_ProjectID.Text = NB_RelatedID.Amount.ToString();
                }


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }

                if (e.CommandName == "INVOICE")
                {
                    LoadConstractRelatedInvoice(strAOID);
                    CountInvoiceAmount(strAOID);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                if (intWLNumber > 0 | projectMaterialPaymentApplicant.Status == "已记账")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCSQDYTJSPHYJC + "')", true);
                    return;
                }

                strUserCode = LB_UserCode.Text.Trim();

                strHQL = "Delete From T_ProjectMaterialPaymentApplicant Where AOID = " + strAOID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From T_ProjectMaterialPaymentApplicantDetail Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadProjectMaterialPaymentApplicant(strUserCode);
                    LoadProjectMaterialPaymentApplicantDetail(strAOID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
                }
            }
        }
    }

    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_AOID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        LoadProjectMaterialPaymentApplicantDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strAOID;

        strAOID = LB_AOID.Text.Trim();

        if (strAOID == "")
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
        string strAOID, strAOName, strUserCode, strUserName, strCurrencyType, strPartA, strPartAContactInformation, strPaymentMethod;
        DateTime dtCreateTime;
        decimal deCurrentTotalPaymentAmount;
        string strStatus;

        strAOName = TB_AOName.Text.Trim();
        strUserCode = TB_CreatorCode.Text.Trim();
        strUserName = LB_CreatorName.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartAContactInformation = TB_PartAContactInformation.Text.Trim();

        strPaymentMethod = TB_PaymentMethod.Text.Trim();

        dtCreateTime = DateTime.Parse(DLC_CreateTime.Text);

        deCurrentTotalPaymentAmount = NB_CurrentTotalPaymentAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();

        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = new ProjectMaterialPaymentApplicant();

        if (GetProjectMaterialPaymentApplicantCodeCount("0", strAOName) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTDMQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        projectMaterialPaymentApplicant.AOName = strAOName;
        projectMaterialPaymentApplicant.UserCode = strUserCode;
        try
        {
            projectMaterialPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }
        projectMaterialPaymentApplicant.UserCode = strUserCode;
        projectMaterialPaymentApplicant.UserName = strUserName;
        projectMaterialPaymentApplicant.CreateTime = dtCreateTime;

        projectMaterialPaymentApplicant.CurrentTotalPaymentAmount = deCurrentTotalPaymentAmount;
        projectMaterialPaymentApplicant.CurrencyType = strCurrencyType;
        projectMaterialPaymentApplicant.PartA = strPartA;
        projectMaterialPaymentApplicant.PartAContactInformation = strPartAContactInformation;
        projectMaterialPaymentApplicant.CompanyName = strPartA;

        projectMaterialPaymentApplicant.PaymentMethod = strPaymentMethod;

        projectMaterialPaymentApplicant.AleadyTotalInvoice = NB_AleadyTotalInvoice.Amount;
        projectMaterialPaymentApplicant.ShouldTotalInvoice = NB_ShouldTotalInvoice.Amount;

        projectMaterialPaymentApplicant.ContractPayCondition = TB_ContractPayCondition.Text;

        projectMaterialPaymentApplicant.Attachment = TB_Attachment.Text;

        projectMaterialPaymentApplicant.BankCode = TB_BankCode.Text.Trim();
        projectMaterialPaymentApplicant.BankName = TB_BankName.Text.Trim();
        projectMaterialPaymentApplicant.Status = "新建";

        projectMaterialPaymentApplicant.ProjectID = int.Parse(NB_RelatedID.Amount.ToString());
        projectMaterialPaymentApplicant.ProjectName = ShareClass.GetProjectName(NB_RelatedID.Amount.ToString());


        try
        {
            projectMaterialPaymentApplicantBLL.AddProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant);

            strAOID = ShareClass.GetMyCreatedMaxProjectMaterialPaymentApplicantID(strUserCode);
            LB_AOID.Text = strAOID;

            //自动产生单号
            string strNewPOCode = ShareClass.GetCodeByRule("PayApplyOrderCode", "PayApplyOrderCode", strAOID);
            if (strNewPOCode != "")
            {
                TB_AOName.Text = strNewPOCode;
                string strHQL = "Update T_ProjectMaterialPaymentApplicant Set AOName = " + "'" + strNewPOCode + "'" + " Where AOID = " + strAOID;
                ShareClass.RunSqlCommand(strHQL);
            }

            NB_CurrentTotalPaymentAmount.Amount = 0;

            TB_WLName.Text = Resources.lang.FeiYong + strAOName + Resources.lang.ShenQing;

            BT_SubmitApply.Enabled = true;

            LoadProjectMaterialPaymentApplicant(strUserCode);
            LoadProjectMaterialPaymentApplicantDetail(strAOID);

            //LoadRelatedConstract(strAOID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCCKNCGMCZD50GHZHBZZSZD100GHZGDJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

        }
    }

    protected int GetProjectMaterialPaymentApplicantCodeCount(string strAOID, string strGoodsPOCode)
    {
        string strHQL;

        if (strGoodsPOCode != "")
        {
            strHQL = "Select * From T_ProjectMaterialPaymentApplicant Where AOID <> " + strAOID + " and AOName =  " + "'" + strGoodsPOCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicant");

            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        string strAOID, strAOName, strUserCode, strUserName, strCurrencyType, strPartA, strPartAContactInformation, strPaymentMethod;
        DateTime dtCreateTime;
        decimal deCurrentTotalPaymentAmount;
        string strStatus;

        strAOID = LB_AOID.Text;
        strAOName = TB_AOName.Text.Trim();
        strUserCode = TB_CreatorCode.Text.Trim();
        strUserName = LB_CreatorName.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartAContactInformation = TB_PartAContactInformation.Text.Trim();

        strPaymentMethod = TB_PaymentMethod.Text.Trim();

        dtCreateTime = DateTime.Parse(DLC_CreateTime.Text);

        deCurrentTotalPaymentAmount = NB_CurrentTotalPaymentAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();


        if (GetProjectMaterialPaymentApplicantCodeCount(strAOID, strAOName) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTDMQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where projectMaterialPaymentApplicant.AOID = " + strAOID;
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];

        projectMaterialPaymentApplicant.AOName = strAOName;

        projectMaterialPaymentApplicant.UserCode = strUserCode;
        try
        {
            projectMaterialPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        projectMaterialPaymentApplicant.AOName = strAOName;
        projectMaterialPaymentApplicant.UserCode = strUserCode;
        try
        {
            projectMaterialPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }
        projectMaterialPaymentApplicant.UserCode = strUserCode;
        projectMaterialPaymentApplicant.UserName = strUserName;
        projectMaterialPaymentApplicant.CreateTime = dtCreateTime;

        //projectMaterialPaymentApplicant.CurrentTotalPaymentAmount = deCurrentTotalPaymentAmount;
        projectMaterialPaymentApplicant.CurrencyType = strCurrencyType;
        projectMaterialPaymentApplicant.PartA = strPartA;
        projectMaterialPaymentApplicant.PartAContactInformation = strPartAContactInformation;
        projectMaterialPaymentApplicant.CompanyName = strPartA;

        projectMaterialPaymentApplicant.PaymentMethod = strPaymentMethod;

        projectMaterialPaymentApplicant.AleadyTotalInvoice = NB_AleadyTotalInvoice.Amount;
        projectMaterialPaymentApplicant.ShouldTotalInvoice = NB_ShouldTotalInvoice.Amount;

        projectMaterialPaymentApplicant.ContractPayCondition = TB_ContractPayCondition.Text;

        projectMaterialPaymentApplicant.Attachment = TB_Attachment.Text;

        projectMaterialPaymentApplicant.BankCode = TB_BankCode.Text.Trim();
        projectMaterialPaymentApplicant.BankName = TB_BankName.Text.Trim();
        projectMaterialPaymentApplicant.Status = "新建";

        projectMaterialPaymentApplicant.ProjectID = int.Parse(NB_RelatedID.Amount.ToString());
        projectMaterialPaymentApplicant.ProjectName = ShareClass.GetProjectName(NB_RelatedID.Amount.ToString());

        try
        {
            projectMaterialPaymentApplicantBLL.UpdateProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant, int.Parse(strAOID));
            LoadProjectMaterialPaymentApplicant(strUserCode);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select AOID as DetailAOID, * from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        ProjectMaterialPaymentApplicantBLL puchaseOrderBLL = new ProjectMaterialPaymentApplicantBLL();
        IList lst = puchaseOrderBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorName, strVendorPhone, strClearingForm, strContacts, strFax;
        decimal deTaxRate;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(Tel1,''),TaxRate,ClearingForm ,ContactName,Fax,VendorName From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(PhoneNum,''),1,'' ,TechnicalDirector,Fax,Name From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strVendorPhone = ds.Tables[0].Rows[0][0].ToString();
            deTaxRate = decimal.Parse(ds.Tables[0].Rows[0][1].ToString());
            strClearingForm = ds.Tables[0].Rows[0][2].ToString();
            strContacts = ds.Tables[0].Rows[0][3].ToString();
            strFax = ds.Tables[0].Rows[0][4].ToString();
            strVendorName = ds.Tables[0].Rows[0][5].ToString().Trim();

            TB_PartA.Text = DL_VendorList.SelectedItem.Text;
            TB_PartAContactInformation.Text = strContacts + "," + strVendorPhone;
        }
        catch
        {
            TB_PartA.Text = "";
            TB_PartAContactInformation.Text = "";

            strVendorName = "";
        }

        LoadVendorRelatedGoodsList(strVendorCode);

        LoadGoodsCheckInOrder(LB_UserCode.Text, strProjectID, strVendorName);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;

        DataGrid4.CurrentPageIndex = 0;
        TabContainer2.ActiveTabIndex = 1;

        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strType = "%" + strType + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select * From T_Goods as goods Where goods.GoodsCode Like " + "'" + strGoodsCode + "'" + " and goods.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and goods.Type Like " + "'" + strType + "'" + " and goods.ModelNumber Like " + "'" + strModelNumber + "'" + " and goods.Spec Like " + "'" + strSpec + "'";
        strHQL += " Order by goods.Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid7.DataSource = ds;
        DataGrid7.DataBind();

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Count_Click(object sender, EventArgs e)
    {
        NB_Amount.Amount = NB_Number.Amount * NB_Price.Amount;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        TB_Account.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strVendorCode;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            LB_ID.Text = strID;

            strVendorCode = DL_VendorList.SelectedValue.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor Where vendorRelatedGoodsInfor.ID = " + strID;

            VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
            lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);
            VendorRelatedGoodsInfor vendorRelatedGoodsInfor = (VendorRelatedGoodsInfor)lst[0];

            TB_GoodsCode.Text = vendorRelatedGoodsInfor.GoodsCode;
            TB_GoodsName.Text = vendorRelatedGoodsInfor.GoodsName;
            TB_ModelNumber.Text = vendorRelatedGoodsInfor.ModelNumber;
            TB_Spec.Text = vendorRelatedGoodsInfor.Spec;
            TB_Manufacturer.Text = vendorRelatedGoodsInfor.Brand;

            DL_Type.SelectedValue = vendorRelatedGoodsInfor.Type;
            DL_Unit.SelectedValue = vendorRelatedGoodsInfor.Unit;
            NB_Price.Amount = vendorRelatedGoodsInfor.Price;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
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
                    DL_Type.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_Type.SelectedValue = "";
                }
                TB_ModelNumber.Text = item.ModelNumber;
                DL_Unit.SelectedValue = item.Unit;
                TB_Spec.Text = item.Specification;
                NB_Price.Amount = item.PurchasePrice;
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strGoodsCode;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Goods as goods where goods.ID = " + strID;
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            if (lst.Count > 0)
            {
                Goods goods = (Goods)lst[0];

                TB_GoodsCode.Text = goods.GoodsCode;
                TB_GoodsName.Text = goods.GoodsName;
                TB_ModelNumber.Text = goods.ModelNumber;
                DL_Unit.SelectedValue = goods.UnitName;
                TB_Spec.Text = goods.Spec;
                DL_Type.SelectedValue = goods.Type;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPlanVerID;

            strPlanVerID = ((Button)e.Item.FindControl("BT_PlanVerID")).Text.Trim();

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strPlanVerID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid11_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode, strItemName, strBomVerID, strUnit, strDefaultProcess;
            decimal deNumber, deReservedNumber;

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ID = " + strID;
            ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
            lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

            ProjectRelatedItem projectRelatedItem = (ProjectRelatedItem)lst[0];

            strItemCode = projectRelatedItem.ItemCode.Trim();
            strItemName = projectRelatedItem.ItemName.Trim();
            strBomVerID = projectRelatedItem.BomVersionID.ToString();
            strUnit = projectRelatedItem.Unit;
            deNumber = projectRelatedItem.Number;
            deReservedNumber = projectRelatedItem.ReservedNumber;
            strDefaultProcess = projectRelatedItem.DefaultProcess.Trim();

            TB_GoodsCode.Text = strItemCode;
            TB_GoodsName.Text = strItemName;

            try
            {
                DL_Type.SelectedValue = projectRelatedItem.ItemType;
            }
            catch
            {
            }
            TB_Spec.Text = projectRelatedItem.Specification;
            TB_ModelNumber.Text = projectRelatedItem.ModelNumber;
            NB_Number.Amount = projectRelatedItem.Number;

            DL_Unit.SelectedValue = strUnit;

            //LB_SourceRelatedID.Text = projectRelatedItem.ProjectID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPJRecord";
            NB_RecordSourceID.Amount = projectRelatedItem.ID;

            //LoadItemBomVersion(strItemCode, DL_BomVerID);
            //DL_BomVerID.SelectedValue = strBomVerID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected Item GetItem(string strItemCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Item as item where item.ItemCode = " + "'" + strItemCode + "'";
        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);
        Item item = (Item)lst[0];

        return item;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strAOID;
            IList lst;

            strAOID = LB_AOID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_NewDetail.Visible = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail where projectMaterialPaymentApplicantDetail.ID = " + strID;

                ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
                ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[0];

                TB_GoodsCode.Text = projectMaterialPaymentApplicantDetail.GoodsCode;
                TB_GoodsName.Text = projectMaterialPaymentApplicantDetail.GoodsName;
                TB_ModelNumber.Text = projectMaterialPaymentApplicantDetail.ModelNumber;
                TB_Spec.Text = projectMaterialPaymentApplicantDetail.Spec;

                NB_Price.Amount = projectMaterialPaymentApplicantDetail.Price;

                DL_Type.SelectedValue = projectMaterialPaymentApplicantDetail.Type;
                DL_Unit.SelectedValue = projectMaterialPaymentApplicantDetail.Unit;
                NB_Number.Amount = projectMaterialPaymentApplicantDetail.Number;

                TB_Manufacturer.Text = projectMaterialPaymentApplicantDetail.Manufacture;

                TB_Account.Text = projectMaterialPaymentApplicantDetail.AccountName.Trim();
                lbl_AccountCode.Text = projectMaterialPaymentApplicantDetail.AccountCode;

                NB_Amount.Amount = projectMaterialPaymentApplicantDetail.Amount;

                try
                {
                    DL_RecordSourceType.SelectedValue = projectMaterialPaymentApplicantDetail.SourceType.Trim();
                }
                catch
                {
                }

                NB_RecordSourceID.Amount = projectMaterialPaymentApplicantDetail.SourceID;


                //刷新关联的入库单明细
                if (projectMaterialPaymentApplicantDetail.SourceType.Trim() == "CheckInOrderRecord")
                {
                    LoadGoodsCheckInOrderDetailByID(projectMaterialPaymentApplicantDetail.SourceID.ToString());
                }


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }

                string strSourceType;
                int intSourceID;


                ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                strHQL = "from ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail where projectMaterialPaymentApplicantDetail.ID = " + strID;
                lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
                ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[0];

                strSourceType = projectMaterialPaymentApplicantDetail.SourceType.Trim();
                intSourceID = projectMaterialPaymentApplicantDetail.SourceID;

                try
                {
                    projectMaterialPaymentApplicantDetailBLL.DeleteProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail);

                    LoadProjectMaterialPaymentApplicantDetail(strAOID);

                    UpdateProjectMaterialPaymentApplicantAmount(strAOID, SumProjectMaterialPaymentApplicantAmount(strAOID));

                    //更改项目关联物资下单量
                    if (strSourceType == "GoodsPJRecord")
                    {
                        UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                        if (DL_RelatedType.SelectedValue.Trim() == "Project")
                        {
                            RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                        }
                    }

                    try
                    {
                        //删除关联的项目费用
                        strHQL = "Delete From T_ProExpense Where PMPADID = " + strID;
                        ShareClass.RunSqlCommand(strHQL);
                    }
                    catch
                    {
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AOID as DetailAOID, * from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }
        }
    }

    //给品牌和工艺字段赋值
    protected void setGoodsManufacturerAndProcessRoute(string strRecordID)
    {
        string strHQL;

        strHQL = "Select Manufacture,ProcessRoute From T_ProjectMaterialPaymentApplicantDetail Where ID =  " + strRecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_Manufacturer.Text = ds.Tables[0].Rows[0]["Manufacture"].ToString();
            //TB_ProcessRoute.Text = ds.Tables[0].Rows[0]["ProcessRoute"].ToString();
        }
    }

    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {

        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strAOID;

        strAOID = LB_AOID.Text.Trim();

        if (strAOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strAOID = LB_AOID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
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
        string strRecordID, strAOID, strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;
        string strUnitName;
        decimal decNumber;
        DateTime dtBuyTime;
        decimal dePrice;
        string strSourceType;
        int intSourceID;

        strAOID = LB_AOID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        decNumber = NB_Number.Amount;
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;

        dtBuyTime = DateTime.Now;

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
        if (ShareClass.CheckProjectExpenseBudgetByProjectMaterialPayApplicant(strProjectID, TB_Account.Text.Trim(), NB_Amount.Amount) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop777", "popShow('popwindow','true','popDetailWindow') ", true);
        }
        else
        {
            if (strType == "" | strGoodsName == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click333", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
            }
            else
            {
                ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = new ProjectMaterialPaymentApplicantDetail();

                projectMaterialPaymentApplicantDetail.AOID = int.Parse(strAOID);
                projectMaterialPaymentApplicantDetail.Type = strType;
                projectMaterialPaymentApplicantDetail.GoodsCode = strGoodsCode;
                projectMaterialPaymentApplicantDetail.GoodsName = strGoodsName;

                projectMaterialPaymentApplicantDetail.Price = dePrice;
                projectMaterialPaymentApplicantDetail.ModelNumber = strModelNumber;
                projectMaterialPaymentApplicantDetail.Spec = strSpec;

                projectMaterialPaymentApplicantDetail.Number = decNumber;
                projectMaterialPaymentApplicantDetail.Unit = strUnitName;
                projectMaterialPaymentApplicantDetail.Amount = NB_Amount.Amount;

                projectMaterialPaymentApplicantDetail.SourceType = strSourceType;
                projectMaterialPaymentApplicantDetail.SourceID = intSourceID;

                projectMaterialPaymentApplicantDetail.Manufacture = TB_Manufacturer.Text.Trim();

                projectMaterialPaymentApplicantDetail.AccountCode = lbl_AccountCode.Text;
                projectMaterialPaymentApplicantDetail.AccountName = TB_Account.Text.Trim();


                try
                {
                    projectMaterialPaymentApplicantDetailBLL.AddProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail);

                    strRecordID = ShareClass.GetMyCreatedMaxProjectMaterialPaymentApplicantDetailID(strAOID);
                    LB_ID.Text = strRecordID;

                    LoadProjectMaterialPaymentApplicantDetail(strAOID);

                    UpdateProjectMaterialPaymentApplicantAmount(strAOID, SumProjectMaterialPaymentApplicantAmount(strAOID));

                    //刷新关联的入库单明细
                    if (strSourceType == "CheckInOrderRecord")
                    {
                        LoadGoodsCheckInOrderDetail(LB_CheckInOrderID.Text);
                    }


                    //更改项目关联物资下单量
                    if (strSourceType == "GoodsPJRecord")
                    {
                        UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                        if (DL_RelatedType.SelectedValue.Trim() == "Project")
                        {
                            RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                        }
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AOID as DetailAOID, * from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click444", "alert('" + Resources.lang.ZZBCCG + "')", true);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop555", "popShow('popwindow','true') ", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click666", "alert('" + Resources.lang.ZZBCSB + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop777", "popShow('popwindow','true','popDetailWindow') ", true);
                }
            }
        }
    }


    protected void UpdateDetail()
    {
        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;
        string strUnitName;
        DateTime dtBuyTime;
        decimal deNumber;
        decimal dePrice;
        string strSourceType;
        int intSourceID;

        string strID, strAOID;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strAOID = LB_AOID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;
        deNumber = NB_Number.Amount;

        dtBuyTime = DateTime.Now;

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
        if (ShareClass.CheckProjectExpenseBudgetByProjectMaterialPayApplicant(strProjectID, TB_Account.Text.Trim(), NB_Amount.Amount) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop777", "popShow('popwindow','true','popDetailWindow') ", true);
        }
        else
        {
            if (strType == "" | strGoodsName == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click333", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
            }
            else
            {
                ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                strHQL = "from ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail where projectMaterialPaymentApplicantDetail.ID = " + strID;
                lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
                ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[0];

                projectMaterialPaymentApplicantDetail.AOID = int.Parse(strAOID);
                projectMaterialPaymentApplicantDetail.Type = strType;
                projectMaterialPaymentApplicantDetail.GoodsCode = strGoodsCode;
                projectMaterialPaymentApplicantDetail.GoodsName = strGoodsName;
                projectMaterialPaymentApplicantDetail.Number = deNumber;
                projectMaterialPaymentApplicantDetail.Unit = strUnitName;
                projectMaterialPaymentApplicantDetail.Price = dePrice;
                //projectMaterialPaymentApplicantDetail.Amount = NB_Amount.Amount;

                projectMaterialPaymentApplicantDetail.ModelNumber = strModelNumber;
                projectMaterialPaymentApplicantDetail.Spec = strSpec;

                projectMaterialPaymentApplicantDetail.Manufacture = TB_Manufacturer.Text.Trim();

                projectMaterialPaymentApplicantDetail.Amount = dePrice * deNumber;

                projectMaterialPaymentApplicantDetail.AccountCode = lbl_AccountCode.Text;
                projectMaterialPaymentApplicantDetail.AccountName = TB_Account.Text.Trim();

                projectMaterialPaymentApplicantDetail.SourceType = strSourceType;
                projectMaterialPaymentApplicantDetail.SourceID = intSourceID;

                try
                {
                    projectMaterialPaymentApplicantDetailBLL.UpdateProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail, int.Parse(strID));

                    LoadProjectMaterialPaymentApplicantDetail(strAOID);

                    //更新物资采购付款单总金额
                    UpdateProjectMaterialPaymentApplicantAmount(strAOID, SumProjectMaterialPaymentApplicantAmount(strAOID));

                    //刷新关联的入库单明细
                    if (strSourceType == "CheckInOrderRecord")
                    {
                        LoadGoodsCheckInOrderDetail(LB_CheckInOrderID.Text);
                    }

                    //更改项目关联物资下单量
                    if (strSourceType == "GoodsPJRecord")
                    {
                        UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                        if (DL_RelatedType.SelectedValue.Trim() == "Project")
                        {
                            RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                        }
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AOID as DetailAOID, * from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click444", "alert('" + Resources.lang.ZZBCCG + "')", true);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop555", "popShow('popwindow','true') ", true);

                }
                catch (Exception err)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click666", "alert('" + Resources.lang.ZZBCSB + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop777", "popShow('popwindow','true','popDetailWindow') ", true);

                }
            }
        }
    }


    ////增加或更改费用的到项目费用表
    //protected void AddOrUpdteProjectExpense(string strProjectID, string strPMPADID, string strUserCode, string strUserName, string strAccount, string strDescription, string strCurrencyType, decimal deAmount)
    //{
    //    string strHQL;

    //    DateTime dtEffectDate = DateTime.Parse(DLC_CreateTime.Text);

    //    ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
    //    ProExpense proExpense = new ProExpense();

    //    strHQL = "Select * From T_ProExpense Where PMPADID = " + strPMPADID;
    //    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");
    //    if (ds.Tables[0].Rows.Count == 0)
    //    {
    //        try
    //        {
    //            proExpense.ProjectID = int.Parse(strProjectID);
    //            proExpense.TaskID = 0;
    //            proExpense.RecordID = 0;
    //            proExpense.QuestionID = 0;
    //            proExpense.PlanID = 0;
    //            proExpense.WorkflowID = 0;
    //            proExpense.PMPADID = int.Parse(strPMPADID);

    //            proExpense.UserCode = strUserCode;
    //            proExpense.UserName = strUserName;
    //            proExpense.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
    //            proExpense.Account = strAccount;
    //            proExpense.Description = strDescription;
    //            proExpense.Amount = deAmount;

    //            proExpense.ConfirmAmount = deAmount;
    //            proExpense.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
    //            proExpense.FinancialStaffCode = "";
    //            proExpense.FinancialStaffName = "";

    //            proExpense.EffectDate = dtEffectDate;
    //            proExpense.RegisterDate = DateTime.Now;

    //            proExpenseBLL.AddProExpense(proExpense);
    //        }
    //        catch
    //        {
    //        }
    //    }
    //    else
    //    {
    //        try
    //        {
    //            proExpense.ProjectID = int.Parse(strProjectID);
    //            proExpense.TaskID = 0;
    //            proExpense.RecordID = 0;
    //            proExpense.QuestionID = 0;
    //            proExpense.PlanID = 0;
    //            proExpense.WorkflowID = 0;
    //            proExpense.PMPADID = int.Parse(strPMPADID);

    //            proExpense.UserCode = strUserCode;
    //            proExpense.UserName = strUserName;
    //            proExpense.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
    //            proExpense.Account = strAccount;
    //            proExpense.Description = strDescription;
    //            proExpense.Amount = deAmount;

    //            proExpense.ConfirmAmount = deAmount;
    //            proExpense.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
    //            proExpense.FinancialStaffCode = "";
    //            proExpense.FinancialStaffName = "";

    //            proExpense.EffectDate = dtEffectDate;
    //            proExpense.RegisterDate = DateTime.Now;

    //            proExpenseBLL.UpdateProExpense(proExpense, int.Parse(strPMPADID));
    //        }
    //        catch
    //        {
    //        }
    //    }
    //}

    protected void BT_AllPurGoods_Click(object sender, EventArgs e)
    {
        //LB_GoodsOwner.Text = Resources.lang.SYLPLB; 
        //LB_GoodsOwner.Visible = true;

        string strUserCode = LB_UserCode.Text.Trim();

        LoadProjectMaterialPaymentApplicant(strUserCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strAOID;

        string strWLID, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strAOID = LB_AOID.Text.Trim();

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = ShareClass.GetUserName(strCreatorCode);

        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        strXMLFileName = strWLType + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        WorkFlow workFlow = new WorkFlow();

        workFlow.WLName = strWLName;
        workFlow.WLType = strWLType;
        workFlow.XMLFile = strXMLFile2;
        workFlow.TemName = strTemName;
        workFlow.Description = strDescription;
        workFlow.CreatorCode = strCreatorCode;
        workFlow.CreatorName = strCreatorName;
        workFlow.CreateTime = DateTime.Now;
        workFlow.RelatedType = "项目";
        workFlow.Status = "新建";
        workFlow.RelatedID = int.Parse(strAOID);
        workFlow.DIYNextStep = "Yes";
        workFlow.IsPlanMainWorkflow = "NO";

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

            LoadRelatedWL(strWLType, "项目", int.Parse(strAOID));

            UpdateGoodsPurchaseStatus(strAOID, "处理中");
            DL_AOStatus.SelectedValue = "处理中";

            strCmdText = "select AOID as DetailAOID, * from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_ProjectMaterialPaymentApplicant", strXMLFile2);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPCGSSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPCGSSBKNGZLMCGCZD25GHZJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
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

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '物资采购付款'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
    }

    protected void DL_POStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAOID, strStatus, strUserCode;

        strAOID = LB_AOID.Text.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        if (strAOID != "")
        {
            UpdateGoodsPurchaseStatus(strAOID, strStatus);
            LoadProjectMaterialPaymentApplicant(strUserCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strUserCode;
            string strID;

            strUserCode = LB_UserCode.Text.Trim();

            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid12.Items.Count; i++)
                {
                    DataGrid12.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;


                strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
                ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
                lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

                ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];


                LB_InvoiceID.Text = constractRelatedInvoice.ID.ToString();
                DL_InvoiceReceiveOPen.SelectedValue = constractRelatedInvoice.ReceiveOpen.Trim();
                DL_TaxType.SelectedValue = constractRelatedInvoice.TaxType.Trim();
                TB_InvoiceCode.Text = constractRelatedInvoice.InvoiceCode.Trim();
                NB_InvoiceAmount.Amount = constractRelatedInvoice.Amount;
                NB_InvoiceTaxRate.Amount = constractRelatedInvoice.TaxRate;

                DLC_OpenDate.Text = constractRelatedInvoice.OpenDate.ToString("yyyy-MM-dd");

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strInvoiceCode, strAOID;
                decimal deAmount, deTaxRate;

                strAOID = LB_AOID.Text.Trim();
                strInvoiceCode = TB_InvoiceCode.Text.Trim();
                deAmount = NB_InvoiceAmount.Amount;
                deTaxRate = NB_InvoiceTaxRate.Amount;

                ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
                strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
                lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);
                ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];

                constractRelatedInvoice.ConstractCode = strAOID;
                constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
                constractRelatedInvoice.Amount = deAmount;
                constractRelatedInvoice.TaxRate = deTaxRate;

                try
                {
                    constractRelatedInvoiceBLL.DeleteConstractRelatedInvoice(constractRelatedInvoice);
                    LoadConstractRelatedInvoice(strAOID);

                    CountInvoiceAmount(strAOID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
            }
        }
    }


    protected void BT_OpenInvoice_Click(object sender, EventArgs e)
    {
        LB_InvoiceID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
    }

    protected void BT_Invoice_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_InvoiceID.Text.Trim();

        if (strID == "")
        {
            AddInvoice();
        }
        else
        {
            UpdateInvoice();
        }
    }

    protected void AddInvoice()
    {
        string strInvoiceCode, strAOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strAOID = LB_AOID.Text.Trim();
        strInvoiceCode = TB_InvoiceCode.Text.Trim();
        strTaxType = DL_TaxType.SelectedValue.Trim();
        deAmount = NB_InvoiceAmount.Amount;
        deTaxRate = NB_InvoiceTaxRate.Amount;
        dtOpenDate = DateTime.Parse(DLC_OpenDate.Text);

        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        ConstractRelatedInvoice constractRelatedInvoice = new ConstractRelatedInvoice();

        constractRelatedInvoice.ReceiveOpen = DL_InvoiceReceiveOPen.SelectedValue.Trim();
        constractRelatedInvoice.ConstractCode = "";
        constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
        constractRelatedInvoice.TaxType = strTaxType;
        constractRelatedInvoice.Amount = deAmount;
        constractRelatedInvoice.TaxRate = deTaxRate;
        constractRelatedInvoice.OpenDate = dtOpenDate;
        constractRelatedInvoice.RelatedType = "PO";
        constractRelatedInvoice.RelatedID = strAOID;

        try
        {
            constractRelatedInvoiceBLL.AddConstractRelatedInvoice(constractRelatedInvoice);

            LoadConstractRelatedInvoice(strAOID);
            CountInvoiceAmount(strAOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
        }
    }

    protected void UpdateInvoice()
    {
        string strHQL;
        IList lst;

        string strID, strInvoiceCode, strAOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strID = LB_InvoiceID.Text.Trim();
        strAOID = LB_AOID.Text.Trim();
        strTaxType = DL_TaxType.SelectedValue.Trim();
        strInvoiceCode = TB_InvoiceCode.Text.Trim();
        deAmount = NB_InvoiceAmount.Amount;
        deTaxRate = NB_InvoiceTaxRate.Amount;
        dtOpenDate = DateTime.Parse(DLC_OpenDate.Text);

        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);
        ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];

        constractRelatedInvoice.ReceiveOpen = DL_InvoiceReceiveOPen.SelectedValue.Trim();
        constractRelatedInvoice.ConstractCode = "";
        constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
        constractRelatedInvoice.TaxType = strTaxType;
        constractRelatedInvoice.Amount = deAmount;
        constractRelatedInvoice.TaxRate = deTaxRate;
        constractRelatedInvoice.OpenDate = dtOpenDate;
        constractRelatedInvoice.RelatedType = "PO";
        constractRelatedInvoice.RelatedID = strAOID;

        try
        {
            constractRelatedInvoiceBLL.UpdateConstractRelatedInvoice(constractRelatedInvoice, int.Parse(strID));

            LoadConstractRelatedInvoice(strAOID);
            CountInvoiceAmount(strAOID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
        }
    }

    protected void CountInvoiceAmount(string strAOID)
    {
        string strHQL;
        IList lst;

        decimal deOpenInvoiceAmount = 0, deReceiveInvoiceAmount = 0;
        string strType;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strAOID + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        ConstractRelatedInvoice constractRelatedInvoice = new ConstractRelatedInvoice();

        for (int i = 0; i < lst.Count; i++)
        {
            constractRelatedInvoice = (ConstractRelatedInvoice)lst[i];

            strType = constractRelatedInvoice.ReceiveOpen.Trim();

            if (strType == "OPEN")
            {
                deOpenInvoiceAmount += constractRelatedInvoice.Amount;
            }

            if (strType == "RECEIVE")
            {
                deReceiveInvoiceAmount += constractRelatedInvoice.Amount;
            }
        }


        LB_TotalOpenInvoiceAmount.Text = deOpenInvoiceAmount.ToString();
        LB_TotalReceiveInvoiceAmount.Text = deReceiveInvoiceAmount.ToString();

    }

    protected void LoadConstractRelatedInvoice(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strAOID + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }


    protected void UpdateGoodsPurchaseStatus(string strAOID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where projectMaterialPaymentApplicant.AOID = " + strAOID;
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];

        projectMaterialPaymentApplicant.Status = strStatus;

        try
        {
            projectMaterialPaymentApplicantBLL.UpdateProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected void UpdatPurchasePlanNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "PurchasePlan")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_ProjectMaterialPaymentApplicantDetail Where SourceType = 'PurchasePlan' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ItemMainPlanRelatedItemPurchasePlan Set OrderNumber = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void UpdatProjectRelatedItemNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "GoodsPJRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_ProjectMaterialPaymentApplicantDetail Where SourceType = 'GoodsPJRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ProjectRelatedItem Set AleadyPurchased = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void RefreshProjectRelatedItemNumber(string strProjectID)
    {
        LoadProjectRelatedItem(strProjectID);
    }

    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID + " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }

    protected void LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadProjectMaterialPaymentApplicant(string strUserCode)
    {
        string strHQL;
        IList lst;

        //从流程中打开的业务单
        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where (projectMaterialPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or projectMaterialPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and projectMaterialPaymentApplicant.ProjectID = " + strProjectID;
        strHQL += " Order by projectMaterialPaymentApplicant.AOID DESC";

        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant Where projectMaterialPaymentApplicant.AOID = " + strWLBusinessID;
        }

        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadItemMainPlan(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " Or CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in  " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PlanVerID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlan");

        DataGrid10.DataSource = ds;
        DataGrid10.DataBind();
    }

    protected void LoadCurrencyType()
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Order By currencyType.SortNo ASC";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        DL_CurrencyType.DataSource = lst;
        DL_CurrencyType.DataBind();
    }

    protected void LoadProjectMaterialPaymentApplicantDetail(string strAOID)
    {
        string strHQL = "Select * from T_ProjectMaterialPaymentApplicantDetail where AOID = " + strAOID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicantDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected string GetProjectMaterialPaymentApplicantProjectID(string strAOID)
    {
        string strHQL = "Select ProjectID from T_ProjectMaterialPaymentApplicant where AOID = " + strAOID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicant");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected void LoadGoodsSaleOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where ( goodsSaleOrder.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsSaleOrder.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
        strHQL += " or goodsSaleOrder.UserCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or goodsSaleOrder.SalesCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid9.DataSource = lst;
        DataGrid9.DataBind();
    }


    protected int GetWLID()
    {
        int intWLID;
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where WLID in (select max(workFlow1.MLID) from WorkFlow as workFlow)";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        WorkFlow workFlow = (WorkFlow)lst[0];

        intWLID = workFlow.WLID;

        return intWLID;
    }

    protected decimal SumProjectMaterialPaymentApplicantAmount(string strAOID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail where projectMaterialPaymentApplicantDetail.AOID = " + strAOID;
        ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
        lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);

        ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = new ProjectMaterialPaymentApplicantDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[i];
            deAmount += projectMaterialPaymentApplicantDetail.Amount;
        }

        NB_CurrentTotalPaymentAmount.Amount = deAmount;

        return deAmount;
    }

    protected void UpdateProjectMaterialPaymentApplicantAmount(string strAOID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where projectMaterialPaymentApplicant.AOID = " + strAOID;
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];

        projectMaterialPaymentApplicant.CurrentTotalPaymentAmount = deAmount;

        try
        {
            projectMaterialPaymentApplicantBLL.UpdateProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected decimal GetGoodsStockTotalNumber(string strGoodsCode, string strBrand, string strModelNumber, string strSpec)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Number),0) From T_Goods Where GoodsCode = '" + strGoodsCode + "' and Manufacturer = '" + strBrand + "' and ModelNumber = '" + strModelNumber + "' and Spec = '" + strSpec + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
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


    protected void LoadVendorRelatedGoodsList(string strVendorCode)
    {
        string strHQL;
        IList lst;


        VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
        strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor where vendorRelatedGoodsInfor.VendorCode = " + "'" + strVendorCode + "'";
        lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadVendorRelatedGoodsListByName(string strVendorName)
    {
        string strHQL;
        IList lst;


        VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
        strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor where vendorRelatedGoodsInfor.VendorCode In (Select vendor.VendorCode From Vendor as vendor Where vendor.VendorName Like " + "'%" + strVendorName + "%')";
        lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    public static void LoadAccountForDDL(DropDownList DL_Account)
    {
        DataTable dt = GetAccountList(string.Empty);
        if (dt != null && dt.Rows.Count > 0)
        {
            DL_Account.Items.Clear();
            DL_Account.Items.Insert(0, new ListItem("--Select--", ""));
            SetInterval(DL_Account, "0", " ");
        }
        else
        {
            DL_Account.Items.Clear();
            DL_Account.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    public static DataTable GetAccountList(string strParentID)
    {
        string strHQL = "Select * From T_Account ";
        if (!string.IsNullOrEmpty(strParentID))
        {
            strHQL += " Where ParentID='" + strParentID.Trim() + "' ";
        }
        strHQL += " Order By SortNumber ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Account");
        return ds.Tables[0];
    }

    public static void SetInterval(DropDownList DDL, string strParentID, string interval)
    {
        interval += "├";

        DataTable list = GetAccountList(strParentID);
        if (list.Rows.Count > 0 && list != null)
        {
            for (int i = 0; i < list.Rows.Count; i++)
            {
                DDL.Items.Add(new ListItem(string.Format("{0}{1}", interval, list.Rows[i]["AccountType"].ToString().Trim() + "-" + list.Rows[i]["AccountName"].ToString().Trim()), list.Rows[i]["AccountCode"].ToString().Trim()));

                ///递归
                SetInterval(DDL, list.Rows[i]["ID"].ToString().Trim(), interval);
            }
        }
    }

    public static void LoadCurrencyType(DropDownList DL_CurrencyType)
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Order By currencyType.SortNo ASC";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        DL_CurrencyType.DataSource = lst;
        DL_CurrencyType.DataBind();
    }
}


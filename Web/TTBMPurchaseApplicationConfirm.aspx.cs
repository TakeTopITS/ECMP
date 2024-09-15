using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMPurchaseApplicationConfirm : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "分包付款申请", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ApplicationDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_PlanStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            TB_Application.Text = ShareClass.GetUserName(strUserCode);
            TB_DepartName.Text = ShareClass.GetDepartName(ShareClass.GetDepartCodeFromUserCode(strUserCode.Trim()));

            ShareClass.LoadUnitForDropDownList(DL_EngineeringUnit);
            ShareClass.LoadUnitForDropDownList(DL_DeviceUnit);

            BindTreeView(TreeView1);

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);
            ShareClass.LoadCurrencyType(DL_CurrencyType);

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());

            LoadBMSupplierInfoList();

            ShareClass.LoadWFTemplate(strUserCode, DL_WFType.SelectedValue.Trim(), DL_TemName);
        }
    }

    protected void LoadBMSupplierInfoList()
    {
        string strHQL = "Select * From T_BMSupplierInfo Where Status='合格' ";
        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DL_Supplier.DataSource = ds;
        DL_Supplier.DataBind();

        DL_Supplier.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadBMPurchaseApplicationList(string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_BMPurchaseApplication Where 1=1";

        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
        {
            strHQL += " and (Name like '%" + TextBox1.Text.Trim() + "%' or Remark like '%" + TextBox1.Text.Trim() + "%') ";
        }
        if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
        {
            strHQL += " and Application like '%" + TextBox2.Text.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(TextBox3.Text.Trim()))
        {
            strHQL += " and '" + TextBox3.Text.Trim() + "'::date-ApplicationDate::date<=0 ";
        }
        if (!string.IsNullOrEmpty(TextBox4.Text.Trim()))
        {
            strHQL += " and '" + TextBox4.Text.Trim() + "'::date-ApplicationDate::date>=0 ";
        }
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void BT_Add_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(TB_Name.Text.Trim()) || TB_Name.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCBNWKCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        if (IsBMPurchaseApplicationName(TB_Name.Text.Trim(), string.Empty))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        BMPurchaseApplicationBLL bMPurchaseApplicationBLL = new BMPurchaseApplicationBLL();
        BMPurchaseApplication bMPurchaseApplication = new BMPurchaseApplication();

        bMPurchaseApplication.Code = GetBMPurchaseApplicationCode(DateTime.Now);
        TB_Code.Text = bMPurchaseApplication.Code.Trim();
        bMPurchaseApplication.Code = bMPurchaseApplication.Code.Trim() + TB_Code1.Text.Trim();
        bMPurchaseApplication.Application = TB_Application.Text.Trim();

        bMPurchaseApplication.SupplierCode = DL_Supplier.SelectedValue.Trim();
        bMPurchaseApplication.SupplierName = DL_Supplier.SelectedItem.Text.Trim();

        bMPurchaseApplication.ProjectID = int.Parse(LB_ProjectID.Text);
        bMPurchaseApplication.Name = TB_Name.Text.Trim();
        bMPurchaseApplication.ApplicationDate = DateTime.Parse(DLC_ApplicationDate.Text.Trim());
        bMPurchaseApplication.Remark = TB_Remark.Text.Trim();
        bMPurchaseApplication.EnterCode = strUserCode.Trim();
        bMPurchaseApplication.DepartName = TB_DepartName.Text.Trim();

        bMPurchaseApplication.EngineeringAddress = TB_EngineeringAddress.Text.Trim();
        bMPurchaseApplication.EngineeringNumber = NB_EnigeeringNumber.Amount;
        bMPurchaseApplication.EngineeringUnitName = DL_EngineeringUnit.SelectedValue;
        bMPurchaseApplication.PlanStartTime = DateTime.Parse(DLC_PlanStartTime.Text.Trim());
        bMPurchaseApplication.TotalDuration = NB_TotalDuration.Amount;
        bMPurchaseApplication.DeviceNumber = NB_DeviceNumber.Amount;
        bMPurchaseApplication.DeviceUnitName = DL_DeviceUnit.SelectedValue;
        bMPurchaseApplication.ManHour = NB_ManHour.Amount;
        bMPurchaseApplication.SiteCondition = TB_SiteCondition.Text.Trim();
        bMPurchaseApplication.ManHour = NB_ManHour.Amount;
        bMPurchaseApplication.OtherComment = TB_OtherComment.Text.Trim();
        bMPurchaseApplication.ExpectedAmount = NB_ExpectedAmount.Amount;
        bMPurchaseApplication.Status = "计划";

        bMPurchaseApplication.CurrencyType = DL_CurrencyType.SelectedValue;

        try
        {
            bMPurchaseApplicationBLL.AddBMPurchaseApplication(bMPurchaseApplication);
            TB_ID.Text = GetBMPurchaseApplicationID(bMPurchaseApplication).ToString();

            BT_Update.Visible = true;

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());

            BT_SubmitApply.Visible = true;
            BT_SubmitApply.Enabled = true;

            LoadRelatedWL(DL_WFType.SelectedValue.Trim(), "项目", int.Parse(TB_ID.Text.Trim()));

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
        }
    }

    /// <summary>
    /// 新增时，获取表T_BMPurchaseApplication中最大编号 规则YYYYMM00X(X代表自增数字)。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected string GetBMPurchaseApplicationCode(DateTime strNow)
    {
        string flag = string.Empty;
        string strgold = strNow.ToString("yyyyMM");
        string strHQL = "Select Code From T_BMPurchaseApplication Where Code like '" + strgold + "%' Order by Code Desc";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            int pa = int.Parse(dt.Rows[0]["Code"].ToString().Substring(0, 9)) + 1;
            flag = pa.ToString();
        }
        else
        {
            flag = strgold + "001";
        }
        return flag;
    }

    /// <summary>
    /// 新增或更新时，采购申请名称是否存在，存在返回true；不存在返回false。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected bool IsBMPurchaseApplicationName(string strName, string strID)
    {
        bool flag = true;
        string strHQL;
        if (string.IsNullOrEmpty(strID))
        {
            strHQL = "Select ID From T_BMPurchaseApplication Where Name='" + strName + "' ";
        }
        else
            strHQL = "Select ID From T_BMPurchaseApplication Where Name='" + strName + "' and ID<>'" + strID + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            flag = true;
        }
        else
        {
            flag = false;
        }
        return flag;
    }

    /// <summary>
    /// 新增后，获取表T_BMPurchaseApplication中最大编号。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected int GetBMPurchaseApplicationID(BMPurchaseApplication bmpa)
    {
        string strHQL = "Select ID From T_BMPurchaseApplication where Application='" + bmpa.Application.Trim() + "' and Name='" + bmpa.Name.Trim() + "' Order by ID Desc";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            return int.Parse(dt.Rows[0]["ID"].ToString());
        }
        else
        {
            return 0;
        }
    }

    protected void BT_CountActualAmount_Click(object sender, EventArgs e)
    {
        NB_ActualAmount.Amount = NB_ActualManHour.Amount * NB_UnitPrice.Amount;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);

    }

    protected void BT_CountTotalAmount_Click(object sender, EventArgs e)
    {
        NB_TotalPayAmount.Amount = NB_ActualAmount.Amount + NB_OutContractPayAmount.Amount - NB_DeductedAmount.Amount;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        TB_Account.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(TB_Name.Text.Trim()) || TB_Name.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCBNWKCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }
        if (IsBMPurchaseApplicationName(TB_Name.Text.Trim(), TB_ID.Text.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGMCYCZCZSBJC + "')", true);
            TB_Name.Focus();
            return;
        }

        string strHQL = "From BMPurchaseApplication as bMPurchaseApplication where bMPurchaseApplication.ID = '" + TB_ID.Text.Trim() + "'";
        BMPurchaseApplicationBLL bMPurchaseApplicationBLL = new BMPurchaseApplicationBLL();
        IList lst = bMPurchaseApplicationBLL.GetAllBMPurchaseApplications(strHQL);
        BMPurchaseApplication bMPurchaseApplication = (BMPurchaseApplication)lst[0];

        bMPurchaseApplication.Application = TB_Application.Text.Trim();
        bMPurchaseApplication.ProjectID = int.Parse(LB_ProjectID.Text);
        bMPurchaseApplication.Name = TB_Name.Text.Trim();
        bMPurchaseApplication.ApplicationDate = DateTime.Parse(DLC_ApplicationDate.Text.Trim());

        bMPurchaseApplication.SupplierCode = DL_Supplier.SelectedValue.Trim();
        bMPurchaseApplication.SupplierName = DL_Supplier.SelectedItem.Text.Trim();

        bMPurchaseApplication.Remark = TB_Remark.Text.Trim();
        bMPurchaseApplication.Code = bMPurchaseApplication.Code.Trim().Substring(0, 9) + TB_Code1.Text.Trim();
        bMPurchaseApplication.DepartName = TB_DepartName.Text.Trim();

        bMPurchaseApplication.EngineeringAddress = TB_EngineeringAddress.Text.Trim();
        bMPurchaseApplication.EngineeringNumber = NB_EnigeeringNumber.Amount;
        bMPurchaseApplication.EngineeringUnitName = DL_EngineeringUnit.SelectedValue;
        bMPurchaseApplication.PlanStartTime = DateTime.Parse(DLC_PlanStartTime.Text.Trim());
        bMPurchaseApplication.TotalDuration = NB_TotalDuration.Amount;
        bMPurchaseApplication.DeviceNumber = NB_DeviceNumber.Amount;
        bMPurchaseApplication.DeviceUnitName = DL_DeviceUnit.SelectedValue;
        bMPurchaseApplication.ManHour = NB_ManHour.Amount;
        bMPurchaseApplication.SiteCondition = TB_SiteCondition.Text.Trim();
        bMPurchaseApplication.ManHour = NB_ManHour.Amount;
        bMPurchaseApplication.OtherComment = TB_OtherComment.Text.Trim();
        bMPurchaseApplication.ExpectedAmount = NB_ExpectedAmount.Amount;

        bMPurchaseApplication.ActualManHour = NB_ActualManHour.Amount;
        bMPurchaseApplication.UnitPrice = NB_UnitPrice.Amount;
        bMPurchaseApplication.ActualAmount = NB_ActualAmount.Amount;

        bMPurchaseApplication.OutContractPayAmount = NB_OutContractPayAmount.Amount;
        bMPurchaseApplication.DeductedAmount = NB_DeductedAmount.Amount;
        bMPurchaseApplication.TotalPayAmount = NB_TotalPayAmount.Amount;

        bMPurchaseApplication.AccountCode = lbl_AccountCode.Text.Trim();
        bMPurchaseApplication.AccountName = TB_Account.Text.Trim();
        bMPurchaseApplication.CurrencyType = DL_CurrencyType.SelectedValue;
        bMPurchaseApplication.Comment = TB_Comment.Text.Trim();
        bMPurchaseApplication.Status = "确认";

        try
        {
            bMPurchaseApplicationBLL.UpdateBMPurchaseApplication(bMPurchaseApplication, bMPurchaseApplication.ID);

            BT_Update.Visible = true;

            LB_Status.Text = "确认";

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strCode = TB_ID.Text.Trim();
        if (IsBMPurchaseApplication(strCode))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSDYBZBFADYWFSCJC + "')", true);
            return;
        }
        strHQL = "Delete From T_BMPurchaseApplication Where ID = '" + strCode + "' ";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            BT_Update.Visible = false;

            BT_SubmitApply.Visible = false;

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBJC + "')", true);
        }
    }

    /// <summary>
    /// 删除时，判断采购申请单是否已被调用，已调用返回true；否则返回false。
    /// </summary>
    /// <param name="strBarCode"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    protected bool IsBMPurchaseApplication(string strID)
    {
        bool flag = true;
        bool flag1 = true;
        string strHQL;
        strHQL = "Select ID From T_BMBidPlan Where PurchaseAppID='" + strID + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidPlan").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
            flag = true;
        else
            flag = false;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = '" + DL_WFType.SelectedValue.Trim() + "' and workFlow.RelatedType='项目' and workFlow.RelatedID = '" + strID + "' ";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        IList lst = workFlowBLL.GetAllWorkFlows(strHQL);
        if (lst.Count > 0 && lst != null)
            flag1 = true;
        else
            flag1 = false;

        return flag || flag1;
    }

    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strCode, strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            strCode = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From BMPurchaseApplication as bMPurchaseApplication where bMPurchaseApplication.Code = '" + strCode + "'";
            BMPurchaseApplicationBLL bMPurchaseApplicationBLL = new BMPurchaseApplicationBLL();
            lst = bMPurchaseApplicationBLL.GetAllBMPurchaseApplications(strHQL);
            BMPurchaseApplication bMPurchaseApplication = (BMPurchaseApplication)lst[0];

            TB_ID.Text = bMPurchaseApplication.ID.ToString();

            if (e.CommandName == "Update")
            {
                DLC_ApplicationDate.Text = bMPurchaseApplication.ApplicationDate.ToString("yyyy-MM-dd");
                TB_Application.Text = bMPurchaseApplication.Application.Trim();

                DL_Supplier.SelectedValue = bMPurchaseApplication.SupplierCode;

                LB_ProjectID.Text = bMPurchaseApplication.ProjectID.ToString();

                TB_Name.Text = bMPurchaseApplication.Name.Trim();
                TB_Remark.Text = bMPurchaseApplication.Remark.Trim();
                TB_Code.Text = bMPurchaseApplication.Code.Trim().Substring(0, 9);
                TB_Code1.Text = bMPurchaseApplication.Code.Trim().Substring(9);
                TB_DepartName.Text = bMPurchaseApplication.DepartName.Trim();

                TB_EngineeringAddress.Text = bMPurchaseApplication.EngineeringAddress.Trim();
                NB_EnigeeringNumber.Amount = bMPurchaseApplication.EngineeringNumber;

                try
                {
                    DL_EngineeringUnit.SelectedValue = bMPurchaseApplication.EngineeringUnitName;
                }
                catch
                {
                    DL_EngineeringUnit.SelectedValue = bMPurchaseApplication.EngineeringUnitName.Trim();
                }


                DLC_PlanStartTime.Text = bMPurchaseApplication.PlanStartTime.ToString("yyyy-MM-dd");
                NB_TotalDuration.Amount = bMPurchaseApplication.TotalDuration;
                NB_DeviceNumber.Amount = bMPurchaseApplication.DeviceNumber;
                try
                {
                    DL_DeviceUnit.SelectedValue = bMPurchaseApplication.DeviceUnitName;
                }
                catch
                {
                    DL_DeviceUnit.SelectedValue = bMPurchaseApplication.DeviceUnitName.Trim();
                }

                NB_ManHour.Amount = bMPurchaseApplication.ManHour;
                TB_SiteCondition.Text = bMPurchaseApplication.SiteCondition.Trim();
                TB_OtherComment.Text = bMPurchaseApplication.OtherComment.Trim();

                NB_ExpectedAmount.Amount = bMPurchaseApplication.ExpectedAmount;

                LB_Status.Text = bMPurchaseApplication.Status;

                NB_ActualManHour.Amount = bMPurchaseApplication.ActualManHour;
                NB_UnitPrice.Amount = bMPurchaseApplication.UnitPrice;
                NB_ActualAmount.Amount = bMPurchaseApplication.ActualAmount;

                NB_OutContractPayAmount.Amount = bMPurchaseApplication.OutContractPayAmount;
                NB_DeductedAmount.Amount = bMPurchaseApplication.DeductedAmount;
                NB_TotalPayAmount.Amount = bMPurchaseApplication.TotalPayAmount;

                TB_Account.Text = bMPurchaseApplication.AccountName;
                lbl_AccountCode.Text = bMPurchaseApplication.AccountCode;
                try
                {
                    DL_CurrencyType.SelectedValue = bMPurchaseApplication.CurrencyType.Trim();
                }
                catch
                {
                }
                TB_Comment.Text = bMPurchaseApplication.Comment;

              
                BT_Update.Visible = true;
                BT_Update.Enabled = true;
             

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
            }

            if (e.CommandName == "Workflow")
            {
                LoadRelatedWL(DL_WFType.SelectedValue.Trim(), "项目", int.Parse(TB_ID.Text.Trim()));

                int intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", TB_ID.Text.Trim());

                if (intWLNumber > 0)
                {
                    BT_SubmitApply.Visible = false;
                }
                else
                {
                    BT_SubmitApply.Visible = true;
                    BT_SubmitApply.Enabled = true;
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindowWorkflow','false') ", true);
            }
        }
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());
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

    protected string SubmitApply()
    {
        string strCmdText, strID, strWLID, strXMLFileName, strXMLFile2, strTemName;

        strID = TB_ID.Text.Trim();
        strWLID = "0";

        strTemName = DL_TemName.SelectedValue.Trim();
        if (strTemName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWLCMBBNWKJC + "')", true);
            return strWLID;
        }

        XMLProcess xmlProcess = new XMLProcess();

        //strHQL = "Update T_CarApplyForm Set Status = '处理中' Where ID = " + strID;

        try
        {
            //ShareClass.RunSqlCommand(strHQL);

            strXMLFileName = DL_WFType.SelectedValue.Trim() + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
            strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            WorkFlow workFlow = new WorkFlow();

            workFlow.WLName = DL_WFType.SelectedValue.Trim();
            workFlow.WLType = DL_WFType.SelectedValue.Trim();
            workFlow.Status = "新建";
            workFlow.TemName = DL_TemName.SelectedValue.Trim();
            workFlow.CreateTime = DateTime.Now;
            workFlow.CreatorCode = strUserCode;
            workFlow.CreatorName = ShareClass.GetUserName(strUserCode.Trim());
            workFlow.Description = TB_Name.Text.Trim();
            workFlow.XMLFile = strXMLFile2;
            workFlow.RelatedType = "项目";
            workFlow.RelatedID = int.Parse(strID);
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

                strCmdText = "select * from V_BMPurchaseApplicationPayForm where ID = " + strID;

                strXMLFile2 = Server.MapPath(strXMLFile2);
                xmlProcess.DbToXML(strCmdText, "V_BMPurchaseApplicationPayForm", strXMLFile2);

                LoadRelatedWL(DL_WFType.SelectedValue.Trim(), "项目", int.Parse(strID));

                //DL_Status.SelectedValue = "处理中";

                BT_Update.Visible = false;
                BT_Delete.Visible = false;

                BT_SubmitApply.Visible = false;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSJHSCCG + "')", true);
            }
            catch
            {
                strWLID = "0";
                BT_Update.Visible = true;
                BT_Update.Enabled = true;
                BT_Delete.Visible = true;
                BT_Delete.Enabled = true;
                BT_SubmitApply.Visible = true;
                BT_SubmitApply.Enabled = true;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('申请生成" + Resources.lang.ZZSBJC + "')", true);
            }

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());
        }
        catch
        {
            strWLID = "0";
            BT_Update.Visible = true;
            BT_Update.Enabled = true;
            BT_Delete.Visible = true;
            BT_Delete.Enabled = true;
            BT_SubmitApply.Visible = true;
            BT_SubmitApply.Enabled = true;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('申请生成" + Resources.lang.ZZSBJC + "')", true);
        }

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindowWorkflow','false') ", true);
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindowWorkflow','false') ", true);
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

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strtype = DL_WFType.SelectedValue.Trim();

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '" + strtype + "'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DL_TemName.Items.Clear();
        if (lst.Count > 0 && lst != null)
        {
            DL_TemName.DataSource = lst;
            DL_TemName.DataBind();
        }
        else
        {
            DL_TemName.Items.Insert(0, new ListItem("--Select--", ""));
        }

        LoadRelatedWL(strtype, "项目", int.Parse(TB_ID.Text.Trim()));

        int intWLNumber = GetRelatedWorkFlowNumber(strtype, "项目", TB_ID.Text.Trim());

        if (intWLNumber > 0)
        {
            BT_SubmitApply.Visible = false;
        }
        else
        {
            BT_SubmitApply.Visible = true;
            BT_SubmitApply.Enabled = true;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindowWorkflow','false') ", true);

    }

    protected void BindTreeView(TreeView tv)
    {
        tv.Nodes.Clear();

        TreeNode nd1 = new TreeNode();
        TreeNode nd2 = new TreeNode();

        nd1.Text = "<B>所有项目</B>";
        nd1.Target = "0";
        nd1.Expanded = true;
        tv.Nodes.Add(nd1);

        string strHQL = "From Project as project Where project.ParentID=1 and project.Status not in ('删除','归档') Order By project.ProjectID DESC ";
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        for (int i = 0; i < lst.Count; i++)
        {
            Project project = (Project)lst[i];
            nd2 = new TreeNode();
            nd2.Text = project.ProjectID.ToString() + "." + project.ProjectName.Trim();
            nd2.Target = project.ProjectID.ToString();
            nd2.Expanded = false;

            nd1.ChildNodes.Add(nd2);

            BindAllProjectTreeShow(project.ProjectID.ToString(), nd2);

            tv.DataBind();
        }
    }

    protected void BindAllProjectTreeShow(string strParentID, TreeNode tn)
    {
        string strHQL = "From Project as project Where project.ParentID='" + strParentID + "' and project.Status not in ('删除','归档') Order By project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        for (int i = 0; i < lst.Count; i++)
        {
            Project project = (Project)lst[i];
            TreeNode tn1 = new TreeNode();
            tn1.Target = project.ProjectID.ToString();
            tn1.Text = project.ProjectID.ToString() + "." + project.ProjectName.Trim();
            tn1.Expanded = false;

            tn.ChildNodes.Add(tn1);

            strHQL = "From Project as project Where project.ParentID = '" + project.ProjectID.ToString() + "' and project.Status not in ('删除','归档') Order by project.ProjectID DESC";
            lst = projectBLL.GetAllProjects(strHQL);
            if (lst.Count > 0 && lst != null)
            {
                BindAllProjectTreeShow(project.ProjectID.ToString(), tn1);
            }
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;
        if (treeNode.Target != "0")
        {
            LB_ProjectID.Text = treeNode.Target.Trim();
            TB_Name.Text = ShareClass.GetProjectName(treeNode.Target.Trim());

            LoadBMPurchaseApplicationList(LB_ProjectID.Text.Trim());
        }
        else
            TB_Name.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

}
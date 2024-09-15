using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTConstractPayableVisaEdit : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strRelatedWorkflowID, strRelatedWorkflowStepID, strRelatedWorkflowStepDetailID;
    private string strMainTableCanAdd, strDetailTableCanAdd, strMainTableCanEdit, strMainTableCanDelete, strDetailTableCanEdit, strDetailTableCanDelete;

    string strRelatedType, strProjectID;

    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strRelatedType = Request.QueryString["RelatedType"];
        strProjectID = Request.QueryString["ProjectID"];


        string strUserName;
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        //WorkFlow,如果是由工作流启动的业务，那么给下面三个变量赋值
        strRelatedWorkflowID = Request.QueryString["RelatedWorkflowID"];
        strRelatedWorkflowStepID = Request.QueryString["RelatedWorkflowStepID"];
        strRelatedWorkflowStepDetailID = Request.QueryString["RelatedWorkflowStepDetailID"];
        strMainTableCanAdd = Request.QueryString["MainTableCanAdd"];
        strDetailTableCanAdd = Request.QueryString["DetailTableCanAdd"];
        strMainTableCanEdit = Request.QueryString["MainTableCanEdit"];
        strMainTableCanDelete = Request.QueryString["MainTableCanDelete"];
        strDetailTableCanEdit = Request.QueryString["DetailTableCanEdit"];
        strDetailTableCanDelete = Request.QueryString["DetailTableCanDelete"];

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];
        if (strProjectID == null & strWLBusinessID != null)
        {
            strProjectID = GetConstractVisaRelatedProjectID(strWLBusinessID);
        }

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_VisaSignTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            ShareClass.LoadCurrencyType(DL_CurrencyType);

            ShareClass.LoadWFTemplate(strUserCode, "签证管理", DL_TemName);

            ShareClass.InitialInvolvedProjectTree(TreeView2, strUserCode);

            LoadConstractPayableVisa(strProjectID, strUserCode);

            //strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT, TreeView1, strUserCode);
            //LB_DepartString.Text = strDepartString;
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();

            //NB_RelatedID.Amount = int.Parse(strProjectID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

        TreeView2.SelectedNode.Selected = false;
    }

    protected void BT_SelectUser_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShowWithGrandson('popwindow','true','popDetailWindow','popDeparentUserSelectWindow') ", true);
    }

    protected void BT_CloseSelectUser_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strVisaID;
            IList lst;
            int intWLNumber;

            strVisaID = e.Item.Cells[3].Text.Trim();

            intWLNumber = GetRelatedWorkFlowNumber("签证管理", "合同签证", strVisaID);
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_SubmitApply.Enabled = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同签证", strVisaID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.ID = " + strVisaID;
                ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
                lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);
                ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

                LB_VisaID.Text = constractPayableVisa.ID.ToString();
                TB_VisaName.Text = constractPayableVisa.VisaName.Trim();
                DLC_VisaSignTime.Text = constractPayableVisa.VisaSignTime.ToString("yyyy-MM-dd");
                NB_VisaAmount.Amount = constractPayableVisa.VisaAmount;
                DL_CurrencyType.SelectedValue = constractPayableVisa.CurrencyType.Trim();
                TB_Comment.Text = constractPayableVisa.Comment.Trim();
                DL_VisaStatus.SelectedValue = constractPayableVisa.Status.Trim();
                TB_VisaSignMan.Text = constractPayableVisa.VisaSignMan.Trim();

                LoadConstractPayableVisaDetail(strVisaID);
                LoadRelatedConstract(strVisaID);

                TB_WLName.Text = Resources.lang.HeTongQiaZhen + constractPayableVisa.VisaName.Trim() + Resources.lang.ShenQing;

                LoadRelatedWL("签证管理", "合同签证", constractPayableVisa.ID);

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
                strUserCode = LB_UserCode.Text.Trim();

                intWLNumber = GetRelatedWorkFlowNumber("签证管理", "合同签证", strVisaID);
                if (intWLNumber > 0)
                {
                    return;
                }

                try
                {
                    strHQL = "Delete From T_ConstractPayableVisa Where VisaID = " + strVisaID;
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From T_ConstractPayableVisaDetail Where VisaID = " + strVisaID;
                    ShareClass.RunSqlCommand(strHQL);

                    //Workflow,删除流程模组关联记录
                    ShareClass.DeleteModuleToRelatedWorkflow(strRelatedWorkflowID, strRelatedWorkflowStepID, strRelatedWorkflowStepDetailID, "资产采购单", strVisaID);

                    BT_SubmitApply.Enabled = false;

                    LoadConstractPayableVisa(strProjectID, strUserCode);
                    LoadConstractPayableVisaDetail(strVisaID);
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
        LB_VisaID.Text = "";

        LoadConstractPayableVisaDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strVisaID;

        strVisaID = LB_VisaID.Text.Trim();

        if (strVisaID == "")
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
        string strVisaID, strVisaName, strVisaSignMan, strCurrencyType, strComment;
        DateTime dtVisaSignTime;
        decimal deAmount;
        string strStatus;

        strVisaName = TB_VisaName.Text.Trim();
        strVisaSignMan = TB_VisaSignMan.Text.Trim();
        strComment = TB_Comment.Text.Trim();
        dtVisaSignTime = DateTime.Parse(DLC_VisaSignTime.Text);
        deAmount = NB_VisaAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_VisaStatus.SelectedValue.Trim();
        strComment = TB_Comment.Text.Trim();

        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        ConstractPayableVisa constractPayableVisa = new ConstractPayableVisa();

        constractPayableVisa.ProjectID = int.Parse(strProjectID);
        constractPayableVisa.VisaName = strVisaName;
        constractPayableVisa.VisaSignMan = strVisaSignMan;
        constractPayableVisa.VisaSignTime = dtVisaSignTime;
        constractPayableVisa.VisaAmount = 0;
        constractPayableVisa.CurrencyType = strCurrencyType;
        constractPayableVisa.Comment = strComment;
        constractPayableVisa.Status = "新建";

        constractPayableVisa.OperatorCode = strUserCode;
        constractPayableVisa.OperatorName = strUserName;

        try
        {
            constractPayableVisaBLL.AddConstractPayableVisa(constractPayableVisa);

            strVisaID = GetMyCreatedMaxConstractPayableVisaID();
            LB_VisaID.Text = strVisaID;

            TB_WLName.Text = Resources.lang.HeTongQiaZhen + strVisaName + Resources.lang.ShenQing;

            BT_SubmitApply.Enabled = true;

            LoadConstractPayableVisa(strProjectID, strUserCode);
            LoadConstractPayableVisaDetail(strVisaID);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();

        string strVisaID, strVisaName, strVisaSignMan, strCurrencyType, strComment;
        DateTime dtVisaSignTime;
        decimal deAmount;
        string strStatus;

        strVisaID = LB_VisaID.Text;
        strVisaName = TB_VisaName.Text.Trim();
        strVisaSignMan = TB_VisaSignMan.Text.Trim();
        strComment = TB_Comment.Text.Trim();
        dtVisaSignTime = DateTime.Parse(DLC_VisaSignTime.Text);
        deAmount = NB_VisaAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_VisaStatus.SelectedValue.Trim();
        strComment = TB_Comment.Text.Trim();


        strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.ID = " + strVisaID;
        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);

        ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

        constractPayableVisa.ProjectID = int.Parse(strProjectID);
        constractPayableVisa.VisaName = strVisaName;
        constractPayableVisa.VisaSignTime = dtVisaSignTime;
        constractPayableVisa.VisaAmount = deAmount;
        constractPayableVisa.CurrencyType = strCurrencyType;
        constractPayableVisa.Comment = strComment;
        constractPayableVisa.Status = strStatus;

        constractPayableVisa.OperatorCode = strUserCode;
        constractPayableVisa.OperatorName = strUserName;

        try
        {
            constractPayableVisaBLL.UpdateConstractPayableVisa(constractPayableVisa, int.Parse(strVisaID));
            LoadConstractPayableVisa(strProjectID, strUserCode);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同", strVisaID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText;

                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("签证管理", "合同", strVisaID);
                }

                if (strToDoWLDetailID == null)
                {
                    strToDoWLDetailID = "0";
                }

                if (strToDoWLID != null)
                {
                    strCmdText = "select ID as DetailVisaID, * from T_ConstractPayableVisa where ID = " + strVisaID;

                    ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }

                if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                {
                    strCmdText = "select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID;

                    ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        IList lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strVisaID;
            IList lst;

            strVisaID = LB_VisaID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("签证管理", "合同", strVisaID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同", strVisaID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from ConstractPayableVisaDetail as constractPayableVisaDetail where constractPayableVisaDetail.ID = " + strID;

                ConstractPayableVisaDetailBLL constractPayableVisaDetailBLL = new ConstractPayableVisaDetailBLL();
                lst = constractPayableVisaDetailBLL.GetAllConstractPayableVisaDetails(strHQL);
                ConstractPayableVisaDetail constractPayableVisaDetail = (ConstractPayableVisaDetail)lst[0];

                TB_VisaDetailName.Text = constractPayableVisaDetail.VisaDetailName;
                NB_VisaPrice.Amount = constractPayableVisaDetail.VisaPrice;
                DL_Unit.SelectedValue = constractPayableVisaDetail.UnitName;
                NB_VisaNumber.Amount = constractPayableVisaDetail.VisaNumber;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber("签证管理", "合同签证", strVisaID);
                if (intWLNumber > 0)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    return;
                }

                ConstractPayableVisaDetailBLL constractPayableVisaDetailBLL = new ConstractPayableVisaDetailBLL();
                strHQL = "from ConstractPayableVisaDetail as constractPayableVisaDetail where constractPayableVisaDetail.ID = " + strID;
                lst = constractPayableVisaDetailBLL.GetAllConstractPayableVisaDetails(strHQL);
                ConstractPayableVisaDetail constractPayableVisaDetail = (ConstractPayableVisaDetail)lst[0];

                try
                {
                    constractPayableVisaDetailBLL.DeleteConstractPayableVisaDetail(constractPayableVisaDetail);

                    LoadConstractPayableVisaDetail(strVisaID);

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同签证", strVisaID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText = "select * from T_ConstractPayableVisa where ID = " + strVisaID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("签证管理", "合同签证", strVisaID);
                        }

                        if (strToDoWLDetailID == null)
                        {
                            strToDoWLDetailID = "0";
                        }

                        if (strToDoWLID != null)
                        {
                            ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID;

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


    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strVisaID;

        strVisaID = LB_VisaID.Text.Trim();

        if (strVisaID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strVisaID = LB_VisaID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber("签证管理", "合同签证", strVisaID);
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
        string strID, strVisaID, strVisaDetailName;
        string strUnitName;
        decimal decNumber;
        decimal dePrice;

        strID = LB_ID.Text.Trim();
        strVisaID = LB_VisaID.Text.Trim();

        strVisaDetailName = TB_VisaDetailName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        decNumber = NB_VisaNumber.Amount;
        dePrice = NB_VisaPrice.Amount;

        if (strVisaDetailName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            ConstractPayableVisaDetailBLL constractPayableVisaDetailBLL = new ConstractPayableVisaDetailBLL();
            ConstractPayableVisaDetail constractPayableVisaDetail = new ConstractPayableVisaDetail();

            constractPayableVisaDetail.VisaID = int.Parse(strVisaID);
            constractPayableVisaDetail.VisaDetailName = strVisaDetailName;
            constractPayableVisaDetail.VisaNumber = decNumber;
            constractPayableVisaDetail.UnitName = strUnitName;
            constractPayableVisaDetail.VisaPrice = dePrice;
            constractPayableVisaDetail.VisaAmount = dePrice * decNumber;
            constractPayableVisaDetail.Comment = "";

            constractPayableVisaDetailBLL.AddConstractPayableVisaDetail(constractPayableVisaDetail);
            try
            {
                strID = GetMyCreatedMaxConstractPayableVisaDetailID(strVisaID);
                LB_ID.Text = strID;

                NB_VisaAmount.Amount = SumTotalConstractPayableVisaAmount(strVisaID);

                LoadConstractPayableVisaDetail(strVisaID);
                LoadConstractPayableVisa(strProjectID, strUserCode);

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同", strVisaID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("签证管理", "合同", strVisaID);
                    }

                    if (strToDoWLDetailID == null)
                    {
                        strToDoWLDetailID = "0";
                    }

                    if (strToDoWLID != null)
                    {
                        strCmdText = "select ID as DetailVisaID, * from T_ConstractPayableVisa where ID = " + strVisaID;

                        ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID;

                        ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }


                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    protected void UpdateDetail()
    {
        string strHQL;
        IList lst;

        string strID, strVisaID, strVisaDetailName;
        string strUnitName;
        decimal decNumber;

        decimal dePrice;


        strID = LB_ID.Text.Trim();
        strVisaID = LB_VisaID.Text.Trim();

        strVisaDetailName = TB_VisaDetailName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();

        decNumber = NB_VisaNumber.Amount;

        dePrice = NB_VisaPrice.Amount;
        if (strVisaDetailName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            ConstractPayableVisaDetailBLL constractPayableVisaDetailBLL = new ConstractPayableVisaDetailBLL();
            strHQL = "from ConstractPayableVisaDetail as constractPayableVisaDetail where constractPayableVisaDetail.ID = " + strID;
            lst = constractPayableVisaDetailBLL.GetAllConstractPayableVisaDetails(strHQL);
            ConstractPayableVisaDetail constractPayableVisaDetail = (ConstractPayableVisaDetail)lst[0];

            constractPayableVisaDetail.VisaDetailName = strVisaDetailName;
            constractPayableVisaDetail.VisaNumber = decNumber;
            constractPayableVisaDetail.UnitName = strUnitName;
            constractPayableVisaDetail.VisaPrice = dePrice;
            constractPayableVisaDetail.VisaAmount = dePrice * decNumber;

            try
            {
                constractPayableVisaDetailBLL.UpdateConstractPayableVisaDetail(constractPayableVisaDetail, int.Parse(strID));

                NB_VisaAmount.Amount = SumTotalConstractPayableVisaAmount(strVisaID);

                LoadConstractPayableVisaDetail(strVisaID);
                LoadConstractPayableVisa(strProjectID, strUserCode);

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("签证管理", "合同", strVisaID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("签证管理", "合同", strVisaID);
                    }

                    if (strToDoWLDetailID == null)
                    {
                        strToDoWLDetailID = "0";
                    }

                    if (strToDoWLID != null)
                    {
                        strCmdText = "select ID as DetailVisaID, * from T_ConstractPayableVisa where ID = " + strVisaID;

                        ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID;

                        ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    //更新合同签证的总金额
    protected decimal SumTotalConstractPayableVisaAmount(string strVisaID)
    {
        string strHQL;
        decimal deTotalAmount;

        strHQL = "Select Sum(VisaAmount) From T_ConstractPayableVisaDetail Where VisaID = " + strVisaID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");
        deTotalAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

        strHQL = "Update T_ConstractPayableVisa Set VisaAmount = " + deTotalAmount.ToString() + " Where ID = " + strVisaID;
        ShareClass.RunSqlCommand(strHQL);

        return deTotalAmount;
    }

    public string GetMyCreatedMaxConstractPayableVisaDetailID(string strVisaID)
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_ConstractPayableVisaDetail Where VisaID = " + strVisaID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    public string GetMyCreatedMaxConstractPayableVisaID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_ConstractPayableVisa";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisa");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strVisaID;

        string strWLID, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strVisaID = LB_VisaID.Text.Trim();

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
        workFlow.RelatedType = "合同签证";
        workFlow.Status = "新建";
        workFlow.RelatedID = int.Parse(strVisaID);
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

            LoadRelatedWL(strWLType, "合同签证", int.Parse(strVisaID));

            UpdateConstractPayableVisaStatus(strVisaID, "处理中");
            DL_VisaStatus.SelectedValue = "处理中";

            strCmdText = "select ID as DetailVisaID, * from T_ConstractPayableVisa where ID = " + strVisaID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_ConstractPayableVisa", strXMLFile2);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZCCGSSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZCCGSSBKNGZLMCGCZD25GHZJC + "')", true);
            return "0";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        return strWLID;
    }

    protected void UpdateConstractPayableVisaStatus(string strVisaID, string strStatus)
    {
        string strHQL;

        strHQL = "Update T_ConstractPayableVisa Set Status = '" + strStatus + "' Where ID = " + strVisaID;
        ShareClass.RunSqlCommand(strHQL);

        DL_VisaStatus.SelectedValue = strStatus;

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

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '签证管理'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
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

    protected void LoadConstractPayableVisa(string strProjectID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.ProjectID = " + strProjectID + " and constractPayableVisa.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " Order by constractPayableVisa.ID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.ID = " + strWLBusinessID;
        }

        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadRelatedConstract(string strVisaID)
    {
        string strHQL;

        strHQL = "Select * from T_Constract where Status not in ('归档','删除') ";
        strHQL += " and ConstractCode in (select ConstractCode from T_ConstractPayable where ID in";
        strHQL += " (Select ConstractPayableID From T_ConstractPayableVisa Where ID = " + strVisaID + "))";
        strHQL += " order by SignDate DESC,ConstractCode DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Contract");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
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

    protected void LoadConstractPayableVisaDetail(string strVisaID)
    {
        string strHQL = "Select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
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


    protected decimal SumConstractPayableVisaTotalAmount(string strVisaID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from ConstractPayableVisaDetail as constractPayableVisaDetail where constractPayableVisaDetail.VisaID = " + strVisaID;
        ConstractPayableVisaDetailBLL constractPayableVisaDetailBLL = new ConstractPayableVisaDetailBLL();
        lst = constractPayableVisaDetailBLL.GetAllConstractPayableVisaDetails(strHQL);

        ConstractPayableVisaDetail constractPayableVisaDetail = new ConstractPayableVisaDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayableVisaDetail = (ConstractPayableVisaDetail)lst[i];
            deAmount += constractPayableVisaDetail.VisaNumber * constractPayableVisaDetail.VisaPrice;
        }

        return deAmount;
    }

    protected string GetConstractVisaRelatedProjectID(string strVisaID)
    {
        string strHQL;

        strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.ID = " + strVisaID;
        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        IList lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);
        ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

        return constractPayableVisa.ProjectID.ToString();
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

    //Workflow,取得单据创建人代码
    protected string getConstractPayableVisaCreatorCode(string strVisaID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayableVisa as constractPayableVisa where constractPayableVisa.VisaID = " + strVisaID;
        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);
        ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

        return constractPayableVisa.OperatorCode.Trim();
    }
}

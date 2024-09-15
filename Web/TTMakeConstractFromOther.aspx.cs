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

public partial class TTMakeConstractFromOther : System.Web.UI.Page
{
    string strLangCode;
    string strIsMobileDevice;
    string strRelatedType, strRelatedCode, strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName;
        string strDepartCode;
        string strDepartString;

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedCode = Request.QueryString["RelatedCode"];
        strRelatedID = Request.QueryString["RelatedID"];

        if (strRelatedCode == null)
        {
            strRelatedCode = "";
        }


        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(TB_MainContent);
        _FileBrowser.SetupCKEditor(TB_Exception);

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_MainContent.Visible = true;
                HT_Exception.Visible = true;
            }
            else
            {
                TB_MainContent.Visible = true;
                TB_Exception.Visible = true;
            }

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_GiveTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_SignDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            DLC_SaleTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_DeleveryTime.Text = DateTime.Now.ToString("yyyy-MM-dd");


            //生成合同树
            InitialConstractTreeByAuthority(TreeView4, strUserCode);
            InitialConstractTreeByAuthority(TreeView5, strUserCode);


            strHQL = "from ConstractBigType as constractBigType Order by constractBigType.SortNumber ASC";
            ConstractBigTypeBLL constractBigTypeBLL = new ConstractBigTypeBLL();
            lst = constractBigTypeBLL.GetAllConstractBigTypes(strHQL);
            DL_ConstractClass.DataSource = lst;
            DL_ConstractClass.DataBind();

            strHQL = "from ConstractType as constractType Order by constractType.SortNumber ASC";
            ConstractTypeBLL constractTypeBLL = new ConstractTypeBLL();
            lst = constractTypeBLL.GetAllConstractTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
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

            strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
            ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
            lst = actorGroupBLL.GetAllActorGroups(strHQL);
            Repeater1.DataSource = lst;
            Repeater1.DataBind();

            //By LiuJianping 2013-10-10
            BindBMContractDiscussData();//end

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView3, strUserCode);

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            ShareClass.LoadVendorList(DL_VendorList, strUserCode);
            LoadCustomerList(strUserCode);

            ShareClass.LoadCurrencyForDropDownList(DL_Currency);
            ShareClass.LoadReceivePayWayForDropDownList(DL_ReAndPayType);

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityProjectLeader(strUserCode);
            ShareClass.InitialPrjectTreeByAuthorityProjectLeader(TreeView1, strUserCode, strDepartString);

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

            LoadMembersGoodsSaleOrder(strUserCode, strDepartString, DataGrid6);
            LoadMembersGoodsPurchaseOrder(strUserCode, strDepartString, DataGrid7);
            LoadMembersAssetPurchaseOrder(strUserCode, strDepartString, DataGrid9);

            if (ShareClass.GetCodeRuleStatusByType("ConstractCode") == "YES")
            {
                TB_ConstractCode.Enabled = false;
                TB_ConstractCode.Text = ShareClass.GetCodeByRule("ConstractCode", "", "0");
            }

            if (strRelatedType == "PROJECT")
            {
                strHQL = "from Project as project where project.ProjectID = " + strRelatedID;
                ProjectBLL projectBLL = new ProjectBLL();
                lst = projectBLL.GetAllProjects(strHQL);

                if (lst.Count > 0)
                {
                    Project project = (Project)lst[0];

                    TB_ConstractName.Text = Resources.lang.Project + ": " + project.ProjectName.Trim() + " " + Resources.lang.HeTong;

                    DLC_BeginDate.Text = project.BeginDate.ToString("yyyy-MM-dd");
                    DLC_EndDate.Text = project.EndDate.ToString("yyyy-MM-dd");

                    NB_Amount.Amount = project.ProjectAmount;
                    DL_Currency.Text = project.CurrencyType;

                    TB_MainContent.Text = project.ProjectDetail;

                    TB_ProjectID.Text = strRelatedID;
                }
            }

            if (strRelatedType == "WZConstract" & strRelatedCode != "")
            {

                strHQL = "From WZCompact as wzCompact Where wzCompact.CompactCode = " + "'" + strRelatedCode + "'";
                WZCompactBLL wzCompactBLL = new WZCompactBLL();
                lst = wzCompactBLL.GetAllWZCompacts(strHQL);
                if (lst.Count > 0)
                {
                    WZCompact wzCompact = (WZCompact)lst[0];

                    TB_ConstractCode.Text = strRelatedCode;
                    TB_ConstractName.Text = wzCompact.CompactName.Trim();
                    TB_MainContent.Text = wzCompact.CompactName;

                    NB_Amount.Amount = wzCompact.CompactMoney;

                    try
                    {
                        DL_ConstractClass.SelectedValue = "采购类";
                    }
                    catch
                    {

                    }

                    try
                    {

                        DL_Type.SelectedValue = "物资采购";
                    }
                    catch
                    {

                    }

                    try
                    {
                        DLC_SignDate.Text = DateTime.Parse(wzCompact.SingTime).ToString("yyyy-MM-dd");
                    }
                    catch
                    {
                        DLC_SignDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    }

                    try
                    {
                        TB_DepartCode.Text = ShareClass.GetDepartCodeFromUserCode(wzCompact.NeedCode);
                        LB_DepartName.Text = ShareClass.GetDepartName(TB_DepartCode.Text.Trim());
                    }
                    catch
                    {

                    }

                    try
                    {
                        DL_Currency.SelectedValue = "人民币";
                    }
                    catch
                    {

                    }

                    try
                    {
                        DL_ReAndPayType.SelectedValue = "转账";
                    }
                    catch
                    {

                    }

                    try
                    {
                        DLC_BeginDate.Text = DateTime.Parse(wzCompact.EffectTime).ToString("yyyy-MM-dd");
                    }
                    catch
                    {

                    }

                    try
                    {
                        DLC_EndDate.Text = DateTime.Parse(wzCompact.CancelTime).ToString("yyyy-MM-dd");
                    }
                    catch
                    {

                    }

                    TB_PartA.Text = "中石油第二建设公司";

                    try
                    {
                        TB_PartAOperator.Text = ShareClass.GetUserName(wzCompact.DelegateAgent);
                    }
                    catch
                    {

                    }

                    try
                    {
                        TB_PartB.Text = ShareClass.GetUserName(wzCompact.SupplierCode);
                    }
                    catch
                    {

                    }

                    try
                    {
                        TB_PartBOperator.Text = ShareClass.GetUserName(wzCompact.SupplierCode);
                    }
                    catch
                    {

                    }

                    try
                    {
                        DL_Status.SelectedValue = wzCompact.Progress.Trim();
                    }
                    catch
                    {

                    }
                }
            }

            LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
            LoadDeletedConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];

                if (strProductType != "ERP" & strProductType != "CRM" & strProductType != "SIMP" & strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "DEMO")
                {
                    TabPanel7.Visible = false;
                    TabPanel4.Visible = false;
                    TabPanel5.Visible = false;
                }
            }
            catch
            {

            }

            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("ConstractCode") == "YES")
            {
                TB_ConstractCode.Enabled = false;
                TB_ConstractCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }

            //BusinessForm,列出业务表单类型 
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);
        }
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strConstractCode, strConstractName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        strConstractCode = treeNode.Target.Trim();
        strConstractName = GetConstractName(strConstractCode);

        if (strConstractCode == "")
        {
            strConstractName = "";
        }

        LB_ParentCode.Text = strConstractCode;
        TB_ParentConstract.Text = strConstractName;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void TreeView5_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strConstractID, strConstractCode;
        string strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView5.SelectedNode;

        strConstractCode = treeNode.Target.Trim();

        strHQL = "from  Constract as constract where constract.ConstractCode= " + "'" + strConstractCode + "'";

        ConstractBLL constractBLL = new ConstractBLL();

        lst = constractBLL.GetAllConstracts(strHQL);

        Constract constract = (Constract)lst[0];

        strConstractID = constract.ConstractID.ToString();
        LB_ConstractID.Text = strConstractID;

        TB_ConstractCode.Text = constract.ConstractCode.Trim();
        TB_ConstractName.Text = constract.ConstractName.Trim();

        DL_ConstractClass.SelectedValue = constract.ConstractClass;
        DL_Type.SelectedValue = constract.Type;
        DL_Currency.SelectedValue = constract.Currency.Trim();
        DL_ReAndPayType.SelectedValue = constract.ReAndPayType;

        if (strIsMobileDevice == "YES")
        {
            HT_MainContent.Content = constract.MainContent.Trim();
            HT_Exception.Content = constract.Exception.Trim();
        }
        else
        {
            TB_MainContent.Text = constract.MainContent.Trim();
            TB_Exception.Text = constract.Exception.Trim();
        }

        NB_Amount.Amount = constract.Amount;

        DLC_SignDate.Text = constract.SignDate.ToString("yyyy-MM-dd");
        DLC_BeginDate.Text = constract.StartDate.ToString("yyyy-MM-dd");
        DLC_EndDate.Text = constract.EndDate.ToString("yyyy-MM-dd");

        TB_DepartCode.Text = constract.DepartCode;
        LB_DepartName.Text = ShareClass.GetDepartName(constract.DepartCode);
        TB_PartA.Text = constract.PartA.Trim();
        TB_PartAOperator.Text = constract.PartAOperator.Trim();
        TB_PartB.Text = constract.PartB.Trim();
        TB_PartBOperator.Text = constract.PartBOperator.Trim();
        DL_Status.SelectedValue = constract.Status.Trim();

        LB_CustomerCode.Text = constract.RelatedCustomerCode;
        LB_VendorCode.Text = constract.RelatedVendorCode;

        LB_ConstractCode.Text = strConstractCode;

        //By LiuJianping 2013-10-10
        DL_ConstractNotice.SelectedValue = GetBMContractDiscussIDByConstractID(strConstractID);//end

        HL_RelatedDoc.Enabled = true;
        HL_RelatedDoc.NavigateUrl = "TTConstractRelatedDoc.aspx?ConstractCode=" + strConstractCode;

        HL_ConstractReviewBYWF.Enabled = true;
        HL_ConstractReviewBYWF.NavigateUrl = "TTRelatedDIYWorkflowForm.aspx?RelatedType=Constract&RelatedID=" + constract.ConstractID.ToString();

        HL_ConstractReview.Enabled = true;
        HL_ConstractReview.NavigateUrl = "TTConstractReviewWL.aspx?ConstractCode=" + strConstractCode;

        HL_WFTemName.Enabled = true;
        HL_WFTemName.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

        HL_TransferProject.Enabled = true;
        HL_TransferProject.NavigateUrl = "TTMakeProjectFromOther.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

        HL_MakeCollaboration.Enabled = true;
        HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=CONSTRACT&RelatedCode=" + strConstractCode;


        BT_AddProjectID.Enabled = true;


        LoadConstractSales(strConstractCode);
        LoadConstractRelatedUser(strConstractCode);
        LoadConstractRelatedProject(strConstractCode);
        LoadConstractRelatedGoodsSaleOrder(strConstractCode);
        LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
        LoadConstractRelatedAssetPurchaseOrder(strConstractCode);

        LoadConstractRelatedGoodsList(strConstractCode);

        LoadUnRelatedConstract(strConstractCode);
        LoadRelatedConstract(strConstractCode);

        LB_ParentCode.Text = constract.ParentCode.Trim();
        TB_ParentConstract.Text = GetConstractName(constract.ParentCode.Trim());

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    //定义合同树（根据权限）
    public void InitialConstractTreeByAuthority(TreeView ConstractTreeView, string strUserCode)
    {
        string strHQL;
        IList lst;

        String strConstractCode, strConstractName;

        //添加根节点
        ConstractTreeView.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>" + Resources.lang.WoDeHeTong + "</B>";
        node1.Target = "";
        node1.Expanded = true;
        ConstractTreeView.Nodes.Add(node1);

        Constract constract = new Constract();

        strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'";
        strHQL += " and constract.ParentCode = ''";
        strHQL += " and constract.Status not in ('归档','删除') ";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);


        for (int i = 0; i < lst.Count; i++)
        {
            constract = (Constract)lst[i];

            strConstractCode = constract.ConstractCode.Trim();
            strConstractName = constract.ConstractName.Trim();

            node3 = new TreeNode();

            node3.Text = strConstractCode + " " + strConstractName;
            node3.Target = strConstractCode;
            node3.Expanded = false;

            node1.ChildNodes.Add(node3);
            ConstractTreeShowByAuthority(strConstractCode, node3);
            ConstractTreeView.DataBind();
        }
    }

    public static void ConstractTreeShowByAuthority(string strParentCode, TreeNode treeNode)
    {
        string strHQL;
        IList lst1, lst2;

        String strConstractCode, strConstractName;

        ConstractBLL constractBLL = new ConstractBLL();
        Constract constract = new Constract();


        strHQL = "from Constract as constract where ";
        strHQL += " constract.ParentCode = " + "'" + strParentCode + "'";
        strHQL += " and constract.Status not in ('归档','删除') ";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        lst1 = constractBLL.GetAllConstracts(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            constract = (Constract)lst1[i];

            strConstractCode = constract.ConstractCode.Trim();
            strConstractName = constract.ConstractName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strConstractCode;
            node.Text = strConstractCode + " " + strConstractName;
            treeNode.ChildNodes.Add(node);
            node.Expanded = false;


            strHQL = "from Constract as constract where ";
            strHQL += " constract.ParentCode = " + "'" + strConstractCode + "'";
            strHQL += " and constract.Status not in ('归档','删除') ";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst2 = constractBLL.GetAllConstracts(strHQL);

            if (lst2.Count > 0)
            {
                ConstractTreeShowByAuthority(strConstractCode, node);
            }
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();
        string strConstractCode = "%" + TB_FindConstractCode.Text.Trim() + "%";
        string strFindPartA = "%" + TB_FindPartA.Text.Trim() + "%";
        string strFindPartB = "%" + TB_FindPartB.Text.Trim() + "%";

        DataGrid1.CurrentPageIndex = 0;

        LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);

        strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'" + " and constract.Status not in ('归档','删除')";
        strHQL += " and constract.ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and constract.PartA like " + "'" + strFindPartA + "'";
        strHQL += " and constract.PartB like " + "'" + strFindPartB + "'";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }

    //BusinessForm，定义后期是否可编辑此表单
    protected void DL_AllowUpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strConstractID, strAllowUpdate;

        strAllowUpdate = DL_AllowUpdate.SelectedValue;
        strConstractID = LB_ConstractID.Text.Trim();

        try
        {
            strHQL = "Update T_RelatedBusinessForm Set AllowUpdate = '" + strAllowUpdate + "'  Where RelatedType = 'Constract' and RelatedID = " + strConstractID;
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void BT_Create_Click(object sender, EventArgs e)
    {
        //BusinessForm，隐藏业务表单元素
        Panel_RelatedBusiness.Visible = false;

        LB_ConstractID.Text = "";
        TB_ConstractCode.Text = strRelatedCode;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    //  By LiuJianping 2013-10-10 关联招标管理中的合同通知
    /// <summary>
    /// 绑定招标管理中的合同通知名称
    /// </summary>
    protected void BindBMContractDiscussData()
    {
        string strHQL = "from BMContractDiscuss as bMContractDiscuss Order by bMContractDiscuss.ID ASC";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        DL_ConstractNotice.Items.Clear();
        if (lst.Count > 0 && lst != null)
        {
            lbl_ContractNotice.Visible = true;
            DL_ConstractNotice.Visible = true;
            DL_ConstractNotice.DataSource = lst;
            DL_ConstractNotice.DataBind();
            DL_ConstractNotice.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        else
        {
            DL_ConstractNotice.Items.Insert(0, new ListItem("--Select--", "0"));
            lbl_ContractNotice.Visible = false;
            DL_ConstractNotice.Visible = false;
        }
    }

    /// <summary>
    /// 判断此招投标合同通知是否已制定合同，已制定合同(此合同状态不等于取消或删除或归档)，则返回true，否则返回false
    /// </summary>
    /// <param name="strBMContractDiscussID">合同通知号</param>
    /// <returns></returns>
    protected bool IsMakeBMContract(string strBMContractDiscussID)
    {
        bool flag = true;
        string strHQL = "from BMContractDiscuss as bMContractDiscuss Where bMContractDiscuss.ID ='" + strBMContractDiscussID + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMContractDiscuss bMContractDiscuss = (BMContractDiscuss)lst[0];
            if (bMContractDiscuss.ConstractID == 0)
                flag = false;
            else
            {
                strHQL = "from Constract as constract where constract.Status != '归档' and constract.Status != '取消' and constract.Status != '删除' and constract.ConstractID='" + bMContractDiscuss.ConstractID.ToString() + "' ";
                ConstractBLL constractBLL = new ConstractBLL();
                lst = constractBLL.GetAllConstracts(strHQL);
                if (lst.Count > 0 && lst != null)
                    flag = true;
                else
                    flag = false;
            }
        }
        else
            flag = false;

        return flag;
    }

    /// <summary>
    /// 招投标合同通知制定合同时，把合同号写入合同通知中
    /// </summary>
    /// <param name="strID">合同号</param>
    /// <param name="strBMContractDiscussID">合同通知号</param>
    protected void UpdateBMContractDiscussConstractID(string strID, string strBMContractDiscussID)
    {
        string strHQL = "from BMContractDiscuss as bMContractDiscuss Where bMContractDiscuss.ID ='" + strBMContractDiscussID + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMContractDiscuss bMContractDiscuss = (BMContractDiscuss)lst[0];
            bMContractDiscuss.ConstractID = int.Parse(strID);
            bMContractDiscussBLL.UpdateBMContractDiscuss(bMContractDiscuss, bMContractDiscuss.ID);
        }
    }

    /// <summary>
    /// 更新时，先把旧的合同通知中的合同号调为0，然后再把合同号写入新的合同通知中
    /// </summary>
    /// <param name="strID">合同号</param>
    /// <param name="strBMContractDiscussIDNew">当前所选择的合同通知</param>
    /// <param name="strBMContractDiscussIDOld">原来的合同通知</param>
    protected void UpdateBMContractDiscussConstractID(string strID, string strBMContractDiscussIDNew, string strBMContractDiscussIDOld)
    {
        string strHQL = "from BMContractDiscuss as bMContractDiscuss Where bMContractDiscuss.ID ='" + strBMContractDiscussIDOld + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMContractDiscuss bMContractDiscuss = (BMContractDiscuss)lst[0];
            bMContractDiscuss.ConstractID = 0;
            bMContractDiscussBLL.UpdateBMContractDiscuss(bMContractDiscuss, bMContractDiscuss.ID);
        }

        strHQL = "from BMContractDiscuss as bMContractDiscuss Where bMContractDiscuss.ID ='" + strBMContractDiscussIDNew + "' ";
        lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMContractDiscuss bMContractDiscuss = (BMContractDiscuss)lst[0];
            bMContractDiscuss.ConstractID = int.Parse(strID);
            bMContractDiscussBLL.UpdateBMContractDiscuss(bMContractDiscuss, bMContractDiscuss.ID);
        }
    }

    /// <summary>
    /// 根据合同号获取合同通知ID
    /// </summary>
    /// <param name="strID">合同号</param>
    /// <returns></returns>
    protected string GetBMContractDiscussIDByConstractID(string strID)
    {
        string flag = "0";
        string strHQL = "from BMContractDiscuss as bMContractDiscuss Where bMContractDiscuss.ConstractID ='" + strID + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMContractDiscuss bMContractDiscuss = (BMContractDiscuss)lst[0];
            flag = bMContractDiscuss.ID.ToString();
        }
        return flag;
    }
    //end

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strProjectID = treeNode.Target.Trim();

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        TB_ProjectID.Text = project.ProjectID.ToString();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strGoodsSaleOrderID;
            string strConstractCode;
            string strUserCode = LB_UserCode.Text.Trim();

            strGoodsSaleOrderID = e.Item.Cells[0].Text;
            strConstractCode = TB_ConstractCode.Text.Trim();

            strHQL = "Delete From T_ConstractRelatedGoodsSaleOrder Where SOID = " + strGoodsSaleOrderID;
            strHQL += " and ConstractCode = " + "'" + strConstractCode + "'";

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadConstractRelatedGoodsSaleOrder(strConstractCode);
            }
            catch
            {
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strGoodsSaleOrderID;

            strGoodsSaleOrderID = ((Button)e.Item.FindControl("BT_SOID")).Text.Trim();

            GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
            strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.SOID = " + strGoodsSaleOrderID;
            lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

            GoodsSaleOrder goodsSaleOrder = (GoodsSaleOrder)lst[0];

            TB_GoodsSaleOrderID.Text = goodsSaleOrder.SOID.ToString();
            BT_AddSaleOrder.Enabled = true;


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_AddSaleOrder_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGoodsSaleOrderID, strConstractCode;
        string strUserCode = LB_UserCode.Text.Trim();

        strGoodsSaleOrderID = TB_GoodsSaleOrderID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.SOID = " + strGoodsSaleOrderID;
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        if (lst.Count > 0)
        {
            ConstractRelatedGoodsSaleOrderBLL constractRelatedGoodsSaleOrderBLL = new ConstractRelatedGoodsSaleOrderBLL();
            ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder = new ConstractRelatedGoodsSaleOrder();

            constractRelatedGoodsSaleOrder.SOID = int.Parse(strGoodsSaleOrderID);
            constractRelatedGoodsSaleOrder.ConstractCode = strConstractCode;

            try
            {
                constractRelatedGoodsSaleOrderBLL.AddConstractRelatedGoodsSaleOrder(constractRelatedGoodsSaleOrder);
                LoadConstractRelatedGoodsSaleOrder(strConstractCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJSBDDHCWWCDDSC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strGoodsPurchaseOrderID;

            strGoodsPurchaseOrderID = ((Button)e.Item.FindControl("BT_POID")).Text.Trim();

            GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
            strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strGoodsPurchaseOrderID;
            lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

            GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

            TB_GoodsPurchaseOrderID.Text = goodsPurchaseOrder.POID.ToString();
            BT_AddPurchaseOrder.Enabled = true;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_AddPurchaseOrder_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGoodsPurchaseOrderID, strConstractCode;
        string strUserCode = LB_UserCode.Text.Trim();

        strGoodsPurchaseOrderID = TB_GoodsPurchaseOrderID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strGoodsPurchaseOrderID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        if (lst.Count > 0)
        {
            ConstractRelatedGoodsPurchaseOrderBLL constractRelatedGoodsPurchaseOrderBLL = new ConstractRelatedGoodsPurchaseOrderBLL();
            ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder = new ConstractRelatedGoodsPurchaseOrder();

            constractRelatedGoodsPurchaseOrder.POID = int.Parse(strGoodsPurchaseOrderID);
            constractRelatedGoodsPurchaseOrder.ConstractCode = strConstractCode;

            try
            {
                constractRelatedGoodsPurchaseOrderBLL.AddConstractRelatedGoodsPurchaseOrder(constractRelatedGoodsPurchaseOrder);
                LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJSBDDHCWWCDDSC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strGoodsPurchaseOrderID;
            string strConstractCode;
            string strUserCode = LB_UserCode.Text.Trim();

            strGoodsPurchaseOrderID = e.Item.Cells[0].Text;
            strConstractCode = TB_ConstractCode.Text.Trim();

            strHQL = "Delete From T_ConstractRelatedGoodsPurchaseOrder Where POID = " + strGoodsPurchaseOrderID;
            strHQL += " and ConstractCode = " + "'" + strConstractCode + "'";

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
            }
            catch
            {
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_AddAssetPurchaseOrder_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPurchaseOrderID, strConstractCode;
        string strUserCode = LB_UserCode.Text.Trim();

        strPurchaseOrderID = TB_AssetPurchaseOrderID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();

        strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.POID = " + strPurchaseOrderID;
        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        if (lst.Count > 0)
        {
            ConstractRelatedAssetPurchaseOrderBLL constractRelatedAssetPurchaseOrderBLL = new ConstractRelatedAssetPurchaseOrderBLL();
            ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder = new ConstractRelatedAssetPurchaseOrder();

            constractRelatedAssetPurchaseOrder.POID = int.Parse(strPurchaseOrderID);
            constractRelatedAssetPurchaseOrder.ConstractCode = strConstractCode;

            try
            {
                constractRelatedAssetPurchaseOrderBLL.AddConstractRelatedAssetPurchaseOrder(constractRelatedAssetPurchaseOrder);
                LoadConstractRelatedAssetPurchaseOrder(strConstractCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJSBDDHCWWCDDSC + "')", true);
        }


        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid16_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();

            TB_RelatedConstractCode.Text = strConstractCode;

            BT_AddRelatedConstractCode.Enabled = true;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void DataGrid17_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strConstractCode, strRelatedConstractCode;

            strConstractCode = TB_ConstractCode.Text.Trim();
            strRelatedConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();

            strHQL = "Delete From T_ConstractRelatedConstract Where ConstractCode = " + "'" + strConstractCode + "'" + " and RelatedConstractCode = " + "'" + strRelatedConstractCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadUnRelatedConstract(strRelatedConstractCode);

            strConstractCode = TB_ConstractCode.Text.Trim();
            LoadRelatedConstract(strConstractCode);


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_AddRelatedConstractCode_Click(object sender, EventArgs e)
    {
        string strConstractCode, strRelatedConstractCode;

        strConstractCode = TB_ConstractCode.Text.Trim();
        strRelatedConstractCode = TB_RelatedConstractCode.Text.Trim();

        ConstractRelatedConstractBLL constractRelatedConstractBLL = new ConstractRelatedConstractBLL();
        ConstractRelatedConstract constractRelatedConstract = new ConstractRelatedConstract();

        constractRelatedConstract.ConstractCode = TB_ConstractCode.Text.Trim();
        constractRelatedConstract.RelatedConstractCode = strRelatedConstractCode;

        try
        {
            constractRelatedConstractBLL.AddConstractRelatedConstract(constractRelatedConstract);

            LoadRelatedConstract(strConstractCode);
            LoadUnRelatedConstract(strConstractCode);
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strPurchaseOrderID;

            strPurchaseOrderID = ((Button)e.Item.FindControl("BT_POID")).Text.Trim();

            AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
            strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.POID = " + strPurchaseOrderID;
            lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

            AssetPurchaseOrder assetPurchaseOrder = (AssetPurchaseOrder)lst[0];

            TB_AssetPurchaseOrderID.Text = assetPurchaseOrder.POID.ToString();
            BT_AddAssetPurchaseOrder.Enabled = true;


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strAssetPurchaseOrderID;
            string strConstractCode;
            string strUserCode = LB_UserCode.Text.Trim();

            strAssetPurchaseOrderID = e.Item.Cells[0].Text;
            strConstractCode = TB_ConstractCode.Text.Trim();

            strHQL = "Delete From T_ConstractRelatedAssetPurchaseOrder Where POID = " + strAssetPurchaseOrderID;
            strHQL += " and ConstractCode = " + "'" + strConstractCode + "'";

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadConstractRelatedAssetPurchaseOrder(strConstractCode);
            }
            catch
            {
            }


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_AllConstract_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();

        LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
        LoadDeletedConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
    }


    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strConstractID, strConstractCode;

        strConstractID = LB_ConstractID.Text;
        strConstractCode = TB_ConstractCode.Text.Trim();

        if (strConstractID == "")
        {
            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("ConstractCode") == "YES")
            {
                TB_ConstractCode.Enabled = false;
                TB_ConstractCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }

            AddConstract();
        }
        else
        {
            UpdateConstract();
        }
    }

    protected void AddConstract()
    {
        //判断招投标合同通知是否已制定合同 By LiuJianping 2013-10-10
        if (IsMakeBMContract(DL_ConstractNotice.SelectedValue.Trim()))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSCHTTZYZDHTJC + "')", true);
            DL_ConstractNotice.Focus();
            return;
        }//end

        string strHQL;

        string strUserCode = LB_UserCode.Text.Trim();

        string strConstractID, strConstractCode, strConstractClass, strConstractType, strConstractName, strOperatorCode, strOperatorName, strMainContent, strException;
        decimal deAmount;
        DateTime dtSignDate, dtStartDate, dtEndDate;
        string strCurrency, strDepartCode, strDepartName;
        string strPartA, strPartAOperator, strPartB, strPartBOperator;
        string strStatus;
        int intCount;

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractName = TB_ConstractName.Text.Trim();

        strConstractClass = DL_ConstractClass.SelectedValue.Trim();
        strConstractType = DL_Type.SelectedValue.Trim();

        if (strIsMobileDevice == "YES")
        {
            strMainContent = HT_MainContent.Content.Trim();
            strException = HT_Exception.Content.Trim();
        }
        else
        {
            strMainContent = TB_MainContent.Text.Trim();
            strException = TB_Exception.Text.Trim();
        }

        deAmount = NB_Amount.Amount;
        strCurrency = DL_Currency.SelectedValue.Trim();

        dtSignDate = DateTime.Parse(DLC_SignDate.Text);
        dtStartDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);

        strPartA = TB_PartA.Text.Trim();
        strPartAOperator = TB_PartAOperator.Text.Trim();
        strPartB = TB_PartB.Text.Trim();
        strPartBOperator = TB_PartBOperator.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        intCount = GetConstractCount(strConstractCode);

        if (intCount > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBHTHZFJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        strDepartCode = TB_DepartCode.Text.Trim();

        if (strConstractCode == "" | strConstractName == "" | strDepartCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZHTHHTMBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            strDepartName = ShareClass.GetDepartName(strDepartCode);
            Constract constract = new Constract();
            ConstractBLL constractBLL = new ConstractBLL();

            constract.ConstractCode = strConstractCode;
            constract.ConstractName = strConstractName;

            constract.ConstractClass = strConstractClass;
            constract.Type = strConstractType;

            constract.SignDate = dtSignDate;
            constract.StartDate = dtStartDate;
            constract.EndDate = dtEndDate;

            constract.MainContent = strMainContent;
            constract.ConstractMainDocURL = "";
            constract.Exception = strException;
            constract.Amount = deAmount;
            constract.Currency = strCurrency;
            constract.ReAndPayType = DL_ReAndPayType.SelectedValue.Trim();

            constract.DepartCode = strDepartCode;
            constract.DepartName = strDepartName;

            constract.PartA = strPartA;
            constract.PartAOperator = strPartAOperator;
            constract.PartB = strPartB;
            constract.PartBOperator = strPartBOperator;
            constract.Status = strStatus;

            constract.RecordTime = DateTime.Now;
            constract.RecorderCode = strUserCode;
            constract.RecorderName = ShareClass.GetUserName(strUserCode);
            constract.RelatedCustomerCode = LB_CustomerCode.Text.Trim();
            constract.RelatedVendorCode = LB_VendorCode.Text.Trim();

            constract.ParentCode = LB_ParentCode.Text.Trim();
            constract.ArchiveTime = "";

            try
            {
                constractBLL.AddConstract(constract);

                //生成合同树
                InitialConstractTreeByAuthority(TreeView4, strUserCode);
                InitialConstractTreeByAuthority(TreeView5, strUserCode);

                strConstractID = ShareClass.GetMyCreatedMaxConstractID(strUserCode);
                LB_ConstractID.Text = strConstractID;

                //依项目类型添加关联的工作流模板
                ShareClass.AddRelatedWorkFlowTemplateByProjectType(strConstractType, strConstractID, "Constract", "Constract", "ConstractType");


                //添加相关对象到合同
                AddRelatedObjectToConstract(strConstractCode, strRelatedType, strRelatedID);
                if (strRelatedType == "PROEJCT")
                {
                    TB_ProjectID.Text = strRelatedID;
                }

                if (strRelatedType == "WZConstract")
                {
                    string strHQL1;
                    strHQL1 = "Update T_WZCompact Set RelatedConstractCode = " + "'" + strConstractCode + "'" + " Where CompactCode = " + "'" + strRelatedCode + "'";
                    ShareClass.RunSqlCommand(strHQL1);

                    strHQL = "From WZCompact as wzCompact Where wzCompact.CompactCode = " + "'" + strRelatedCode + "'";
                    WZCompactBLL wzCompactBLL = new WZCompactBLL();
                    IList lst = wzCompactBLL.GetAllWZCompacts(strHQL);
                    if (lst.Count > 0)
                    {
                        WZCompact wzCompact = (WZCompact)lst[0];

                        try
                        {
                            ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
                            ConstractSales constractSales = new ConstractSales();

                            constractSales.ConstractCode = wzCompact.CompactCode;
                            constractSales.SalesName = ShareClass.GetUserName(wzCompact.Compacter.Trim());
                            constractSales.Duty = "合同员";
                            constractSales.Comment = "";
                            constractSales.Commission = 0;
                            constractSales.GiveTime = DateTime.Now;
                            constractSales.CommissionStatus = "未发";

                            constractSalesBLL.AddConstractSales(constractSales);

                            LoadConstractSales(wzCompact.CompactCode);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }


                        ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
                        ConstractRelatedUser constractRelatedUser = new ConstractRelatedUser();

                        try
                        {
                            constractRelatedUser.ConstractCode = wzCompact.CompactCode;
                            constractRelatedUser.UserCode = wzCompact.PurchaseEngineer;
                            constractRelatedUser.UserName = ShareClass.GetUserName(wzCompact.PurchaseEngineer);
                            constractRelatedUser.Authority = "NO";
                            constractRelatedUserBLL.AddConstractRelatedUser(constractRelatedUser);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }

                        try
                        {
                            constractRelatedUser.ConstractCode = wzCompact.CompactCode;
                            constractRelatedUser.UserCode = wzCompact.ControlMoney;
                            constractRelatedUser.UserName = ShareClass.GetUserName(wzCompact.ControlMoney);
                            constractRelatedUser.Authority = "NO";
                            constractRelatedUserBLL.AddConstractRelatedUser(constractRelatedUser);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }

                        try
                        {
                            constractRelatedUser.ConstractCode = wzCompact.CompactCode;
                            constractRelatedUser.UserCode = wzCompact.DelegateAgent;
                            constractRelatedUser.UserName = ShareClass.GetUserName(wzCompact.DelegateAgent);
                            constractRelatedUser.Authority = "NO";
                            constractRelatedUserBLL.AddConstractRelatedUser(constractRelatedUser);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }

                        try
                        {
                            string strProjectID;
                            strHQL = "Select ProjectID From T_Project Where ProjectCode = " + "'" + wzCompact.ProjectCode + "'";
                            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
                            strProjectID = ds.Tables[0].Rows[0][0].ToString();

                            ConstractRelatedProjectBLL constractRelatedProjectBLL = new ConstractRelatedProjectBLL();
                            ConstractRelatedProject constractRelatedProject = new ConstractRelatedProject();
                            constractRelatedProject.ProjectID = int.Parse(strProjectID);
                            constractRelatedProject.ConstractCode = wzCompact.CompactCode;
                            constractRelatedProjectBLL.AddConstractRelatedProject(constractRelatedProject);

                            LoadConstractRelatedProject(wzCompact.CompactCode);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }

                        try
                        {
                            string strDocType;

                            DocumentBLL documentBLL = new DocumentBLL();
                            Document document = new Document();

                            document.RelatedType = "合同";

                            document.DocTypeID = int.Parse("1");
                            strDocType = GetDocTypeName("1");
                            document.DocType = strDocType;

                            document.RelatedID = int.Parse(strConstractID);
                            document.Author = ShareClass.GetUserName(strUserCode);
                            document.DocName = wzCompact.CompactText;
                            document.Address = wzCompact.CompactTextURL;
                            document.UploadManCode = strUserCode;
                            document.UploadManName = ShareClass.GetUserName(strUserCode);
                            document.UploadTime = DateTime.Now;
                            document.Visible = "全体";
                            document.DepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
                            document.Status = "处理中";
                            document.RelatedName = "";


                            documentBLL.AddDocument(document);
                        }
                        catch (Exception ex)
                        {
                            //Response.Write(ex.Message.ToString());
                        }
                    }
                }

                string strNewConstractCode = ShareClass.GetCodeByRule("ConstractCode", strConstractType, strConstractID);
                if (strNewConstractCode != "")
                {
                    TB_ConstractCode.Text = strNewConstractCode;
                    strHQL = "Update T_Constract Set ConstractCode = " + "'" + strNewConstractCode + "'" + " Where ConstractID = " + strConstractID;
                    ShareClass.RunSqlCommand(strHQL);

                    strConstractCode = strNewConstractCode;
                }


                LB_ConstractCode.Text = strConstractCode;

                HL_RelatedDoc.Enabled = true;
                HL_RelatedDoc.NavigateUrl = "TTConstractRelatedDoc.aspx?ConstractCode=" + strConstractCode;

                HL_ConstractReview.Enabled = true;
                HL_ConstractReview.NavigateUrl = "TTConstractReviewWL.aspx?ConstractCode=" + strConstractCode;

                HL_WFTemName.Enabled = true;
                HL_WFTemName.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

                HL_MakeCollaboration.Enabled = true;
                HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=CONSTRACT&RelatedCode=" + strConstractCode;


                BT_AddProjectID.Enabled = true;


                // By LiuJianping 2013-10-10
                UpdateBMContractDiscussConstractID(strConstractID, DL_ConstractNotice.SelectedValue.Trim());//end

                LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
                LoadDeletedConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);


                LoadConstractSales(strConstractCode);
                LoadConstractRelatedUser(strConstractCode);
                LoadConstractRelatedProject(strConstractCode);
                LoadConstractRelatedGoodsSaleOrder(strConstractCode);
                LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
                LoadConstractRelatedAssetPurchaseOrder(strConstractCode);
                LoadConstractRelatedGoodsList(strConstractCode);
                LoadUnRelatedConstract(strConstractCode);
                LoadRelatedConstract(strConstractCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected string GetDocTypeName(string strDocTypeID)
    {
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        if (lst.Count > 0)
        {
            DocType docType = (DocType)lst[0];
            return docType.Type.Trim();
        }
        else
        {
            return "";
        }
    }

    protected void UpdateConstract()
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        string strConstractCode1;
        string strConstractCode, strConstractClass, strConstractType, strConstractName, strMainContent, strException;
        string strOldParentCode;
        decimal deAmount;
        DateTime dtStartDate, dtEndDate, dtSignDate;
        string strCurrency, strDepartCode, strDepartName;
        string strPartA, strPartAOperator, strPartB, strPartBOperator;
        string strStatus;
        int intConstractID;
        int intCount;

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractName = TB_ConstractName.Text.Trim();

        strConstractClass = DL_ConstractClass.SelectedValue.Trim();
        strConstractType = DL_Type.SelectedValue.Trim();

        if (strIsMobileDevice == "YES")
        {
            strMainContent = HT_MainContent.Content.Trim();
            strException = HT_Exception.Content.Trim();
        }
        else
        {
            strMainContent = TB_MainContent.Text.Trim();
            strException = TB_Exception.Text.Trim();
        }

        deAmount = NB_Amount.Amount;
        strCurrency = DL_Currency.SelectedValue.Trim();
        strDepartCode = TB_DepartCode.Text.Trim();
        strDepartName = ShareClass.GetDepartName(strDepartCode);

        dtSignDate = DateTime.Parse(DLC_SignDate.Text);
        dtStartDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);

        strPartA = TB_PartA.Text.Trim();
        strPartAOperator = TB_PartAOperator.Text.Trim();
        strPartB = TB_PartB.Text.Trim();
        strPartBOperator = TB_PartBOperator.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        strConstractCode1 = LB_ConstractCode.Text.Trim();
        if (strConstractCode != strConstractCode1)
        {
            intCount = GetConstractCount(strConstractCode);
            if (intCount > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSBHTHZFJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }

        if (strConstractCode == "" | strConstractName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZHTHHTMYWYBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            strHQL = "from Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";
            ConstractBLL constractBLL = new ConstractBLL();
            lst = constractBLL.GetAllConstracts(strHQL);

            Constract constract = (Constract)lst[0];

            intConstractID = constract.ConstractID;

            constract.ConstractCode = strConstractCode;
            constract.ConstractName = strConstractName;

            constract.ConstractClass = strConstractClass;
            constract.Type = strConstractType;

            constract.SignDate = dtSignDate;
            constract.StartDate = dtStartDate;
            constract.EndDate = dtEndDate;

            constract.MainContent = strMainContent;
            constract.Exception = strException;

            constract.Amount = deAmount;
            constract.Currency = strCurrency;
            constract.ReAndPayType = DL_ReAndPayType.SelectedValue.Trim();

            constract.DepartCode = strDepartCode;
            constract.DepartName = strDepartName;

            constract.PartA = strPartA;
            constract.PartAOperator = strPartAOperator;
            constract.PartB = strPartB;
            constract.PartBOperator = strPartBOperator;

            constract.Status = strStatus;

            constract.RelatedCustomerCode = LB_CustomerCode.Text.Trim();
            constract.RelatedVendorCode = LB_VendorCode.Text.Trim();

            strOldParentCode = constract.ParentCode.Trim();

            //判断招投标合同通知是否已制定合同 By LiuJianping 2013-10-10
            string paraID = GetBMContractDiscussIDByConstractID(intConstractID.ToString());
            if (paraID.Trim() == DL_ConstractNotice.SelectedValue.Trim())
            {
            }
            else
            {
                if (IsMakeBMContract(DL_ConstractNotice.SelectedValue.Trim()))
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSCHTTZYZDHTJC + "')", true);
                    DL_ConstractNotice.Focus();

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }
            }//end

            try
            {
                constractBLL.UpdateConstract(constract, intConstractID);

                // By LiuJianping 2013-10-10
                UpdateBMContractDiscussConstractID(intConstractID.ToString(), DL_ConstractNotice.SelectedValue.Trim(), paraID);//end

                LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
                LoadDeletedConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
            }
            catch
            {

            }

            try
            {
                strHQL = "Update T_Constract Set ParentCode = " + "'" + LB_ParentCode.Text.Trim() + "'" + " Where ConstractCode = " + "'" + strConstractCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                //依项目类型添加关联的工作流模板
                ShareClass.AddRelatedWorkFlowTemplateByProjectType(strConstractType, intConstractID.ToString(), "Constract", "Constract", "ConstractType");

                //BusinessForm，关联相应的业务表单模板
                ShareClass.SaveRelatedBusinessForm("Constract", intConstractID.ToString(), DL_WFTemplate.SelectedValue, DL_AllowUpdate.SelectedValue, strUserCode);

                //生成合同树
                InitialConstractTreeByAuthority(TreeView4, strUserCode);
                InitialConstractTreeByAuthority(TreeView5, strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            }
            catch
            {
                strHQL = "Update T_Constract Set ParentCode = " + "'" + strOldParentCode + "'" + " Where ConstractCode = " + "'" + strConstractCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                LB_ParentCode.Text = strOldParentCode;
                TB_ParentConstract.Text = GetConstractName(strOldParentCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBHHTBNZWZHTDZHTQJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strHQL;
            string strConstractID, strConstractCode;

            strUserCode = LB_UserCode.Text.Trim();

            strConstractCode = e.Item.Cells[3].Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Detail")
            {
                strHQL = "from  Constract as constract where constract.ConstractCode= " + "'" + strConstractCode + "'";

                ConstractBLL constractBLL = new ConstractBLL();

                IList lst = constractBLL.GetAllConstracts(strHQL);

                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                Constract constract = (Constract)lst[0];

                strConstractID = constract.ConstractID.ToString();
                LB_ConstractID.Text = strConstractID;

                TB_ConstractCode.Text = constract.ConstractCode.Trim();
                TB_ConstractName.Text = constract.ConstractName.Trim();

                DL_ConstractClass.SelectedValue = constract.ConstractClass;
                DL_Type.SelectedValue = constract.Type;
                DL_Currency.SelectedValue = constract.Currency.Trim();
                try
                {
                    DL_ReAndPayType.SelectedValue = constract.ReAndPayType;
                }
                catch
                {
                }

                if (strIsMobileDevice == "YES")
                {
                    HT_MainContent.Content = constract.MainContent.Trim();
                    HT_Exception.Content = constract.Exception.Trim();
                }
                else
                {
                    TB_MainContent.Text = constract.MainContent.Trim();
                    TB_Exception.Text = constract.Exception.Trim();
                }

                NB_Amount.Amount = constract.Amount;

                DLC_SignDate.Text = constract.SignDate.ToString("yyyy-MM-dd");
                DLC_BeginDate.Text = constract.StartDate.ToString("yyyy-MM-dd");
                DLC_EndDate.Text = constract.EndDate.ToString("yyyy-MM-dd");

                TB_DepartCode.Text = constract.DepartCode;
                LB_DepartName.Text = ShareClass.GetDepartName(constract.DepartCode);
                TB_PartA.Text = constract.PartA.Trim();
                TB_PartAOperator.Text = constract.PartAOperator.Trim();
                TB_PartB.Text = constract.PartB.Trim();
                TB_PartBOperator.Text = constract.PartBOperator.Trim();
                DL_Status.SelectedValue = constract.Status.Trim();

                LB_CustomerCode.Text = constract.RelatedCustomerCode;
                LB_VendorCode.Text = constract.RelatedVendorCode;

                LB_ConstractCode.Text = strConstractCode;

                //By LiuJianping 2013-10-10
                DL_ConstractNotice.SelectedValue = GetBMContractDiscussIDByConstractID(strConstractID);//end

                HL_RelatedDoc.Enabled = true;
                HL_RelatedDoc.NavigateUrl = "TTConstractRelatedDoc.aspx?ConstractCode=" + strConstractCode;

                HL_ConstractReviewBYWF.Enabled = true;
                HL_ConstractReviewBYWF.NavigateUrl = "TTRelatedDIYWorkflowForm.aspx?RelatedType=Constract&RelatedID=" + constract.ConstractID.ToString();

                HL_ConstractReview.Enabled = true;
                HL_ConstractReview.NavigateUrl = "TTConstractReviewWL.aspx?ConstractCode=" + strConstractCode;

                HL_WFTemName.Enabled = true;
                HL_WFTemName.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

                HL_TransferProject.Enabled = true;
                HL_TransferProject.NavigateUrl = "TTMakeProjectFromOther.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

                HL_MakeCollaboration.Enabled = true;
                HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=CONSTRACT&RelatedCode=" + strConstractCode;


                BT_AddProjectID.Enabled = true;

                LoadConstractSales(strConstractCode);
                LoadConstractRelatedUser(strConstractCode);
                LoadConstractRelatedProject(strConstractCode);
                LoadConstractRelatedGoodsSaleOrder(strConstractCode);
                LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
                LoadConstractRelatedAssetPurchaseOrder(strConstractCode);

                LoadConstractRelatedGoodsList(strConstractCode);

                LoadUnRelatedConstract(strConstractCode);
                LoadRelatedConstract(strConstractCode);

                LB_ParentCode.Text = constract.ParentCode.Trim();
                TB_ParentConstract.Text = GetConstractName(constract.ParentCode.Trim());

                LB_ConstractID.Text = strConstractID;


                //BusinessForm，列出关联表单模板
                try
                {
                    Panel_RelatedBusiness.Visible = true;

                    string strTemName;
                    strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = 'Constract' and RelatedID = " + strConstractID;
                    strHQL += " Order By CreateTime DESC";

                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();

                        DL_WLType.SelectedValue = ShareClass.GetWorkTemplateType(strTemName);
                        ShareClass.LoadWFTemplate(strUserCode, DL_WLType.SelectedValue.Trim(), DL_WFTemplate);
                        DL_WFTemplate.SelectedValue = strTemName;

                        DL_AllowUpdate.SelectedValue = ds.Tables[0].Rows[0]["AllowUpdate"].ToString().Trim();
                    }
                }
                catch
                {
                }

                //BusinessForm,装载关联信息
                TabContainer4.ActiveTabIndex = 0;
                ShareClass.LoadBusinessForm("Constract", strConstractID, DL_WFTemplate.SelectedValue.Trim(), IFrame_RelatedInformation);



                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Detail")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
                }
            }
        }

        if (e.CommandName == "Delete")
        {
            string strHQL;
            IList lst;
            int intConstractID;

            string strUserCode = LB_UserCode.Text.Trim();
            string strConstractCode = TB_ConstractCode.Text.Trim();

            strHQL = "Select * From T_Constract Where ParentCode = " + "'" + strConstractCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGZHTCZZHTBNSCQJC + "')", true);
                return;
            }

            if (strConstractCode != "")
            {
                strHQL = "from Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";
                ConstractBLL constractBLL = new ConstractBLL();
                lst = constractBLL.GetAllConstracts(strHQL);

                Constract constract = (Constract)lst[0];

                intConstractID = constract.ConstractID;
                constract.Status = "删除";

                try
                {
                    constractBLL.UpdateConstract(constract, intConstractID);

                    LoadUsingConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);
                    LoadDeletedConstract(strUserCode, strRelatedType, strRelatedID, strRelatedCode);

                    DL_Status.SelectedValue = "删除";

                    HL_RelatedDoc.Enabled = false;
                    HL_ConstractReview.Enabled = false;
                    HL_WFTemName.Enabled = false;


                    BT_AddProjectID.Enabled = false;


                    //if (strRelatedType == "WZConstract")
                    //{
                    //    string strHQL1;
                    //    strHQL1 = "Update T_WZCompact Set RelatedConstractCode = '' Where CompactCode = " + "'" + strRelatedCode + "'";
                    //    ShareClass.RunSqlCommand(strHQL1);
                    //}

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    //BusinessForm,工作流类型查询
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Visible = 'YES' and Authority = '所有'";
        strHQL += " Order by SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();

        DL_WFTemplate.Items.Add(new ListItem(""));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    //BusinessForm,启动关联的业务表单
    protected void BT_StartupBusinessForm_Click(object sender, EventArgs e)
    {
        string strURL;
        string strTemName, strIdentifyString;
        strTemName = DL_WFTemplate.SelectedValue.Trim();
        strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);

        string strConstractID;
        strConstractID = LB_ConstractID.Text.Trim();

        if (strConstractID == "")
        {
            strConstractID = "0";
        }

        //strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);


        strURL = "TTRelatedDIYBusinessForm.aspx?RelatedType=Constract&RelatedID=" + strConstractID + "&IdentifyString=" + strIdentifyString;
        IFrame_RelatedInformation.Attributes.Add("src", strURL);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    //BusinessForm,删除关联的业务表单
    protected void BT_DeleteBusinessForm_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strTemName;
        strTemName = DL_WFTemplate.SelectedValue.Trim();

        string strConstractID;
        strConstractID = LB_ConstractID.Text.Trim();

        strHQL = "Delete From T_RelatedBusinessForm Where RelatedType = 'Constract' and RelatedID = " + strConstractID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void LBT_CloseSalesWindow_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void BT_CreateSales_Click(object sender, EventArgs e)
    {
        LB_SalesID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false','popSalesWindow') ", true);
    }


    protected void BT_NewSales_Click(object sender, EventArgs e)
    {
        string strSalesID;

        strSalesID = LB_SalesID.Text;

        if (strSalesID == "")
        {
            AddSales();
        }
        else
        {
            UpdateSales();
        }
    }

    protected void AddSales()
    {
        string strSalesID, strSalesName, strDuty, strComment, strStatus;
        decimal deCommission;
        DateTime dtGiveTime;

        string strUserCode = LB_UserCode.Text.Trim();

        string strConstractCode = TB_ConstractCode.Text.Trim();

        strSalesID = LB_SalesID.Text.Trim();
        strSalesName = TB_SalesName.Text.Trim();
        strDuty = TB_SalesDuty.Text.Trim();
        strComment = TB_SalesComment.Text.Trim();
        strStatus = DL_CommissionStatus.SelectedValue.Trim();

        deCommission = NB_Commission.Amount;
        dtGiveTime = DateTime.Parse(DLC_GiveTime.Text);

        ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
        ConstractSales constractSales = new ConstractSales();

        constractSales.ConstractCode = strConstractCode;
        constractSales.SalesName = strSalesName;
        constractSales.Duty = strDuty;
        constractSales.Comment = strComment;
        constractSales.Commission = deCommission;
        constractSales.GiveTime = dtGiveTime;
        constractSales.CommissionStatus = strStatus;

        try
        {
            constractSalesBLL.AddConstractSales(constractSales);
            LB_SalesID.Text = ShareClass.GetMyCreatedMaxConstractSalesID(strConstractCode);

            LoadConstractSales(strConstractCode);
            LoadConstractRelatedGoodsSaleOrder(strConstractCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false','popSalesWindow') ", true);
        }
    }

    protected void UpdateSales()
    {
        string strHQL;
        IList lst;

        string strSalesID, strSalesName, strDuty, strComment, strStatus;
        decimal deCommission;
        DateTime dtGiveTime;

        string strUserCode = LB_UserCode.Text.Trim();

        string strConstractCode = TB_ConstractCode.Text.Trim();

        strSalesID = LB_SalesID.Text.Trim();
        strSalesName = TB_SalesName.Text.Trim();
        strDuty = TB_SalesDuty.Text.Trim();
        strComment = TB_SalesComment.Text.Trim();
        strStatus = DL_CommissionStatus.SelectedValue.Trim();

        deCommission = NB_Commission.Amount;
        dtGiveTime = DateTime.Parse(DLC_GiveTime.Text);

        strHQL = "From ConstractSales as constractSales Where constractSales.ID = " + strSalesID;
        ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
        lst = constractSalesBLL.GetAllConstractSaless(strHQL);

        ConstractSales constractSales = (ConstractSales)lst[0];

        constractSales.SalesName = strSalesName;
        constractSales.Duty = strDuty;
        constractSales.Comment = strComment;
        constractSales.Commission = deCommission;
        constractSales.GiveTime = dtGiveTime;
        constractSales.CommissionStatus = strStatus;

        try
        {
            constractSalesBLL.UpdateConstractSales(constractSales, int.Parse(strSalesID));

            LoadConstractSales(strConstractCode);
            LoadConstractRelatedGoodsSaleOrder(strConstractCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false','popSalesWindow') ", true);
        }

    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strUserCode;
            string strSalesID;

            strUserCode = LB_UserCode.Text.Trim();

            strSalesID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Detail")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;

                strHQL = "From ConstractSales as constractSales Where constractSales.ID = " + strSalesID;
                ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
                lst = constractSalesBLL.GetAllConstractSaless(strHQL);

                ConstractSales constractSales = (ConstractSales)lst[0];

                LB_SalesID.Text = constractSales.ID.ToString();
                TB_SalesName.Text = constractSales.SalesName.Trim();
                TB_SalesDuty.Text = constractSales.Duty.Trim();
                NB_Commission.Amount = constractSales.Commission;
                DL_CommissionStatus.SelectedValue = constractSales.CommissionStatus.Trim();
                TB_SalesComment.Text = constractSales.Comment.Trim();

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','false','popSalesWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strConstractCode = TB_ConstractCode.Text.Trim();

                ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
                ConstractSales constractSales = new ConstractSales();

                constractSales.ID = int.Parse(strSalesID);


                try
                {
                    constractSalesBLL.DeleteConstractSales(constractSales);

                    LoadConstractSales(strConstractCode);
                    LoadConstractRelatedGoodsSaleOrder(strConstractCode);


                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
            }
        }
    }



    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strHQL;
            string strConstractID, strConstractCode;

            strUserCode = LB_UserCode.Text.Trim();

            strConstractCode = e.Item.Cells[1].Text.Trim();

            if (e.CommandName == "Update")
            {
                strHQL = "from  Constract as constract where constract.ConstractCode= " + "'" + strConstractCode + "'";

                ConstractBLL constractBLL = new ConstractBLL();

                IList lst = constractBLL.GetAllConstracts(strHQL);

                for (int i = 0; i < DataGrid15.Items.Count; i++)
                {
                    DataGrid15.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                Constract constract = (Constract)lst[0];

                strConstractID = constract.ConstractID.ToString();
                LB_ConstractID.Text = strConstractID;

                TB_ConstractCode.Text = constract.ConstractCode.Trim();
                TB_ConstractName.Text = constract.ConstractName.Trim();

                DL_ConstractClass.SelectedValue = constract.ConstractClass;
                DL_Type.SelectedValue = constract.Type;
                DL_Currency.SelectedValue = constract.Currency.Trim();
                DL_ReAndPayType.SelectedValue = constract.ReAndPayType;

                if (strIsMobileDevice == "YES")
                {
                    HT_MainContent.Content = constract.MainContent.Trim();
                    HT_Exception.Content = constract.Exception.Trim();
                }
                else
                {
                    TB_MainContent.Text = constract.MainContent.Trim();
                    TB_Exception.Text = constract.Exception.Trim();
                }

                NB_Amount.Amount = constract.Amount;

                DLC_SignDate.Text = constract.SignDate.ToString("yyyy-MM-dd");
                DLC_BeginDate.Text = constract.StartDate.ToString("yyyy-MM-dd");
                DLC_EndDate.Text = constract.EndDate.ToString("yyyy-MM-dd");

                TB_DepartCode.Text = constract.DepartCode;
                LB_DepartName.Text = ShareClass.GetDepartName(constract.DepartCode);
                TB_PartA.Text = constract.PartA.Trim();
                TB_PartAOperator.Text = constract.PartAOperator.Trim();
                TB_PartB.Text = constract.PartB.Trim();
                TB_PartBOperator.Text = constract.PartBOperator.Trim();
                DL_Status.SelectedValue = constract.Status.Trim();

                LB_CustomerCode.Text = constract.RelatedCustomerCode;
                LB_VendorCode.Text = constract.RelatedVendorCode;

                LB_ConstractCode.Text = strConstractCode;

                //By LiuJianping 2013-10-10
                DL_ConstractNotice.SelectedValue = GetBMContractDiscussIDByConstractID(strConstractID);//end

                HL_RelatedDoc.Enabled = true;
                HL_RelatedDoc.NavigateUrl = "TTConstractRelatedDoc.aspx?ConstractCode=" + strConstractCode;

                HL_ConstractReviewBYWF.Enabled = true;
                HL_ConstractReviewBYWF.NavigateUrl = "TTRelatedDIYWorkflowForm.aspx?RelatedType=Constract&RelatedID=" + constract.ConstractID.ToString();

                HL_ConstractReview.Enabled = true;
                HL_ConstractReview.NavigateUrl = "TTConstractReviewWL.aspx?ConstractCode=" + strConstractCode;

                HL_WFTemName.Enabled = true;
                HL_WFTemName.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

                HL_TransferProject.Enabled = true;
                HL_TransferProject.NavigateUrl = "TTMakeProjectFromOther.aspx?RelatedType=Constract&RelatedID=" + strConstractID;

                HL_MakeCollaboration.Enabled = true;
                HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=CONSTRACT&RelatedCode=" + strConstractCode;


                BT_AddProjectID.Enabled = true;



                LoadConstractSales(strConstractCode);
                LoadConstractRelatedUser(strConstractCode);
                LoadConstractRelatedProject(strConstractCode);
                LoadConstractRelatedGoodsSaleOrder(strConstractCode);
                LoadConstractRelatedGoodsPurchaseOrder(strConstractCode);
                LoadConstractRelatedAssetPurchaseOrder(strConstractCode);

                LoadConstractRelatedGoodsList(strConstractCode);

                LB_ParentCode.Text = constract.ParentCode.Trim();
                TB_ParentConstract.Text = GetConstractName(constract.ParentCode.Trim());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }


    protected void DataGrid11_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strConstractCode;
            IList lst;

            strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            strConstractCode = TB_ConstractCode.Text.Trim();

            for (int i = 0; i < DataGrid11.Items.Count; i++)
            {
                DataGrid11.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            if (e.CommandName == "Update")
            {
                strHQL = "from ConstractRelatedGoods as constractRelatedGoods Where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";

                ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
                lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
                ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

                TB_GoodsCode.Text = constractRelatedGoods.GoodsCode;
                TB_GoodsName.Text = constractRelatedGoods.GoodsName;
                TB_ModelNumber.Text = constractRelatedGoods.ModelNumber;
                TB_Spec.Text = constractRelatedGoods.Spec;
                TB_Brand.Text = constractRelatedGoods.Brand;

                DL_GoodsType.SelectedValue = constractRelatedGoods.Type;
                DL_Unit.SelectedValue = constractRelatedGoods.Unit;
                NB_Number.Amount = constractRelatedGoods.Number;

                NB_Number.Amount = constractRelatedGoods.Number;
                NB_Price.Amount = constractRelatedGoods.Price;

                DL_Unit.SelectedValue = constractRelatedGoods.Unit;


                DLC_SaleTime.Text = constractRelatedGoods.SaleTime.ToString("yyyy-MM-dd");
                DLC_DeleveryTime.Text = constractRelatedGoods.DeleveryTime.ToString("yyyy-MM-dd");

                TB_SaleOrderNumber.Amount = constractRelatedGoods.SaleOrderNumber;
                TB_PurchaseOrderNubmer.Amount = constractRelatedGoods.PurchaseOrderNumber;


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
            }


            if (e.CommandName == "Delete")
            {
                ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
                strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ID = " + strID;
                lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
                ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

                try
                {
                    constractRelatedGoodsBLL.DeleteConstractRelatedGoods(constractRelatedGoods);

                    LoadConstractRelatedGoodsList(strConstractCode);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }

    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strConstractCode, strOperatorCode;

        strConstractCode = LB_ConstractCode.Text.Trim();

        if (strConstractCode != "")
        {
            strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
            ConstractRelatedUser constractRelatedUser = new ConstractRelatedUser();

            constractRelatedUser.ConstractCode = strConstractCode;
            constractRelatedUser.UserCode = strOperatorCode;
            constractRelatedUser.UserName = ShareClass.GetUserName(strOperatorCode);
            constractRelatedUser.Authority = "NO";

            try
            {
                constractRelatedUserBLL.AddConstractRelatedUser(constractRelatedUser);

                LoadConstractRelatedUser(strConstractCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZHTCNZJCY + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL, strConstractCode;
            IList lst;

            string strUserCode = e.Item.Cells[0].Text.Trim();

            strConstractCode = TB_ConstractCode.Text.Trim();
            strHQL = "from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.ConstractCode = " + "'" + strConstractCode + "'" + " and constractRelatedUser.UserCode = " + "'" + strUserCode + "'";
            ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
            lst = constractRelatedUserBLL.GetAllConstractRelatedUsers(strHQL);

            ConstractRelatedUser constractRelatedUser = (ConstractRelatedUser)lst[0];

            constractRelatedUserBLL.DeleteConstractRelatedUser(constractRelatedUser);

            LoadConstractRelatedUser(strConstractCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }

    protected void BT_UserAuthoritySave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode;
        string strAuthority;
        int i = 0, j = 0;

        try
        {
            for (i = 0; i < DataGrid12.Items.Count; i++)
            {
                strUserCode = DataGrid12.Items[i].Cells[0].Text.Trim();
                strAuthority = ((DropDownList)DataGrid12.Items[i].FindControl("DL_Authority")).SelectedValue;

                strHQL = "Update T_ConstractRelatedUser Set Authority = " + "'" + strAuthority + "'" + " Where UserCode = " + "'" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXSZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXSZSB + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }


    protected void BT_FindGroup_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGroupName = TB_ActorGroupName.Text.Trim();
        strGroupName = "%" + strGroupName + "%";

        strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
        strHQL += " and GroupName Like " + "'" + strGroupName + "'";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);
        Repeater1.DataSource = lst;
        Repeater1.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            int i = 0;
            string strConstractCode, strGroupName;
            string strUserCode;

            strGroupName = ((Button)e.Item.FindControl("BT_GroupName")).Text.Trim();
            DataGrid12.CurrentPageIndex = 0;

            TB_ActorGroupName.Text = strGroupName;

            strConstractCode = LB_ConstractCode.Text.Trim();

            ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
            ConstractRelatedUser constractRelatedUser = new ConstractRelatedUser();


            ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
            ActorGroupDetail actorGroupDetail = new ActorGroupDetail();

            if (strConstractCode != "")
            {
                strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'";
                lst = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);

                for (i = 0; i < lst.Count; i++)
                {
                    actorGroupDetail = (ActorGroupDetail)lst[i];

                    strUserCode = actorGroupDetail.UserCode.Trim();

                    constractRelatedUser.ConstractCode = strConstractCode;
                    constractRelatedUser.UserCode = strUserCode;
                    constractRelatedUser.UserName = ShareClass.GetUserName(strUserCode);
                    constractRelatedUser.Authority = "NO";

                    try
                    {
                        constractRelatedUserBLL.AddConstractRelatedUser(constractRelatedUser);
                    }
                    catch
                    {
                    }
                }

                LoadConstractRelatedUser(strConstractCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZHTCNZJCY + "')", true);
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
        }
    }


    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid14.Items.Count; i++)
            {
                DataGrid14.Items[i].ForeColor = Color.Black;
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

                }
                TB_ModelNumber.Text = item.ModelNumber;
                DL_Unit.SelectedValue = item.Unit;
                TB_Spec.Text = item.Specification;
                TB_Brand.Text = item.Brand;

                NB_Price.Amount = item.PurchasePrice;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
        }
    }

    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strGoodsCode;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            for (int i = 0; i < DataGrid13.Items.Count; i++)
            {
                DataGrid13.Items[i].ForeColor = Color.Black;
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
                TB_Brand.Text = goods.Manufacturer;

                DL_GoodsType.SelectedValue = goods.Type;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
        }
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;


        TabContainer2.ActiveTabIndex = 0;

        strType = DL_GoodsType.SelectedValue.Trim();
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
        DataGrid13.DataSource = ds;
        DataGrid13.DataBind();

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid14.DataSource =ds;
        DataGrid14.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }


    protected void BT_CreateGoodsList_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);
    }


    protected void BT_SaveGoods_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddGoods();
        }
        else
        {
            UpdateGoods();
        }
    }

    protected void AddGoods()
    {
        string strRecordID, strConstractCode, strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strStatus;
        string strUnitName;
        decimal decNumber;
        DateTime dtSaleTime, dtDeleveryTime;
        decimal dePrice;


        strConstractCode = TB_ConstractCode.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        decNumber = NB_Number.Amount;
        strSpec = TB_Spec.Text.Trim();
        dePrice = NB_Price.Amount;
        dtSaleTime = DateTime.Parse(DLC_SaleTime.Text);
        dtDeleveryTime = DateTime.Parse(DLC_DeleveryTime.Text);


        if (strType == "" | strGoodsName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

        }
        else
        {
            ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
            ConstractRelatedGoods constractRelatedGoods = new ConstractRelatedGoods();

            constractRelatedGoods.ConstractCode = strConstractCode;
            constractRelatedGoods.Type = strType;
            constractRelatedGoods.GoodsCode = strGoodsCode;
            constractRelatedGoods.GoodsName = strGoodsName;

            constractRelatedGoods.ModelNumber = strModelNumber;
            constractRelatedGoods.Spec = strSpec;
            constractRelatedGoods.Brand = TB_Brand.Text;

            constractRelatedGoods.Number = decNumber;
            constractRelatedGoods.Unit = strUnitName;
            constractRelatedGoods.Number = decNumber;
            constractRelatedGoods.Price = dePrice;

            constractRelatedGoods.Amount = decNumber * dePrice;

            constractRelatedGoods.SaleTime = dtSaleTime;
            constractRelatedGoods.DeleveryTime = dtDeleveryTime;

            constractRelatedGoods.SaleOrderNumber = TB_SaleOrderNumber.Amount;
            constractRelatedGoods.PurchaseOrderNumber = TB_PurchaseOrderNubmer.Amount;


            try
            {
                constractRelatedGoodsBLL.AddConstractRelatedGoods(constractRelatedGoods);

                strRecordID = ShareClass.GetMyCreatedMaxConstractRelatedGoodsID(strConstractCode);
                LB_ID.Text = strRecordID;

                LoadConstractRelatedGoodsList(strConstractCode);



                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

            }
        }
    }


    protected void UpdateGoods()
    {
        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strStatus;
        string strUnitName;
        DateTime dtSaleTime, dtDeleveryTime;
        decimal dePrice, deNumber;

        string strID, strConstractCode;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strConstractCode = TB_ConstractCode.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;
        deNumber = NB_Number.Amount;

        dtSaleTime = DateTime.Parse(DLC_SaleTime.Text);
        dtDeleveryTime = DateTime.Parse(DLC_DeleveryTime.Text);



        if (strType == "" | strGoodsName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

        }
        else
        {
            ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
            strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ID = " + strID;
            lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
            ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

            constractRelatedGoods.ConstractCode = strConstractCode;
            constractRelatedGoods.Type = strType;
            constractRelatedGoods.GoodsCode = strGoodsCode;
            constractRelatedGoods.GoodsName = strGoodsName;
            constractRelatedGoods.ModelNumber = strModelNumber;
            constractRelatedGoods.Spec = strSpec;
            constractRelatedGoods.Brand = TB_Brand.Text;

            constractRelatedGoods.Number = deNumber;
            constractRelatedGoods.Unit = strUnitName;
            constractRelatedGoods.Price = dePrice;

            constractRelatedGoods.Amount = deNumber * dePrice;

            constractRelatedGoods.SaleTime = dtSaleTime;
            constractRelatedGoods.DeleveryTime = dtDeleveryTime;

            constractRelatedGoods.SaleOrderNumber = TB_SaleOrderNumber.Amount;
            constractRelatedGoods.PurchaseOrderNumber = TB_PurchaseOrderNubmer.Amount;


            try
            {
                constractRelatedGoodsBLL.UpdateConstractRelatedGoods(constractRelatedGoods, int.Parse(strID));

                LoadConstractRelatedGoodsList(strConstractCode);


                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popGoodsListWindow') ", true);

            }
        }
    }

    protected void BT_DeleteGoods_Click(object sender, EventArgs e)
    {
        string strID = LB_ID.Text.Trim();
        string strConstractCode = TB_ConstractCode.Text.Trim();

        string strHQL;
        IList lst;

        ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
        strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ID = " + strID;
        lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
        ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

        try
        {
            constractRelatedGoodsBLL.DeleteConstractRelatedGoods(constractRelatedGoods);

            LoadConstractRelatedGoodsList(strConstractCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strHQL;
            string strProjectID, strConstractCode;
            IList lst;

            strUserCode = LB_UserCode.Text.Trim();
            strConstractCode = LB_ConstractCode.Text.Trim();

            strProjectID = e.Item.Cells[0].Text.Trim();

            strHQL = "from ConstractRelatedProject as constractRelatedProject where constractRelatedProject.ProjectID = " + strProjectID;
            strHQL += " and constractRelatedProject.ConstractCode = " + "'" + strConstractCode + "'";
            ConstractRelatedProjectBLL constractRelatedProjectBLL = new ConstractRelatedProjectBLL();
            lst = constractRelatedProjectBLL.GetAllConstractRelatedProjects(strHQL);

            ConstractRelatedProject constractRelatedProject = (ConstractRelatedProject)lst[0];

            try
            {
                constractRelatedProjectBLL.DeleteConstractRelatedProject(constractRelatedProject);
                LoadConstractRelatedProject(strConstractCode);
            }
            catch
            {
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid15_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid15.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql15.Text;

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid15.DataSource = lst;
        DataGrid15.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);

    }

    protected void DataGrid16_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid16.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql16.Text;

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid16.DataSource = lst;
        DataGrid16.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }


    protected void BT_AddProjectID_Click(object sender, EventArgs e)
    {
        string strProjectID, strConstractCode;
        string strHQL;
        IList lst;

        strProjectID = TB_ProjectID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        if (lst.Count > 0)
        {
            ConstractRelatedProjectBLL constractRelatedProjectBLL = new ConstractRelatedProjectBLL();
            ConstractRelatedProject constractRelatedProject = new ConstractRelatedProject();

            constractRelatedProject.ProjectID = int.Parse(strProjectID);
            constractRelatedProject.ConstractCode = strConstractCode;

            try
            {
                constractRelatedProjectBLL.AddConstractRelatedProject(constractRelatedProject);
                LoadConstractRelatedProject(strConstractCode);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJSBXMHCWWCXMSC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    //添加相关对象到合同
    protected void AddRelatedObjectToConstract(string strConstractCode, string strRelatedType, string strRelatedID)
    {
        string strHQL;


        if (strRelatedType == "PROJECT")
        {
            strHQL = "Select * From T_ConstractRelatedProject Where ProjectID = " + strRelatedID + " and ConstractCode = " + "'" + strConstractCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractRelatedProject");
            if (ds.Tables[0].Rows.Count == 0)
            {
                ConstractRelatedProjectBLL constractRelatedProjectBLL = new ConstractRelatedProjectBLL();
                ConstractRelatedProject constractRelatedProject = new ConstractRelatedProject();

                constractRelatedProject.ProjectID = int.Parse(strRelatedID);
                constractRelatedProject.ConstractCode = strConstractCode;

                try
                {
                    constractRelatedProjectBLL.AddConstractRelatedProject(constractRelatedProject);
                    LoadConstractRelatedProject(strConstractCode);
                }
                catch
                {
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJSBXMHCWWCXMSC + "')", true);
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }

    protected void DL_Customer_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strCustomerCode, strContactName;

        strCustomerCode = DL_CustomerList.SelectedValue.Trim();
        strHQL = "Select COALESCE(ContactName,'') From T_Customer Where CustomerCode = " + "'" + strCustomerCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Customer");
            strContactName = ds.Tables[0].Rows[0][0].ToString();

            LB_CustomerCode.Text = DL_CustomerList.SelectedValue.Trim();
            TB_PartAOperator.Text = strContactName;
            TB_PartA.Text = DL_CustomerList.SelectedItem.Text;
        }
        catch
        {
            LB_CustomerCode.Text = "";
            TB_PartAOperator.Text = "";
            TB_PartA.Text = "";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strContactName;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(ContactName,'') From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(TechnicalDirector,'') From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strContactName = ds.Tables[0].Rows[0][0].ToString();
            LB_VendorCode.Text = DL_VendorList.SelectedValue.Trim();
            TB_PartBOperator.Text = strContactName;
            TB_PartB.Text = DL_VendorList.SelectedItem.Text;
        }
        catch
        {
            LB_VendorCode.Text = "";
            TB_PartBOperator.Text = "";
            TB_PartB.Text = "";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void LoadUsingConstract(string strUserCode, string strRelatedType, string strRelatedID, string strRelatedCode)
    {
        string strHQL;
        IList lst;

        ConstractBLL constractBLL = new ConstractBLL();
        if (strRelatedType == "PROJECT")
        {
            strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'";
            strHQL += " and constract.ConstractCode in (Select constractRelatedProject.ConstractCode From ConstractRelatedProject as constractRelatedProject Where constractRelatedProject.ProjectID = " + strRelatedID + ")";
            strHQL += " and constract.Status not in ('归档','删除') ";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst = constractBLL.GetAllConstracts(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;
        }

        if (strRelatedType == "WZConstract")
        {
            strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'";
            strHQL += " and constract.ConstractCode in (Select wzCompact.RelatedConstractCode From WZCompact as wzCompact Where wzCompact.RelatedConstractCode = " + "'" + strRelatedCode + "'" + ")";
            strHQL += " and constract.Status not in ('归档','删除') ";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst = constractBLL.GetAllConstracts(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;
        }
    }

    protected void LoadDeletedConstract(string strUserCode, string strRelatedType, string strRelatedID, string strRelatedCode)
    {
        string strHQL;
        IList lst;

        ConstractBLL constractBLL = new ConstractBLL();

        if (strRelatedType == "PROJECT")
        {
            strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'";
            strHQL += " and constract.ConstractCode in (Select constractRelatedProject.ConstractCode From ConstractRelatedProject as constractRelatedProject Where constractRelatedProject.ProjectID = " + strRelatedID + ")";
            strHQL += " and constract.Status = '删除'";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst = constractBLL.GetAllConstracts(strHQL);

            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();

            LB_Sql15.Text = strHQL;
        }

        if (strRelatedType == "WZConstract")
        {
            strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'";
            strHQL += " and constract.ConstractCode in (Select wzCompact.RelatedConstractCode From WZCompact as wzCompact Where wzCompact.RelatedConstractCode = " + "'" + strRelatedCode + "'" + ")";
            strHQL += " and constract.Status = '删除'";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst = constractBLL.GetAllConstracts(strHQL);

            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();

            LB_Sql15.Text = strHQL;
        }
    }

    protected void LoadUnRelatedConstract(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where  constract.Status not in ('归档','删除') ";
        strHQL += " and constract.ConstractCode not in (Select constractRelatedConstract.RelatedConstractCode From ConstractRelatedConstract as constractRelatedConstract Where constractRelatedConstract.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        DataGrid16.DataSource = lst;
        DataGrid16.DataBind();

        LB_Sql16.Text = strHQL;
    }

    protected void LoadRelatedConstract(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.Status not in ('归档','删除') ";
        strHQL += " and constract.ConstractCode in (Select constractRelatedConstract.RelatedConstractCode From ConstractRelatedConstract as constractRelatedConstract Where constractRelatedConstract.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        DataGrid17.DataSource = lst;
        DataGrid17.DataBind();

        LB_Sql17.Text = strHQL;
    }

    protected void LoadGoodsSaleOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " and goodsSaleOrder.SalesCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadConstractSales(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From ConstractSales as constractSales Where constractSales.ConstractCode = " + "'" + strConstractCode + "'" + " Order By constractSales.ID ASC";
        ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
        lst = constractSalesBLL.GetAllConstractSaless(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadMembersGoodsSaleOrder(string strUserCode, string strDepartString, DataGrid dataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where ";
        strHQL += " goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or goodsSaleOrder.SalesCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }

    protected void LoadMembersGoodsPurchaseOrder(string strUserCode, string strDepartString, DataGrid dataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where ";
        strHQL += " goodsPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or goodsPurchaseOrder.PurManCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by goodsPurchaseOrder.POID DESC";
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }

    protected void LoadMembersAssetPurchaseOrder(string strUserCode, string strDepartString, DataGrid dataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where ";
        strHQL += " assetPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or assetPurchaseOrder.PurManCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " Order by assetPurchaseOrder.POID DESC";
        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }

    protected int GetConstractCount(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        return lst.Count;
    }

    protected void LoadConstractRelatedUser(string strConstractCode)
    {
        string strHQL;
        IList lst;

        string strAuthority;

        strHQL = "from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
        lst = constractRelatedUserBLL.GetAllConstractRelatedUsers(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();

        for (int i = 0; i < lst.Count; i++)
        {
            strAuthority = ((ConstractRelatedUser)lst[i]).Authority.Trim();

            ((DropDownList)DataGrid12.Items[i].FindControl("DL_Authority")).SelectedValue = strAuthority;
        }
    }

    protected void LoadConstractRelatedProject(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID in ( select constractRelatedProject.ProjectID from  ConstractRelatedProject as constractRelatedProject where constractRelatedProject.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }


    protected void LoadConstractRelatedGoodsSaleOrder(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.SOID in ( select constractRelatedGoodsSaleOrder.SOID from  ConstractRelatedGoodsSaleOrder as constractRelatedGoodsSaleOrder where constractRelatedGoodsSaleOrder.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadConstractRelatedGoodsPurchaseOrder(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID in ( select constractRelatedGoodsPurchaseOrder.POID from  ConstractRelatedGoodsPurchaseOrder as constractRelatedGoodsPurchaseOrder where constractRelatedGoodsPurchaseOrder.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        DataGrid8.DataSource = lst;
        DataGrid8.DataBind();
    }

    protected void LoadConstractRelatedAssetPurchaseOrder(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.POID in ( select constractRelatedAssetPurchaseOrder.POID from  ConstractRelatedAssetPurchaseOrder as constractRelatedAssetPurchaseOrder where constractRelatedAssetPurchaseOrder.ConstractCode = " + "'" + strConstractCode + "'" + ")";
        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        DataGrid10.DataSource = lst;
        DataGrid10.DataBind();
    }

    protected void LoadConstractRelatedGoodsList(string strConstractCode)
    {
        string strHQL;
        IList lst;


        ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
        strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }

    protected void LoadCustomerList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Customer as customer ";
        strHQL += " Where (customer.CreatorCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order by customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DL_CustomerList.DataSource = lst;
        DL_CustomerList.DataBind();

        DL_CustomerList.Items.Insert(0, new ListItem("--请选择客户--", ""));
    }

    public string GetConstractName(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Constract as constract Where constract.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractBLL constractBLL = new ConstractBLL();

        try
        {
            lst = constractBLL.GetAllConstracts(strHQL);
            Constract constract = (Constract)lst[0];
            return constract.ConstractName.Trim();
        }
        catch
        {
            return "";
        }
    }

}

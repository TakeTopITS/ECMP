using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTMakeProjectForEngineeringIndustry : System.Web.UI.Page
{
    string strIsMobileDevice, strProjectUserCode;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strDepartString, strProjectType;

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_AcceptStandard);
        _FileBrowser.SetupCKEditor(HE_ProjectDetail);

        strProjectUserCode = Session["UserCode"].ToString().Trim();
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "工程项目立项", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_ProjectDetail.Visible = true;
                HT_AcceptStandard.Visible = true;

            }
            else
            {
                HE_ProjectDetail.Visible = true;
                HE_AcceptStandard.Visible = true;
            }


            TXT_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TXT_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView2, strUserCode);
            LB_DepartString.Text = strDepartString;
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView3, strUserCode);

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);
            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_PM);

            ShareClass.LoadProjectType(DL_ProjectType);

            LoadFundingSource();

            LoadMyCreateProjectList(strUserCode);

            strProjectType = DL_ProjectType.SelectedItem.Text.Trim();
            ShareClass.LoadProjectForPMStatus(strProjectType, strLangCode, DL_Status);

            LB_BelongDepartCode.Text = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            LB_BelongDepartName.Text = ShareClass.GetDepartName(LB_BelongDepartCode.Text.Trim());

            BindProjectAttribute();
            BindProjectNature();

            //BusinessForm,列出业务表单类型 
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);

            //列出可用的工作流模板
            ShareClass.LoadProjectPlanStartupRelatedWorkflowTemplate(strUserCode, DL_PlanStartupRelatedWorkflowTemplate);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strProjectName, strHQL;
        string strUserName;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strProjectID = treeNode.Target.Trim();

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strUserName = LB_UserName.Text.Trim();
        strProjectName = project.ProjectName.Trim();

        LB_ParentProjectID.Text = project.ProjectID.ToString();
        TB_ParentProject.Text = project.ProjectName.Trim();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_MyMember_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();

        ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_PM);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_CreateObjectCode_Click(object sender, EventArgs e)
    {
        TB_ProjectCode.Text = CreateNewProjectCode();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Order By projectMember.SortNumber DESC";

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DL_PM.DataSource = lst;
            DL_PM.DataBind();
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            LB_BelongDepartCode.Text = strDepartCode;
            LB_BelongDepartName.Text = ShareClass.GetDepartName(strDepartCode);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }
    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectName, strPMName;

        strProjectName = TB_FindProjectName.Text.Trim();
        strProjectName = "%" + strProjectName + "%";

        strPMName = TB_FindPMName.Text.Trim();
        strPMName = "%" + strPMName + "%";

        strHQL = "From Project as project Where project.ProjectName Like " + "'" + strProjectName + "'" + " and project.PMName Like " + "'" + strPMName + "'";
        strHQL += " Order By project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    //BusinessForm，判断后续是否可以改表单内容
    protected void DL_AllowUpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strProjectID, strAllowUpdate;

        strAllowUpdate = DL_AllowUpdate.SelectedValue;
        strProjectID = LB_ProjectID.Text.Trim();

        try
        {
            strHQL = "Update T_RelatedBusinessForm Set AllowUpdate = '" + strAllowUpdate + "'  Where RelatedType = 'Project' and RelatedID = " + strProjectID;
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

        LB_ProjectID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strProjectID;

        strProjectID = LB_ProjectID.Text.Trim();

        if (strProjectID == "")
        {
            AddProject();
        }
        else
        {
            UpdateProject();
        }
    }

    protected void AddProject()
    {
        string strProjectID, strProjectCode;
        string strPMCode, strCustomerPMName, strUserCode, strUserName, strStatus, strStatusValue, strBeginDate;
        string strEndDate, strProject, strDetail, strAcceptStandard, strParentID;
        string strBudget = NB_Budget.Amount.ToString();
        string strProjectType, strCurrencyType, strPriority;
        decimal deProjectAmount, deManHour, deManNumber;

        strProjectCode = TB_ProjectCode.Text.Trim();

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();
        strPMCode = DL_PM.SelectedValue.Trim();
        strCustomerPMName = TB_CustomerPMName.Text.Trim();

        strBeginDate = TXT_BeginDate.Text;
        strEndDate = TXT_EndDate.Text;

        strProject = TB_ProjectName.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strBudget = NB_Budget.Amount.ToString();

        if (strIsMobileDevice == "YES")
        {
            strDetail = HT_ProjectDetail.Text.Trim();
            strAcceptStandard = HT_AcceptStandard.Text.Trim();
        }
        else
        {
            strDetail = HE_ProjectDetail.Text.Trim();
            strAcceptStandard = HE_AcceptStandard.Text.Trim();
        }

        strParentID = LB_ParentProjectID.Text.Trim();
        deProjectAmount = NB_ProjectAmount.Amount;
        deManHour = NB_ManHour.Amount;
        deManNumber = NB_ManNubmer.Amount;
        strStatus = DL_Status.SelectedValue;
        strStatusValue = DL_StatusValue.SelectedValue.Trim();

        if (strBudget == "")
        {
            strBudget = "0";
        }

        if (!string.IsNullOrEmpty(DDL_ProjectAttribute.SelectedValue) && !string.IsNullOrEmpty(DDL_ProjectNature.SelectedValue))
        {
            string strProjectName = TB_ProjectName.Text.Trim();
            string strProjectManager = DL_PM.SelectedValue;
            string strStartTime = TXT_StartTime.Text.Trim();
            string strEndTime = TXT_EndTime.Text.Trim();
            string strPowerPurchase = DL_AuthorizedProcurement.SelectedValue;

            string strForCost = NB_ABudgetFor.Text.Trim();
            string strSelfCost = NB_SincePurchaseBudget.Text.Trim();
            string strBuildUnit = TB_ConstructionUnit.Text.Trim();
            string strSupervisorUnit = TB_SupervisionUnit.Text.Trim();
            string strProjectDesc = HE_ProjectDetail.Text.Trim();

            //string strMarkTime = TXT_MarkTime.Text;
            string strMarker = strProjectUserCode; //HF_Marker.Value;

            string strRelatedCode = TB_ProjectCode.Text.Trim();


            //主管领导，费控主管，材料员，使用标记
            string strLeader = HF_Leader.Value;
            string strFeeManage = HF_FeeManage.Value;
            string strMaterialPerson = HF_MaterialPerson.Value;

            string strIsMark = DDL_IsMark.SelectedValue;
            int intIsMark = 0;
            int.TryParse(strIsMark, out intIsMark);

            string strUnitType = DDL_UnitType.SelectedValue;

            strPriority = DL_Priority.SelectedValue.Trim();

            if (strLangCode == "" | strFeeManage == "" | strMaterialPerson == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.LDZGCLYBNWK + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }

            if (string.IsNullOrEmpty(strProjectName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            else
            {
                if (!ShareClass.CheckStringRight(strProjectName))
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBNBHFFZF + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }
                if (strProjectName.Length > 30)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBNCG30GZF + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }
            }
            if (string.IsNullOrEmpty(strProjectManager))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMJLBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strStartTime))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKGRBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strEndTime))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWGRBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strForCost))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGYSBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (!ShareClass.CheckIsNumber(strForCost))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGYSBXWXSHZZS + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strSelfCost))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZGYSBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (!ShareClass.CheckIsNumber(strSelfCost))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZGYSBXWXSHZZS + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strBuildUnit))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSDWBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            else
            {
                if (strBuildUnit.Length > 20)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSDWBNCG20GZF + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }
            }
            if (string.IsNullOrEmpty(strSupervisorUnit))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLDWBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            else
            {
                if (strSupervisorUnit.Length > 20)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLDWBNCG20GZF + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                    return;
                }
            }
            if (!ShareClass.CheckStringRight(strProjectDesc))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMSBNBHFFZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (strProjectDesc.Length > 2000)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMSBNCG2000GZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (string.IsNullOrEmpty(strUnitType))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDWLXBYXWKBC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }

        //if (strProjectCode != "")
        //{
        //    if (ShareClass.GetProjecCountByProjectCodeAndID(strProjectCode, "0") > 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCZXTDXMDMDXMJC + "')", true);

        //        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        //        return;
        //    }
        //}

        if (strParentID == "")
        {
            strParentID = "1";
        }

        if (strPMCode == "" | strStatus == "" | strBeginDate == "" | strEndDate == "" | strProject == "" | strDetail == "" | strAcceptStandard == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            string strProjectAttribute = DDL_ProjectAttribute.SelectedValue;
            string strProjectNature = DDL_ProjectNature.SelectedValue;


            ProjectBLL projectBLL = new ProjectBLL();
            projectBLL = new ProjectBLL();
            Project project = new Project();

            project.ProjectCode = strProjectCode;
            project.UserCode = strUserCode;
            project.UserName = ShareClass.GetUserName(strUserCode);
            project.PMCode = strPMCode;
            project.PMName = ShareClass.GetUserName(strPMCode);
            project.CustomerPMName = strCustomerPMName;
            project.ProjectName = strProject;
            project.ProjectType = strProjectType;
            project.ProjectClass = "常规项目";
            project.ProjectAmount = NB_ProjectAmount.Amount;
            project.Budget = decimal.Parse(strBudget);
            project.ManHour = deManHour;
            project.CurrencyType = strCurrencyType;
            project.ManNumber = deManNumber;
            project.ProjectDetail = strDetail;
            project.AcceptStandard = strAcceptStandard;
            project.BeginDate = DateTime.Parse(strBeginDate);
            project.EndDate = DateTime.Parse(strEndDate);
            project.MakeDate = DateTime.Now;
            project.Status = strStatus;
            project.StatusValue = "进行中";
            project.ParentID = int.Parse(strParentID);

            project.Priority = DL_Priority.SelectedValue.Trim();

            project.BelongDepartCode = LB_BelongDepartCode.Text.Trim();
            project.BelongDepartName = LB_BelongDepartName.Text.Trim();

            try
            {
                projectBLL.AddProject(project);

                strProjectID = ShareClass.GetMyCreatedMaxProjectID(strUserCode);
                LB_ProjectID.Text = strProjectID;

                //保存项目的经纬度
                UpdateProjectLongitudeLatitude(strProjectID);

                //保存项目的其它属性
                UpdateProjectOtherFieldValue(strProjectID);

                // 更新客户项目属性值
                UpdateProjectOtherFieldForCustomer(strProjectID);

                string strNewProjectCode = ShareClass.GetCodeByRule("ProjectCode", strProjectType, strProjectID);
                if (strNewProjectCode != "")
                {
                    TB_ProjectCode.Text = strNewProjectCode;
                    string strHQL = "Update T_Project Set ProjectCode = " + "'" + strNewProjectCode + "'" + " Where ProjectID = " + strProjectID;
                    ShareClass.RunSqlCommand(strHQL);
                }

                //保存到物资表中
                if (!string.IsNullOrEmpty(DDL_ProjectAttribute.SelectedValue) && !string.IsNullOrEmpty(DDL_ProjectNature.SelectedValue))
                {
                    ProjectWZDetailData(strProjectID, "1");
                }

                CB_SMS.Enabled = true;
                CB_Mail.Enabled = true;
                BT_Send.Enabled = true;

                //2013-08-26 LiuJianping

                HL_CustomerInfo.Enabled = true;
                HL_CustomerInfo.NavigateUrl = "TTProjectCustomerInfo.aspx?ProjectID=" + strProjectID;


                TB_Message.Text = strUserName + " 给你建立了项目 ：" + strProjectID + " " + strProject + "，请及时收理！";

                LoadProject(strUserCode);

                //依项目类型添加关联的工作流模板和文档模板
                ShareClass.AddRelatedWorkFlowTemplateByProjectType(strProjectType, strProjectID, "Project", "Project", "ProjectType");
                //ShareClass.AddRelatedDocumentTemplateByProjectType(strProjectType, strProjectID, "项目", "ProjectType");


                ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void UpdateProject()
    {
        string strProjectID, strProjectCode;
        string strProjectType;
        string strUserCode, strCustomerPMName, strUserName, strStatus, strStatusValue, strBeginDate;
        string strEndDate, strProject, strDetail, strAcceptStandard, strParentID, strPriority;
        string strBudget;
        string strHQL;

        IList lst;
        string strPMCode;
        decimal deProjectAmount, deManHour, deManNumber;

        string strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue;

        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        RelatedUser relatedUser = new RelatedUser();

        strUserCode = LB_UserCode.Text;
        strUserName = ShareClass.GetUserName(strUserCode);
        strPMCode = DL_PM.SelectedValue.Trim();
        strCustomerPMName = TB_CustomerPMName.Text.Trim();

        strBeginDate = TXT_BeginDate.Text;
        strEndDate = TXT_EndDate.Text;

        strProject = TB_ProjectName.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();

        strPriority = DL_Priority.SelectedValue.Trim();

        if (strIsMobileDevice == "YES")
        {
            strDetail = HT_ProjectDetail.Text.Trim();
            strAcceptStandard = HT_AcceptStandard.Text.Trim();
        }
        else
        {
            strDetail = HE_ProjectDetail.Text.Trim();
            strAcceptStandard = HE_AcceptStandard.Text.Trim();
        }

        deProjectAmount = NB_ProjectAmount.Amount;
        deManHour = NB_ManHour.Amount;
        deManNumber = NB_ManNubmer.Amount;
        strStatus = DL_Status.SelectedValue.Trim();
        strStatusValue = DL_StatusValue.SelectedValue.Trim();

        strParentID = LB_ParentProjectID.Text.Trim();
        strProjectID = LB_ProjectID.Text;
        strProjectCode = TB_ProjectCode.Text.Trim();
        strBudget = NB_Budget.Amount.ToString();

        strNewStatus = DL_Status.SelectedValue.Trim();
        strNewStatusValue = DL_StatusValue.SelectedValue.Trim();

        if (strProjectCode != "")
        {
            if (ShareClass.GetProjecCountByProjectCodeAndID(strProjectCode, strProjectID) > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCZXTDXMDMDXMJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }

        if (strParentID == strProjectID)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWBNZSHZXMZWFXMJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        if (strPMCode == "" | strStatus == "" | strBeginDate == "" | strEndDate == "" | strProject == "" | strDetail == "" | strAcceptStandard == "" | strParentID == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            ProjectBLL projectBLL = new ProjectBLL();
            lst = projectBLL.GetAllProjects(strHQL);
            Project project = (Project)lst[0];

            strOldStatus = project.Status.Trim();
            strOldStatusValue = project.StatusValue.Trim();

            project.ProjectCode = strProjectCode;
            project.UserCode = strUserCode;
            project.UserName = ShareClass.GetUserName(strUserCode);
            project.PMCode = strPMCode;
            project.PMName = ShareClass.GetUserName(strPMCode);
            project.CustomerPMName = strCustomerPMName;
            project.ProjectName = strProject;
            project.ProjectType = strProjectType;
            project.Budget = decimal.Parse(strBudget);
            project.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
            project.ProjectDetail = strDetail;
            project.AcceptStandard = strAcceptStandard;
            project.BeginDate = DateTime.Parse(strBeginDate);
            project.EndDate = DateTime.Parse(strEndDate);
            project.MakeDate = DateTime.Now;
            project.Status = strStatus;
            project.StatusValue = strStatusValue;
            project.ProjectAmount = deProjectAmount;
            project.ManHour = deManHour;
            project.ManNumber = deManNumber;

            project.ParentID = int.Parse(strParentID);
            project.Priority = strPriority;

            project.BelongDepartCode = LB_BelongDepartCode.Text.Trim();
            project.BelongDepartName = LB_BelongDepartName.Text.Trim();

            if (strProjectID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXMBNXGJC + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            else
            {
                try
                {
                    projectBLL.UpdateProject(project, int.Parse(strProjectID));


                    //保存项目的其它属性
                    UpdateProjectOtherFieldValue(strProjectID);

                    // 更新客户项目属性值
                    UpdateProjectOtherFieldForCustomer(strProjectID);

                    //保存项目的经纬度
                    UpdateProjectLongitudeLatitude(strProjectID);


                    //BusinessForm，关联相应的业务表单模板
                    ShareClass.SaveRelatedBusinessForm("Project", strProjectID, DL_WFTemplate.SelectedValue, DL_AllowUpdate.SelectedValue, strUserCode);

                    if (!string.IsNullOrEmpty(DDL_ProjectAttribute.SelectedValue) && !string.IsNullOrEmpty(DDL_ProjectNature.SelectedValue))
                    {
                        ProjectWZDetailData(strProjectID, "2");
                    }

                    AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue);
                    LB_Status.Text = strNewStatus;

                    LoadProject(strUserCode);

                    //依项目类型添加关联的工作流模板和文档模板
                    ShareClass.AddRelatedWorkFlowTemplateByProjectType(strProjectType, strProjectID, "Project", "Project", "ProjectType");
                    //ShareClass.AddRelatedDocumentTemplateByProjectType(strProjectType, strProjectID, "项目", "ProjectType");


                    ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

                    TB_Message.Text = strUserName + " 更新了项目： " + strProjectID + " " + strProject + "的内容,请关注，特此通知！";

                    LB_Sql.Text = strHQL;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
            }
        }
    }

    //保存项目的经纬度
    protected void UpdateProjectLongitudeLatitude(string strProjectID)
    {
        string strHQL;

        string strLongitude, strLatitude;
        strLongitude = TB_Longitude.Text.Trim();
        strLatitude = TB_Latitude.Text.Trim();

        strHQL = "Update T_Project Set Longitude = '" + strLongitude + "' Where ProjectID = " + strProjectID;
        ShareClass.RunSqlCommand(strHQL);
        strHQL = "Update T_Project Set Latitude = '" + strLatitude + "' Where ProjectID = " + strProjectID;
        ShareClass.RunSqlCommand(strHQL);
    }

    //更新客户项目属性值 
    protected void UpdateProjectOtherFieldForCustomer(string strProjectID)
    {
        string strAttachFile, strProjectDirection, strBudgetAccount, strProjectLocation, strFundingSource;

        strAttachFile = TB_AttachFile.Text.Trim();
        strProjectDirection = TB_ProjectDirection.Text.Trim();
        strBudgetAccount = TB_BudgetAccount.Text.Trim();
        strProjectLocation = TB_ProjectLocation.Text.Trim();
        strFundingSource = DL_FundingSource.SelectedValue.Trim();

        string strHQL;

        strHQL = string.Format(@"Update T_Project Set AttachFile = '{0}',ProjectDirection='{1}',BudgetAccount ='{2}',ProjectLocation='{3}',FundingSource ='{4}'
                          Where ProjectID ={5}", strAttachFile, strProjectDirection, strBudgetAccount, strProjectLocation,strFundingSource, strProjectID);
        ShareClass.RunSqlCommand(strHQL);
    }

    protected void DL_ProjectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType;

        strType = DL_ProjectType.SelectedValue.Trim();

        ShareClass.LoadProjectForPMStatus(strType, strLangCode, DL_Status);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    /// <summary>
    /// 物资项目操作
    /// </summary>
    /// <param name="strProjectID">项目ID</param>
    /// <param name="strGold">1 增加；2 更新；3 删除</param>
    protected void ProjectWZDetailData(string strProjectID, string strGold)
    {
        WZProjectBLL wZProjectBLL = new WZProjectBLL();

        string strProjectName = TB_ProjectName.Text.Trim();
        string strProjectManager = DL_PM.SelectedValue;
        string strStartTime = TXT_StartTime.Text.Trim();
        string strEndTime = TXT_EndTime.Text.Trim();
        string strPowerPurchase = DL_AuthorizedProcurement.SelectedValue;

        string strForCost = NB_ABudgetFor.Text.Trim();
        string strSelfCost = NB_SincePurchaseBudget.Text.Trim();
        string strBuildUnit = TB_ConstructionUnit.Text.Trim();
        string strSupervisorUnit = TB_SupervisionUnit.Text.Trim();
        string strProjectDesc = HE_ProjectDetail.Text.Trim();

        //string strMarkTime = TXT_MarkTime.Text;
        string strMarker = strProjectUserCode; //HF_Marker.Value;

        string strRelatedCode = TB_ProjectCode.Text.Trim();


        //主管领导，费控主管，材料员，使用标记
        //string strLeader = DDL_Leader.SelectedValue;
        //string strFeeManage = DDL_FeeManage.SelectedValue;
        //string strMaterialPerson = DDL_MaterialPerson.SelectedValue;
        string strLeader = HF_Leader.Value;
        string strFeeManage = HF_FeeManage.Value;
        string strMaterialPerson = HF_MaterialPerson.Value;

        string strIsMark = DDL_IsMark.SelectedValue;
        int intIsMark = 0;
        int.TryParse(strIsMark, out intIsMark);

        string strUnitType = DDL_UnitType.SelectedValue;

        string strProjectAttribute = DDL_ProjectAttribute.SelectedValue.Trim();
        string strProjectNature = DDL_ProjectNature.SelectedValue.Trim();

        if (string.IsNullOrEmpty(strProjectName))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        else
        {
            if (!ShareClass.CheckStringRight(strProjectName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBNBHFFZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
            if (strProjectName.Length > 30)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCBNCG30GZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }
        if (string.IsNullOrEmpty(strProjectManager))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMJLBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        if (string.IsNullOrEmpty(strStartTime))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZKGRBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        if (string.IsNullOrEmpty(strEndTime))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWGRBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        if (string.IsNullOrEmpty(strForCost))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGYSBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        //if (!ShareClass.CheckIsNumber(strForCost))
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('"+Resources.lang.ZZJGGSBXWXSHZZS+"')", true);
        //    return;
        //}
        if (string.IsNullOrEmpty(strSelfCost))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZGYSBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        if (string.IsNullOrEmpty(strBuildUnit))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSDWBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        else
        {
            if (strBuildUnit.Length > 20)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJSDWBNCG20GZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }
        if (string.IsNullOrEmpty(strSupervisorUnit))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLDWBYXWKBC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        else
        {
            if (strSupervisorUnit.Length > 20)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJLDWBNCG20GZF + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }
        if (!ShareClass.CheckStringRight(strProjectDesc))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMSBNBHFFZF + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        if (strProjectDesc.Length > 2000)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMSBNCG2000GZF + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        DateTime dtStartTime = DateTime.Now;
        if (!string.IsNullOrEmpty(strStartTime))
        {
            DateTime.TryParse(strStartTime, out dtStartTime);
        }
        DateTime dtEndTime = DateTime.Now;
        if (!string.IsNullOrEmpty(strEndTime))
        {
            DateTime.TryParse(strEndTime, out dtEndTime);
        }

        if (dtEndTime < dtStartTime)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWGRBXDYKGR + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        decimal decimalForCost = 0;
        if (!string.IsNullOrEmpty(strForCost))
        {
            decimal.TryParse(strForCost, out decimalForCost);
        }
        decimal decimalSelfCost = 0;
        if (!string.IsNullOrEmpty(strSelfCost))
        {
            decimal.TryParse(strSelfCost, out decimalSelfCost);
        }

        if (strGold == "1")//增加
        {
            //判断项目名称是否重复
            string strCheckProjectNameSQL = string.Format(@"select * from T_WZProject
                            where ProjectName = '{0}'", strProjectName);
            DataTable dtCheckProjectName = ShareClass.GetDataSetFromSql(strCheckProjectNameSQL, "CheckProjectName").Tables[0];
            if (dtCheckProjectName != null && dtCheckProjectName.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMMCZFXG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }

            WZProject wZProject = new WZProject();
            wZProject.ProjectName = strProjectName;
            wZProject.ProjectManager = strProjectManager;
            wZProject.StartTime = dtStartTime;
            wZProject.EndTime = dtEndTime;
            wZProject.PowerPurchase = strPowerPurchase;
            wZProject.ForCost = decimalForCost;
            wZProject.SelfCost = decimalSelfCost;
            wZProject.BuildUnit = strBuildUnit;
            wZProject.SupervisorUnit = strSupervisorUnit;
            wZProject.ProjectDesc = strProjectDesc;

            wZProject.MarkTime = DateTime.Now; //DateTime.Parse(strMarkTime);
            wZProject.Marker = strMarker;

            wZProject.Progress = "立项";
            wZProject.IsMark = 0;

            wZProject.SupplementEditor = "-";

            wZProject.RelatedCode = strRelatedCode;
            wZProject.IsStatus = "正常";


            //连接平台字段
            wZProject.Leader = strLeader;
            wZProject.FeeManage = strFeeManage;
            wZProject.Checker = strMaterialPerson;
            wZProject.IsMark = intIsMark;

            wZProject.UnitType = strUnitType;

            wZProject.ProjectAttribute = strProjectAttribute;
            wZProject.ProjectNature = strProjectNature;

            //增加
            wZProject.ProjectCode = TB_ProjectCode.Text.Trim();
            wZProject.RelatedProjectID = int.Parse(strProjectID);

            wZProjectBLL.AddWZProject(wZProject);
        }
        else if (strGold == "2")//更新
        {
            string strWZProjectSql = "from WZProject as wZProject where ProjectCode = '" + TB_ProjectCode.Text.Trim() + "'";
            IList projectList = wZProjectBLL.GetAllWZProjects(strWZProjectSql);
            if (projectList != null && projectList.Count > 0)
            {
                WZProject wZProject = (WZProject)projectList[0];

                wZProject.ProjectName = strProjectName;
                wZProject.ProjectManager = strProjectManager;
                wZProject.StartTime = dtStartTime;
                wZProject.EndTime = dtEndTime;
                wZProject.PowerPurchase = strPowerPurchase;
                wZProject.ForCost = decimalForCost;
                wZProject.SelfCost = decimalSelfCost;
                wZProject.BuildUnit = strBuildUnit;
                wZProject.SupervisorUnit = strSupervisorUnit;
                wZProject.ProjectDesc = strProjectDesc;

                //连接平台字段
                wZProject.Leader = strLeader;
                wZProject.FeeManage = strFeeManage;
                wZProject.Checker = strMaterialPerson;
                wZProject.IsMark = intIsMark;

                wZProject.UnitType = strUnitType;

                wZProject.ProjectAttribute = strProjectAttribute;
                wZProject.ProjectNature = strProjectNature;

                wZProject.RelatedProjectID = int.Parse(strProjectID);

                try
                {
                    string strHQL;
                    strHQL = "Update T_WZProject Set ProjectCode = '" + TB_ProjectCode.Text.Trim() + "' where RelatedProjectID = " + strProjectID;
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch
                {
                }

                wZProjectBLL.UpdateWZProject(wZProject, wZProject.ProjectCode);
            }
            else//新增
            {
                WZProject wZProject = new WZProject();
                wZProject.ProjectName = strProjectName;
                wZProject.ProjectManager = strProjectManager;
                wZProject.StartTime = dtStartTime;
                wZProject.EndTime = dtEndTime;
                wZProject.PowerPurchase = strPowerPurchase;
                wZProject.ForCost = decimalForCost;
                wZProject.SelfCost = decimalSelfCost;
                wZProject.BuildUnit = strBuildUnit;
                wZProject.SupervisorUnit = strSupervisorUnit;
                wZProject.ProjectDesc = strProjectDesc;

                wZProject.MarkTime = DateTime.Now; //DateTime.Parse(strMarkTime);
                wZProject.Marker = strMarker;

                wZProject.Progress = "立项";
                wZProject.IsMark = 0;

                wZProject.SupplementEditor = "-";

                wZProject.RelatedCode = strRelatedCode;
                wZProject.IsStatus = "正常";


                //连接平台字段
                wZProject.Leader = strLeader;
                wZProject.FeeManage = strFeeManage;
                wZProject.Checker = strMaterialPerson;
                wZProject.IsMark = intIsMark;

                wZProject.UnitType = strUnitType;

                wZProject.ProjectAttribute = strProjectAttribute;
                wZProject.ProjectNature = strProjectNature;

                //增加
                wZProject.ProjectCode = TB_ProjectCode.Text.Trim();
                wZProject.RelatedProjectID = int.Parse(strProjectID);

                wZProjectBLL.AddWZProject(wZProject);
            }
        }
        else if (strGold == "3")//删除
        {

        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        string strUserCode, strUserName, strRelatedUserCode;
        IList lst;
        string strMsg, strSubject;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();

        strProjectID = LB_ProjectID.Text.Trim();

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

        RelatedUser relatedUser = new RelatedUser();

        strMsg = TB_Message.Text.Trim();

        strSubject = "项目通知";

        Msg msg = new Msg();

        try
        {
            for (int i = 0; i < lst.Count; i++)
            {
                relatedUser = (RelatedUser)lst[i];
                strRelatedUserCode = relatedUser.UserCode.Trim();

                if (CB_SMS.Checked == true | CB_Mail.Checked == true)
                {
                    if (CB_SMS.Checked == true)
                    {
                        msg.SendMSM("Message", strRelatedUserCode, strMsg, strUserCode);
                    }

                    if (CB_Mail.Checked == true)
                    {
                        msg.SendMail(strRelatedUserCode, strSubject, strMsg, strUserCode);
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strProjectID, strProjectName, strHQL, strStatus;
        string strUserName;

        if (e.CommandName != "Page")
        {
            strUserName = LB_UserName.Text.Trim();
            strProjectID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                try
                {
                    strUserName = LB_UserName.Text.Trim();

                    for (int i = 0; i < DataGrid2.Items.Count; i++)
                    {
                        DataGrid2.Items[i].ForeColor = Color.Black;
                    }

                    e.Item.ForeColor = Color.Red;

                    strHQL = "from Project as project where project.ProjectID = " + strProjectID;

                    ProjectBLL projectBLL = new ProjectBLL();
                    IList lst = projectBLL.GetAllProjects(strHQL);

                    Project project = (Project)lst[0];

                    strProjectName = project.ProjectName.Trim();

                    TB_ProjectCode.Text = project.ProjectCode.Trim();
                    LB_ProjectID.Text = project.ProjectID.ToString();
                    try
                    {
                        DL_ProjectType.SelectedValue = project.ProjectType;
                        ShareClass.LoadProjectForPMStatus(project.ProjectType.Trim(), strLangCode, DL_Status);
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_ProjectType.SelectedValue = project.ProjectType.Trim();
                        ShareClass.LoadProjectForPMStatus(project.ProjectType.Trim(), strLangCode, DL_Status);
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_Status.SelectedValue = project.Status;
                        DL_StatusValue.SelectedValue = project.StatusValue.Trim();
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_Status.SelectedValue = project.Status.Trim();
                        DL_StatusValue.SelectedValue = project.StatusValue.Trim();
                    }
                    catch
                    {
                    }
                    strStatus = project.Status.Trim();

                    try
                    {
                        DL_PM.SelectedValue = project.PMCode;
                    }
                    catch
                    {
                        DL_PM.Items.Insert(0, new ListItem(project.PMName, project.PMCode));
                    }

                    TB_CustomerPMName.Text = project.CustomerPMName;
                    LB_Status.Text = project.Status.Trim();
                    TXT_BeginDate.Text = project.BeginDate.ToString();
                    TXT_EndDate.Text = project.EndDate.ToString();

                    TB_ProjectName.Text = project.ProjectName;

                    if (strIsMobileDevice == "YES")
                    {
                        HT_ProjectDetail.Text = project.ProjectDetail;
                        HT_AcceptStandard.Text = project.AcceptStandard;
                    }
                    else
                    {
                        HE_ProjectDetail.Text = project.ProjectDetail;
                        HE_AcceptStandard.Text = project.AcceptStandard;
                    }
                    NB_Budget.Amount = project.Budget;

                    TXT_BeginDate.Text = project.BeginDate.ToString("yyyy-MM-dd");
                    TXT_EndDate.Text = project.EndDate.ToString("yyyy-MM-dd");

                    NB_ProjectAmount.Amount = project.ProjectAmount;
                    try
                    {
                        DL_CurrencyType.SelectedValue = project.CurrencyType;
                    }
                    catch
                    {
                    }
                    NB_ManHour.Amount = project.ManHour;
                    NB_ManNubmer.Amount = project.ManNumber;

                    DL_Priority.SelectedValue = project.Priority.Trim();

                    LB_BelongDepartCode.Text = project.BelongDepartCode.Trim();
                    LB_BelongDepartName.Text = project.BelongDepartName.Trim();

                    //取得项目经纬度
                    LoadProjectLongitudeLatitude(strProjectID);

                    //取得项目的其它属性
                    LoadProjectOtherAttribute(strProjectID);
                    SetProjectOtherFieldValue(strProjectID);

                    string strWZProjectHQL = string.Format(@"select p.*,l.UserName as LeaderName,
                            f.UserName as FeeManageName,
                            c.UserName as CheckerName
                            from T_WZProject p
                            left join T_ProjectMember l on p.Leader = l.UserCode
                            left join T_ProjectMember f on p.FeeManage = f.UserCode
                            left join T_ProjectMember c on p.Checker = c.UserCode 
                            where p.ProjectCode = '{0}'", project.ProjectCode);
                    DataTable dtWZProject = ShareClass.GetDataSetFromSql(strWZProjectHQL, "Project").Tables[0];
                    if (dtWZProject != null && dtWZProject.Rows.Count > 0)
                    {
                        DataRow drProject = dtWZProject.Rows[0];

                        TXT_StartTime.Text = ShareClass.ObjectToString(drProject["StartTime"]);                         //wZProject.StartTime.ToString();
                        TXT_EndTime.Text = ShareClass.ObjectToString(drProject["EndTime"]);                             //wZProject.EndTime.ToString();
                        DL_AuthorizedProcurement.SelectedValue = ShareClass.ObjectToString(drProject["PowerPurchase"]); //wZProject.PowerPurchase;

                        NB_ABudgetFor.Text = ShareClass.ObjectToString(drProject["ForCost"]);                   //wZProject.ForCost.ToString();
                        NB_SincePurchaseBudget.Text = ShareClass.ObjectToString(drProject["SelfCost"]);         //wZProject.SelfCost.ToString();
                        TB_ConstructionUnit.Text = ShareClass.ObjectToString(drProject["BuildUnit"]);           //wZProject.BuildUnit;
                        TB_SupervisionUnit.Text = ShareClass.ObjectToString(drProject["SupervisorUnit"]);       //wZProject.SupervisorUnit;

                        //主管领导，费控主管，材料员，使用标记
                        HF_Leader.Value = ShareClass.ObjectToString(drProject["Leader"]); //wZProject.Leader;
                        TXT_Leader.Text = ShareClass.ObjectToString(drProject["LeaderName"]); //wZProject.Leader;
                        HF_FeeManage.Value = ShareClass.ObjectToString(drProject["FeeManage"]); //wZProject.FeeManage;
                        TXT_FeeManage.Text = ShareClass.ObjectToString(drProject["FeeManageName"]); //wZProject.FeeManage;
                        HF_MaterialPerson.Value = ShareClass.ObjectToString(drProject["Checker"]); //wZProject.Checker;
                        TXT_MaterialPerson.Text = ShareClass.ObjectToString(drProject["CheckerName"]); //wZProject.Checker;

                        DDL_IsMark.SelectedValue = ShareClass.ObjectToString(drProject["IsMark"]); //wZProject.IsMark.ToString();

                        DDL_UnitType.SelectedValue = ShareClass.ObjectToString(drProject["UnitType"]); //wZProject.UnitType;


                        DDL_ProjectAttribute.SelectedValue = ShareClass.ObjectToString(drProject["ProjectAttribute"]);
                        DDL_ProjectNature.SelectedValue = ShareClass.ObjectToString(drProject["ProjectNature"]);
                    }
                    else
                    {
                        TXT_StartTime.Text = "";
                        TXT_EndTime.Text = "";
                        DL_AuthorizedProcurement.SelectedValue = "";

                        NB_ABudgetFor.Text = "";
                        NB_SincePurchaseBudget.Text = "";
                        TB_ConstructionUnit.Text = "";
                        TB_SupervisionUnit.Text = "";

                        HF_Leader.Value = "";
                        TXT_Leader.Text = "";
                        HF_FeeManage.Value = "";
                        TXT_FeeManage.Text = "";
                        HF_MaterialPerson.Value = "";
                        TXT_MaterialPerson.Text = "";

                        DDL_IsMark.SelectedValue = "0";

                        DDL_UnitType.SelectedValue = "";

                        DDL_ProjectAttribute.SelectedValue = "";
                        DDL_ProjectNature.SelectedValue = "";
                    }

                    HL_CustomerInfo.Enabled = true;
                    HL_CustomerInfo.NavigateUrl = "TTProjectCustomerInfo.aspx?ProjectID=" + strProjectID;

                    //会出错，这个错误是防止修改总项目
                    LB_ParentProjectID.Text = project.ParentID.ToString();
                    TB_ParentProject.Text = ShareClass.GetProjectName(project.ParentID.ToString());

                    CB_SMS.Enabled = true;
                    CB_Mail.Enabled = true;
                    BT_Send.Enabled = true;

                    TB_Message.Text = strUserName + " 给你建立了项目 ：" + strProjectID + " " + strProjectName + "，请及时收理！";

                    //BusinessForm，列出关联表单模板
                    try
                    {
                        Panel_RelatedBusiness.Visible = true;

                        string strTemName;
                        strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = 'Project' and RelatedID = " + strProjectID;
                        strHQL += " Order By CreateTime DESC";
                        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();

                            DL_WLType.SelectedValue = ShareClass.GetWorkTemplateType(strTemName);
                            ShareClass.LoadWFTemplate(LB_UserCode.Text.Trim(), DL_WLType.SelectedValue.Trim(), DL_WFTemplate);
                            DL_WFTemplate.SelectedValue = strTemName;

                            DL_AllowUpdate.SelectedValue = ds.Tables[0].Rows[0]["AllowUpdate"].ToString().Trim();
                        }
                    }
                    catch
                    {
                    }

                    //BusinessForm,装载关联信息
                    TabContainer1.ActiveTabIndex = 0;
                    strProjectID = LB_ProjectID.Text.Trim();
                    ShareClass.LoadBusinessForm("Project", strProjectID, DL_WFTemplate.SelectedValue.Trim(), IFrame_RelatedInformation);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch
                {

                    BT_Send.Enabled = false;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYKNS1STXGZXM2CXMFXMBCZ3XMZTLBZMYCXMDZTJC + "')", true);
                }

            }

            if (e.CommandName == "Delete")
            {
                string strPMCode, strUserCode;
                IList lst;

                strUserCode = LB_UserCode.Text;
                strUserName = LB_UserName.Text;
                strPMCode = DL_PM.SelectedValue.Trim();

                ProjectBLL projectBLL = new ProjectBLL();
                strHQL = "from Project as project where project.ProjectID = " + strProjectID;
                lst = projectBLL.GetAllProjects(strHQL);
                Project project = (Project)lst[0];
                project.Status = "删除";

                strProjectName = project.ProjectName.Trim();

                try
                {
                    //会出错，这个错误是防止修改总项目
                    LB_ParentProjectID.Text = project.ParentID.ToString();
                    TB_ParentProject.Text = ShareClass.GetProjectName(project.ParentID.ToString());

                    projectBLL.UpdateProject(project, int.Parse(strProjectID));

                    LoadProject(strUserCode);

                    ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);


                    TB_Message.Text = strUserName + " 删除了项目： " + strProjectID + " " + strProjectName + "的内容,请关注，特此通知！";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "(" + Resources.lang.ZZCCYYKNS1STXGZXM2CXMFXMBCZ3XMZTLBZMYCXMDZTJC + ")" + "')", true);
                }
            }
        }
    }

    //取得项目经纬度
    protected void LoadProjectLongitudeLatitude(string strProjectID)
    {
        string strHQL;

        strHQL = "Select Longitude,Latitude From T_Project Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_Longitude.Text = ds.Tables[0].Rows[0]["Longitude"].ToString().Trim();
            TB_Latitude.Text = ds.Tables[0].Rows[0]["Latitude"].ToString().Trim();
        }
    }

    //取得项目的其它属性
    protected void LoadProjectOtherAttribute(string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_Project Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_AttachFile.Text = ds.Tables[0].Rows[0]["AttachFile"].ToString().Trim();
            TB_BudgetAccount .Text = ds.Tables[0].Rows[0]["BudgetAccount"].ToString().Trim();
            TB_ProjectDirection.Text = ds.Tables[0].Rows[0]["ProjectDirection"].ToString().Trim();
            TB_ProjectLocation.Text = ds.Tables[0].Rows[0]["ProjectLocation"].ToString().Trim();

            try
            {
                DL_FundingSource.SelectedValue = ds.Tables[0].Rows[0]["FundingSource"].ToString();
            }
            catch
            { 
            }
            try
            {
                DL_FundingSource.SelectedValue = ds.Tables[0].Rows[0]["FundingSource"].ToString().Trim();
            }
            catch
            {
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

        string strProjectID;
        strProjectID = LB_ProjectID.Text.Trim();

        if (strProjectID == "")
        {
            strProjectID = "0";
        }

        //strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);

        strURL = "TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + strIdentifyString;
        IFrame_RelatedInformation.Attributes.Add("src", strURL);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    //BusinessForm,删除关联的业务表单
    protected void BT_DeleteBusinessForm_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strTemName;
        strTemName = DL_WFTemplate.SelectedValue.Trim();

        string strProjectID;
        strProjectID = LB_ProjectID.Text.Trim();

        strHQL = "Delete From T_RelatedBusinessForm Where RelatedType = 'Project' and RelatedID = " + strProjectID;

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


    protected void BT_AllProjects_Click(object sender, EventArgs e)
    {

        string strUserCode = LB_UserCode.Text.Trim();

        LoadMyCreateProjectList(strUserCode);

        //DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        //DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        TXT_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        TXT_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

        TB_ProjectName.Text = "";

        if (strIsMobileDevice == "YES")
        {
            HT_ProjectDetail.Text = "";
            HT_AcceptStandard.Text = "";
        }
        else
        {
            HE_ProjectDetail.Text = "";
            HE_AcceptStandard.Text = "";
        }

        LB_ProjectID.Text = "";
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProjectID, strStatus;

        strProjectID = LB_ProjectID.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strProjectID != "")
        {
            DL_StatusValue.SelectedValue = GetProjectStatusLatestValue(strProjectID, strStatus);
        }
        else
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_StatusValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLID, strProjectID, strProjectType, strStatus, strStatusValues, strReviewControl;
        IList lst;

        strStatus = DL_Status.SelectedValue.Trim();
        strStatusValues = DL_StatusValue.SelectedValue.Trim();
        strProjectID = LB_ProjectID.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();

        if (strProjectID != "")
        {
            strReviewControl = GetProjectStatusReviewControl(strProjectType, strStatus);

            if (strReviewControl == "是")
            {
                if (strStatusValues == "通过")
                {
                    strHQL = "from StatusRelatedWF as statusRelatedWF where statusRelatedWF.Status = " + "'" + strStatus + "'" + " and  statusRelatedWF.RelatedType = '项目' and statusRelatedWF.RelatedID = " + strProjectID + " Order by statusRelatedWF.ID DESC";
                    StatusRelatedWFBLL statusRelatedWFBLL = new StatusRelatedWFBLL();
                    lst = statusRelatedWFBLL.GetAllStatusRelatedWFs(strHQL);
                    if (lst.Count > 0)
                    {
                        StatusRelatedWF statusRelatedWF = (StatusRelatedWF)lst[0];
                        strWLID = statusRelatedWF.WLID.ToString();

                        strHQL = "from WorkFlow as workFlow where workFlow.Status in ('通过','结案') and workFlow.WLID = " + strWLID;
                        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
                        lst = workFlowBLL.GetAllWorkFlows(strHQL);

                        if (lst.Count == 0)
                        {
                            DL_StatusValue.SelectedValue = "进行中";
                            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCZTMYTJPSHPSMTGZTZBNGWTG + "')", true);
                        }
                    }
                    else
                    {
                        DL_StatusValue.SelectedValue = "进行中";
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCZTMYTJPSHPSMTGZTZBNGWTG + "')", true);
                    }
                }
            }
        }
        else
        {
            DL_StatusValue.SelectedValue = "进行中";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCWKJLBNGBZTZXZXM + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void AddStatusChangeRecord(string strProjectID, string strOldStatus, string strNewStatus, string strOldStatusValue, string strNewStatusValue)
    {
        string strUserCode, strUserName;

        if ((strOldStatus != strNewStatus) | (strOldStatusValue != strNewStatusValue))
        {
            strUserCode = LB_UserCode.Text.Trim();
            strUserName = ShareClass.GetUserName(strUserCode);

            ProStatusChangeBLL proStatusChangeBLL = new ProStatusChangeBLL();
            ProStatusChange proStatusChange = new ProStatusChange();

            proStatusChange.ProjectID = int.Parse(strProjectID);
            proStatusChange.UserCode = strUserCode;
            proStatusChange.UserName = strUserName;
            proStatusChange.OldStatus = strOldStatus;
            proStatusChange.NewStatus = strNewStatus;
            proStatusChange.OldStatusValue = strOldStatusValue;
            proStatusChange.NewStatusValue = strNewStatusValue;
            proStatusChange.ChangeTime = DateTime.Now;

            try
            {
                proStatusChangeBLL.AddProStatusChange(proStatusChange);
            }
            catch
            {
            }
        }
    }

    //更改项目其它字段值 
    public void UpdateProjectOtherFieldValue(string strProjectID)
    {
        string strHQL;

        string strLockStartupedPlan;
        strLockStartupedPlan = DL_LockStartupedPlan.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set LockStartupedPlan = '{0}' Where ProjectID = {1}", strLockStartupedPlan, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strAllowPMChangeStatus;
        strAllowPMChangeStatus = DL_AllowPMChangeStatus.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set AllowPMChangeStatus = '{0}' Where ProjectID = {1}", strAllowPMChangeStatus, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProgressByDetailImpact;
        strProgressByDetailImpact = DL_ProgressByDetailImpact.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProgressByDetailImpact = '{0}' Where ProjectID = {1}", strProgressByDetailImpact, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strPlanProgressNeedPlanerConfirm;
        strPlanProgressNeedPlanerConfirm = DL_PlanProgressNeedPlanerConfirm.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set PlanProgressNeedPlanerConfirm = '{0}' Where ProjectID = {1}", strPlanProgressNeedPlanerConfirm, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strAutoRunWFAfterMakeProject;
        strAutoRunWFAfterMakeProject = DL_AutoRunWFAfterMakeProject.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set AutoRunWFAfterMakeProject = '{0}' Where ProjectID = {1}", strAutoRunWFAfterMakeProject, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectStartupNeedSupperConfirm;
        strProjectStartupNeedSupperConfirm = DL_ProjectStartupNeedSupperConfirm.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProjectStartupNeedSupperConfirm = '{0}' Where ProjectID = {1}", strProjectStartupNeedSupperConfirm, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectPlanStartupStauts;
        strProjectPlanStartupStauts = DL_ProjectPlanStartupSatus.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProjectPlanStartupStatus = '{0}' Where ProjectID = {1}", strProjectPlanStartupStauts, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectPlanStartupRelatedWorkflowTemplate;
        strProjectPlanStartupRelatedWorkflowTemplate = DL_PlanStartupRelatedWorkflowTemplate.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set PlanStartupRelatedWorkflowTemplate = '{0}' Where ProjectID = {1}", strProjectPlanStartupRelatedWorkflowTemplate, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

    }

    //设置项目其它属性的值 
    public void SetProjectOtherFieldValue(string strProjectID)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From T_Project Where ProjectID={0}", strProjectID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

        DL_LockStartupedPlan.SelectedValue = ds.Tables[0].Rows[0]["LockStartupedPlan"].ToString().Trim();
        DL_AllowPMChangeStatus.SelectedValue = ds.Tables[0].Rows[0]["AllowPMChangeStatus"].ToString().Trim();

        DL_ProgressByDetailImpact.SelectedValue = ds.Tables[0].Rows[0]["ProgressByDetailImpact"].ToString().Trim();
        DL_PlanProgressNeedPlanerConfirm.SelectedValue = ds.Tables[0].Rows[0]["PlanProgressNeedPlanerConfirm"].ToString().Trim();

        DL_AutoRunWFAfterMakeProject.SelectedValue = ds.Tables[0].Rows[0]["AutoRunWFAfterMakeProject"].ToString().Trim();
        DL_ProjectStartupNeedSupperConfirm.SelectedValue = ds.Tables[0].Rows[0]["ProjectStartupNeedSupperConfirm"].ToString().Trim();

        DL_ProjectPlanStartupSatus.SelectedValue = ds.Tables[0].Rows[0]["ProjectPlanStartupStatus"].ToString().Trim();

        DL_PlanStartupRelatedWorkflowTemplate.SelectedValue = ds.Tables[0].Rows[0]["PlanStartupRelatedWorkflowTemplate"].ToString().Trim();
    }

    protected void LoadMyCreateProjectList(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text;

        strHQL = "from Project as project where project.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and (( project.PMCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " or  ( project.PMCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")))";
        strHQL += " and project.Status <> '归档' order by project.ProjectID DESC";

        ProjectBLL projectBLL = new ProjectBLL();

        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void LoadProject(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where  project.UserCode = " + "'" + strUserCode + "'" + " and project.Status <> '归档' order by project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadFundingSource()
    {
        string strHQL;

        strHQL = "Select FundingSource From T_FundingSource";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_FundingSource");

        DL_FundingSource.DataSource = ds;
        DL_FundingSource.DataBind();

        DL_FundingSource.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected string GetProjectStatusReviewControl(string strProjectType, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectType = " + "'" + strProjectType + "'" + " and projectStatus.Status = " + "'" + strStatus + "'";
        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        lst = projectStatusBLL.GetAllProjectStatuss(strHQL);

        ProjectStatus projectStatus = (ProjectStatus)lst[0];

        return projectStatus.ReviewControl.Trim();
    }

    protected string GetProjectStatusLatestValue(string strProjectID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = " from ProStatusChange as proStatusChange where proStatusChange.ProjectID = " + strProjectID;
        strHQL += " and proStatusChange.NewStatus = " + "'" + strStatus + "'";
        strHQL += " Order by proStatusChange.ChangeTime DESC";
        ProStatusChangeBLL proStatusChangeBLL = new ProStatusChangeBLL();
        lst = proStatusChangeBLL.GetAllProStatusChanges(strHQL);

        if (lst.Count > 0)
        {
            ProStatusChange proStatusChange = (ProStatusChange)lst[0];
            return proStatusChange.NewStatusValue.Trim();
        }
        else
        {
            return "进行中";
        }
    }

    protected string GetProjectStatusIdentityString(string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectStatus.Status = " + "'" + strStatus + "'";
        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        lst = projectStatusBLL.GetAllProjectStatuss(strHQL);

        ProjectStatus projectStatus = (ProjectStatus)lst[0];

        return projectStatus.IdentityString.Trim();
    }



    private void BindProjectAttribute()
    {
        string strProjectAttributeHQL = "select * from T_WZProjectAttribute order by AttributeCode ";
        DataTable dtProjectAttribute = ShareClass.GetDataSetFromSql(strProjectAttributeHQL, "strProjectAttributeHQL").Tables[0];

        DDL_ProjectAttribute.DataSource = dtProjectAttribute;
        DDL_ProjectAttribute.DataTextField = "AttributeDesc";
        DDL_ProjectAttribute.DataValueField = "AttributeCode";
        DDL_ProjectAttribute.DataBind();

        DDL_ProjectAttribute.Items.Insert(0, new ListItem("", ""));
    }


    private void BindProjectNature()
    {
        string strProjectNatureHQL = "select * from T_WZProjectNature order by NatureCode ";
        DataTable dtProjectNature = ShareClass.GetDataSetFromSql(strProjectNatureHQL, "strProjectNatureHQL").Tables[0];

        DDL_ProjectNature.DataSource = dtProjectNature;
        DDL_ProjectNature.DataTextField = "NatureDesc";
        DDL_ProjectNature.DataValueField = "NatureCode";
        DDL_ProjectNature.DataBind();

        DDL_ProjectNature.Items.Insert(0, new ListItem("", ""));
    }


    private string CreateNewProjectCode()
    {
        //生成项目编号 〈项目编码〉＝“G2013J0001” 总共长度为10位
        string strNewProjectCode = string.Empty;
        try
        {
            lock (this)
            {
                bool isExist = true;
                string strProjectCodeHQL = string.Format("select COUNT(1) as RowNumber from T_WZProject where MarkTime like '%{0}%'", DateTime.Now.Year.ToString());
                DataTable dtProjectCode = ShareClass.GetDataSetFromSql(strProjectCodeHQL, "strProjectCodeHQL").Tables[0];
                int intProjectCodeNumber = int.Parse(dtProjectCode.Rows[0]["RowNumber"].ToString());
                intProjectCodeNumber = intProjectCodeNumber + 1;
                do
                {
                    StringBuilder sbProjectCode = new StringBuilder();
                    for (int j = 4 - intProjectCodeNumber.ToString().Length; j > 0; j--)
                    {
                        sbProjectCode.Append("0");
                    }
                    string strProjectAttribute = DDL_ProjectAttribute.SelectedValue;
                    string strProjectNature = DDL_ProjectNature.SelectedValue;
                    strNewProjectCode = strProjectAttribute + DateTime.Now.Year + strProjectNature + sbProjectCode.ToString() + intProjectCodeNumber.ToString();

                    //验证新的项目编号是滞存在
                    string strCheckNewProjectCodeHQL = "select count(1) as RowNumber from T_WZProject where ProjectCode = '" + strNewProjectCode + "'";
                    DataTable dtCheckNewProjectCode = ShareClass.GetDataSetFromSql(strCheckNewProjectCodeHQL, "strCheckNewProjectCodeHQL").Tables[0];
                    int intCheckNewProjectCode = int.Parse(dtCheckNewProjectCode.Rows[0]["RowNumber"].ToString());
                    if (intCheckNewProjectCode == 0)
                    {
                        isExist = false;
                    }
                    else
                    {
                        intProjectCodeNumber++;
                    }
                } while (isExist);
            }
        }
        catch (Exception ex) { }

        return strNewProjectCode;
    }
}
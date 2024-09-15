using System;
using System.Collections;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;

using System.Data;

using ProjectMgt.BLL;
using ProjectMgt.Model;


public partial class TTProPlanRelatedDocForTemplate : System.Web.UI.Page
{
    string strProjectID, strPlanID, strPlanName, strPlanVerID, strProjectType;
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strLangCode = Session["LangCode"].ToString();

        string strUserCode, strUserName, strDepartCode;
        string strFromProjectID, strFromProjectPlanVerID;

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);
        strDepartCode = GetDepartCode(strUserCode);

        strPlanID = Request.QueryString["PlanID"];

        //string strSystemVersionType = Session["SystemVersionType"].ToString();
        //string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        //if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        //{
        //    Response.Redirect("TTProPlanRelatedDocSAAS.aspx?PlanID=" + strPlanID);
        //}

        //if (ShareClass.CheckUserCanControlProjectPlan(strPlanID, strUserCode) == false)
        //{
        //    Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZJHFZRCNJXZCZQJC + "'");
        //}

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        workPlan = (WorkPlan)lst[0];

        strPlanName = workPlan.Name.Trim();
        strProjectID = workPlan.ProjectID.ToString().Trim();
        strPlanVerID = workPlan.VerID.ToString().Trim();


        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strProjectType = project.ProjectType.Trim();

        LB_PlanID.Text = strPlanID;
        LB_ProjectID.Text = strProjectID;
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "计划", strPlanID, strPlanName);
            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;

            LoadRelatedDoc(strPlanID, strProjectID);

            ShareClass.InitialUserDocTypeTree(TreeView3, strUserCode);
            ShareClass.LoadProjectActorGroupForDropDownList(DL_Visible, strProjectID);

            string strTopTreeDocTypeName = "计划" + "：" + strPlanID + " " + strPlanName + " " + Resources.lang.WenDangLieBiao;
            strHQL = "Select TemName From T_WorkFlowTemplate Where TemName In ((Select TemName from T_WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '文件评审'";
            strHQL += " and ((workFlowTemplate.TemName in (Select relatedWorkFlowTemplate.WFTemplateName from T_RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID + "))";
            strHQL += " or ( workFlowTemplate.Authority = '所有' ))";
            strHQL += " and (position(trim(workFlowTemplate.TemName) in '" + strTopTreeDocTypeName + "') > 0)";
            strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC)";
            strHQL += " UNION ";
            strHQL += "(Select TemName from T_WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '文件评审'";
            strHQL += " and ((workFlowTemplate.TemName in (Select relatedWorkFlowTemplate.WFTemplateName from T_RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID + "))";
            strHQL += " or ( workFlowTemplate.Authority = '所有' ))";
            strHQL += " and (position(trim(workFlowTemplate.TemName) in '" + strTopTreeDocTypeName + "') = 0)";
            strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC)) Order By SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
            DL_TemName.DataSource = ds;
            DL_TemName.DataBind();

            TB_Author.Text = strUserName;

            strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + "'" + strProjectID + "'" + " and projectPlanVersion.Type = '在用'";
            ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
            lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
            if (lst.Count > 0)
            {
                ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
                strFromProjectID = projectPlanVersion.FromProjectID.ToString();
                strFromProjectPlanVerID = projectPlanVersion.FromProjectPlanVerID.ToString();

                TakeTopPlan.InitialProjectPlanTree(TreeView2, strFromProjectID, strFromProjectPlanVerID);
                LoadProjectPlanDoc(strFromProjectID, strFromProjectPlanVerID);

                ShareClass.InitialDocTypeTree(TreeView4, strUserCode, "ProjectType", "0", strProjectType);
                LoadProjectTypeRelatedDoc("ProjectType", strProjectType);

                LB_TemplateProjectID.Text = strFromProjectID;
                LB_TemplatePlanVerID.Text = strFromProjectPlanVerID;
            }

            //HL_DocTree.NavigateUrl = "TTDocumentForProjectPlanTemplateTreeView.aspx?RelatedType=ProjectPlan&RelatedID=" + strPlanID;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID, strHQL, strUserCode, strDepartCode, strDocType;
        IList lst1, lst2;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = GetDepartCode(strUserCode);

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strDocTypeID = treeNode.Target.Trim();

        DocTypeBLL docTypeBLL = new DocTypeBLL();
        strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        lst1 = docTypeBLL.GetAllDocTypes(strHQL);

        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();

        if (strDocTypeID != "0")
        {
            DocType docType = (DocType)lst1[0];
            strDocType = docType.Type.Trim();

            LB_DocTypeID.Text = docType.ID.ToString();
            TB_DocType.Text = docType.Type.Trim();

            strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = '计划' and documentForProjectPlanTemplate.RelatedID = " + strPlanID + " and  documentForProjectPlanTemplate.DocType = " + "'" + strDocType + "'" + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
            LB_FindCondition.Text = Resources.lang.CXFWWJLX + strDocType;

            //设置缺省的文件类型
            ShareClass.SetDefaultDocType(strDocType, LB_DocTypeID, TB_DocType);
            ////按文件类型设置缺省的工作流模板树
            //ShareClass.SetDefaultWorkflowTemplate(strDocType, DL_TemName);
        }
        else
        {
            LB_DocTypeID.Text = "";
            TB_DocType.Text = "";

            strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = '计划' and documentForProjectPlanTemplate.RelatedID = " + strPlanID + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;
        }

        lst2 = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
        DataGrid1.DataSource = lst2;
        DataGrid1.DataBind();

        LB_TotalCount.Text = Resources.lang.CXDDWJS + ": " + lst2.Count.ToString();
    }


    protected void BT_LoadDoc_Click(object sender, EventArgs e)
    {
        LoadRelatedDoc(strPlanID, strProjectID);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPlanID, strParentID, strPlanVerID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;
        strPlanID = treeNode.Target.Trim();

        try
        {
            strParentID = treeNode.Parent.Target;

            strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = '计划' and documentForProjectPlanTemplate.RelatedID = " + strPlanID + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
            DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
            lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
        catch
        {
            strPlanVerID = LB_TemplatePlanVerID.Text.Trim();
            LoadProjectPlanDoc(strProjectID, strPlanVerID);
        }

        LB_TemplatePlanID.Text = strPlanID;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text.Trim();
            string strUserName = GetUserName(strUserCode);
            string strDocID = e.Item.Cells[0].Text.Trim();
            string strDocName = e.Item.Cells[2].Text.Trim();
            string strUploadMan = e.Item.Cells[5].Text.Trim();
            string strUploadManCode;
            string strDepartCode = GetDepartCode(strUserCode);

            if (e.CommandName == "Delete")
            {
                strHQL = "from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.DocID = " + strDocID;
                DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
                lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
                DocumentForProjectPlanTemplate documentForProjectPlanTemplate = (DocumentForProjectPlanTemplate)lst[0];

                strUploadManCode = documentForProjectPlanTemplate.UploadManCode.Trim();

                if (strUserCode == strUploadManCode)
                {
                    documentForProjectPlanTemplate.Status = "删除";

                    documentForProjectPlanTemplateBLL.UpdateDocumentForProjectPlanTemplate(documentForProjectPlanTemplate, int.Parse(strDocID));

                    ////删除更多文档
                    //ShareClass.DeleteMoreDocByDataGrid(DataGrid1);

                    LoadRelatedDoc(strPlanID, strProjectID);
                    ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "计划", strPlanID, strPlanName);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFFCZNBNSCBRSCDWJ + "')", true);
                }
            }

            if (e.CommandName == "Review")
            {
                MultiView1.ActiveViewIndex = 1;
                RadioButtonList1.SelectedIndex = 1;

                LB_DocID.Text = strDocID;

                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;

                TB_WLName.Text = Resources.lang.PingShen + Resources.lang.WenJian + strDocID + strDocName;

                BT_SubmitApply.Enabled = true;

                LoadRelatedWL("文件评审", "文件", int.Parse(strDocID));
            }
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID = TreeView3.SelectedNode.Target;
        string strDocType = GetDocTypeName(strDocTypeID);

        LB_DocTypeID.Text = strDocTypeID;
        TB_DocType.Text = strDocType;
    }

    protected void BtnUP_Click(object sender, EventArgs e)
    {
        if (AttachFile.HasFile)
        {
            string strUserCode = LB_UserCode.Text.Trim();
            string strProjectID = LB_ProjectID.Text.Trim();
            string strAuthor = TB_Author.Text.Trim();
            string strDocTypeID = LB_DocTypeID.Text.Trim();
            if (strDocTypeID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGWDLXBNWKJC + "')", true);
                return;
            }
            string strDocType = GetDocTypeName(strDocTypeID);
            string strDepartCode = GetDepartCode(strUserCode);
            string strVisible = DL_Visible.SelectedValue.Trim();


            string strFileName1, strExtendName;

            strFileName1 = this.AttachFile.FileName;//获取上传文件的文件名,包括后缀

            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);
           

            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;

            string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";


            FileInfo fi = new FileInfo(strDocSavePath + strFileName3);
            string strSystemVersionType = Session["SystemVersionType"].ToString();
            string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
            if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
            {
                if (this.AttachFile.ContentLength > 1024)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBNSCDYSZDWJ + "')", true);
                    return;
                }
            }

            if (fi.Exists)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
            }
            else
            {
                DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
                DocumentForProjectPlanTemplate documentForProjectPlanTemplate = new DocumentForProjectPlanTemplate();

                documentForProjectPlanTemplate.RelatedType = "计划";
                documentForProjectPlanTemplate.DocTypeID = int.Parse(strDocTypeID);
                documentForProjectPlanTemplate.DocType = strDocType;
                documentForProjectPlanTemplate.RelatedID = int.Parse(strPlanID);
                documentForProjectPlanTemplate.Author = strAuthor;
                documentForProjectPlanTemplate.DocName = Path.GetFileNameWithoutExtension(strFileName2) ;
                documentForProjectPlanTemplate.Address = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
                documentForProjectPlanTemplate.UploadManCode = strUserCode;
                documentForProjectPlanTemplate.UploadManName = GetUserName(strUserCode);
                documentForProjectPlanTemplate.UploadTime = DateTime.Now;
                documentForProjectPlanTemplate.Visible = strVisible;
                documentForProjectPlanTemplate.DepartCode = strDepartCode;
                documentForProjectPlanTemplate.DepartName = ShareClass.GetDepartName(strDepartCode);
                documentForProjectPlanTemplate.Status = "处理中";
                documentForProjectPlanTemplate.RelatedName = "";


                try
                {
                    documentForProjectPlanTemplateBLL.AddDocumentForProjectPlanTemplate(documentForProjectPlanTemplate);

                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);

                    LoadRelatedDoc(strPlanID, strProjectID);
                    ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "计划", strPlanID, strPlanName);
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSCSBJC + "')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        }
    }

    protected void BT_AddDoc_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();
        string strAuthor = TB_Author.Text.Trim();
        string strDocTypeID = LB_DocTypeID.Text.Trim();
        if (strDocTypeID == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGWDLXBNWKJC + "')", true);
            return;
        }
        string strDocType = GetDocTypeName(strDocTypeID);
        string strDepartCode = GetDepartCode(strUserCode);
        string strVisible = DL_Visible.SelectedValue.Trim();


        string strFileName2 = TB_DocName.Text.Trim();
        
        if (strFileName2=="")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
        }
        else
        {
            DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
            DocumentForProjectPlanTemplate documentForProjectPlanTemplate = new DocumentForProjectPlanTemplate();

            documentForProjectPlanTemplate.RelatedType = "计划";
            documentForProjectPlanTemplate.DocTypeID = int.Parse(strDocTypeID);
            documentForProjectPlanTemplate.DocType = strDocType;
            documentForProjectPlanTemplate.RelatedID = int.Parse(strPlanID);
            documentForProjectPlanTemplate.Author = strAuthor;
            documentForProjectPlanTemplate.DocName = strFileName2;
            documentForProjectPlanTemplate.Address = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName2;
            documentForProjectPlanTemplate.UploadManCode = strUserCode;
            documentForProjectPlanTemplate.UploadManName = GetUserName(strUserCode);
            documentForProjectPlanTemplate.UploadTime = DateTime.Now;
            documentForProjectPlanTemplate.Visible = strVisible;
            documentForProjectPlanTemplate.DepartCode = strDepartCode;
            documentForProjectPlanTemplate.DepartName = ShareClass.GetDepartName(strDepartCode);
            documentForProjectPlanTemplate.Status = "处理中";
            documentForProjectPlanTemplate.RelatedName = "";


            try
            {
                documentForProjectPlanTemplateBLL.AddDocumentForProjectPlanTemplate(documentForProjectPlanTemplate);

            
                LoadRelatedDoc(strPlanID, strProjectID);
                ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "计划", strPlanID, strPlanName);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSCSBJC + "')", true);
            }
        }

    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
        IList lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        //根据文档有无工作流情况隐藏删除按钮
        ShareClass.HideDataGridDeleteButtonForDocUploadPage(DataGrid1);
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = 0;
        string strUserCode = LB_UserCode.Text.Trim();

        while (i < RadioButtonList1.Items.Count)
        {
            if (RadioButtonList1.Items[i].Selected == true)
            {
                MultiView1.ActiveViewIndex = int.Parse(RadioButtonList1.Items[i].Value);
            }
            i++;
        }
    }

    protected void BT_SubmitApply_Click(object sender, EventArgs e)
    {
        string strWFID, strWLName, strWLType, strTemName, strXMLFileName, strXMLFile1, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName, strUserCode;
        string strCmdText, strDocID;
        DateTime dtCreateTime;

        strDocID = LB_DocID.Text.Trim();

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = GetUserName(strCreatorCode);
        dtCreateTime = DateTime.Now;

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
        workFlow.CreateTime = dtCreateTime;
        workFlow.Status = "新建";
        workFlow.RelatedType = "文件";
        workFlow.RelatedID = int.Parse(strDocID);
        workFlow.DIYNextStep = "Yes"; workFlow.IsPlanMainWorkflow = "NO";

        if (CB_RequiredSMS.Checked == true)
        {
            workFlow.ReceiveSMS = "Yes";
        }
        else
        {
            workFlow.ReceiveSMS = "No";
        }

        if (CB_RequiredMail.Checked == true)
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

            strUserCode = LB_UserCode.Text.Trim();
            strWFID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

            strCmdText = "select * from T_DocumentForProjectPlanTemplate where DocID = " + strDocID;
            strXMLFile2 = Server.MapPath(strXMLFile2);

            xmlProcess.DbToXML(strCmdText, "T_DocumentForProjectPlanTemplate", strXMLFile2);

            ////自动附加要评审的工作流文件
            //ShareClass.AddWLDocumentForProjectPlanTemplateForUploadDocPage(strDocID, int.Parse(strWFID));
            ////自动附加其它已选择的要评审的工作流文件
            //ShareClass.AddMoreWLSelectedDocumentForProjectPlanTemplateForUploadDocPage(DataGrid1, int.Parse(strWFID), strDocID);

            LoadRelatedWL("文件评审", "文件", int.Parse(strDocID));

            //工作流模板是否是自动激活状态
            if (ShareClass.GetWorkflowTemplateIsAutoActiveStatus(strTemName) == "NO")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWJPSSSCDGZLGLYMJHCGZLS + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGZLFQCG + "')", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWJPSSSB + "')", true);
        }
    }

    protected void BT_Refrash_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strTopTreeDocTypeName = "计划" + "：" + strPlanID + " " + strPlanName + " " + Resources.lang.WenDangLieBiao;
        strHQL = "Select TemName From T_WorkFlowTemplate Where TemName In ((Select TemName from T_WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '文件评审'";
        strHQL += " and ((workFlowTemplate.TemName in (Select relatedWorkFlowTemplate.WFTemplateName from T_RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID + "))";
        strHQL += " or ( workFlowTemplate.Authority = '所有' ))";
        strHQL += " and (position(trim(workFlowTemplate.TemName) in '" + strTopTreeDocTypeName + "') > 0)";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC)";
        strHQL += " UNION ";
        strHQL += "(Select TemName from T_WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '文件评审'";
        strHQL += " and ((workFlowTemplate.TemName in (Select relatedWorkFlowTemplate.WFTemplateName from T_RelatedWorkFlowTemplate as relatedWorkFlowTemplate where relatedWorkFlowTemplate.RelatedType = 'Project' and relatedWorkFlowTemplate.RelatedID = " + strProjectID + "))";
        strHQL += " or ( workFlowTemplate.Authority = '所有' ))";
        strHQL += " and (position(trim(workFlowTemplate.TemName) in '" + strTopTreeDocTypeName + "') = 0)";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC)) Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_TemName.DataSource = ds;
        DL_TemName.DataBind();
    }

    protected void AddWLDocumentForProjectPlanTemplate(string strDocID, int intRelatedID)
    {
        string strHQL;
        IList lst;


        strHQL = "from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.DocID = " + strDocID;
        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
        lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);

        DocumentForProjectPlanTemplate documentForProjectPlanTemplate = (DocumentForProjectPlanTemplate)lst[0];

        documentForProjectPlanTemplate.RelatedType = "工作流";
        documentForProjectPlanTemplate.RelatedID = intRelatedID;
        documentForProjectPlanTemplate.RelatedName = "";

        try
        {
            documentForProjectPlanTemplateBLL.AddDocumentForProjectPlanTemplate(documentForProjectPlanTemplate);
        }
        catch
        {
        }
    }

    protected int GetWLID(string strWLName, string strWLType, string strXMLFile, string strCreatorCode, DateTime dtCreateTime)
    {
        string strHQL;
        int intWLID;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLName = " + "'" + strWLName + "'";
        strHQL += " and workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.XMLFile = ";
        strHQL += "'" + strXMLFile + "'" + " and workFlow.CreatorCode = " + "'" + strCreatorCode + "'" + " and to_char(workFlow.CreateTime,'yyyy-mm-dd hh:mi:ss') = " + "'" + dtCreateTime.ToString("yyyy-MM-dd HH:mm:ss") + "'";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        intWLID = workFlow.WLID;

        return intWLID;
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

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }

    protected string GetDepartCode(string strUserCode)
    {
        string strDepartCode, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strDepartCode = projectMember.DepartCode.Trim();
        return strDepartCode;
    }

    protected void LoadRelatedDoc(string strPlanID, string strProjectID)
    {
        string strHQL;
        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartCode = GetDepartCode(strUserCode);
        IList lst;
        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();

        if (strPlanID != null)
        {
            strHQL = "from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where ";
            strHQL += " (documentForProjectPlanTemplate.RelatedType = '计划' and documentForProjectPlanTemplate.RelatedID = " + strPlanID + ")";
            strHQL += "and rtrim(ltrim(documentForProjectPlanTemplate.Status)) <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
        }
        else
        {
            strHQL = "from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where ";
            strHQL += " (documentForProjectPlanTemplate.RelatedType = '计划' and documentForProjectPlanTemplate.RelatedID in (Select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strPlanVerID + "))";
            strHQL += " and rtrim(ltrim(documentForProjectPlanTemplate.Status)) <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
        }
    
        documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
        lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_TotalCount.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();
    }


    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID, strHQL, strUserCode, strDepartCode, strDocType;
        IList lst1, lst2;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        strDocTypeID = treeNode.Target.Trim();

        DocTypeBLL docTypeBLL = new DocTypeBLL();
        strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        lst1 = docTypeBLL.GetAllDocTypes(strHQL);

        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();

        if (strDocTypeID != "0")
        {
            DocType docType = (DocType)lst1[0];
            strDocType = docType.Type.Trim();

            strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = 'ProjectType' and documentForProjectPlanTemplate.RelatedName = " + "'" + strProjectType + "'" + " and  documentForProjectPlanTemplate.DocType = " + "'" + strDocType + "'" + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
            LB_FindCondition.Text = Resources.lang.CXFWWJLX + strDocType;
        }
        else
        {
            strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType =  'ProjectType' and documentForProjectPlanTemplate.RelatedName = " + "'" + strProjectType + "'" + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;
        }

        lst2 = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
        DataGrid3.DataSource = lst2;
        DataGrid3.DataBind();

        LB_TotalCount.Text = Resources.lang.CXDDWJS + ": " + lst2.Count.ToString();
    }

    protected void LoadProjectTypeRelatedDoc(string strRelatedType, string strRelatedName)
    {
        string strHQL;
        IList lst;

        strHQL = " from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = 'ProjectType' and documentForProjectPlanTemplate.RelatedName = " + "'" + strRelatedName + "'" + " and documentForProjectPlanTemplate.Status <> '删除' Order by documentForProjectPlanTemplate.DocID DESC";
        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
        lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected void LoadProjectPlanDoc(string strProjectID, string strPlanVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from DocumentForProjectPlanTemplate as documentForProjectPlanTemplate where documentForProjectPlanTemplate.RelatedType = '计划'";
        strHQL += " and documentForProjectPlanTemplate.RelatedID in (Select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strPlanVerID + ")";
        strHQL += " order by documentForProjectPlanTemplate.DocID DESC";
        DocumentForProjectPlanTemplateBLL documentForProjectPlanTemplateBLL = new DocumentForProjectPlanTemplateBLL();
        lst = documentForProjectPlanTemplateBLL.GetAllDocumentForProjectPlanTemplates(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected string GetDocTypeName(string strDocTypeID)
    {
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        DocType docType = (DocType)lst[0];

        return docType.Type.Trim();
    }

}

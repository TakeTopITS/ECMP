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

using System.Text;
using System.IO;
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using NPOI.OpenXmlFormats.Dml.Diagram;
using System.Windows.Forms;


public partial class TTAPPWLRelatedDoc : System.Web.UI.Page
{
    string strWLID, strWLName, strWLType, strStepDetailID, strWFStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strDepartCode;

        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        strUserName = ShareClass.GetUserName(strUserCode);
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strWLID = Request.QueryString["WLID"];
        LB_WLID.Text = strWLID;

        strStepDetailID = Request.QueryString["ID"];

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        if (lst.Count > 0)
        {
            WorkFlow workFlow = (WorkFlow)lst[0];

            strWLName = workFlow.WLName.Trim();
            strWLType = workFlow.WLType.Trim();
            strWFStatus = workFlow.Status.Trim();
        }
        else
        {
            strHQL = "from WorkFlowBackup as workFlow where workFlow.WLID = " + strWLID;
            WorkFlowBackupBLL workFlowBackupBLL = new WorkFlowBackupBLL();
            lst = workFlowBackupBLL.GetAllWorkFlowBackups(strHQL);
            WorkFlowBackup workFlowBackup = (WorkFlowBackup)lst[0];

            strWLName = workFlowBackup.WLName.Trim();
            strWLType = workFlowBackup.WLType.Trim();
            strWFStatus = workFlowBackup.Status.Trim();
        }



        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "工作流", strWLID, strWLName);
            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;
            LoadRelatedDoc(strWLID);

            ShareClass.InitialUserDocTypeTree(TreeView3, strUserCode);
            ShareClass.LoadWorkflowActorGroupDropDownList(DL_Visible, strUserCode);

            TB_Author.Text = strUserName;

            //设置对象相关缺省的工作流模板
            ShareClass.SetDefaultWorkflowTemplateByRelateName("Workflow", strWLID, strWLName, DL_TemName);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID, strHQL, strUserCode, strDepartCode, strDocType;
        IList lst1, lst2;

        DataGrid1.CurrentPageIndex = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        System.Web.UI.WebControls.TreeNode treeNode = new System.Web.UI.WebControls.TreeNode();
        treeNode = TreeView1.SelectedNode;

        strDocTypeID = treeNode.Target.Trim();

        DocTypeBLL docTypeBLL = new DocTypeBLL();
        strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        lst1 = docTypeBLL.GetAllDocTypes(strHQL);

        DocumentBLL documentBLL = new DocumentBLL();

        if (strDocTypeID != "0")
        {
            DocType docType = (DocType)lst1[0];
            strDocType = docType.Type.Trim();

            LB_DocTypeID.Text = docType.ID.ToString();
            TB_DocType.Text = docType.Type.Trim();

            strHQL = " from Document as document where document.RelatedType = '工作流' and document.RelatedID = " + strWLID + " and  document.DocType = " + "'" + strDocType + "'" + " and document.Status <> '删除' Order by document.DocID DESC";
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

            strHQL = " from Document as document where document.RelatedType = '工作流' and document.RelatedID = " + strWLID + " and document.Status <> '删除' Order by document.DocID DESC";
            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;
        }

        lst2 = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst2;
        DataGrid1.DataBind();

        LB_TotalCount.Text = Resources.lang.CXDDWJS + ": " + lst2.Count.ToString();
        LB_Sql.Text = strHQL;

        //根据文档有无工作流情况隐藏删除按钮
        ShareClass.HideDataGridDeleteButtonForDocUploadPage(DataGrid1);
    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text.Trim();
            string strUserName = ShareClass.GetUserName(strUserCode);
            string strDocID = e.Item.Cells[0].Text.Trim();

            string strDocName = e.Item.Cells[3].Text.Trim();
            string strUploadManCode;
            string strUploadMan = e.Item.Cells[6].Text.Trim();
            string strProjectID = LB_ProjectID.Text.Trim();

            string strCreatorCode = GetWorkflowCreatorCode(LB_WLID.Text.Trim());
            string strStatus = GetWorkflowStepDetailStatus(strStepDetailID);

            if (e.CommandName == "Delete")
            {
                if (strWFStatus != "新建")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZLCYJHXGWJBNSC + "')", true);
                    return;
                }

                if (strWLType == "文件评审" & strStatus == "批准")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFFCZWJPSLXDGZLDFJZLCBZPZHBNSCWJJC + "')", true);
                    return;
                }

                strHQL = "from Document as document where document.DocID = " + strDocID;
                DocumentBLL documentBLL = new DocumentBLL();
                lst = documentBLL.GetAllDocuments(strHQL);
                Document document = (Document)lst[0];

                strUploadManCode = document.UploadManCode.Trim();

                if (strUserCode == strUploadManCode)
                {
                    document.Status = "删除";

                    documentBLL.UpdateDocument(document, int.Parse(strDocID));

                    //删除更多文档
                    ShareClass.DeleteMoreDocByDataGrid(DataGrid1);

                    LoadRelatedDoc(strWLID);
                    ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "工作流", strWLID, strWLName);
                    LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;
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

            string strAuthor = TB_Author.Text.Trim();

            string strDocTypeID = LB_DocTypeID.Text.Trim();
            if (strDocTypeID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGXZWDLX + "')", true);
                return;
            }
            string strDocType = GetDocTypeName(strDocTypeID);

            string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
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
                //if (this.AttachFile.ContentLength > 10240000)
                //{
                //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBNSCDYSZDWJ + "')", true);
                //    return;
                //}
            }

            if (fi.Exists)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "')", true);
            }
            else
            {
                DocumentBLL documentBLL = new DocumentBLL();
                Document document = new Document();

                document.RelatedType = "工作流";
                document.RelatedID = int.Parse(strWLID);
                document.DocType = strDocType;
                document.DocTypeID = int.Parse(strDocTypeID);
                document.Author = strAuthor;
                document.DocName = strFileName2;
                document.Address = "Doc\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\" + strFileName3;
                document.UploadManCode = strUserCode;
                document.UploadManName = ShareClass.GetUserName(strUserCode);
                document.UploadTime = DateTime.Now;
                document.Visible = strVisible;
                document.DepartCode = strDepartCode; document.DepartName = ShareClass.GetDepartName(strDepartCode);
                document.Status = "处理中";
                document.RelatedName = "";


                try
                {
                    documentBLL.AddDocument(document);
                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);

                    LoadRelatedDoc(strWLID);
                    ShareClass.InitialDocTypeTree(TreeView1, strUserCode, "工作流", strWLID, strWLName);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        }
    }

    protected void BT_LoadDoc_Click(object sender, EventArgs e)
    {
        LoadRelatedDoc(strWLID);
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

    protected void BT_Refrash_Click(object sender, EventArgs e)
    {
        //设置对象相关缺省的工作流模板
        ShareClass.SetDefaultWorkflowTemplateByRelateName("Workflow", strWLID, strWLName, DL_TemName);
    }

    protected void BT_SubmitApply_Click(object sender, EventArgs e)
    {
        string strWFID, strWLName, strWLType, strTemName, strXMLFileName, strXMLFile1, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strDocID;
        string strUserCode;

        DateTime dtCreateTime;

        strDocID = LB_DocID.Text.Trim();

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = ShareClass.GetUserName(strCreatorCode);
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

            strCmdText = "select * from T_Document where DocID = " + strDocID;
            strXMLFile2 = Server.MapPath(strXMLFile2);

            xmlProcess.DbToXML(strCmdText, "T_Document", strXMLFile2);

            //自动附加要评审的工作流文件
            ShareClass.AddWLDocumentForUploadDocPage(strDocID, int.Parse(strWFID));
            //自动附加其它已选择的要评审的工作流文件
            ShareClass.AddMoreWLSelectedDocumentForUploadDocPage(DataGrid1, int.Parse(strWFID), strDocID);

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

    protected void AddWLDocument(string strDocID, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Document as document where document.DocID = " + strDocID;
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);

        Document document = (Document)lst[0];

        document.RelatedType = "工作流";
        document.RelatedID = intRelatedID;
        document.RelatedName = "";


        try
        {
            documentBLL.AddDocument(document);
        }
        catch
        {
        }
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

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text;
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        DocumentBLL documentBLL = new DocumentBLL();
        IList lst = documentBLL.GetAllDocuments(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        //根据文档有无工作流情况隐藏删除按钮
        ShareClass.HideDataGridDeleteButtonForDocUploadPage(DataGrid1);
    }

    protected void LoadRelatedDoc(string strWLID)
    {
        string strHQL, strUserCode, strDepartCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "from Document as document where document.Status <> '删除' ";
        strHQL += " and (document.RelatedType = '工作流' and document.RelatedID = " + strWLID;
        strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " or (document.Visible = '部门' and document.DepartCode = " + "'" + strDepartCode + "'" + " )";
        strHQL += " or ( document.Visible = '全体'))) ";
        strHQL += " or ((document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='工作流' and meeting.RelatedID = " + strWLID + "))";
        strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " or ( document.Visible = '全体')))";

        strHQL += " or ((document.RelatedType = '合同' and document.RelatedID in (select workFlow.RelatedID from WorkFlow as workFlow where workFlow.RelatedType = '合同' and workFlow.WLID = " + strWLID + "))";
        //strHQL += " or ((document.RelatedType = '合同' and document.RelatedID in (select workFlowBackup.RelatedID from WorkFlowBackup as workFlowBackup where workFlowBackup.RelatedType = '合同' and workFlowBackup.WLID = " + strWLID + "))";


        strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " or ( document.Visible = '全体')))";
        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_TotalCount.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        //根据文档有无工作流情况隐藏删除按钮
        ShareClass.HideDataGridDeleteButtonForDocUploadPage(DataGrid1);
    }

    protected string GetDocTypeName(string strDocTypeID)
    {
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        DocType docType = (DocType)lst[0];

        return docType.Type.Trim();
    }

    protected string GetWorkflowCreatorCode(string strWFID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        WorkFlow workFlow = (WorkFlow)lst[0];

        return workFlow.CreatorCode.Trim();
    }

    protected string GetWorkflowStepDetailStatus(string strID)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from WorkFlowStepDetail as workFlowStepDetail where workFlowStepDetail.ID = " + strID;
            WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();
            lst = workFlowStepDetailBLL.GetAllWorkFlowStepDetails(strHQL);
            WorkFlowStepDetail workFlowStepDetail = (WorkFlowStepDetail)lst[0];
            return workFlowStepDetail.Status.Trim();
        }
        catch
        {
            return "处理中";
        }
    }


}

using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopSecurity;


public partial class TTOfficialDocumentEdit : System.Web.UI.Page
{
    string strUserCode;
    string strIsMobileDevice;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString;

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(CKE_MainContent);

        strUserCode = Session["UserCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "公文编辑", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HTEditor1.Visible = true;
            }
            else
            {
                CKE_MainContent.Visible = true;
            }

            ShareClass.LoadWFTemplate(strUserCode, "公文审批", DL_TemName);


            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityNewsNotice(Resources.lang.ZZJGT, TreeView1, strUserCode);

            strHQL = "from OfficialDocument as officialDocument where officialDocument.PublisherCode = " + "'" + strUserCode + "'";
            strHQL += " Order by officialDocument.ID DESC";
            OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
            lst = officialDocumentBLL.GetAllOfficialDocuments(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID, strHQL;
        int intWLNumber;


        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[3].Text.Trim();

            intWLNumber = GetRelatedWorkFlowNumber("公文审批", "公文", strID);
            if (intWLNumber > 0)
            {
                BT_New.Enabled = false;

                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_New.Enabled = true;

                BT_SubmitApply.Enabled = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                strHQL = "Select * From T_OfficialDocument Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OfficialDocument");

                LB_ID.Text = strID;
                TB_Title.Text = ds.Tables[0].Rows[0]["Title"].ToString().Trim();

                if (strIsMobileDevice == "YES")
                {
                    HTEditor1.Text = ds.Tables[0].Rows[0]["Content"].ToString().Trim();
                }
                else
                {
                    CKE_MainContent.Text = ds.Tables[0].Rows[0]["Content"].ToString().Trim();
                }

                HL_ContentDocURL.NavigateUrl = ds.Tables[0].Rows[0]["ContentDocURL"].ToString().Trim();
                TB_ContentDocURL.Text = ds.Tables[0].Rows[0]["ContentDocURL"].ToString().Trim();

                try
                {
                    TB_DepartCode.Text = ds.Tables[0].Rows[0]["RelatedDepartCode"].ToString().Trim();
                    LB_DepartName.Text = ShareClass.GetDepartName(TB_DepartCode.Text);
                }
                catch
                {
                }

                DL_Status.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString().Trim();

                BT_Archive.Enabled = true;

                TB_WLName.Text = Resources.lang.GongWenShenPi + TB_Title.Text.Trim();

                LoadRelatedWL("公文审批", "公文", int.Parse(strID));
            }

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
                try
                {
                    strHQL = "Delete From T_OfficialDocument Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    BT_Archive.Enabled = false;

                    LoadOfficialDocument();

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }


    protected void BT_Import_Click(object sender, EventArgs e)
    {
        string  strWordFile, strHTMLFile, strDocSavePath, strContentFileName;

        try
        {
            strWordFile = TB_ContentDocURL.Text.Trim();

            if (strWordFile != "")
            {
                strWordFile = Server.MapPath(strWordFile);

                strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode + "\\Doc\\";
                strContentFileName = "WordOfficeDocument"  + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".html";

                strHTMLFile = strDocSavePath + strContentFileName;

                MSWordHandler.WordToHTML(strWordFile, strHTMLFile);

                CKE_MainContent.Text = MSWordHandler.ImportToStringFromFile(strHTMLFile);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRSBJC + "')", true);
            }

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDRSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";
        BT_New.Enabled = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();


        if (strID == "")
        {
            AddNews();
        }
        else
        {
            UpdateNews();
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void AddNews()
    {
        string strTitle, strContent, strDepartCode, strDepartName;


        strTitle = TB_Title.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HTEditor1.Text.Trim();
        }
        else
        {
            strContent = CKE_MainContent.Text.Trim();
        }

        strDepartCode = TB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();

        if (strDepartCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGGSBMBNWKCZSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
        OfficialDocument officialDocument = new OfficialDocument();

        officialDocument.Title = strTitle;

        officialDocument.Content = strContent;
        officialDocument.ContentDocUrl = TB_ContentDocURL.Text.Trim();

        officialDocument.RelatedDepartCode = strDepartCode;
        officialDocument.RelatedDepartName = strDepartName;
        officialDocument.PublishTime = DateTime.Now;
        officialDocument.PublisherCode = strUserCode;
        officialDocument.PublisherName = ShareClass.GetUserName(strUserCode);
        officialDocument.Status = "新建";


        try
        {
            officialDocumentBLL.AddOfficialDocument(officialDocument);

            DL_Status.SelectedValue = "新建";

            LB_ID.Text = ShareClass.GetMyCreatedMaxOfficialDocumentID(strUserCode);

            string strID = LB_ID.Text.Trim();

            //保存内容文件URL
            SaveOfficeDocumentDocURL(strID, MSWordHandler.HTMLToWord(strID, CKE_MainContent.Text));

            BT_Archive.Enabled = true;

            LoadOfficialDocument();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void UpdateNews()
    {
        string strHQL;
        IList lst;
        string strID, strTitle, strContent, strDepartCode, strDepartName;

        strID = LB_ID.Text.Trim();

        strTitle = TB_Title.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HTEditor1.Text.Trim();
        }
        else
        {
            strContent = CKE_MainContent.Text.Trim();
        }

        strDepartCode = TB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();

        if (strDepartCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGGSBMBNWKCZSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        try
        {
            strHQL = "From OfficialDocument as officialDocument Where officialDocument.ID = " + strID;
            OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
            lst = officialDocumentBLL.GetAllOfficialDocuments(strHQL);
            OfficialDocument officialDocument = (OfficialDocument)lst[0];

            officialDocument.Title = strTitle;

            officialDocument.Content = strContent;
            officialDocument.ContentDocUrl = TB_ContentDocURL.Text.Trim();

            officialDocument.RelatedDepartCode = strDepartCode;
            officialDocument.RelatedDepartName = strDepartName;
            officialDocument.PublishTime = DateTime.Now;
            officialDocument.PublisherCode = strUserCode;
            officialDocument.PublisherName = ShareClass.GetUserName(strUserCode);


            officialDocumentBLL.UpdateOfficialDocument(officialDocument, int.Parse(strID));

            //保存内容文件URL
            SaveOfficeDocumentDocURL(strID, MSWordHandler.HTMLToWord(strID, CKE_MainContent.Text));

            LoadOfficialDocument();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }


    protected void BT_Archive_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strID, strTitle, strContent, strDepartCode, strDepartName;


        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddNews();
        }
        else
        {
            UpdateNews();
        }

        strID = LB_ID.Text.Trim();

        strTitle = TB_Title.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HTEditor1.Text.Trim();
        }
        else
        {
            strContent = CKE_MainContent.Text.Trim();
        }

        strDepartCode = TB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();

        if (strDepartCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGGSBMBNWKCZSBJC + "')", true);
            return;
        }

        strID = LB_ID.Text.Trim();
        strTitle = TB_Title.Text.Trim();

        try
        {
            strHQL = "From OfficialDocument as officialDocument Where officialDocument.ID = " + strID;
            OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
            lst = officialDocumentBLL.GetAllOfficialDocuments(strHQL);
            OfficialDocument officialDocument = (OfficialDocument)lst[0];

            officialDocument.Title = strTitle;
            officialDocument.Content = strContent;
            officialDocument.ContentDocUrl = TB_ContentDocURL.Text.Trim();

            officialDocument.RelatedDepartCode = strDepartCode;
            officialDocument.RelatedDepartName = strDepartName;
            officialDocument.PublishTime = DateTime.Now;
            officialDocument.PublisherCode = strUserCode;
            officialDocument.PublisherName = ShareClass.GetUserName(strUserCode);
            officialDocument.Status = "归档";

            officialDocumentBLL.UpdateOfficialDocument(officialDocument, int.Parse(strID));

            //保存内容文件URL
            SaveOfficeDocumentDocURL(strID, MSWordHandler.HTMLToWord(strID, CKE_MainContent.Text));

            DL_Status.SelectedValue = "归档";
            LoadOfficialDocument();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGDCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGDSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strID;

        string strWLID;

        strWLID = "0";
        strID = LB_ID.Text.Trim();

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = strUserCode;
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
        workFlow.RelatedType = "公文";
        workFlow.Status = "新建";
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

            LoadRelatedWL(strWLType, "公文", int.Parse(strID));

            //UpdateGoodsPurchaseStatus(strPOID, "处理中");
            DL_Status.SelectedValue = "处理中";

            strCmdText = "select * from T_OfficialDocument where ID = " + strID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_OfficialDocument", strXMLFile2);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJGZLSCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBQJC + "')", true);

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

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '公文评审'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
    }

    //保存公文内容的文档链接
    public void SaveOfficeDocumentDocURL(string strID, string strFileURL)
    {
        string strHQL;

        try
        {
            strHQL = "Update T_OfficialDocument Set ContentDocURL = '" + strFileURL + "' Where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            HL_ContentDocURL.NavigateUrl = strFileURL;
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
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

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        IList lst;

        OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
        lst = officialDocumentBLL.GetAllOfficialDocuments(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadOfficialDocument()
    {
        string strHQL;
        IList lst;

        strHQL = "from OfficialDocument as officialDocument where officialDocument.PublisherCode = " + "'" + strUserCode + "'";
        strHQL += " Order by officialDocument.ID DESC";
        OfficialDocumentBLL officialDocumentBLL = new OfficialDocumentBLL();
        lst = officialDocumentBLL.GetAllOfficialDocuments(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
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

}

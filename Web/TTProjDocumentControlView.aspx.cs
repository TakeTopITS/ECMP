using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTProjDocumentControlView : System.Web.UI.Page
{
    string strUserCode, strProjectID;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strProjectID = Request.QueryString["ProjectID"];

        //this.Title = Resources.lang.Project + strProjectID + " " + ShareClass.GetProjectName(strProjectID.Trim()) + "的项目文控";

        LB_UserCode.Text = strUserCode.Trim();
        LB_UserName.Text = ShareClass.GetUserName(strUserCode.Trim());
        LB_ReqID.Text = strProjectID.Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DocTypeTree(TreeView1, strUserCode, strProjectID, ShareClass.GetProjectName(strProjectID.Trim()));
            DLC_CreateDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_FigureDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_IssueDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_IssuingDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TB_Creator.Text = strUserCode;
            TB_Creator1.Text = strUserCode;
            TB_Distribution.Text = strUserCode;

            LoadProDocType();
            LoadProGraphRegistrationName();
            LoadProReceiptRegistrationName();
            BindInformation();
        }
    }

    /// <summary>
    /// 根据情况显示右边列表信息，1 收图登记,2 发图登记,3 收文登记,4 发文登记
    /// </summary>
    protected void BindInformation()
    {
        string strtype = lbl_ParamaValue.Text.Trim();
        if (strtype.Equals("2"))
        {
            Panel_ProSendFigureRegistration.Visible = true;
            Panel_ProGraphRegistration.Visible = false;
            Panel_ProIssueRegistration.Visible = false;
            Panel_ProReceiptRegistration.Visible = false;
            TabContainer2.ActiveTabIndex = 1;
            LoadProSendFigureRegistration();
            LB_ProGraphRegistrationCount.Visible = false;
            LB_ProIssueRegistrationCount.Visible = false;
            LB_ProReceiptRegistrationCount.Visible = false;
            LB_ProSendFigureRegistrationCount.Visible = true;
        }
        else if (strtype.Equals("3"))
        {
            Panel_ProSendFigureRegistration.Visible = false;
            Panel_ProGraphRegistration.Visible = false;
            Panel_ProIssueRegistration.Visible = false;
            Panel_ProReceiptRegistration.Visible = true;
            TabContainer2.ActiveTabIndex = 2;
            LoadProReceiptRegistration();
            LB_ProGraphRegistrationCount.Visible = false;
            LB_ProIssueRegistrationCount.Visible = false;
            LB_ProReceiptRegistrationCount.Visible = true;
            LB_ProSendFigureRegistrationCount.Visible = false;
        }
        else if (strtype.Equals("4"))
        {
            Panel_ProSendFigureRegistration.Visible = false;
            Panel_ProGraphRegistration.Visible = false;
            Panel_ProIssueRegistration.Visible = true;
            Panel_ProReceiptRegistration.Visible = false;
            TabContainer2.ActiveTabIndex = 3;
            LoadProIssueRegistration();
            LB_ProGraphRegistrationCount.Visible = false;
            LB_ProIssueRegistrationCount.Visible = true;
            LB_ProReceiptRegistrationCount.Visible = false;
            LB_ProSendFigureRegistrationCount.Visible = false;
        }
        else
        {
            Panel_ProSendFigureRegistration.Visible = false;
            Panel_ProGraphRegistration.Visible = true;
            Panel_ProIssueRegistration.Visible = false;
            Panel_ProReceiptRegistration.Visible = false;
            TabContainer2.ActiveTabIndex = 0;
            LoadProGraphRegistration();
            LB_ProGraphRegistrationCount.Visible = true;
            LB_ProIssueRegistrationCount.Visible = false;
            LB_ProReceiptRegistrationCount.Visible = false;
            LB_ProSendFigureRegistrationCount.Visible = false;
        }
    }

    /// <summary>
    /// 定义文控类型树
    /// </summary>
    /// <param name="tv">控件</param>
    /// <param name="strUserCode">用户编码</param>
    /// <param name="strprojectid">项目编号</param>
    /// <param name="strprojectname">项目名称</param>
    protected void DocTypeTree(TreeView tv, string strUserCode, string strprojectid, string strprojectname)
    {
        //添加根节点
        tv.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = Resources.lang.Project + strprojectid + " " + strprojectname + " 文控列表";
        node1.Target = "0";
        node1.Expanded = true;
        tv.Nodes.Add(node1);

        string namelist = "收图登记,发图登记,收文登记,发文登记";
        string[] tempNameList = namelist.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

        for (int i = 0; i < tempNameList.Length; i++)
        {
            node3 = new TreeNode();
            node3.Text = (i + 1) + "." + tempNameList[i].ToString();
            node3.Target = (i + 1).ToString();
            node3.Expanded = false;
            node1.ChildNodes.Add(node3);

            GetProDocGraphControlTreeView(tempNameList[i].ToString().Trim(), node3);

            tv.DataBind();
        }
    }

    /// <summary>
    /// 根据父节点名称，获取其子节点名称
    /// </summary>
    /// <param name="strParentName"></param>
    /// <returns></returns>
    protected void GetProDocGraphControlTreeView(string strParentName, TreeNode node)
    {
        string strHQL = "From ProDocGraphControl as proDocGraphControl Where proDocGraphControl.ParentName='" + strParentName + "' Order By proDocGraphControl.SortNo ";
        ProDocGraphControlBLL proDocGraphControlBLL = new ProDocGraphControlBLL();
        IList lst = proDocGraphControlBLL.GetAllProDocGraphControls(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                ProDocGraphControl proDocGraphControl = (ProDocGraphControl)lst[i];
                TreeNode node1 = new TreeNode();
                node1.Text = node.Text.Trim().Substring(0, node.Text.Trim().LastIndexOf(".")) + "." + proDocGraphControl.SortNo.ToString() + "." + proDocGraphControl.ClassificationName.Trim();
                node1.Target = node.Target.Trim() + "_" + proDocGraphControl.ID;
                node1.Expanded = false;
                node.ChildNodes.Add(node1);

                GetProDocGraphControlTreeView(proDocGraphControl.ClassificationName.Trim(), node1);
            }
        }
    }

    /// <summary>
    /// 收图登记
    /// </summary>
    protected void LoadProGraphRegistration()
    {
        string strHQL = "Select * From T_ProGraphRegistration Where ProjectID='" + strProjectID + "' ";
        if (lbl_TreeViewName.Text.Trim() != "" && lbl_TreeViewName.Text.Trim() != "收图登记")
        {
            strHQL += " and DocType='" + lbl_TreeViewName.Text.Trim() + "' ";
        }
        strHQL += "Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProGraphRegistration");

        DataGrid3.CurrentPageIndex = 0;
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
        lbl_sql3.Text = strHQL;

        LB_FindCondition.Text = "收图登记列表";
        LB_ProGraphRegistrationCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 发图登记
    /// </summary>
    protected void LoadProSendFigureRegistration()
    {
        string strHQL = "Select * From T_ProSendFigureRegistration Where FileNo in (Select FileNo From T_ProGraphRegistration Where ProjectID='" + strProjectID + "') ";
        if (lbl_TreeViewName.Text.Trim() != "" && lbl_TreeViewName.Text.Trim() != "收图登记")
        {
            strHQL += " and DocType='" + lbl_TreeViewName.Text.Trim() + "' ";
        }
        strHQL += "Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProSendFigureRegistration");

        DataGrid5.CurrentPageIndex = 0;
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
        lbl_sql4.Text = strHQL;

        LB_FindCondition.Text = "发图登记列表";
        LB_ProSendFigureRegistrationCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 收文登记
    /// </summary>
    protected void LoadProReceiptRegistration()
    {
        string strHQL = "Select * From T_ProReceiptRegistration Where ProjectID='" + strProjectID + "' ";
        if (lbl_TreeViewName.Text.Trim() != "" && lbl_TreeViewName.Text.Trim() != "收文登记")
        {
            strHQL += " and DocType='" + lbl_TreeViewName.Text.Trim() + "' ";
        }
        strHQL += "Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProReceiptRegistration");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        lbl_sql1.Text = strHQL;

        LB_FindCondition.Text = "收文登记列表";
        LB_ProReceiptRegistrationCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 发文登记
    /// </summary>
    protected void LoadProIssueRegistration()
    {
        string strHQL = "Select * From T_ProIssueRegistration Where DocumentNo in (Select DocumentNo From T_ProReceiptRegistration Where ProjectID='" + strProjectID + "') ";
        if (lbl_TreeViewName.Text.Trim() != "" && lbl_TreeViewName.Text.Trim() != "收文登记")
        {
            strHQL += " and DocType='" + lbl_TreeViewName.Text.Trim() + "' ";
        }
        strHQL += "Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProIssueRegistration");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql2.Text = strHQL;

        LB_FindCondition.Text = "发文登记列表";
        LB_ProIssueRegistrationCount.Text = "总数：" + ds.Tables[0].Rows.Count.ToString();
    }

    /// <summary>
    /// 绑定收图登记中的档案号及名称
    /// </summary>
    protected void LoadProGraphRegistrationName()
    {
        string strHQL;
        IList lst;
        strHQL = "From ProGraphRegistration as proGraphRegistration Where proGraphRegistration.ProjectID='" + strProjectID + "' Order By proGraphRegistration.ID Desc";
        ProGraphRegistrationBLL proGraphRegistrationBLL = new ProGraphRegistrationBLL();
        lst = proGraphRegistrationBLL.GetAllProGraphRegistrations(strHQL);
        ddl_FileNo.DataSource = lst;
        ddl_FileNo.DataBind();
        ddl_FileNo.Items.Insert(0, new ListItem("--Select--", ""));
    }

    /// <summary>
    /// 绑定收文登记中的文件编号及名称
    /// </summary>
    protected void LoadProReceiptRegistrationName()
    {
        string strHQL;
        IList lst;
        strHQL = "From ProReceiptRegistration as proReceiptRegistration Where proReceiptRegistration.ProjectID='" + strProjectID + "' Order By proReceiptRegistration.ID Desc";
        ProReceiptRegistrationBLL proReceiptRegistrationBLL = new ProReceiptRegistrationBLL();
        lst = proReceiptRegistrationBLL.GetAllProReceiptRegistrations(strHQL);
        ddl_DocumentNo.DataSource = lst;
        ddl_DocumentNo.DataBind();
        ddl_DocumentNo.Items.Insert(0, new ListItem("--Select--", ""));
    }

    /// <summary>
    /// 绑定类型
    /// </summary>
    protected void LoadProDocType()
    {
        DataTable dt = GetList("收图登记");
        if (dt != null && dt.Rows.Count > 0)
        {
            ddl_DocType.Items.Clear();
            ddl_DocType.Items.Insert(0, new ListItem("收图登记", "收图登记"));
            SetInterval(ddl_DocType, "收图登记", " ");
        }
        else
        {
            ddl_DocType.Items.Clear();
            ddl_DocType.Items.Insert(0, new ListItem("收图登记", "收图登记"));
        }

        dt = GetList("收文登记");
        if (dt != null && dt.Rows.Count > 0)
        {
            ddl_DocType1.Items.Clear();
            ddl_DocType1.Items.Insert(0, new ListItem("收文登记", "收文登记"));
            SetInterval(ddl_DocType1, "收文登记", " ");
        }
        else
        {
            ddl_DocType1.Items.Clear();
            ddl_DocType1.Items.Insert(0, new ListItem("收文登记", "收文登记"));
        }
    }

    /// <summary>
    /// 获取项目文控类型
    /// </summary>
    protected DataTable GetList(string strParentName)
    {
        string strHQL = "Select * From T_ProDocGraphControl ";
        if (!string.IsNullOrEmpty(strParentName) && strParentName.Trim() != "")
        {
            strHQL += " Where ParentName='" + strParentName.Trim() + "' ";
        }
        strHQL += " Order By SortNo ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProDocGraphControl");
        return ds.Tables[0];
    }

    protected void SetInterval(DropDownList DDL, string strParentName, string interval)
    {
        interval += "├";

        DataTable list = GetList(strParentName);
        if (list.Rows.Count > 0 && list != null)
        {
            for (int i = 0; i < list.Rows.Count; i++)
            {
                DDL.Items.Add(new ListItem(string.Format("{0}{1}", interval, list.Rows[i]["ClassificationName"].ToString().Trim()), list.Rows[i]["ClassificationName"].ToString().Trim()));

                ///递归
                SetInterval(DDL, list.Rows[i]["ClassificationName"].ToString().Trim(), interval);
            }
        }
    }

    protected void GetGraphNums(string strFileNo, string strSendId)
    {
        int filenumG = 0, tablenumG = 0, figurenumG = 0;
        int filenumU = 0, tablenumU = 0, figurenumU = 0;
        string strHQL = "From ProGraphRegistration as proGraphRegistration Where proGraphRegistration.FileNo='" + strFileNo.Trim() + "' and proGraphRegistration.ProjectID='" + LB_ReqID.Text.Trim() + "' ";
        ProGraphRegistrationBLL proGraphRegistrationBLL = new ProGraphRegistrationBLL();
        IList lst = proGraphRegistrationBLL.GetAllProGraphRegistrations(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            ProGraphRegistration proGraphRegistration = (ProGraphRegistration)lst[0];
            filenumG = proGraphRegistration.FileNum;
            tablenumG = proGraphRegistration.TableNum;
            figurenumG = proGraphRegistration.FigureNum;

            if (string.IsNullOrEmpty(strSendId))
                strHQL = "From ProSendFigureRegistration as proSendFigureRegistration Where proSendFigureRegistration.FileNo='" + strFileNo.Trim() + "' and char_length(rtrim(ltrim(proSendFigureRegistration.BackPer))) = 0 ";
            else
                strHQL = "From ProSendFigureRegistration as proSendFigureRegistration Where proSendFigureRegistration.FileNo='" + strFileNo.Trim() + "' and char_length(rtrim(ltrim(proSendFigureRegistration.BackPer))) = 0 and proSendFigureRegistration.ID<>'" + strSendId + "' ";
            ProSendFigureRegistrationBLL proSendFigureRegistrationBLL = new ProSendFigureRegistrationBLL();
            lst = proSendFigureRegistrationBLL.GetAllProSendFigureRegistrations(strHQL);
            if (lst.Count > 0 && lst != null)
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    ProSendFigureRegistration proSendFigureRegistration = (ProSendFigureRegistration)lst[i];
                    filenumU += proSendFigureRegistration.FileNum;
                    tablenumU += proSendFigureRegistration.TableNum;
                    figurenumU += proSendFigureRegistration.FigureNum;
                }
            }
        }
        lbl_FileOld.Text = (filenumG - filenumU).ToString();
        lbl_TableOld.Text = (tablenumG - tablenumU).ToString();
        lbl_FigureOld.Text = (figurenumG - figurenumU).ToString();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        string strDocTypeID = treeNode.Target.Trim();
        string strDocTypeName = treeNode.Text.Trim();
        string strParentName = treeNode.Parent.Text.Trim();
        if (strDocTypeID.IndexOf("_") > -1)
        {
            strDocTypeID = strDocTypeID.Substring(0, strDocTypeID.IndexOf("_"));
        }
        lbl_ParamaValue.Text = strDocTypeID;

        if (strDocTypeName.Contains(Resources.lang.Project) && strDocTypeName.Contains("文控列表"))
        {
            lbl_TreeViewName.Text = "";
        }
        else
        {
            if (strDocTypeName.Contains("."))
            {
                lbl_TreeViewName.Text = strDocTypeName.Substring(strDocTypeName.LastIndexOf(".") + 1);
                if (lbl_TreeViewName.Text == "发图登记")
                    lbl_TreeViewName.Text = "收图登记";
                else if (lbl_TreeViewName.Text == "发文登记")
                    lbl_TreeViewName.Text = "收文登记";
            }
            else
            {
                lbl_TreeViewName.Text = "";
            }
        }

        BindInformation();
    }

    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        if (e.CommandName != "Page")
        {
            string strDocID = e.Item.Cells[0].Text.Trim();
            strHQL = "from ProReceiptRegistration as proReceiptRegistration where proReceiptRegistration.ID = " + strDocID;
            ProReceiptRegistrationBLL proReceiptRegistrationBLL = new ProReceiptRegistrationBLL();
            lst = proReceiptRegistrationBLL.GetAllProReceiptRegistrations(strHQL);
            ProReceiptRegistration proReceiptRegistration = (ProReceiptRegistration)lst[0];

            if (e.CommandName == "View")
            {
                TB_ID3.Text = proReceiptRegistration.ID.ToString();
                TB_DocumentNo.Text = proReceiptRegistration.DocumentNo.Trim();
                TB_FileName1.Text = proReceiptRegistration.FileName.Trim();
                TB_DispatchDepartment.Text = proReceiptRegistration.DispatchDepartment.Trim();
                TB_FileWay.Text = proReceiptRegistration.FileWay.Trim();
                if (string.IsNullOrEmpty(proReceiptRegistration.DestroyPeople) || proReceiptRegistration.DestroyPeople.Trim() == "")
                {
                    ddl_IsDestroy.SelectedValue = "否";
                }
                else
                    ddl_IsDestroy.SelectedValue = "是";
                DLC_CreateDate.Text = proReceiptRegistration.CreateDate.ToString("yyyy-MM-dd");
                TB_Creator1.Text = proReceiptRegistration.Creator.Trim();
                ddl_DocType1.SelectedValue = proReceiptRegistration.DocType.Trim();
            }
            lbl_TreeViewName.Text = proReceiptRegistration.DocType.Trim();
        }
        lbl_ParamaValue.Text = "3";
        BindInformation();
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql1.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProReceiptRegistration");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        if (e.CommandName != "Page")
        {
            string strDocID = e.Item.Cells[0].Text.Trim();
            strHQL = "from ProIssueRegistration as proIssueRegistration where proIssueRegistration.ID = " + strDocID;
            ProIssueRegistrationBLL proIssueRegistrationBLL = new ProIssueRegistrationBLL();
            lst = proIssueRegistrationBLL.GetAllProIssueRegistrations(strHQL);
            ProIssueRegistration proIssueRegistration = (ProIssueRegistration)lst[0];

            if (e.CommandName == "View")
            {
                TB_ID4.Text = proIssueRegistration.ID.ToString();
                ddl_DocumentNo.SelectedValue = proIssueRegistration.DocumentNo.Trim();
                TB_Recipients1.Text = proIssueRegistration.Recipients.Trim();
                NB_Attachments.Amount = proIssueRegistration.Attachments;
                TB_ReceivingDepartment.Text = proIssueRegistration.ReceivingDepartment.Trim();
                if (string.IsNullOrEmpty(proIssueRegistration.Recycling) || proIssueRegistration.Recycling.Trim() == "")
                {
                    ddl_IsRecycle.SelectedValue = "否";
                }
                else
                    ddl_IsRecycle.SelectedValue = "是";
                DLC_IssuingDate.Text = proIssueRegistration.IssuingDate.ToString("yyyy-MM-dd");
                lbl_FilePath1.Text = proIssueRegistration.FilePath.Trim();
                RP_SendFile.DataSource = lst;
                RP_SendFile.DataBind();
                lbl_DocType1.Text = proIssueRegistration.DocType.Trim();
            }
            lbl_TreeViewName.Text = proIssueRegistration.DocType.Trim();
        }
        lbl_ParamaValue.Text = "4";
        BindInformation();
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql2.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProIssueRegistration");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid3_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        if (e.CommandName != "Page")
        {
            string strDocID = e.Item.Cells[0].Text.Trim();
            strHQL = "from ProGraphRegistration as proGraphRegistration where proGraphRegistration.ID = " + strDocID;
            ProGraphRegistrationBLL proGraphRegistrationBLL = new ProGraphRegistrationBLL();
            lst = proGraphRegistrationBLL.GetAllProGraphRegistrations(strHQL);
            ProGraphRegistration proGraphRegistration = (ProGraphRegistration)lst[0];

            if (e.CommandName == "View")
            {
                TB_ID1.Text = proGraphRegistration.ID.ToString();
                TB_FileNo.Text = proGraphRegistration.FileNo.Trim();
                TB_FileName.Text = proGraphRegistration.FileName.Trim();
                TB_FileNum.Amount = proGraphRegistration.FileNum;
                TB_TableNum.Amount = proGraphRegistration.TableNum;
                NB_FigureNum.Amount = proGraphRegistration.FigureNum;
                DLC_FigureDate.Text = proGraphRegistration.FigureDate.ToString("yyyy-MM-dd");
                TB_Creator.Text = proGraphRegistration.Creator.Trim();
                ddl_DocType.SelectedValue = proGraphRegistration.DocType.Trim();
                TB_GraphNo.Text = string.IsNullOrEmpty(proGraphRegistration.GraphNo) ? "" : proGraphRegistration.GraphNo.Trim();
                TB_Remark.Text = string.IsNullOrEmpty(proGraphRegistration.Remark) ? "" : proGraphRegistration.Remark.Trim();
            }
            lbl_TreeViewName.Text = proGraphRegistration.DocType.Trim();
        }
        lbl_ParamaValue.Text = "1";
        BindInformation();
    }

    protected void DataGrid3_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql3.Text.Trim();
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProGraphRegistration");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void DataGrid5_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        if (e.CommandName != "Page")
        {
            string strDocID = e.Item.Cells[0].Text.Trim();
            strHQL = "from ProSendFigureRegistration as proSendFigureRegistration where proSendFigureRegistration.ID = " + strDocID;
            ProSendFigureRegistrationBLL proSendFigureRegistrationBLL = new ProSendFigureRegistrationBLL();
            lst = proSendFigureRegistrationBLL.GetAllProSendFigureRegistrations(strHQL);
            ProSendFigureRegistration proSendFigureRegistration = (ProSendFigureRegistration)lst[0];

            if (e.CommandName == "View")
            {
                TB_ID2.Text = proSendFigureRegistration.ID.ToString();
                ddl_FileNo.SelectedValue = proSendFigureRegistration.FileNo.Trim();
                TB_Recipients.Text = proSendFigureRegistration.Recipients.Trim();
                NB_FileNum.Amount = proSendFigureRegistration.FileNum;
                NB_TableNum.Amount = proSendFigureRegistration.TableNum;
                NB_FigureNum1.Amount = proSendFigureRegistration.FigureNum;
                DLC_IssueDate.Text = proSendFigureRegistration.IssueDate.ToString("yyyy-MM-dd");
                TB_Distribution.Text = proSendFigureRegistration.Distribution.Trim();
                TB_FigurePlan.Text = proSendFigureRegistration.FigurePlan.Trim();
                lbl_FilePath.Text = proSendFigureRegistration.FilePath.Trim();
                lbl_DocType.Text = proSendFigureRegistration.DocType.Trim();
                RP_SendGraph.DataSource = lst;
                RP_SendGraph.DataBind();
                
                GetGraphNums(proSendFigureRegistration.FileNo.Trim(), strDocID);

                if (proSendFigureRegistration.BackPer.Trim() == "" || string.IsNullOrEmpty(proSendFigureRegistration.BackPer))
                {
                    ddl_IsBack.SelectedValue = "否";
                }
                else
                    ddl_IsBack.SelectedValue = "是";
            }
            lbl_TreeViewName.Text = proSendFigureRegistration.DocType.Trim();
        }
        lbl_ParamaValue.Text = "2";
        BindInformation();
    }

    protected void DataGrid5_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql4.Text.Trim();
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProSendFigureRegistration");
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected string GetStatusValue(string obj)
    {
        string flag = "否";
        if (string.IsNullOrEmpty(obj) || obj.Trim() == "")
        {
            flag = "否";
        }
        else
            flag = "是";
        return flag;
    }
}
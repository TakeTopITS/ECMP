using System;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;
using Npgsql;

using Microsoft.Win32.SafeHandles;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTProjectMRPPlanToProjectPlan : System.Web.UI.Page
{
    string strUserCode, strMainPlanVerID, strMRPPlanVerID;
    string strRelatedProjectID, strRelatedProjectPlanVerID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strMainPlanVerID = Request.QueryString["MainPlanVerID"];
        strMRPPlanVerID = Request.QueryString["MRPPlanVerID"];

        strUserCode = Session["UserCode"].ToString();

        string strHQL;
        strHQL = string.Format(@"Select ID,PlanMRPVerID,Type,ExpendType,OnOrder,OnProduction,OnLine,relatedprojectid,relatedprojectplanverid From T_ItemMainPlanMRPVersion Where PlanVerID = {0} and planmrpverid ={1}",
            strMainPlanVerID, strMRPPlanVerID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");
        strRelatedProjectID = ds.Tables[0].Rows[0]["RelatedProjectID"].ToString();
        strRelatedProjectPlanVerID = ds.Tables[0].Rows[0]["RelatedProjectPlanVerID"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strRelatedProjectID != "0" & strRelatedProjectPlanVerID != "0")
            {
                string strID = GetProjectPlanVersionIDByVerID(strRelatedProjectID, strRelatedProjectPlanVerID);
                if (strID != "0")
                {
                    LB_OldProjectID.Text = strRelatedProjectID;
                    LoadOldProjectPlanVersion(strRelatedProjectID);
                    DL_OldVersionID.SelectedValue = strID;

                    TakeTopPlan.InitialProjectPlanTree(TreeView3, strRelatedProjectID, strRelatedProjectPlanVerID);
                }

                InitialTemplatePrjectTreeForPlan(TreeView2, strUserCode, strRelatedProjectID, Resources.lang.ZongXiangMu, Resources.lang.ZZTSDSSFF, Resources.lang.MuBanXiangMu, Resources.lang.CommonProject);
            }
            else
            {
                InitialTemplatePrjectTreeForPlan(TreeView2, strUserCode, null, Resources.lang.ZongXiangMu, Resources.lang.ZZTSDSSFF, Resources.lang.MuBanXiangMu, Resources.lang.CommonProject);

            }
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID2, strVerID, strID;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        strProjectID2 = treeNode.Target.Trim();

        LB_OldProjectID.Text = strProjectID2;
        LoadOldProjectPlanVersion(strProjectID2);

        if (DL_OldVersionID.Items.Count > 0)
        {
            if (strProjectID2 == strRelatedProjectID)
            {
                strID = GetProjectPlanVersionIDByVerID(strRelatedProjectID, strRelatedProjectPlanVerID);
                DL_OldVersionID.SelectedValue = strID;
            }

            strVerID = DL_OldVersionID.SelectedItem.Text;
            TakeTopPlan.InitialProjectPlanTree(TreeView3, strProjectID2, strVerID);

            HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID2 + "&VerID=" + strVerID;

        }
        else
        {
            TakeTopPlan.InitialProjectPlanTree(TreeView3, strProjectID2, "0");
        }
    }

    //取得版本号ID
    public static string GetProjectPlanVersionIDByVerID(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID = " + strVerID;

        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            return projectPlanVersion.ID.ToString();
        }
        else
        {
            return "0";
        }
    }

    protected void BT_NewVersion_Click(object sender, EventArgs e)
    {
        string strType, strProjectID;
        int intVerID;


        strProjectID = TreeView2.SelectedNode.Target.ToString();

        intVerID = int.Parse(NB_NewVerID.Amount.ToString());
        strType = DL_VersionType.SelectedValue.Trim();

        if (intVerID > 100 | intVerID < 1)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGBBHZNS1100ZJDSZ + "')", true);
            return;
        }

        if (GetProjectPlanVersionCount(strProjectID, intVerID.ToString()) == 0)
        {
            ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
            ProjectPlanVersion projectPlanVersion = new ProjectPlanVersion();
            projectPlanVersion.VerID = intVerID;
            projectPlanVersion.ProjectID = int.Parse(strProjectID);
            projectPlanVersion.Type = strType;
            projectPlanVersion.CreatorCode = strUserCode;
            projectPlanVersion.CreateTime = DateTime.Now;
            projectPlanVersion.FromProjectID = int.Parse(strProjectID);
            projectPlanVersion.FromProjectPlanVerID = intVerID;

            try
            {
                projectPlanVersionBLL.AddProjectPlanVersion(projectPlanVersion);

                LoadOldProjectPlanVersion(LB_OldProjectID.Text);

                string strID, strVerID, strOldProjectID;
                strID = DL_OldVersionID.SelectedValue.Trim();
                strOldProjectID = LB_OldProjectID.Text.Trim();
                strVerID = DL_OldVersionID.SelectedItem.Text.Trim();

                TakeTopPlan.InitialProjectPlanTree(TreeView3, strOldProjectID, strVerID);
                HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strOldProjectID + "&VerID=" + strVerID;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBCXMZKNCZCBBHJC + "')", true);
        }
    }

    protected void BT_DeleteVersion_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strVerID, strProjectID; ;
        string strProjectCreatorCode;

        strProjectID = TreeView2.SelectedNode.Target.ToString();

        strVerID = NB_NewVerID.Amount.ToString();
        strProjectCreatorCode = GetProjectCreatorCode(strProjectID);

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.VerID = " + strVerID + " and projectPlanVersion.ProjectID = " + strProjectID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            strType = projectPlanVersion.Type.Trim();
            try
            {
                if (strType == "基准" || strType == "在用")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBBZBBZNYLXZSCJC + "')", true);
                    return;
                }
                else
                {
                    projectPlanVersionBLL.DeleteProjectPlanVersion(projectPlanVersion);

                    strHQL = "Delete From T_Document Where RelatedType = '计划' and RelatedID in (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_PlanMember where PlanID in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from dependency Where From_ID in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From assignment Where task_id in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID;
                    ShareClass.RunSqlCommand(strHQL);
                }

                LoadOldProjectPlanVersion(LB_OldProjectID.Text);

                string strID, strOldProjectID;
                strID = DL_OldVersionID.SelectedValue.Trim();
                strOldProjectID = LB_OldProjectID.Text.Trim();
                strVerID = DL_OldVersionID.SelectedItem.Text.Trim();

                TakeTopPlan.InitialProjectPlanTree(TreeView3, strOldProjectID, strVerID);
                HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strOldProjectID + "&VerID=" + strVerID;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBKNBCZCBBHJC + "')", true);
            }
        }
    }

    public bool DeleteProjectPlan(string strProjectID, string strPlanVerID)
    {
        string strHQL;
        IList lst;

        string strType;

        try
        {
            strProjectID = TreeView2.SelectedNode.Target.ToString();
        }
        catch (Exception err)
        {
            if (strRelatedProjectID != "0")
            {
                strProjectID = strRelatedProjectID;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提示，请先选择项目！')", true);
                return false;
            }
        }

        strPlanVerID = DL_OldVersionID.SelectedItem.Text.Trim();

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.VerID = " + strPlanVerID + " and projectPlanVersion.ProjectID = " + strProjectID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            strType = projectPlanVersion.Type.Trim();
            try
            {
                if (strType == "基准" || strType == "在用")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBBZBBZNYLXZSCJC + "')", true);
                    return false;
                }
                else
                {
                    strHQL = "Delete From T_Document Where RelatedType = '计划' and RelatedID in (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_PlanMember where PlanID in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from dependency Where From_ID in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From assignment Where task_id in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + ")";
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "delete from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + " and Parent_ID <> 0";
                    ShareClass.RunSqlCommand(strHQL);
                }

                LoadOldProjectPlanVersion(LB_OldProjectID.Text);

                string strID, strOldProjectID;
                strID = DL_OldVersionID.SelectedValue.Trim();
                strOldProjectID = LB_OldProjectID.Text.Trim();
                strPlanVerID = DL_OldVersionID.SelectedItem.Text.Trim();

                TakeTopPlan.InitialProjectPlanTree(TreeView3, strOldProjectID, strPlanVerID);
                HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strOldProjectID + "&VerID=" + strPlanVerID;

                return true;
            }
            catch
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void DL_OldVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID, strOldProjectID;

        strID = DL_OldVersionID.SelectedValue.Trim();
        strOldProjectID = LB_OldProjectID.Text.Trim();
        strVerID = DL_OldVersionID.SelectedItem.Text.Trim();

        TakeTopPlan.InitialProjectPlanTree(TreeView3, strOldProjectID, strVerID);
        HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strOldProjectID + "&VerID=" + strVerID;
    }

    protected void BT_TransferPlan_Click(object sender, EventArgs e)
    {
        string strID, strPlanVerID, strProjectID;

        try
        {
            strID = DL_OldVersionID.SelectedValue.Trim();
            strProjectID = LB_OldProjectID.Text.Trim();
            strPlanVerID = DL_OldVersionID.SelectedItem.Text.Trim();

            if (DeleteProjectPlan(strProjectID, strPlanVerID))
            {
                AddProjectPlanFromNode("PO", strProjectID, strPlanVerID);
                AddProjectPlanFromNode("PD", strProjectID, strPlanVerID);
                AddProjectPlanFromNode("OT", strProjectID, strPlanVerID);

                UpdateProjectPlanStartAndEndTime(strProjectID, strPlanVerID);
                UpdateRelatedProjectIDAndPlanVerID(strProjectID, strPlanVerID);

                TakeTopPlan.InitialProjectPlanTree(TreeView3, strProjectID, strPlanVerID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWZJHSBJC + "')", true);
                return;
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJHCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('失败，请先选择项目和计划版本！')", true);
        }
    }

    public void UpdateProjectPlanStartAndEndTime(string strProjectID, string strPlanVerID)
    {
        string strHQL;

        strHQL = string.Format(@"UPdate T_ImplePlan Set Start_Date = cast('{0}' as date),End_Date = cast('{1}' as date) Where ProjectID = {2} and VerID = {3} and (Parent_ID = 0 
                         or trim(name) in ('PurchasePlan','ProductionPlan','OutsourcingPlan'))", GetMinDateFromProjectPlan(strProjectID, strPlanVerID), GetMaxDateFromProjectPlan(strProjectID, strPlanVerID), strProjectID, strPlanVerID);
        ShareClass.RunSqlCommand(strHQL);
    }

    public void UpdateRelatedProjectIDAndPlanVerID(string strProjectID, string strPlanVerID)
    {
        string strHQL;

        strHQL = string.Format(@"Update T_ItemMainPlanMRPVersion Set RelatedProjectID = {0},RelatedProjectPlanVerID = {1} Where planverid = {2} and planmrpverid = {3}",
                 strProjectID, strPlanVerID, strMainPlanVerID, strMRPPlanVerID);
        ShareClass.RunSqlCommand(strHQL);
    }

    public string GetMinDateFromProjectPlan(string strProjectID, string strPlanVerID)
    {
        string strHQL;

        strHQL = "select min(start_date) from T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + " and Parent_ID <> 0 and name not in ('PurchasePlan','ProductionPlan','OutsourcingPlan')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        return DateTime.Parse(ds.Tables[0].Rows[0][0].ToString()).ToString("yyyy-MM-dd");
    }

    public string GetMaxDateFromProjectPlan(string strProjectID, string strPlanVerID)
    {
        string strHQL;

        strHQL = "select max(start_date) from T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + " and Parent_ID <> 0 and name not in ('PurchasePlan','ProductionPlan','OutsourcingPlan')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        return DateTime.Parse(ds.Tables[0].Rows[0][0].ToString()).ToString("yyyy-MM-dd");

    }

    //拼接计划
    public void AddProjectPlanFromNode(string strMRPPlanType, string strProjectID, string strPlanVerID)
    {
        string strHQL;
        string strPlanID, strNewPlanID = "";

        strHQL = "Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        strPlanID = ds.Tables[0].Rows[0][0].ToString().Trim();

        Project project = ShareClass.GetProject(strProjectID);

        //插入计划节点
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();
        WorkPlan workPlanNew = new WorkPlan();


        workPlanNew.WorkID = 0;
        workPlanNew.Type = "计划";
        workPlanNew.ProjectID = int.Parse(strProjectID);
        workPlanNew.VerID = int.Parse(strPlanVerID);
        workPlanNew.FromProjectID = int.Parse(strProjectID);
        workPlanNew.FromProjectPlanVerID = int.Parse(strPlanVerID);

        if (strMRPPlanType == "PO")
        {
            workPlanNew.Name = "PurchasePlan";
        }
        if (strMRPPlanType == "PD")
        {
            workPlanNew.Name = "ProductionPlan";
        }
        if (strMRPPlanType == "OT")
        {
            workPlanNew.Name = "OutsourcingPlan";
        }

        workPlanNew.Budget = 0;
        workPlanNew.WorkHour = 0;

        workPlanNew.Resource = "";
        workPlanNew.Start_Date = project.BeginDate;
        workPlanNew.End_Date = project.EndDate;

        workPlanNew.MakeDate = DateTime.Now;

        workPlanNew.PriorID = 0;
        workPlanNew.Status = "计划";
        workPlanNew.DefaultSchedule = 0;
        workPlanNew.DefaultCost = 0;


        workPlanNew.LockStatus = "No";
        workPlanNew.SortNumber = 1;

        workPlanNew.UpdateManCode = strUserCode;
        workPlanNew.CreatorCode = strUserCode;
        workPlanNew.UpdateTime = DateTime.Now;
        workPlanNew.PID = int.Parse(strProjectID);

        workPlanNew.Parent_ID = int.Parse(strPlanID);

        try
        {
            workPlanBLL.AddWorkPlan(workPlanNew);
        }
        catch
        {
        }

        strNewPlanID = ShareClass.GetMyCreatedMaxProPlanID(strProjectID, strPlanVerID);

        strHQL = "Update T_ImplePlan Set ParentID = " + strPlanID + "  Where ID = " + strNewPlanID;
        ShareClass.RunSqlCommand(strHQL);
        strHQL = "Update T_ImplePlan Set FromPlanID = " + workPlan.ID.ToString() + "  Where ID = " + strNewPlanID;
        ShareClass.RunSqlCommand(strHQL);

        //改变基准时间段和单位的值
        strHQL = "update T_ImplePlan Set BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date Where ID = " + strNewPlanID;
        ShareClass.RunSqlCommand(strHQL);
        strHQL = "update T_ImplePlan Set Duration = F_WorkDay(Start_Date,End_Date), Duration_Unit = 'd' Where ID = " + strNewPlanID;
        ShareClass.RunSqlCommand(strHQL);


        if (strMRPPlanType == "PO")
        {
            TranferProjectPlanFromItemMRPPlan("PO", strProjectID, strPlanVerID, strNewPlanID, strMainPlanVerID, strMRPPlanVerID);
        }
        if (strMRPPlanType == "PD")
        {
            TranferProjectPlanFromItemMRPPlan("PD", strProjectID, strPlanVerID, strNewPlanID, strMainPlanVerID, strMRPPlanVerID);
        }
        if (strMRPPlanType == "OT")
        {
            TranferProjectPlanFromItemMRPPlan("PD", strProjectID, strPlanVerID, strNewPlanID, strMainPlanVerID, strMRPPlanVerID);
        }
    }

    //拼接计划
    public string TranferProjectPlanFromItemMRPPlan(string strMRPPlanType, string strProjectID, string strPlanVerID, string strParentPlanID, string strMainPlanVerID, string strMRPPlanVerID)
    {
        string strHQL, strNewPlanID;
        IList lst;

        string strPlanIDString = "";

        strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strMainPlanVerID + " and PlanMRPVerID = " + strMRPPlanVerID;
        if (strMRPPlanType == "PO")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strMainPlanVerID + " and PlanMRPVerID = " + strMRPPlanVerID;
        }
        if (strMRPPlanType == "PD")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemProductPlan Where PlanVerID = " + strMainPlanVerID + " and PlanMRPVerID = " + strMRPPlanVerID;
            strHQL += " and ItemCode in (Select ItemCode From T_Item Where Type = '自制件')";
        }
        if (strMRPPlanType == "OT")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemProductPlan Where PlanVerID = " + strMainPlanVerID + " and PlanMRPVerID = " + strMRPPlanVerID;
            strHQL += " and ItemCode in (Select ItemCode From T_Item Where Type = '外协件')";
        }
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            //插入计划节点
            WorkPlan workPlan = new WorkPlan();

            workPlan.WorkID = 0;
            workPlan.Type = "计划";
            workPlan.ProjectID = int.Parse(strProjectID);
            workPlan.VerID = int.Parse(strPlanVerID);
            workPlan.FromProjectID = int.Parse(strProjectID);
            workPlan.FromProjectPlanVerID = int.Parse(strPlanVerID);
            workPlan.Name = ds1.Tables[0].Rows[i]["ItemCode"].ToString().Trim() + ds1.Tables[0].Rows[i]["ItemName"].ToString().Trim() + "(规格：" + ds1.Tables[0].Rows[i]["specification"].ToString().Trim() + "）";

            workPlan.Budget = 0;
            workPlan.WorkHour = 0;

            workPlan.Resource = "";
            workPlan.Start_Date = DateTime.Parse(ds1.Tables[0].Rows[i]["ordertime"].ToString().Trim());
            workPlan.End_Date = DateTime.Parse(ds1.Tables[0].Rows[i]["requiretime"].ToString().Trim());

            workPlan.MakeDate = DateTime.Now;

            workPlan.PriorID = 0;
            workPlan.Status = "计划";
            workPlan.DefaultSchedule = 0;
            workPlan.DefaultCost = 0;
            workPlan.Percent_Done = 0;

            workPlan.LockStatus = "No";
            workPlan.SortNumber = 1;

            workPlan.UpdateManCode = strUserCode;
            workPlan.CreatorCode = strUserCode;
            workPlan.UpdateTime = DateTime.Now;
            workPlan.PID = int.Parse(strProjectID);

            workPlan.Parent_ID = int.Parse(strParentPlanID);

            try
            {
                workPlanBLL.AddWorkPlan(workPlan);
            }
            catch
            {
            }

            strNewPlanID = ShareClass.GetMyCreatedMaxProPlanID(strProjectID, strPlanVerID);

            strPlanIDString += strNewPlanID + ",";

            strHQL = "Update T_ImplePlan Set ParentID = " + strParentPlanID + "  Where ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);
            strHQL = "Update T_ImplePlan Set FromPlanID = " + strNewPlanID + "  Where ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);


            //改变基准时间段和单位的值
            strHQL = "update T_ImplePlan Set BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date Where ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);
            strHQL = "update T_ImplePlan Set Duration = F_WorkDay(Start_Date,End_Date), Duration_Unit = 'd' Where ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);

            //COPY模板项目计划关联模板文档到新的项目
            strHQL = "insert into T_Document(RelatedType,DocTypeID,DocType,RelatedID,DocName,Description,Address,Author,UploadManCode,UploadManName,UploadTime,DepartCode,Visible,Status)";
            strHQL += " select A.RelatedType,A.DocTypeID,A.DocType,C.ID,A.DocName,A.Description,A.Address,A.Author,A.UploadManCode,A.UploadManName,A.UploadTime,A.DepartCode,A.Visible,A.Status ";
            strHQL += " from T_Document A,T_ImplePlan B ,T_ImplePlan C ";
            strHQL += " where A.RelatedType = '计划' and A.RelatedID = B.ID and B.ID = C.FromPlanID ";
            strHQL += " and B.ID = " + strParentPlanID;
            strHQL += " and C.ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);


            //COPY模板项目计划关联流程模板到新的项目的项目计划
            strHQL = "insert into t_relatedworkflowtemplate(relatedtype, relatedid, wftemplatename, identifystring, relatedname)";
            strHQL += " select A.relatedtype, C.id, wftemplatename, identifystring, relatedname";
            strHQL += " from t_relatedworkflowtemplate A,t_impleplan B,t_impleplan C";
            strHQL += " where A.RelatedType = 'ProjectPlan' and A.RelatedID = B.id and B.id = c.fromplanid";
            strHQL += " and B.ID = " + strParentPlanID;
            strHQL += " and C.ID = " + strNewPlanID;
            ShareClass.RunSqlCommand(strHQL);


            strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.Parent_ID = " + strNewPlanID + "  order by workPlan.SortNumber ASC";
            lst = workPlanBLL.GetAllWorkPlans(strHQL);
            if (lst.Count > 0)
            {
                strPlanIDString += TranferProjectPlanFromItemMRPPlan(strMRPPlanType, strProjectID, strPlanVerID, strNewPlanID, strMainPlanVerID, strMRPPlanVerID);
            }
        }

        return strPlanIDString;
    }


    protected void LoadOldProjectPlanVersion(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " Order by projectPlanVersion.VerID DESC";
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        DL_OldVersionID.DataSource = lst;
        DL_OldVersionID.DataBind();
    }


    protected string GetProjectPlanVersionType(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

    protected int GetProjectPlanVersionCount(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID =" + strVerID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        return lst.Count;
    }

    protected string GetProjectCreatorCode(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.UserCode.Trim();
    }


    protected string GetProjectPlanVersionType(string strProjectID, string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

    protected string GetProjectPlanVersionTypeByVerID(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID = " + strVerID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

 

    public static string getProjectPlanMemberLeader(string strPlanID)
    {
        string strHQL;

        strHQL = "Select UserName From T_PlanMember Where PlanID = " + strPlanID + " and IsLeader = 'YES'";
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_PlanMember");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    public static string getProjectPlanLeaderName(string strPlanID)
    {
        string strHQL;

        strHQL = "Select Leader From T_ImplePlan Where ID = " + strPlanID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        try
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0][0].ToString().Trim();
            }
            else
            {
                return "";
            }
        }
        catch
        {
            return "";
        }
    }

    //取得GANTT图控件用的项目和计划版本号
    public static int GetPIDForGantt(int intProjectID, int intVerID)
    {
        string strVerID, strPID;

        if (intVerID < 10)
        {
            strVerID = "0" + intVerID.ToString();
        }
        else
        {
            strVerID = intVerID.ToString();
        }

        strPID = intProjectID.ToString() + strVerID;

        return int.Parse(strPID);
    }

    //取得GANTT图控件用的父计划号
    public static int GetParentIDGantt(string strProjectID, string strVerID, string strParentIDGantt)
    {
        string strHQL;

        strHQL = "Select  ID From T_ImplePlan Where ProjectID =" + strProjectID + "and VerID = " + strVerID + "  and Parent_ID = " + strParentIDGantt;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }



    //创建模板项目树（用于计划复制）
    public static void InitialTemplatePrjectTreeForPlan(TreeView TemplateProjectTreeView, string strUserCode, string strTemProjectID, string strTotalProject, string strPushImplementationMethod, string strTemplateProject, string strCommonProject)
    {
        string strHQL, strProjectID2, strProject;
        IList lst;

        //添加根节点
        TemplateProjectTreeView.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();
        TreeNode node3 = new TreeNode();
        TreeNode node4 = new TreeNode();
        TreeNode node5 = new TreeNode();
        TreeNode node6 = new TreeNode();
        TreeNode node7 = new TreeNode();

        node1.Text = "<B>" + strTotalProject + "</B>";
        node1.Target = "1";
        node1.Expanded = true;
        TemplateProjectTreeView.Nodes.Add(node1);

        node2.Text = strTemplateProject;
        node2.Target = strTemplateProject;
        node2.Expanded = true;
        node1.ChildNodes.Add(node2);

        node3.Text = strCommonProject;
        node3.Target = strCommonProject;
        node3.Expanded = true;
        node1.ChildNodes.Add(node3);

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        if (strTemProjectID != null)
        {
            strHQL = "from Project as project where project.ProjectID = " + strTemProjectID;
            lst = projectBLL.GetAllProjects(strHQL);

            if (lst.Count > 0)
            {
                project = (Project)lst[0];

                strProjectID2 = project.ProjectID.ToString();


                strProject = project.ProjectName.Trim();

                node7 = new TreeNode();

                node7.Text = "<strong><font color='red'>" + strProjectID2 + "." + strProject + "</font></strong>";
                node7.Target = strProjectID2;
                node7.Expanded = false;

                node6.ChildNodes.Add(node7);

                TemplateProjectTreeView.DataBind();
            }
        }

        strHQL = "from Project as project where project.ProjectClass = '模板项目' ";
        strHQL += " and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID2 = project.ProjectID.ToString(); ;


            strProject = project.ProjectName.Trim();

            node4 = new TreeNode();

            if (strProjectID2 == strTemProjectID)
            {
                node4.Text = "<strong><font color='red'>" + strProjectID2 + "." + strProject + "</font></strong>";
            }
            else
            {
                node4.Text = strProjectID2 + "." + strProject;
            }
            node4.Target = strProjectID2;
            node4.Expanded = false;

            node2.ChildNodes.Add(node4);

            TemplateProjectTreeView.DataBind();
        }

        strHQL = "from Project as project where project.ProjectClass = '常规项目' and  project.PMCode = " + "'" + strUserCode + "'";
        strHQL += " and project.ParentID not in (select project.ProjectID from Project as project where project.PMCode = " + "'" + strUserCode + "'" + ")";
        strHQL += "  and project.Status not in ('删除','归档') order by project.ProjectID DESC";

        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID2 = project.ProjectID.ToString(); ;
            strProject = project.ProjectName.Trim();

            node5 = new TreeNode();

            if (strProjectID2 == strTemProjectID)
            {
                node5.Text = "<strong><font color='red'>" + strProjectID2 + "." + strProject + "</font></strong>";
            }
            else
            {
                node5.Text = strProjectID2 + "." + strProject;
            }
            node5.Target = strProjectID2;
            node5.Expanded = false;

            node3.ChildNodes.Add(node5);
            TemplateProjectTreeShowForPlan(strProjectID2, node5, strTemProjectID);
            TemplateProjectTreeView.DataBind();
        }
    }

    public static void TemplateProjectTreeShowForPlan(string strParentID, TreeNode treeNode, string strTemProjectID)
    {
        string strHQL, strProjectID2, strProject;
        IList lst1, lst2;

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        strHQL = "from Project as project where project.ProjectClass = '常规项目' and project.ParentID = " + strParentID;
        strHQL += " and project.Status not in ('删除','归档') ";
        strHQL += " order by project.ProjectID DESC";
        lst1 = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            project = (Project)lst1[i];
            strProjectID2 = project.ProjectID.ToString();
            strProject = project.ProjectName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strProjectID2;

            if (strProjectID2 == strTemProjectID)
            {
                node.Text = "<strong><font color='red'>" + strProjectID2 + "." + strProject + "</font></strong>";
            }
            else
            {
                node.Text = strProjectID2 + "." + strProject;
            }

            node.Text = strProjectID2 + ". " + strProject;

            treeNode.ChildNodes.Add(node);
            node.Expanded = false;

            strHQL = "from Project as project where project.ParentID = " + strProjectID2;
            strHQL += " Order by project.ProjectID DESC";
            lst2 = projectBLL.GetAllProjects(strHQL);

            if (lst2.Count > 0)
            {
                TemplateProjectTreeShowForPlan(strProjectID2, node, strTemProjectID);
            }
        }
    }

    //更新实施计划表用于GANTT的ParentID
    public static void UpdateParentIDGanttForImplePlan(string strProjectID, string strVerID)
    {
        string strHQL1, strHQL2, strHQL3, strHQL4;
        string strPlanID, strParentIDGantt, strFromPlanID, strTargetPlanID;

        DataSet ds1, ds2, ds3;

        strHQL1 = "SELECT ID,FromPlanID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
        strHQL1 += " Order By ID ASC";
        ds1 = CoreShareClass.GetDataSetFromSql(strHQL1, "T_ImplePlan");
        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strPlanID = ds1.Tables[0].Rows[i][0].ToString();
            strFromPlanID = ds1.Tables[0].Rows[i][1].ToString();

            try
            {
                strHQL2 = "Select Parent_ID From T_ImplePlan Where ID = " + strFromPlanID;
                ds2 = CoreShareClass.GetDataSetFromSql(strHQL2, "T_ImplePlan");
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    strTargetPlanID = ds2.Tables[0].Rows[0][0].ToString();

                    strHQL3 = "Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID + " and FromPlanID = " + strTargetPlanID;
                    ds3 = CoreShareClass.GetDataSetFromSql(strHQL3, "T_ImplePlan");
                    if (ds3.Tables[0].Rows.Count > 0)
                    {
                        strParentIDGantt = ds3.Tables[0].Rows[0][0].ToString();

                        strHQL4 = "Update T_ImplePlan Set Parent_ID = " + strParentIDGantt + "  Where ID = " + strPlanID;
                        CoreShareClass.RunSqlCommand(strHQL4);
                    }
                    else
                    {
                        strParentIDGantt = "0";
                    }
                }
                else
                {
                    strTargetPlanID = "0";
                }
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
            }

        }
    }


    //COPY项目计划的依赖关系
    public static int CopyImplePlanDependencyAndResources(int intPID, int intNewPID)
    {
        NpgsqlConnection myConnection = new NpgsqlConnection(
        ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand("Pr_CopyImplePlanDependencyAndResources", myConnection);

        ///打开链接
        myConnection.Open();

        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.CommandTimeout = 0;

        ///添加存储过程的参数
        SqlParameter pPID = new SqlParameter("@intPID", SqlDbType.Int);
        pPID.Value = intPID;
        myCommand.Parameters.Add(pPID);
        SqlParameter pNewPID = new SqlParameter("@intNewPID", SqlDbType.Int);
        pNewPID.Value = @intNewPID;
        myCommand.Parameters.Add(pNewPID);

        ///定义返回值
        int nResult = -1;

        try
        {
            ///打开链接
            myConnection.Open();
            ///执行SQL语句
            nResult = myCommand.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            ///抛出异常
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('初始化模组数据失败！')", true);
            throw new Exception(ex.Message, ex);
        }
        finally
        {   ///关闭链接
            myConnection.Close();
        }

        ///返回nResult
        return nResult;
    }


}

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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTMyMemberPlansBackup : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_ReviewDetail);

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_ReviewDetail.Visible = true;
            }
            else
            {
                HE_ReviewDetail.Visible = true;
            }

            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode,"", DataGrid1);
        }
    }

    

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        InitialPlanTreeByUserCode(TreeView2, strOperatorCode, "OTHER");

        LoadPlan("0");
        LoadPlanWorkLog("0");
        LoadPlanTarget("0");
        LoadPlanRelatedLeaderRecord("0");
        LoadPlanRelatedLeaderHandleRecord("0", strUserCode);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strPlanID, strPlanName, strPlanType, strChartTitle;
        DateTime dtStartTime, dtEndTime;
        string strDepartCode, strDepartName;
        string strOperatorCode, strOperatorName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target == "0")
        {
            strPlanID = treeNode.Target.Trim();
            strPlanName = "我的计划";
        }
        else
        {
            strPlanID = treeNode.Target.Trim();
            strPlanName = treeNode.Text.Trim();
        }

        if (strPlanID == "0")
        {
            return;
        }


        LoadPlan(strPlanID);
        LoadPlanWorkLog(strPlanID);
        LoadPlanTarget(strPlanID);
        LoadPlanRelatedLeaderRecord(strPlanID);
        LoadPlanRelatedLeaderHandleRecord(strPlanID, strUserCode);

        LB_PlanID.Text = strPlanID;


        //HL_RelatedDoc.Enabled = true;
        //HL_RelatedDoc.NavigateUrl = "TTPlanRelatedDoc.aspx?PlanID=" + strPlanID;

        strOperatorCode = LB_OperatorCode.Text.Trim();
        strOperatorName = LB_OperatorName.Text.Trim();

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strOperatorCode);
        strDepartName = ShareClass.GetDepartName(strDepartCode);

        DataSet ds = GetPlanByPlanID(strPlanID);
        dtStartTime = DateTime.Parse(ds.Tables[0].Rows[0]["StartTime"].ToString());
        dtEndTime = DateTime.Parse(ds.Tables[0].Rows[0]["EndTime"].ToString());
        strPlanType = ds.Tables[0].Rows[0]["PlanType"].ToString();

        strChartTitle = ds.Tables[0].Rows[0]["PlanName"].ToString() + " " + strDepartName + " 部门成员计划评分对比图";

        strHQL = "Select (CreatorCode || CreatorName) as XName,ScoringByLeader as YNumber From T_PlanBackup ";
        strHQL += " Where CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " and PlanType = " + "'" + strPlanType + "'";
        strHQL += " and  to_char(StartTime,'yyyymmdd') >= " + "'" + dtStartTime.ToString("yyyyMMdd") + "'" + " and to_char(EndTime,'yyyymmdd') <= " + "'" + dtEndTime.ToString("yyyyMMdd") + "'";
        strHQL += " Order by ScoringByLeader ASC";
        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

    }

    protected void DataList4_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strReviewTime, strNow;
        string strHQL;
        IList lst;

        if (e.CommandName == "Update")
        {
            for (int i = 0; i < DataList4.Items.Count; i++)
            {
                DataList4.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            strHQL = "Select Review,Scoring,ReviewTime From T_Plan_LeaderReviewBackup where ID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan_LeaderReviewBackup");


            LB_ID.Text = strID;
            if (strIsMobileDevice == "YES")
            {
                HT_ReviewDetail.Text = ds.Tables[0].Rows[0]["Review"].ToString().Trim();
            }
            else
            {
                HE_ReviewDetail.Text = ds.Tables[0].Rows[0]["Review"].ToString().Trim();
            }
            NB_Scoring.Amount = decimal.Parse(ds.Tables[0].Rows[0]["Scoring"].ToString());
            strReviewTime = DateTime.Parse(ds.Tables[0].Rows[0]["ReviewTime"].ToString()).ToString("yyyyMMdd");


            strNow = DateTime.Now.ToString("yyyyMMdd");
        }
    }

    protected void LoadPlanRelatedLeaderHandleRecord(string strPlanID, string strLeaderCode)
    {
        string strHQL;

        strHQL = "Select * From T_Plan_LeaderReviewBackup where PlanID = " + strPlanID + " and LeaderCode = " + "'" + strLeaderCode + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan_LeaderReviewBackup");

        DataList4.DataSource = ds;
        DataList4.DataBind();
    }

    protected void LoadPlan(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * from T_PlanBackup  where PlanID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

        DataList2.DataSource = ds;
        DataList2.DataBind();
    }

    protected void LoadPlanWorkLog(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_Plan_WorkLogBackup Where PlanID = " + strPlanID;
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan_WorkLogBackup");

        DataList3.DataSource = ds;
        DataList3.DataBind();
    }

    protected void LoadPlanTarget(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "From PlanTarget as planTarget Where planTarget.PlanID = " + strPlanID;
        PlanTargetBLL planTargetBLL = new PlanTargetBLL();
        lst = planTargetBLL.GetAllPlanTargets(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadPlanRelatedLeaderRecord(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_Plan_LeaderReviewBackup where PlanID = " + strPlanID;
        strHQL += " Order By planLeaderReview.ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan_LeaderReviewBackup");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

    protected DataSet GetPlanByPlanID(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * from T_PlanBackup where PlanID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PlanBackup");

        return ds;
    }

    //定义人个计划树
    protected void InitialPlanTreeByUserCode(TreeView TreeView1, String strUserCode, string strRelatedType)
    {
        string strHQL;
        IList lst;

        string strUserName;

        strUserName = ShareClass.GetUserName(strUserCode);

        string strPlanID, strPlanName, strBackupPlanID;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>" + strUserName + " " + Resources.lang.Plan + "</B>";
        node1.Target = "0";
        node1.Expanded = true;
        TreeView1.Nodes.Add(node1);

        strHQL = "Select * from T_PlanBackup where UserCode = " + "'" + strUserCode + "'";
        strHQL += " and ParentID not in (Select BackupPlanID From T_Plan Where UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and Status not in ('删除','归档') ";
        if (strRelatedType != "OTHER")
        {
            strHQL += " and RelatedType = " + "'" + strRelatedType + "'";
        }
        strHQL += " Order By StartTime DESC,EndTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strPlanID = ds.Tables[0].Rows[i]["PlanID"].ToString();
            strPlanName = ds.Tables[0].Rows[i]["PlanName"].ToString();
            strBackupPlanID = ds.Tables[0].Rows[i]["BackupPlanID"].ToString();

            node3 = new TreeNode();

            node3.Text = strPlanName;
            node3.Target = strPlanID;
            node3.Expanded = false;

            node1.ChildNodes.Add(node3);
            PlanTreeShowByUserCode(strUserCode, strBackupPlanID, node3, strRelatedType);
            TreeView1.DataBind();
        }
    }


    protected void PlanTreeShowByUserCode(string strUserCode, string strParentID, TreeNode treeNode, string strRelatedType)
    {
        string strHQL, strPlanID, strBackupPlanID, strPlanName;

        strHQL = "Select * from T_PlanBackup where UserCode = " + "'" + strUserCode + "'" + " and ParentID = " + strParentID;
        if (strRelatedType != "OTHER")
        {
            strHQL += " and RelatedType = " + "'" + strRelatedType + "'";
        }
        strHQL += " Order By StartTime DESC,EndTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strPlanID = ds.Tables[0].Rows[i]["PlanID"].ToString();
            strPlanName = ds.Tables[0].Rows[i]["PlanName"].ToString();
            strBackupPlanID = ds.Tables[0].Rows[i]["BackupPlanID"].ToString();

            TreeNode node = new TreeNode();
            node.Target = strPlanID;
            node.Text = strPlanName;
            treeNode.ChildNodes.Add(node);
            node.Expanded = true;

            strHQL = "Select * from T_PlanBackup where UserCode = " + "'" + strUserCode + "'" + " and ParentID = " + strParentID;
            strHQL += " Order By StartTime DESC,EndTime ASC";
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_Plan");

            if (ds1.Tables[0].Rows.Count > 0)
            {
                PlanTreeShowByUserCode(strUserCode, strBackupPlanID, node, strRelatedType);
            }
        }
    }

}

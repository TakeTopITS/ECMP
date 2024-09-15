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


public partial class TTMyWorkflowBackupByReview : System.Web.UI.Page
{
    string strLangCode;
    string strUserCode, strUserName;
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件(TakeTop Software)       
        string strHQL;
        IList lst;

        string strDepartString;

        strLangCode = Session["LangCode"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);


        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有工作流", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            //LB_DepartString.Text = strDepartString;

            strHQL = "from WLType as wlType ";
            strHQL += " Where wlType.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by wlType.SortNumber ASC";
            WLTypeBLL wlTypeBLL = new WLTypeBLL();
            lst = wlTypeBLL.GetAllWLTypes(strHQL);
            DL_WLType.DataSource = lst;
            DL_WLType.DataBind();
            DL_WLType.Items.Insert(0, new ListItem("--Select--", ""));

            strHQL = "from WLStatus as wlStatus ";
            strHQL += " Where wlStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " and wlStatus.Status <> '新建'";
            strHQL += " order by wlStatus.SortNumber ASC";
            WLStatusBLL wlStatusBLL = new WLStatusBLL();
            lst = wlStatusBLL.GetAllWLStatuss(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            strHQL = "Select * from T_WorkFlowBackup ";
            strHQL += " Where WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
            strHQL += " Order By WLID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;

            LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY;
        }
    }
 
    protected void BT_AllWorkFlow_Click(object sender, EventArgs e)
    {
        string strHQL;

        LB_QueryScope.Text = Resources.lang.GongZuoLiu + ": " + Resources.lang.SuoYou;

        DataGrid1.Visible = false;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";
        LB_Status.Text = "";

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();
        strHQL = "Select * from T_WorkFlowBackup  ";
        strHQL += " Where WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
        strHQL += " and Status <> '新建'";
        strHQL += " Order by WLID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);
        string strHQL;
        IList lst;

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + strOperatorName;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();
        strHQL = "Select * from T_WorkFlowBackup where CreatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
        strHQL += " and Status <> '新建'";
        strHQL += " Order by WLID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Status.Text = "";
        LB_Sql.Text = strHQL;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text;
        string strHQL;
        string strOperatorCode = LB_OperatorCode.Text;
        string strDepartCode, strDepartName;
        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        strDepartCode = LB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();

        if (LB_DepartCode.Text == "")
        {
            strHQL = "Select * From T_WorkFlowBackup where Status = " + "'" + strStatus + "'";
            strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
            strHQL += " and Status <> '新建'";
            strHQL += " Order by WLID DESC";

            LB_QueryScope.Text = Resources.lang.ZZApplicantAll + " " + Resources.lang.ZhuangTai + ":" + strStatus;
        }
        else
        {
            if (LB_OperatorCode.Text == "")
            {
                strHQL = "Select * From T_WorkFlowBackup where CreatorCode in (select UserCode from T_ProjectMember where DepartCode = " + "'" + strDepartCode + "'" + ") and " + "Status = " + "'" + strStatus + "'";
                strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
                strHQL += " and Status <> '新建'";
                strHQL += " Order by WLID DESC";
                LB_QueryScope.Text = Resources.lang.ZZZBuMen + strDepartCode + " " + strDepartName + Resources.lang.ZhuangTai + ":" + strStatus;
            }
            else
            {
                string strOperatorName = LB_OperatorName.Text.Trim();
                strHQL = "Select * From T_WorkFlowBackup where CreatorCode = " + "'" + strOperatorCode + "'" + " and CreatorCode in (select UserCode from T_ProjectMember where DepartCode = " + "'" + strDepartCode + "'" + ") and " + "Status = " + "'" + strStatus + "'";
                strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
                strHQL += " and Status <> '新建'";
                strHQL += " Order by WLID DESC";
                LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + strOperatorName + Resources.lang.ZhuangTai + ":" + strStatus;
            }
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Status.Text = strStatus;
        LB_Sql.Text = strHQL;
    }

  

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

    }

    protected void BT_FindWFID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strWFID;
        string strDepartString;

        strDepartString = LB_DepartString.Text.Trim();

        DataGrid3.CurrentPageIndex = 0;

        strWFID = NB_WFID.Amount.ToString();

        LB_QueryScope.Text = Resources.lang.BianHao + ":" + strWFID;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";
        LB_Status.Text = "";

        try
        {
            strHQL = "Select * From T_WorkFlowBackup where WLID = " + strWFID;
            strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
            strHQL += " and Status <> '新建'";
            strHQL += " Order by WLID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;
        }
        catch
        {
        }
    }
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strWFType;
        string strUserCode = LB_UserCode.Text.Trim();

        string strDepartCode, strUnderDepartString, strParentDepartString;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strWFType = DL_WLType.SelectedValue.Trim();

        strParentDepartString = TakeTopCore.CoreShareClass.InitialParentDepartmentStringByAuthority(strUserCode);
        strUnderDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByAuthority(strUserCode);

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select TemName From T_WorkFlowTemplate Where Authority = '所有'";
        strHQL += " and Type = " + "'" + strWFType + "'";
        //strHQL += " and (BelongDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))";

        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + "))";
        strHQL += " Order by CreateTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        DL_WLTem.DataSource = ds;
        DL_WLTem.DataBind();

        DL_WLTem.Items.Add("");

        TB_WFTemName.Text = "";
        TB_WFName.Text = "";
    }
    protected void DL_WLTem_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strTemName;

        strTemName = DL_WLTem.SelectedValue.Trim();

        TB_WFTemName.Text = strTemName;

        TB_WFName.Text = "";
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWFType, strWFTemName, strWFName, strCreatorName;
        string strDepartString;
        string strStartTime, strEndTime;

        DataGrid3.CurrentPageIndex = 0;

        strDepartString = LB_DepartString.Text.Trim();

        strWFType = DL_WLType.SelectedValue.Trim();
        strWFType = "%" + strWFType + "%";

        strWFTemName = TB_WFTemName.Text.Trim();
        strWFTemName = "%" + strWFTemName + "%";
        strWFName = TB_WFName.Text.Trim();
        strWFName = "%" + strWFName + "%";
        strCreatorName = "%" + TB_WFCreatorName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        LB_QueryScope.Text = Resources.lang.MingChen + ":" + strWFName;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";
        LB_Status.Text = "";

        try
        {
            strHQL = "Select * From T_WorkFlowBackup where WLType Like " + "'" + strWFType + "'" + " and TemName Like " + "'" + strWFTemName + "'" + " and WLName Like " + "'" + strWFName + "'";
            strHQL += " and to_char(CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and CreatorName Like " + "'" + strCreatorName + "'";
            strHQL += " and WLID in (Select WLID From T_WorkFlowStepDetailBackup Where Status <> '' And OperatorCode = " + "'" + strUserCode + "')";
            strHQL += " and Status <> '新建'";
            strHQL += " Order by WLID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;
        }
        catch
        {
        }
    }

}

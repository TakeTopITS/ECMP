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

public partial class TTMyMemberWorkFlows : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件(TakeTop Software)

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        strLangCode = Session["LangCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看成员工作流", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //设置日程控件语言
        Culture = ShareClass.GetDayPilotLanguage();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Workflow", DataGrid1);

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

            strHQL = "from WorkFlow as workFlow ";
            strHQL += " Where workFlow.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.WorkflowVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;

            LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY;
        }
    }

    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartCode, strDepartString;
        string strWFType;
        string strUserCode = LB_UserCode.Text.Trim();

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartString = LB_DepartString.Text.Trim();

        strWFType = DL_WLType.SelectedValue.Trim();

        strHQL = "Select TemName From T_WorkFlowTemplate Where Authority = '所有'";
        strHQL += " and Type = " + "'" + strWFType + "'";
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

    protected void BT_AllWorkFlow_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();
        LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";
        LB_Status.Text = "";

        DataGrid3.CurrentPageIndex = 0;

        strHQL = "from WorkFlow as workFlow ";
        strHQL += " Where workFlow.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.WorkflowVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and workFlow.Status <> '新建'";
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;

        LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + strOperatorName;

        DataGrid3.CurrentPageIndex = 0;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strOperatorCode + "'" + "  Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
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
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        strDepartCode = LB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();

        DataGrid3.CurrentPageIndex = 0;

        if (LB_OperatorCode.Text == "")
        {
            strHQL = "from WorkFlow as workFlow where workFlow.Status = " + "'" + strStatus + "'";
            strHQL += " and workFlow.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.WorkflowVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " Order by workFlow.WLID DESC";

            LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY + Resources.lang.ZhuangTai + ":" + strStatus;
        }
        else
        {
            string strOperatorName = LB_OperatorName.Text.Trim();
            strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strOperatorCode + "'";
            strHQL += " and workFlow.CreatorCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ")";
            strHQL += " and " + "workFlow.Status = " + "'" + strStatus + "'";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " order by workFlow.WLID DESC";
            LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + strOperatorName + Resources.lang.XuQiuZhuangTai + ":" + strStatus;
        }


        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Status.Text = strStatus;
        LB_Sql.Text = strHQL;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strWLType = DL_WLType.SelectedValue.Trim();
        string strDepartCode, strOperatorCode, strStatus;
        string strDepartName, strOperatorName;
        string strWFName, strWFTemName;

        string strUserCode = LB_UserCode.Text.Trim();

        string strHQL;
        IList lst;

        strOperatorCode = LB_OperatorCode.Text.Trim();
        strOperatorName = LB_OperatorName.Text.Trim();
        strDepartCode = LB_DepartCode.Text.Trim();
        strDepartName = LB_DepartName.Text.Trim();
        strStatus = LB_Status.Text.Trim();

        strWLType = "%" + strWLType + "%";
        strWFTemName = TB_WFTemName.Text.Trim();
        strWFTemName = "%" + strWFTemName + "%";
        strWFName = TB_WFName.Text.Trim();
        strWFName = "%" + strWFName + "%";

        DataGrid3.CurrentPageIndex = 0;

        if (LB_OperatorCode.Text == "")
        {
            strHQL = "from WorkFlow as workFlow where workFlow.WLType Like " + "'" + strWLType + "'";
            strHQL += " and workFlow.WLName Like " + "'" + strWFName + "'";
            strHQL += " and workFlow.TemName Like " + "'" + strWFTemName + "'";
            strHQL += " and workFlow.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.WorkflowVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " Order by workFlow.WLID DESC";
            LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY + Resources.lang.LeiXin + ":" + strWLType;
        }
        else
        {
            if (LB_Status.Text == "")
            {
                strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strOperatorCode + "'" + " and " + "workFlow.WLType Like " + "'" + strWLType + "'";
                strHQL += " and workFlow.WLName Like " + "'" + strWFName + "'";
                strHQL += " and workFlow.TemName Like " + "'" + strWFTemName + "'";
                strHQL += " and workFlow.Status <> '新建'";
                strHQL += " order by workFlow.WLID DESC";
                LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + " " + strOperatorName + Resources.lang.LeiXin + ":" + strWLType;
            }
            else
            {
                strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strOperatorCode + "'" + " and " + "workFlow.WLType Like " + "'" + strWLType + "'" + " and workFlow.Status = " + "'" + strStatus + "'";
                strHQL += " and workFlow.WLName Like " + "'" + strWFName + "'";
                strHQL += " and workFlow.TemName Like " + "'" + strWFTemName + "'";
                strHQL += " and workFlow.Status <> '新建'";
                strHQL += " order by workFlow.WLID DESC";
                LB_QueryScope.Text = Resources.lang.ZZApplicant + strOperatorCode + " " + strOperatorName + Resources.lang.LeiXin + ":" + strWLType + Resources.lang.ZhuangTai + strStatus;
            }
        }

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void BT_FindWFID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();
        string strWFID;
        string strStartTime, strEndTime;

        strWFID = NB_WFID.Amount.ToString();
        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        LB_QueryScope.Text = "工作流编号：" + strWFID;

        LB_DepartCode.Text = "";
        LB_OperatorCode.Text = "";
        LB_Status.Text = "";

        DataGrid3.CurrentPageIndex = 0;

        try
        {
            strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWFID;
            strHQL += " and to_char(workFlow.CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(workFlow.CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and workFlow.CreatorCode in (Select memberLevel.UnderCode From MemberLevel as memberLevel Where memberLevel.WorkflowVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;
        }
        catch
        {
        }
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql.Text;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

}

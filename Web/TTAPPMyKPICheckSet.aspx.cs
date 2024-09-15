using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Npgsql;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAPPMyKPICheckSet : System.Web.UI.Page
{
    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;
        string strKPICheckID, strStatus;

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_SelfSummary);


        strUserCode = Session["UserCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strKPICheckID = Request.QueryString["KPICheckID"];

        UserKPICheck userKPICheck = GetUserKPICheck(strKPICheckID);

        //生成同部门同职称员工绩效评分对比柱状图
        CreateSameDepartmentJobTitleKPIScoringChart(strUserCode, userKPICheck);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_SelfSummary.Visible = true;
            }
            else
            {
                HE_SelfSummary.Visible = true;
            }

            //计算KPI的系统评分
            LB_TotalSqlPoint.Text = ShareClass.CalculateSystemPoint(strKPICheckID).ToString();

            LoadKPI(strKPICheckID);

            LB_KPICheckID.Text = strKPICheckID;
            LB_KPICheckName.Text = userKPICheck.KPICheckName.Trim();

            strStatus = userKPICheck.Status.Trim();
            if (strStatus == "关闭")
            {
                BT_NewMain.Enabled = false;
            }
            LB_Status.Text = strStatus;

            LB_TotalSelfPoint.Text = userKPICheck.TotalSelfPoint.ToString();
            LB_TotalLeaderPoint.Text = userKPICheck.TotalLeaderPoint.ToString();
            LB_TotalThirdPartPoint.Text = userKPICheck.TotalThirdPartPoint.ToString();
            LB_TotalHRPoint.Text = userKPICheck.TotalHRPoint.ToString();
            LB_TotalPoint.Text = userKPICheck.TotalPoint.ToString();
        }
    }

    protected void CreateSameDepartmentJobTitleKPIScoringChart(string strUserCode, UserKPICheck userKPICheck)
    {
        string strHQL;
        string strChartTitle;
        string strDepartCode, strDepartName, strJobTitle;
        DateTime dtStartTime, dtEndTime;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartName = ShareClass.GetDepartName(strDepartCode);
        strJobTitle = ShareClass.GetUserJobTitle(strUserCode);

        dtStartTime = userKPICheck.StartTime;
        dtEndTime = userKPICheck.EndTime;

        strChartTitle = userKPICheck.KPICheckName + " 部门：" + strDepartName + " 职称：" + strJobTitle + " 成员绩效总评分对比图";

        strHQL = "Select UserName as XName,TotalPoint as YNumber From T_UserKPICheck ";
        strHQL += " Where UserCode in (Select UserCode From T_ProjectMember Where DepartCode = " + "'" + strDepartCode + "'" + " and JobTitle = " + "'" + strJobTitle + "'" + ")";
        strHQL += " and  to_char(StartTime,'yyyymmdd') >= " + "'" + dtStartTime.ToString("yyyyMMdd") + "'" + " and to_char(EndTime,'yyyymmdd') <= " + "'" + dtEndTime.ToString("yyyyMMdd") + "'";
        strHQL += " Order by TotalPoint ASC";

        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


        //Chart1.Visible = true;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strStatus;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[1].Text;

            LB_KPIID.Text = strID;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;


            strHQL = "From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID = " + strID;
            UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
            lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);
            UserKPICheckDetail userKPICheckDetail = (UserKPICheckDetail)lst[0];
            NB_SelfPoint.Amount = userKPICheckDetail.SelfPoint;

            if (strIsMobileDevice == "YES")
            {
                HT_SelfSummary.Text = userKPICheckDetail.SelfComment.Trim();
            }
            else
            {
                HE_SelfSummary.Text = userKPICheckDetail.SelfComment.Trim();
            }

            //列出KPI评论列表
            LoadKPIReviewList(strID);

            strStatus = LB_Status.Text.Trim();

            if (strStatus == "关闭")
            {
                BT_NewMain.Visible = false;
            }
            else
            {
                BT_NewMain.Visible = true;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        IList lst;

        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strKPICheckID;
        string strKPIID, strSelfComment;
        decimal deSelfPoint;

        strKPICheckID = LB_KPICheckID.Text.Trim();
        strKPIID = LB_KPIID.Text.Trim();

        deSelfPoint = NB_SelfPoint.Amount;
        if (deSelfPoint > 100)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGFSBNDY100JC + "')", true);
            return;
        }

        if (strIsMobileDevice == "YES")
        {
            strSelfComment = HT_SelfSummary.Text.Trim();
        }
        else
        {
            strSelfComment = HE_SelfSummary.Text.Trim();
        }

        strHQL = "From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID = " + strKPIID;
        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);
        UserKPICheckDetail userKPICheckDetail = (UserKPICheckDetail)lst[0];

        try
        {
            userKPICheckDetail.SelfPoint = deSelfPoint;
            userKPICheckDetail.SelfComment = strSelfComment;

            userKPICheckDetailBLL.UpdateUserKPICheckDetail(userKPICheckDetail, int.Parse(strKPIID));

            //更改员工自评总分
            UpdateUserKPICheckSelfPoint(strKPICheckID);

            //更改KPI明细总分
            LB_TotalPoint.Text = ShareClass.UpdateKPICheckDetailTotalPoint(strKPICheckID).ToString();

            LoadKPI(strKPICheckID);

            LoadKPIReviewList(strKPIID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateUserKPICheckSelfPoint(string strKPICheckID)
    {
        string strHQL;
        string strTotalSelfPoint;

        strHQL = "Select Sum(SelfPoint * Weight) From T_UserKPICheckDetail Where KPICheckID = " + strKPICheckID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserKPICheckDetail");

        strTotalSelfPoint = ds.Tables[0].Rows[0][0].ToString();

        strHQL = "Update T_UserKPICheck Set TotalSelfPoint = " + strTotalSelfPoint + " where KPICheckID = " + strKPICheckID;
        ShareClass.RunSqlCommand(strHQL);
    }


    protected void LoadKPI(string strKPICheckID)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserKPICheckDetail as userKPICheckDetail where userKPICheckDetail.KPICheckID = " + strKPICheckID;
        strHQL += " Order by userKPICheckDetail.SortNumber ASC";

        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadKPIReviewList(string strKPIID)
    {
        string strHQL;
        IList lst;


        strHQL = "From KPIThirdPartReview as kpiThirdPartReview Where kpiThirdPartReview.UserKPIID = " + strKPIID;
        KPIThirdPartReviewBLL kpiThirdPartReviewBLL = new KPIThirdPartReviewBLL();
        lst = kpiThirdPartReviewBLL.GetAllKPIThirdPartReviews(strHQL);
        DataList3.DataSource = lst;
        DataList3.DataBind();

        strHQL = "From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.UserKPIID = " + strKPIID;
        KPILeaderReviewBLL kpiLeaderReviewBLL = new KPILeaderReviewBLL();
        lst = kpiLeaderReviewBLL.GetAllKPILeaderReviews(strHQL);
        DataList2.DataSource = lst;
        DataList2.DataBind();

        strHQL = "From KPIHRReview as kpiHRReview Where kpiHRReview.UserKPIID = " + strKPIID;
        KPIHRReviewBLL kpiHRReviewBLL = new KPIHRReviewBLL();
        lst = kpiHRReviewBLL.GetAllKPIHRReviews(strHQL);
        DataList4.DataSource = lst;
        DataList4.DataBind();

        strHQL = "From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID = " + strKPIID;
        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();
    }

    protected UserKPICheck GetUserKPICheck(string strKPICheckID)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserKPICheck as userKPICheck Where userKPICheck.KPICheckID = " + strKPICheckID;
        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        UserKPICheck userKPICheck = (UserKPICheck)lst[0];

        return userKPICheck;
    }

    protected string GetUserKPICheckStatus(string strKPICheckID)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserKPICheck as userKPICheck Where userKPICheck.KPICheckID = " + strKPICheckID;
        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        UserKPICheck userKPICheck = (UserKPICheck)lst[0];

        return userKPICheck.Status.Trim();
    }
}

using System;
using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTKPIManagement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "我的绩效", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "我的绩效";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();

            strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode <> " + "'" + strUserCode + "'";
            strHQL += " and userKPICheck.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.KPIVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID not in ";
            strHQL += "(Select kpiLeaderReview.UserKPIID From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.LeaderCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
            lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;

            strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode <> " + "'" + strUserCode + "'";
            strHQL += " and userKPICheck.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.KPIVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
            strHQL += "(Select kpiLeaderReview.UserKPIID From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.LeaderCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
            lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();
            LB_Sql5.Text = strHQL;

            strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
            strHQL += "(Select kpiThirdPartReview.UserKPIID From KPIThirdPartReview as kpiThirdPartReview Where rtrim(ltrim(Comment)) = '' and kpiThirdPartReview.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
            lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
            strHQL += "(Select kpiThirdPartReview.UserKPIID From KPIThirdPartReview as kpiThirdPartReview Where rtrim(ltrim(Comment)) <> '' and kpiThirdPartReview.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
            lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode = " + "'" + strUserCode + "'";
            strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
            lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;
        }
    }

    protected void BT_AllKPI_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();

        strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and userKPICheck.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.KPIVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID not in ";
        strHQL += "(Select kpiLeaderReview.UserKPIID From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.LeaderCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
        LB_Sql2.Text = strHQL;

        strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode <> " + "'" + strUserCode + "'";
        strHQL += " and userKPICheck.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.KPIVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
        strHQL += "(Select kpiLeaderReview.UserKPIID From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.LeaderCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
        LB_Sql5.Text = strHQL;

        strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
        strHQL += "(Select kpiThirdPartReview.UserKPIID From KPIThirdPartReview as kpiThirdPartReview Where rtrim(ltrim(Comment)) = '' and kpiThirdPartReview.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;

        strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.KPICheckID in (Select userKPICheckDetail.KPICheckID From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID in ";
        strHQL += "(Select kpiThirdPartReview.UserKPIID From KPIThirdPartReview as kpiThirdPartReview Where rtrim(ltrim(Comment)) <> '' and kpiThirdPartReview.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        strHQL = "from UserKPICheck as userKPICheck Where userKPICheck.UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order By userKPICheck.StartTime DESC,userKPICheck.EndTime ASC";
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;
        IList lst;

        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

}

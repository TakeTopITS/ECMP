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

public partial class TTWLManage : System.Web.UI.Page
{
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        string strUserName;
        string strURLType;

        strURLType = Request.QueryString["URLType"];

        strLangCode = Session["LangCode"].ToString();
        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        //设置是否自定义工作流模组模式
        Session["DIYWFModule"] = "NO";

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx");  bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "流程管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

      ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickB", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.Year.ToString() + "-01-01"; 
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LB_QueryScope.Text = Resources.lang.StatusAll;

            strHQL = " from WLType as wlType";
            strHQL += " Where wlType.LangCode = " + "'" + strLangCode + "'";
            strHQL += " Order by wlType.SortNumber ASC";
            WLTypeBLL wlTypeBLL = new WLTypeBLL();
            lst = wlTypeBLL.GetAllWLTypes(strHQL);
            DL_WLType.DataSource = lst;
            DL_WLType.DataBind();
            DL_WLType.Items.Insert(0, new ListItem("--Select--", ""));

            DataSet ds = new DataSet();

            strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','通过','结案')";
            strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
            strHQL += " And A.IsOperator = 'YES'";
            strHQL += " Order By A.StepID DESC";

            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid4.DataSource = ds;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;


            strHQL = "Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','通过','结案')";
            strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
            strHQL += " And A.IsOperator = 'YES'";
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid5.DataSource = ds;
            DataGrid5.DataBind();

            LB_Sql5.Text = strHQL;


            strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;


            strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
            strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
            strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
            strHQL += " Order By A.StepID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

            DataGrid6.DataSource = ds;
            DataGrid6.DataBind();

            LB_Sql6.Text = strHQL;

            strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'" + " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            SetWorkFlowRecordColor();

            LB_Sql3.Text = strHQL;

            strHQL = "from WLStatus as wlStatus ";
            strHQL += " Where wlStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by wlStatus.SortNumber ASC";
            WLStatusBLL wlStatusBLL = new WLStatusBLL();
            lst = wlStatusBLL.GetAllWLStatuss(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LoadMemberAgencyList(strUserCode);

            //int intIntervalTime = int.Parse(System.Configuration.ConfigurationManager.AppSettings["TimerInterval"]);
            //LB_Timer.Text = intIntervalTime.ToString();
            //Timer_SMS.Interval = intIntervalTime;
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

    protected void BT_FindWFID_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();

        string strWFID;

        strWFID = NB_WFID.Amount.ToString();

        LB_QueryScope.Text = Resources.lang.GongZuoLiuBianHao + strWFID;

        DataGrid1.CurrentPageIndex = 0;
        DataGrid3.CurrentPageIndex = 0;
        DataGrid4.CurrentPageIndex = 0;
        DataGrid5.CurrentPageIndex = 0;
        DataGrid6.CurrentPageIndex = 0;

        DataSet ds = new DataSet();
        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('通过','修改中','关闭','结案')";
        strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And A.WLID = " + strWFID;
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And A.WLID = " + strWFID;
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.WLID = " + strWFID;
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.WLID = " + strWFID;
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " And workFlow.WLID = " + strWFID;
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void BT_FindTime_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode;
        string strStartTime, strEndTime;

        strUserCode = LB_UserCode.Text.Trim();

        DataGrid3.CurrentPageIndex = 0;

        strStartTime = DLC_StartTime.Text;
        strEndTime = DLC_EndTime.Text;

        LB_QueryScope.Text = Resources.lang.KaiShiRiQi + ":" + strStartTime + Resources.lang.JieShuRiQi + ":" + strEndTime;

        DataGrid1.CurrentPageIndex = 0;
        DataGrid3.CurrentPageIndex = 0;
        DataGrid4.CurrentPageIndex = 0;
        DataGrid5.CurrentPageIndex = 0;
        DataGrid6.CurrentPageIndex = 0;

        DataSet ds = new DataSet();
        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('通过','修改中','关闭','结案')";
        strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And A.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " And to_char(workFlow.CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(workFlow.CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strWLType = DL_WLType.SelectedValue.Trim();

        string strWFName, strWFTemName, strCreatorName;

        string strUserCode = LB_UserCode.Text.Trim();

        string strHQL;
        IList lst;

        string strStartTime, strEndTime;

        strWLType = "%" + strWLType + "%";
        strWFTemName = TB_WFTemName.Text.Trim();
        strWFTemName = "%" + strWFTemName + "%";
        strWFName = TB_WFName.Text.Trim();
        strWFName = "%" + strWFName + "%";
        strCreatorName = "%" + TB_WFCreatorName.Text.Trim() + "%";

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid3.CurrentPageIndex = 0;
        DataGrid4.CurrentPageIndex = 0;
        DataGrid5.CurrentPageIndex = 0;
        DataGrid6.CurrentPageIndex = 0;

        DataSet ds = new DataSet();
        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('通过','修改中','关闭','结案')";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.WLType Like " + "'" + strWLType + "'";
        strHQL += " and B.WLName Like " + "'" + strWFName + "'";
        strHQL += " and B.TemName Like " + "'" + strWFTemName + "'";
        strHQL += " and B.CreatorName Like " + "'" + strCreatorName + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.WLType Like " + "'" + strWLType + "'";
        strHQL += " and B.WLName Like " + "'" + strWFName + "'";
        strHQL += " and B.TemName Like " + "'" + strWFTemName + "'";
        strHQL += " and B.CreatorName Like " + "'" + strCreatorName + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " And B.WLType Like " + "'" + strWLType + "'";
        strHQL += " and B.WLName Like " + "'" + strWFName + "'";
        strHQL += " and B.TemName Like " + "'" + strWFTemName + "'";
        strHQL += " and B.CreatorName Like " + "'" + strCreatorName + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;

        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,A.StepID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
        strHQL += " And to_char(A.CheckingTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(A.CheckingTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And B.WLType Like " + "'" + strWLType + "'";
        strHQL += " and B.WLName Like " + "'" + strWFName + "'";
        strHQL += " and B.TemName Like " + "'" + strWFTemName + "'";
        strHQL += " and B.CreatorName Like " + "'" + strCreatorName + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " And workFlow.WLType Like " + "'" + strWLType + "'";
        strHQL += " and workFlow.WLName Like " + "'" + strWFName + "'";
        strHQL += " and workFlow.TemName Like " + "'" + strWFTemName + "'";
        strHQL += " And to_char(workFlow.CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(workFlow.CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void DL_MemberAgency_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strAgencyCode, strUserCode, strAgencyName;

        strAgencyCode = DL_MemberAgency.SelectedValue.Trim();
        strAgencyName = ShareClass.GetUserName(strAgencyCode);

        strUserCode = Session["UserCode"].ToString();

        strHQL = "Update T_MemberLevel Set AgencyStatus = 1 Where UserCode = " + "'" + strUserCode + "'" + " and UnderCode = " + "'" + strAgencyCode + "'";
        ShareClass.RunSqlCommand(strHQL);


        strHQL = "Update T_MemberLevel Set AgencyStatus = 0 Where UserCode = " + "'" + strUserCode + "'" + " and UnderCode <> " + "'" + strAgencyCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        if (strUserCode != strAgencyCode)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZYSZSTRAGENCYNAMEWNDGZLSPDLRXZXSWNZJJK + "');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZYXGZLSPDL + "');</script>");
        }
    }

    protected void BT_Refresh_Click(object sender, EventArgs e)
    {
        RefreshWorkflowList();

    }

    protected void RefreshWorkflowList()
    {
        string strHQL;
        IList lst;
        string strUserCode = LB_UserCode.Text.Trim();

        DataSet ds = new DataSet();

        strHQL = LB_Sql4.Text;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
        LB_Sql4.Text = strHQL;

        strHQL = LB_Sql5.Text;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
        LB_Sql5.Text = strHQL;

        strHQL = LB_Sql1.Text;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        strHQL = LB_Sql6.Text;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
        LB_Sql6.Text = strHQL;

        strHQL = LB_Sql3.Text;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        SetWorkFlowRecordColor();
        LB_Sql3.Text = strHQL;
    }

    protected void BT_AllWL_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;
        LB_QueryScope.Text = Resources.lang.StatusAll;

        DataSet ds = new DataSet();

        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('通过','修改中','关闭','结案')";
        strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;


        strHQL = "Select A.ID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'" + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text.Trim();

        LB_QueryScope.Text = Resources.lang.ZhuangTai + strStatus;

        string strUserCode = LB_UserCode.Text.Trim();
        string strHQL;
        IList lst;

        DataSet ds = new DataSet();

        strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('通过','修改中','关闭','结案')";
        strHQL += " And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;


        strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') And B.Status Not In ('修改中','关闭','结案')";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And A.IsOperator = 'YES'";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;


        strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') And trim(A.OperatorCode) = " + "'" + strUserCode + "'";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;


        strHQL = "Select A.ID,A.StepID,A.WorkDetail,A.CheckingTime,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B";
        strHQL += " Where A.WLID = B.WLID And A.Status In ('批准','驳回') ";
        strHQL += " And A.OperatorCode in (Select UserCode From T_MemberLevel Where UnderCode <> UserCode and trim(UnderCode) = " + "'" + strUserCode + "'" + " and AgencyStatus = 1)";
        strHQL += " And B.Status = " + "'" + strStatus + "'";
        strHQL += " Order By A.StepID DESC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;

        strHQL = "from WorkFlow as workFlow where workFlow.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " and workFlow.Status = " + "'" + strStatus + "'";
        strHQL += " Order By workFlow.WLID DESC";

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();

        LB_Sql3.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        IList lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetWorkFlowRecordColor();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql6.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds; ;
        DataGrid6.DataBind();
    }

    protected void LoadMemberAgencyList(string strUserCode)
    {
        string strHQL;

        strHQL = "select A.UnderCode as UserCode,B.UserName as UserName From T_MemberLevel A,T_ProjectMember B Where A.UnderCode = B.UserCode and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order by A.AgencyStatus DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");

        DL_MemberAgency.DataSource = ds;
        DL_MemberAgency.DataBind();
    }

    protected void SetWorkFlowRecordColor()
    {
        int i;
        string strWFID, strStatus;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strWFID = DataGrid3.Items[i].Cells[1].Text.Trim();
            strStatus = GetWorkflowStatus(strWFID);

            if (strStatus == "通过")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_green.png";
            }

            if (strStatus == "结案")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_ok.png";
            }

            if (strStatus == "驳回")
            {
                ((ImageButton)DataGrid3.Items[i].FindControl("IMB_Lamp")).ImageUrl = "~/Images/lamp_refuse.png";
            }
        }
    }

    protected bool CheckWorkflowStepDetailStatus(string strWFID, string strStatus)
    {
        string strHQL;

        strHQL = "Select Status From T_WorkFlowStepDetail Where WLID = " + strWFID + " and Status = " + "'" + strStatus + "'";
        strHQL += " and StepID in (Select max(StepID) From T_WorkflowStep Where WLID = " + strWFID + ")";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

   
    protected string GetWorkflowStatus(string strWLID)
    {
        string strHQL;

        strHQL = "Select Status From T_WorkFlow Where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    

}

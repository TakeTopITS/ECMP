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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        string strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "合同管理", strUserCode);

        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from ConstractBigType as constractBigType Order by constractBigType.SortNumber ASC";
            ConstractBigTypeBLL constractBigTypeBLL = new ConstractBigTypeBLL();
            lst = constractBigTypeBLL.GetAllConstractBigTypes(strHQL);
            RBL_ConstractClass.DataSource = lst;
            RBL_ConstractClass.DataBind();

            strHQL = "from ConstractType as assetType Order by assetType.SortNumber ASC";
            ConstractTypeBLL assetTypeBLL = new ConstractTypeBLL();
            lst = assetTypeBLL.GetAllConstractTypes(strHQL);
            DL_ConstractType.DataSource = lst;
            DL_ConstractType.DataBind();
            DL_ConstractType.Items.Insert(0, new ListItem("--Select--", ""));

            strHQL = "from ProjectMember as projectMember where projectMember.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_ConstractOwner.Text = "我的所有合同列表：";

            strHQL = "from Constract as constract where  constract.Status not in ('归档','删除') ";
            strHQL += " and (constract.RecorderCode = " + "'" + strUserCode + "'" + " Or constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            ConstractBLL constractBLL = new ConstractBLL();
            lst = constractBLL.GetAllConstracts(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            //创建分析图形
            CreateConstractAnalystChart(strUserCode);
        }
    }

    //创建分析图形
    protected void CreateConstractAnalystChart(string strUserCode)
    {
        string strChartTitle, strCmdText;
        strChartTitle = Resources.lang.HTLXBLT;
        strCmdText = @"Select Type as XName, Count(*) as YNumber
            From T_Constract Where (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Type";
        IFrame_Chart_ConstractType.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);


        //ShareClass.CreateAnalystPieChart(strCmdText, Chart_ConstractType, SeriesChartType.Pie, strChartTitle, "XName", "YNumber", "Default");

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber
             From T_Constract Where (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);


        //ShareClass.CreateAnalystPieChart(strCmdText, Chart_ConstractStatus, SeriesChartType.Pie, strChartTitle, "XName", "YNumber", "Default");

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   
            And  (A.RecorderCode = " + "'" + strUserCode + "'" + " Or A.ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);


        //ShareClass.CreateAnalystLineChart(strCmdText, Chart_ConstractAmountTendency, SeriesChartType.Line, strChartTitle, "SignMonth", "MonthAmount", "", "Default");
    }


    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_ConstractOwner.Text = strUserName + " 签订的合同列表：";

        string strHQL = "from Constract as constract where constract.RecorderCode = " + "'" + strUserCode + "'" + "  and constract.Status not in ('归档','删除')  ";
        strHQL += " and constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        try
        {
            IList lst = constractBLL.GetAllConstracts(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
        catch (Exception err)
        {
            Response.Write(err.Message.ToString());
        }

        LB_Sql.Text = strHQL;

        string strChartTitle, strCmdText;

        strChartTitle = Resources.lang.HTLXBLT;
        strCmdText = @"Select Type as XName, Count(*) as YNumber
            From T_Constract Where (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Type";
        IFrame_Chart_ConstractType.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber
             From T_Constract Where (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   
            And  (A.RecorderCode = " + "'" + strUserCode + "'" + " Or A.ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
    }

    protected void RBL_ConstractClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strConstractClass, strUserCode;

        strUserCode = LB_UserCode.Text.Trim();
        strConstractClass = RBL_ConstractClass.SelectedItem.Text.Trim();

        strHQL = "from Constract as constract where constract.ConstractClass = " + "'" + strConstractClass + "'" + " and constract.Status not in ('归档','删除') ";
        strHQL += " and (constract.RecorderCode = " + "'" + strUserCode + "'" + " Or constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_ConstractOwner.Text = "大类: " + strConstractClass + " 的合同：";

        string strChartTitle, strCmdText;

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber From T_Constract  Where ConstractClass = " + "'" + strConstractClass + "'" + " and Status not in ('取消','删除') ";
        strCmdText += " and (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4  and A.ConstractClass = " + "'" + strConstractClass + "'" + " and A.Status not in ('取消','删除') ";
        strCmdText += " And (A.RecorderCode = " + "'" + strUserCode + "'" + " Or A.ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strType = "%" + DL_ConstractType.SelectedValue + "%";
        string strConstractCode = "%" + TB_ConstractCode.Text.Trim() + "%";
        string strConstractName = "%" + TB_ConstractName.Text.Trim() + "%";
        string strPartA = "%" + TB_PartA.Text.Trim() + "%";
        string strPartBOperator = "%" + TB_PartBOperator.Text.Trim() + "%";
        string strPartAOperator = "%" + TB_PartAOperator.Text.Trim() + "%";


        LB_ConstractOwner.Text = "所有合同列表：";

        string strHQL = "from Constract as constract where  constract.Status not in ('归档','删除') ";
        strHQL += " and constract.Type Like " + "'" + strType + "'";
        strHQL += " and constract.ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and constract.ConstractName Like " + "'" + strConstractName + "'";
        strHQL += " and constract.PartA Like " + "'" + strPartA + "'";
        strHQL += " and constract.PartBOperator Like " + "'" + strPartBOperator + "'";
        strHQL += " and constract.PartAOperator Like " + "'" + strPartAOperator + "'";
        strHQL += " and (constract.RecorderCode = " + "'" + strUserCode + "'" + " Or constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        string strChartTitle, strCmdText;

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber From T_Constract  Where Type Like " + "'" + strType + "'" + " and Status not in ('取消','删除') ";
        strCmdText += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strCmdText += " and ConstractName Like " + "'" + strConstractName + "'";
        strCmdText += " and PartA Like " + "'" + strPartA + "'";
        strCmdText += " and PartBOperator Like " + "'" + strPartBOperator + "'";
        strCmdText += " and PartAOperator Like " + "'" + strPartAOperator + "'";
        strCmdText += " and (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractType.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   and A.Status not in ('取消','删除') ";
        strCmdText += " And  (A.RecorderCode = " + "'" + strUserCode + "'" + " Or A.ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        //创建分析图形
        CreateConstractAnalystChart(LB_UserCode.Text.Trim());
    }
}

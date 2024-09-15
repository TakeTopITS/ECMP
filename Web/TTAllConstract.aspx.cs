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

public partial class TTAllConstract : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strDepartCode;
        string strUserCode = Session["UserCode"].ToString();
        string strUserName;
        string strHQL;
        IList lst;

        string strDepartString;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有合同", strUserCode);
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
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from ConstractBigType as constractBigType Order by constractBigType.SortNumber ASC";
            ConstractBigTypeBLL constractBigTypeBLL = new ConstractBigTypeBLL();
            lst = constractBigTypeBLL.GetAllConstractBigTypes(strHQL);
            RBL_ConstractClass.DataSource = lst;
            RBL_ConstractClass.DataBind();

            strHQL = "from ConstractType as constractType Order by constractType.SortNumber ASC";
            ConstractTypeBLL constractTypeBLL = new ConstractTypeBLL();
            lst = constractTypeBLL.GetAllConstractTypes(strHQL);
            DL_ConstractType.DataSource = lst;
            DL_ConstractType.DataBind();
            DL_ConstractType.Items.Insert(0, new ListItem("--Select--", ""));

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            LB_ConstractOwner.Text = "我的所有合同列表：";

            strHQL = "from Constract as constract where constract.Status not in ('归档','删除') ";
            strHQL += " and constract.RecorderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            ConstractBLL constractBLL = new ConstractBLL();
            lst = constractBLL.GetAllConstracts(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;

            //创建分析图形
            CreateConstractAnalystChart(strDepartString);
        }
    }

    //创建分析图形
    protected void CreateConstractAnalystChart(string  strDepartString)
    {
        string strChartTitle, strCmdText;
        strChartTitle = Resources.lang.HTLXBLT;
        strCmdText = @"Select Type as XName, Count(*) as YNumber
            From T_Constract Where Status not in ('归档','删除') and RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strCmdText += " Group By Type";
        IFrame_Chart_ConstractType.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber
             From T_Constract Where Status not in ('归档','删除') and RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type And CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   
            And A.Status not in ('归档','删除') and A.RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            LB_ConstractOwner.Text = strDepartName + " 签订的合同列表：";

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            LB_ConstractOwner.Text = strDepartName + " 签订的合同列表：";

            string strDepartString;
            strDepartString = LB_DepartString.Text.Trim();
            strHQL = "from Constract as constract where constract.ConstractCode in (Select constractSales.ConstractCode From ConstractSales as constractSales Where constractSales.SalesName in (select projectMember.UserName from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + "))  and constract.Status not in ('归档','删除') ";
            strHQL += " and constract.RecorderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            ConstractBLL constractBLL = new ConstractBLL();
            lst = constractBLL.GetAllConstracts(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql.Text = strHQL;

            string strChartTitle, strCmdText;

            strChartTitle = Resources.lang.HTLXBLT;
            strCmdText = @"Select Type as XName, Count(*) as YNumber
            From T_Constract Where ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName in (select UserName from T_ProjectMember where DepartCode = " + "'" + strDepartCode + "'" + "))  and Status not in ('归档','删除') ";
            strCmdText += " and RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strCmdText += " Group By Type";
            IFrame_Chart_ConstractType.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            strChartTitle = Resources.lang.HTZTBLT;
            strCmdText = @"Select Status as XName, Count(*) as YNumber
            From T_Constract Where ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName in (select UserName from T_ProjectMember where DepartCode = " + "'" + strDepartCode + "'" + "))  and Status not in ('归档','删除') ";
            strCmdText += " and RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strCmdText += " Group By Type";
            IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            strChartTitle = Resources.lang.HTZCQST;
            strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount * B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   
            and A.ConstractCode in (Select ConstractCode From T_ConstractSales Where SalesName in (select UserName from T_ProjectMember where DepartCode = " + "'" + strDepartCode + "'" + "))  and Status not in ('归档','删除') ";
            strCmdText += " and A.RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
            strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
            IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
        }


    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_ConstractOwner.Text = strUserName + " 签订的合同列表：";

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();
        strHQL = "from Constract as constract where constract.ConstractCode in (Select constractSales.ConstractCode from ConstractSales as constractSales Where constractSales.SalesName = " + "'" + strUserName + "'" + ")  and constract.Status not in ('归档','删除')  ";
        strHQL += " and constract.RecorderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

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

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();
        strHQL = "from Constract as constract where constract.ConstractClass = " + "'" + strConstractClass + "'" + " and constract.Status not in ('归档','删除') ";
        strHQL += " and constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and constract.RecorderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
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
        strHQL += " and ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as SignMonth,COALESCE(Sum(A.Amount* B.ExchangeRate),0) as MonthAmount
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type And CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4  and A.ConstractClass = " + "'" + strConstractClass + "'" + " and A.Status not in ('取消','删除') ";
        strHQL += " and A.ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " and A.RecorderCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";
        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        LB_ConstractOwner.Text = "所有合同列表：";


        string strSalesName = "%" + TB_SalesName.Text.Trim() + "%";
        string strType = "%" + DL_ConstractType.SelectedValue + "%";
        string strConstractCode = "%" + TB_ConstractCode.Text.Trim() + "%";
        string strConstractName = "%" + TB_ConstractName.Text.Trim() + "%";
        string strPartA = "%" + TB_PartA.Text.Trim() + "%";

        string strConstractClass;

        try
        {
            strConstractClass = RBL_ConstractClass.SelectedItem.Text.Trim();
            strConstractClass = "%" + strConstractClass + "%";
        }
        catch
        {
            strConstractClass = "%%";
        }

        strHQL = "from Constract as constract where constract.ConstractClass like " + "'" + strConstractClass + "'" + " and constract.Status not in ('归档','删除') ";
        strHQL += " and constract.Type Like " + "'" + strType + "'";
        if (strSalesName != "%%")
        {
            strHQL += " and constract.ConstractCode in (Select constractSales.ConstractCode from ConstractSales as constractSales Where constractSales.SalesName like " + "'" + strSalesName + "'" + ") ";
        }
        strHQL += " and constract.ConstractCode Like " + "'" + strConstractCode + "'";
        strHQL += " and constract.ConstractName Like " + "'" + strConstractName + "'";
        strHQL += " and constract.PartA Like " + "'" + strPartA + "'";
        strHQL += " and constract.RecorderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        string strChartTitle, strCmdText;

        strChartTitle = Resources.lang.HTZTBLT;
        strCmdText = @"Select Status as XName, Count(*) as YNumber From T_Constract  Where Type Like " + "'" + strType + "'" + " and Status not in ('取消','删除') ";
        strCmdText += " and Type Like " + "'" + strType + "'";
        if (strSalesName != "%%")
        {
            strCmdText += " and ConstractCode in (Select ConstractCode from T_ConstractSales  Where SalesName like " + "'" + strSalesName + "'" + ") ";
        }
        strCmdText += " and ConstractCode Like " + "'" + strConstractCode + "'";
        strCmdText += " and ConstractName Like " + "'" + strConstractName + "'";
        strCmdText += " and PartA Like " + "'" + strPartA + "'";
        strCmdText += " and (RecorderCode = " + "'" + strUserCode + "'" + " Or ConstractCode in (select ConstractCode from T_ConstractRelatedUser where UserCode = " + "'" + strUserCode + "'" + "))";
        strCmdText += " Group By Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        strChartTitle = Resources.lang.HTZCQST;
        strCmdText = @"Select SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.Amount* B.ExchangeRate),0) as YNumber
            From T_Constract A,T_CurrencyType B Where A.Currency = B.Type and CAST(SUBSTRING(to_char(A.SignDate,'yyyymmdd'),0,5) as int) > extract(year from now()) - 4   and A.Status not in ('取消','删除') ";
        strCmdText += " and A.Type Like " + "'" + strType + "'";
        if (strSalesName != "%%")
        {
            strCmdText += " and A.ConstractCode in (Select ConstractCode from T_ConstractSales  Where SalesName like " + "'" + strSalesName + "'" + ") ";
        }
        strCmdText += " and A.ConstractCode Like " + "'" + strConstractCode + "'";
        strCmdText += " and A.ConstractName Like " + "'" + strConstractName + "'";
        strCmdText += " and A.PartA Like " + "'" + strPartA + "'";
        strCmdText += " Group By SUBSTRING (to_char(A.SignDate,'yyyymmdd'),0,7)";

        IFrame_Chart_ConstractAmountTendency.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
    }

    //创建分析图形
    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ConstractBLL constractBLL = new ConstractBLL();
        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        CreateConstractAnalystChart(LB_DepartString.Text.Trim());
    }

}

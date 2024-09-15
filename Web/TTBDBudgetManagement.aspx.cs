using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBDBudgetManagement : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "预算管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            lbl_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);

            LoadBMBaseDataList();
            //LoadBMBaseDataRecordList();
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;
        if (treeNode.Target != "0")
        {
            LB_DepartCode.Text = treeNode.Target.Trim();
            TB_DepartName.Text = ShareClass.GetDepartName(LB_DepartCode.Text);

            txt_AccountName.Text = "";
            txt_Year.Text = "";
            txt_Month.Text = "";

            LoadBMBaseDataList();
            LoadBMBaseDataRecordList();
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBMBaseDataList();
        LoadBMBaseDataRecordList();
    }

    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string strId, strHQL;
        IList lst;

        if (e.CommandName != "Page")
        {
            strId = ((Button)e.Item.FindControl("BT_BudgetID")).Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From BDBaseData as bdBaseData where bdBaseData.ID = '" + strId + "'";
            BDBaseDataBLL bdBaseDataBLL = new BDBaseDataBLL();
            lst = bdBaseDataBLL.GetAllBDBaseDatas(strHQL);
            BDBaseData bdBaseData = (BDBaseData)lst[0];

           
            TB_DepartName.Text = bdBaseData.DepartName.Trim();
            txt_AccountName.Text = bdBaseData.AccountName.Trim();
            txt_Year.Text = bdBaseData.YearNum.ToString();
            txt_Month.Text = bdBaseData.MonthNum.ToString();
            LB_DepartCode.Text = bdBaseData.DepartCode.Trim();
            lbl_BudgetID.Text = bdBaseData.ID.ToString();

            LoadBMBaseDataRecordList();

            //取得剩余预算
            GetBMBaseDataMoneyNum(bdBaseData.DepartCode.Trim(), bdBaseData.AccountName.Trim(), bdBaseData.YearNum, bdBaseData.MonthNum, bdBaseData.Type.Trim());
        }
    }


    protected void LoadBMBaseDataList()
    {
        string strHQL;
        string strDepartString;

        strDepartString = lbl_DepartString.Text.Trim();

        strHQL = "Select * From T_BDBaseData Where (Type='基础' or Type='预算')";
        strHQL += " and DepartCode In " + strDepartString;

        if (!string.IsNullOrEmpty(TB_DepartName.Text.Trim()))
        {
            strHQL += " and DepartName like '%" + TB_DepartName.Text.Trim() + "%'";
        }
        if (!string.IsNullOrEmpty(LB_DepartCode.Text.Trim()))
        {
            strHQL += " and DepartCode = '" + LB_DepartCode.Text.Trim() + "'";
        }
        if (!string.IsNullOrEmpty(txt_AccountName.Text.Trim()))
        {
            strHQL += " and AccountName like '%" + txt_AccountName.Text.Trim() + "%'";
        }
        if (!string.IsNullOrEmpty(txt_Year.Text.Trim()))
        {
            strHQL += " and YearNum='" + txt_Year.Text.Trim() + "' ";
        }
        if (!string.IsNullOrEmpty(txt_Month.Text.Trim()))
        {
            strHQL += " and MonthNum='" + int.Parse(txt_Month.Text.Trim()) + "' ";
        }
        strHQL += " Order By ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BDBaseData");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void LoadBMBaseDataRecordList()
    {
        string strHQL;
        string strDepartName, strDepartString;

        strDepartString = lbl_DepartString.Text.Trim();
        strDepartName = TB_DepartName.Text.Trim();

        if (strDepartName == "")
        {
            LB_DepartCode.Text = "";
        }

        strHQL = "Select A.*,B.UserName From T_BDBaseDataRecord A,T_ProjectMember B Where A.EnterCode=B.UserCode and (A.Type='操作' or A.Type='实际')";
        strHQL += " and B.DepartCode In " + strDepartString;

       
        if (!string.IsNullOrEmpty(TB_DepartName.Text.Trim()))
        {
            strHQL += " and A.DepartName like '%" + TB_DepartName.Text.Trim() + "%'";
        }
        if (!string.IsNullOrEmpty(LB_DepartCode.Text.Trim()))
        {
            strHQL += " and A.DepartCode = '" + LB_DepartCode.Text.Trim() + "'";
        }
        if (!string.IsNullOrEmpty(txt_AccountName.Text.Trim()))
        {
            strHQL += " and A.AccountName like '%" + txt_AccountName.Text.Trim() + "%'";
        }
        if (!string.IsNullOrEmpty(txt_Year.Text.Trim()))
        {
            strHQL += " and A.YearNum='" + txt_Year.Text.Trim() + "' ";
        }
        if (!string.IsNullOrEmpty(txt_Month.Text.Trim()))
        {
            strHQL += " and A.MonthNum='" + int.Parse(txt_Month.Text.Trim()) + "' ";
        }
        strHQL += " Order By A.ID DESC ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BDBaseData");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql1.Text = strHQL;
    }

    protected void GetBMBaseDataMoneyNum(string strDepartCode, string strAccountName, int strYearNum, int strMonthNum, string strType)
    {
        decimal deMoneyBase = 0;
        decimal deMoneyUsed = 0;
        string strHQL = "From BDBaseData as bDBaseData where bDBaseData.DepartCode = '" + strDepartCode + "' and bDBaseData.AccountName='" + strAccountName + "' and " +
                "bDBaseData.YearNum='" + strYearNum.ToString() + "' and bDBaseData.MonthNum = '" + strMonthNum.ToString() + "' and bDBaseData.Type='" + strType + "' ";
        BDBaseDataBLL bdBaseDataBLL = new BDBaseDataBLL();
        IList lst = bdBaseDataBLL.GetAllBDBaseDatas(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                BDBaseData bdBaseData = (BDBaseData)lst[i];
                deMoneyBase += bdBaseData.MoneyNum;
            }
        }

        BDBaseDataRecordBLL bdBaseDataRecordBLL = new BDBaseDataRecordBLL();
        strHQL = "From BDBaseDataRecord as bdBaseDataRecord where bdBaseDataRecord.DepartCode = '" + strDepartCode + "' and bdBaseDataRecord.AccountName='" + strAccountName + "' and " +
                "bdBaseDataRecord.YearNum='" + strYearNum.ToString() + "' and bdBaseDataRecord.MonthNum = '" + strMonthNum.ToString() + "' and bdBaseDataRecord.Type='操作' ";
        lst = bdBaseDataRecordBLL.GetAllBDBaseDataRecords(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int j = 0; j < lst.Count; j++)
            {
                BDBaseDataRecord bdBaseDataRecord = (BDBaseDataRecord)lst[j];
                deMoneyUsed += bdBaseDataRecord.MoneyNum;
            }
        }

        lbl_MoneyNum.Text = (deMoneyBase - deMoneyUsed).ToString();
    }


    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BDBaseData");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql1.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BDBaseData");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}
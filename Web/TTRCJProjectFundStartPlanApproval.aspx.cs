using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Collections;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTRCJProjectFundStartPlanApproval : System.Web.UI.Page
{
    private string UserCode = "";
    private int ProjectId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        UserCode = Convert.ToString(Session["UserCode"]); 

        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();

            //显示已有资金计划信息
            InitDataList();
            //加载科目
            InitAmountList();
            //加载大类费项
            InitFeetype();
            //加载小类费项
            DDL_CostFee.SelectedIndex = 0;
            InitFeeSubType(DDL_CostFee.SelectedValue);

            //初始化年跟月
            ShareClass.InitYearMonthList(DDL_YearList, DDL_MonthList);
        }
    }

    //显示已有资金计划信息
    private void InitDataList()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectFundStartPlan where ProjectID =");
        sql.Append(ProjectId.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectFundStartPlan");

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }


    private bool IsInputReviewOK()
    {
        if (TB_ActualAmount.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_ActualAmount.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：【执行金额】输入有误，请输入数字再试！";
            return false;
        }

        if (TB_Memo.Text.Trim().Length > 1024)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：【备注】输入有误，输入内容长度限定512个汉字或1024个英文字符，请输入数字再试！";
            return false;
        }

        return true;
    }

    private bool SaveAuditData()
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_RCJAuditFundStartPlan ");
            sql.Append(ProjectId.ToString());
            sql.Append(",");
            sql.Append(tbID.Text);
            sql.Append(",'");
            sql.Append(UserCode);
            sql.Append("',");
            sql.Append(DDL_ApproveStatus.SelectedValue);
            sql.Append(",");
            sql.Append(DDL_ApproveStatus.SelectedIndex == 0 ? "0" : TB_ActualAmount.Text);
            sql.Append(",'");
            sql.Append(DateTime.Now.ToString());
            sql.Append("','");
            sql.Append(TB_Memo.Text); 
            sql.Append("'");

            ShareClass.RunSqlCommand(sql.ToString());

        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：" + exp.Message;
            return false;
        }

        return true;
    }
    //审核功能
    protected void BT_AmountReview_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：请选择一行后再进行审核操作！";
            return;
        }

        if (false == IsInputReviewOK())
            return;

        try
        {
            SaveAuditData();

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：审核操作成功！";

            DisplayApproveList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：审核操作失败！" + exp.Message;
        }
    }

    protected void BT_QueryRecord_Click(object sender, EventArgs e)
    {
        try
        {
            string month = ShareClass.GetYearMonthString(DDL_YearList, DDL_MonthList);
            StringBuilder sql = new StringBuilder(" select * from V_RCJProjectFundStartPlan where ProjectID =");
            sql.Append(ProjectId.ToString());
            if (CB_CheckMonth.Checked == true)
            {
                sql.Append(" and BudgetTime='");
                sql.Append(month);
                sql.Append("'");
            }
            if (CB_CheckType.Checked == true)
            {
                sql.Append(" and CostFeeID=");
                sql.Append(DDL_CostFee.SelectedValue);
                sql.Append(" and CostFeeSubID=");
                sql.Append(DDL_CostSubFee.SelectedValue);
            }

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectFundStartPlan");

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
                lb_ShowMessage.Text = "消息提示：查询到对应的记录！";
            }
            else
            {
                lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessage.Text = "消息提示：没有查询到对应的记录！";

            }
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：查询操作失败：" + exp.Message;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(ViewState["UrlReferrer"].ToString());
    }

    //加载科目
    private void InitAmountList()
    {
        StringBuilder sql = new StringBuilder(" select AccountCode , AccountName from T_Account");
        sql.Append(" order by AccountCode ");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_Account");

        DDL_AmountClass.DataSource = ds;
        DDL_AmountClass.DataTextField = "AccountName";
        DDL_AmountClass.DataValueField = "AccountCode";
        DDL_AmountClass.DataBind();

    }
    //加载大类费项
    private void InitFeetype()
    {
        StringBuilder sql = new StringBuilder(" select ID , Title from T_RCJProjectCostFeeIDs");
        sql.Append(" order by ID ");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostFeeIDs");

        DDL_CostFee.DataSource = ds;
        DDL_CostFee.DataTextField = "Title";
        DDL_CostFee.DataValueField = "ID";
        DDL_CostFee.DataBind();
    }
    //加载小类费项
    private void InitFeeSubType(string costFeeID)
    {
        try
        {
            if (costFeeID.Trim().Length == 0)
                return;

            DDL_CostSubFee.Items.Clear();

            StringBuilder sql = new StringBuilder(" select ID , SubTitle from T_RCJProjectCostFeeSubIDs where CostFeeID =");
            sql.Append(costFeeID);
            sql.Append(" order by ID ");

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostFeeSubIDs");

            DDL_CostSubFee.DataSource = ds;
            DDL_CostSubFee.DataTextField = "SubTitle";
            DDL_CostSubFee.DataValueField = "ID";
            DDL_CostSubFee.DataBind();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：读取成本子项列表信息失败！" + exp.Message;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            tbID.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            TB_Amount.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            TB_Purpose.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
            DDL_CostFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
            InitFeeSubType(GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text);
            DDL_CostSubFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text;
            ListItem li = DDL_AmountClass.Items.FindByText(GridView1.Rows[GridView1.SelectedIndex].Cells[7].Text);
            if (li != null)
            {
                DDL_AmountClass.ClearSelection();
                li.Selected = true;
            }
            string ym = GridView1.Rows[GridView1.SelectedIndex].Cells[8].Text;
            DDL_YearList.SelectedValue = ym.Substring(0, 4);
            int month = Convert.ToInt32(ym.Substring(4, 2));
            DDL_MonthList.SelectedValue = month.ToString();
            TB_AmountLevel.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[9].Text;

            DisplayApproveList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：操作失败！" + exp.Message;
        }
    }
    protected void DDL_CostFee_TextChanged(object sender, EventArgs e)
    {
        try
        {
            InitFeeSubType(DDL_CostFee.SelectedValue);
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：读取成本子项列表信息失败！" + exp.Message;
        }
    }
    //显示审批操作列表
    private void DisplayApproveList()
    {
        try
        {        
            StringBuilder strHQL = new StringBuilder("select * from T_RCJProjectFundStartPlanApprove where FundPlanID =");

            string strApproveCode = tbID.Text.Trim();

            strHQL.Append(strApproveCode);
            strHQL.Append(" order by FundPlanID desc");


            DataSet ds = ShareClass.GetDataSetFromSql(strHQL.ToString(), "T_RCJProjectFundStartPlanApprove");

            GV_ApproveList.DataSource = ds;
            GV_ApproveList.DataBind();

        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：获取审核列表操作失败！" + exp.Message;
        }    
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }
    protected void GV_ApproveList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }
}
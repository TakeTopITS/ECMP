using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Data;
using System.Text;

public partial class TTRCJProjectTargetCostFee : System.Web.UI.Page
{
    private int ProjectId = 0;
    private string UserCode = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        UserCode = Convert.ToString(Session["UserCode"]); 

        if (!IsPostBack)
        {
            try
            {
                InitDataList();
                //加载成本费项大类
                InitCostFeeList();
                //加载成本费项子类
                DDL_CostFee.SelectedIndex = 0;
                InitCostSubFeeList(DDL_CostFee.SelectedValue);

                //合计记录
                InitTotalByMonth();

                //按种类合计
                InitTotalByType();

                //初始化年跟月
                ShareClass.InitYearMonthList(DDL_YearList, DDL_MonthList);
            }
            catch (Exception exp)
            {
                lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessage.Text = "消息提示：读取目标成本信息列表失败！" + exp.Message;
            }
        }
    }

    private void InitDataList()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectTargetCostFee where ProjectID =");
        sql.Append(ProjectId.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectTargetCostFee");

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    private void InitCostFeeList()
    {
        StringBuilder sql = new StringBuilder(" select ID , Title from T_RCJProjectCostFeeIDs ");
        sql.Append(" order by ID ");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostFeeIDs");

        DDL_CostFee.DataSource = ds;
        DDL_CostFee.DataTextField = "Title";
        DDL_CostFee.DataValueField = "ID";
        DDL_CostFee.DataBind();
    }

    private void InitCostSubFeeList(string costFeeID)
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

    //合计记录
    private void InitTotalByMonth()
    {
        try
        {
            StringBuilder sql = new StringBuilder("SELECT workyear,WorkMonth ,COALESCE(sum(COALESCE(FeeMoney,0)),0) as tsum FROM V_RCJProjectMonthWork where ProjectID=");
            sql.Append(ProjectId.ToString());
            sql.Append(" group by workyear, WorkMonth ");
            //sql.Append(" order by workyear,WorkMonth desc"); 
            sql.Append(" union all ");
            sql.Append(" select null,null, COALESCE(sum(COALESCE(FeeMoney,0)),0) FROM V_RCJProjectMonthWork where ProjectID= ");
            sql.Append(ProjectId.ToString());
    

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectMonthWork");

            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        catch (Exception exp)
        {
            LB_ShowMessageTotalByMonth.ForeColor = System.Drawing.Color.Red;
            LB_ShowMessageTotalByMonth.Text = "消息提示：按月累计成本费用列表信息失败！" + exp.Message;
        }
    }

    private void InitTotalByType()
    {
        try
        {
            StringBuilder sql = new StringBuilder("select costfeeid,title,");
            if (RB_FeeSubType.Checked == true)
            {
                sql.Append("costfeesubid,subtitle, ");
            }
            else
            {
                sql.Append(" 0 as costfeesubid, '大类合计' as subtitle, ");
            }
            sql.Append(" sum(originalcost) as originalcost,sum(actualcost) as actualcost,sum(targetcost) as targetcost from V_RCJProjectTargetCostFee");
            sql.Append(" where ProjectID=");
            sql.Append(ProjectId.ToString());
            sql.Append(" group by costfeeid,title");
            if(RB_FeeSubType.Checked == true)
            {
                sql.Append(",costfeesubid,subtitle ");
            }

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectTargetCostFee");

            GV_TotalByType.DataSource = ds;
            GV_TotalByType.DataBind();
        }
        catch (Exception exp)
        {
            LB_ShowMessageTotalByType.ForeColor = System.Drawing.Color.Red;
            LB_ShowMessageTotalByType.Text = "消息提示：按月累计成本费用列表信息失败！" + exp.Message;
        }
    }

    private string GetTypeIdByChsText(string text)
    {
        if( text == "大类合计")
        {
            return "0";
        }
        else if(text == "子类预算")
        {
            return "1";
        }
        else if(text == "实际目标成本")
        {
            return "2";
        }
        return "-1";
    }

    public string GetCostString(object type)
    {
        int it = Convert.ToInt32( type);
        if (it == 0)
            return "大类合计";
        else if (it == 1)
        {
            return "子类预算";
        }
        else if (it == 2)
        {
            return "实际目标成本";
        }
        return "";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            tbID.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            DDL_CostFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            InitCostSubFeeList(GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text);
            DDL_CostSubFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
            Label lbl1 = (Label)GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1");
            DDL_CostType.SelectedValue = GetTypeIdByChsText(lbl1.Text);
            TB_OriginalCost.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text;
            TB_Costtarget.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[8].Text;
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：操作失败！" + exp.Message;
        }
    }


    protected void DDL_CostFee_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            InitCostSubFeeList(DDL_CostFee.SelectedValue);
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：读取成本子项列表信息失败！" + exp.Message;
        }
    }
    protected void btnDeleteItem_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：请选择一行进行删除操作！";
            return;
        }


        try
        {
            //RCJProjectTargetCostFeeBLL tcfBll = new RCJProjectTargetCostFeeBLL();
            //RCJProjectTargetCostFee tcfData = new RCJProjectTargetCostFee();

            //tcfData.ID = Convert.ToInt32(tbID.Text);

            //tcfBll.DeleteRCJProjectTargetCostFee(tcfData);

            if(false == SaveDataTargetCostFeeList(2, Convert.ToInt32(tbID.Text)))
                return;

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：删除目标成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：删除目标成本失败！" + exp.Message;
        }
    }

    private bool IsInputOk()
    {
        if (DDL_CostSubFee.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[成本费项子类]没有选择项，请先输入该大类的子项后再试！";
            return false;
        }

        if (TB_OriginalCost.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_OriginalCost.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[原定成本]输入有误，请输入数字再试！";
            return false;
        } 
        
        if (TB_Costtarget.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_Costtarget.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[目标成本]输入有误，请输入数字再试！";
            return false;
        } 
        
        return true;
    }

    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        if (false == IsInputOk())
            return;

        if (true == IfExistsTargetFee(0, Convert.ToInt32(DDL_CostFee.SelectedValue), Convert.ToInt32(DDL_CostSubFee.SelectedValue),Convert.ToInt32(DDL_CostType.SelectedValue), true))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：该成本费项已经输入目标成本，请直接修改！";
            return;
        }

        try
        {
            if (false == SaveDataTargetCostFeeList(0, 0))
                return;

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：增加目标成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：增加目标成本失败！" + exp.Message;
        }
    }

    private bool IfExistsTargetFee(int id, int costFeeId, int costFeeSubid, int type ,bool bAdd)
    {
        try
        {
            StringBuilder sql = new StringBuilder("select * From T_RCJProjectTargetCostFee where projectid=");
            sql.Append(ProjectId.ToString());
            sql.Append(" and CostFeeID=");
            sql.Append(costFeeId.ToString());
            sql.Append(" and CostFeeSubID=");
            sql.Append(costFeeSubid.ToString());

            if (type == 0)
            {
                sql.Append(" and costfeetype==0");
            }

            if (bAdd == false) //是修改的话，还要判断是否id
            {
                sql.Append(" and ID !=");
                sql.Append(id.ToString());
            }

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectTargetCostFee");

            if (ds.Tables[0].Rows.Count > 0)
                return true;
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：查询操作失败：" + exp.Message;

            return true;
        }
        return false;
    }


    protected void btnEditItem_Click(object sender, EventArgs e)
    {
        if (false == IsInputOk())
            return;

        if (true == IfExistsTargetFee(Convert.ToInt32(tbID.Text), Convert.ToInt32(DDL_CostFee.SelectedValue), Convert.ToInt32(DDL_CostSubFee.SelectedValue),Convert.ToInt32(DDL_CostType.SelectedValue), false))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：该成本费项已经存在目标成本，请仔细确认后再进行修改！";
            return;
        }

        try
        {
            //RCJProjectTargetCostFeeBLL tcfBll = new RCJProjectTargetCostFeeBLL();
            //RCJProjectTargetCostFee tcfData = new RCJProjectTargetCostFee();

            //tcfData.ID = Convert.ToInt32(tbID.Text);
            //tcfData.ProjectID = ProjectId;
            //tcfData.CostFeeID = Convert.ToInt32(DDL_CostFee.SelectedValue);
            //tcfData.CostType = Convert.ToInt32(DDL_CostType.SelectedValue);
            //if (tcfData.CostType == 0)
            //{
            //    tcfData.CostFeeSubID = 0;
            //}
            //else
            //{
            //    tcfData.CostFeeSubID = Convert.ToInt32(DDL_CostSubFee.SelectedValue);
            //}
            //tcfData.OriginalCost = Convert.ToDouble(TB_OriginalCost.Text);
            //tcfData.ActualCost = Convert.ToDouble(GridView1.Rows[GridView1.SelectedIndex].Cells[7].Text);
            //tcfData.TargetCost = Convert.ToDouble(TB_Costtarget.Text);
            //tcfData.InputUser = UserCode;
            //tcfData.LastTime = DateTime.Now.ToString();

            //tcfBll.UpdateRCJProjectTargetCostFee(tcfData, tcfData.ID);

            if (false == SaveDataTargetCostFeeList(1, Convert.ToInt32(tbID.Text)))
                return;

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：修改目标成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：修改目标成本失败！" + exp.Message;
        }

    }

    protected void BT_QueryRecord_Click(object sender, EventArgs e)
    {
        try
        {
            StringBuilder sql = new StringBuilder(" select * from V_RCJProjectTargetCostFee where ProjectID =");
            sql.Append(ProjectId.ToString());

            if (RB_ALL.Checked == false)
            {
                if (RB_MainType.Checked == true)
                {
                    sql.Append(" and CostFeeID=");
                    sql.Append(DDL_CostFee.SelectedValue);
                }

                if (RB_SubType.Checked == true)
                {
                    sql.Append(" and CostFeeID=");
                    sql.Append(DDL_CostFee.SelectedValue);

                    sql.Append(" and CostFeeSubID=");
                    sql.Append(DDL_CostSubFee.SelectedValue);
                }

                if (RB_Time.Checked == true)
                {
                    sql.Append(" and extract(year from LastTime)=");
                    sql.Append(DDL_YearList.Text);

                    sql.Append(" and extract(month from LastTime)=");
                    sql.Append(DDL_MonthList.Text);

                }
            }

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectTargetCostFee");

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


    protected void GV_TotalByType_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            double actual = Convert.ToDouble(e.Row.Cells[5].Text);
            double target = Convert.ToDouble(e.Row.Cells[6].Text);
            if (actual > target)
                e.Row.BackColor = System.Drawing.Color.Red;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //鼠标经过时，行背景色变 
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
                //鼠标移出时，行背景色变 
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
            }
        }
    }
    protected void RB_FeeSubType_CheckedChanged(object sender, EventArgs e)
    {
        InitTotalByType();
    }
    protected void RB_FeeType_CheckedChanged(object sender, EventArgs e)
    {
        InitTotalByType();
    }

    protected void BT_CostSubFeeManage_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.SelectedIndex = -1;
        InitDataList();
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        InitDataList();
    }
    protected void GV_TotalByType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_TotalByType.PageIndex = e.NewPageIndex;
        InitDataList();
    }

    //实际成本数据管理
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["UserCode"] = UserCode; 
        StringBuilder sb = new StringBuilder("TTRCJProjectMonthCostFee.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        Response.Redirect(sb.ToString());
    }

    //项目资金计划和实施
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["UserCode"] = UserCode;
        StringBuilder sb = new StringBuilder("TTRCJProjectFundStartPlan.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        Response.Redirect(sb.ToString());
    }
    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    Session["UserCode"] = UserCode;
    //    StringBuilder sb = new StringBuilder("TTRCJProjectFundStartPlanApproval.aspx?projectid=");
    //    sb.Append(ProjectId.ToString());
    //    Response.Redirect(sb.ToString());
    //}
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
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    private bool SaveDataTargetCostFeeList(int bAdd, int selectId)
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_TargetCostFeeOperation ");
            sql.Append(selectId.ToString());
            sql.Append(",");
            sql.Append(bAdd.ToString());
            sql.Append(",");
            sql.Append(ProjectId.ToString());
            sql.Append(",");
            sql.Append(DDL_CostType.SelectedValue);
            sql.Append(",");
            sql.Append(DDL_CostFee.SelectedValue);
            sql.Append(",");
            if (DDL_CostType.SelectedValue == "0")
            {
                sql.Append(",0");
            }
            else
            {
                sql.Append(DDL_CostSubFee.SelectedValue);
            }            
            sql.Append(",");
            sql.Append(TB_OriginalCost.Text);
            if (bAdd == 1)
            {
                sql.Append(",");
                sql.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[7].Text); 
                sql.Append(","); 
            }
            else
            {
                sql.Append(",0,");
            }
            sql.Append(TB_Costtarget.Text);
            sql.Append(",'");
            sql.Append(UserCode);
            sql.Append("','");
            sql.Append(DateTime.Now.ToString());
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
}


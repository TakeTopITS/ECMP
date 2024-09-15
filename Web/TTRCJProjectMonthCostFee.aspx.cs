using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

using ProjectMgt.BLL;
using ProjectMgt.DAL;
using ProjectMgt.Model;


public partial class TTRCJProjectMonthCostFee : System.Web.UI.Page
{
    private int ProjectId = 0;
    private string UserCode="";

    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        UserCode = Convert.ToString(Session["UserCode"]);

        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();

            try
            {
                InitDataList();
                //加载成本费项大类
                InitCostFeeList();
                //加载成本费项子类
                DDL_CostFee.SelectedIndex = 0;
                InitCostSubFeeList(DDL_CostFee.SelectedValue);

                //初始化年跟月
                ShareClass.InitYearMonthList(DDL_YearList, DDL_MonthList);
            }
            catch (Exception exp)
            {
                lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessage.Text = "消息提示：读取成本费实际发生信息列表失败！" + exp.Message;
            }
        }
    }

    private void InitDataList()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectMonthWork where ProjectID =");
        sql.Append(ProjectId.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectMonthWork");

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    private void InitCostFeeList()
    {
        StringBuilder sql = new StringBuilder(" select ID , Title from T_RCJProjectCostFeeIDs");
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            tbID.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            DDL_CostFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            InitCostSubFeeList(GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text);
            DDL_CostSubFee.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
            //string ym = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text;
            //int year = Convert.ToInt32( ym.Substring(0,4));
            DDL_YearList.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text; ;
            //int month = Convert.ToInt32( ym.Substring(4,2));
            //DDL_MonthList.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text;
            TB_CostFee.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[7].Text;
            TB_Memo.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[8].Text;
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
            lb_ShowMessage.Text = "消息提示：请选择一行进行删除操作！" ;
            return;
        }

        try
        {
            RCJProjectMonthCostFeeBLL mcfBll = new RCJProjectMonthCostFeeBLL();
            RCJProjectMonthCostFee mcfData = new RCJProjectMonthCostFee();

            mcfData.ID = Convert.ToInt32( tbID.Text);

            mcfBll.DeleteRCJProjectMonthCostFee(mcfData);

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：删除实际发生成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：删除实际发生成本失败！" + exp.Message;
        }
    }

    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        if (DDL_CostSubFee.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[成本费项子类]没有选择项，请先输入该大类的子项后再试！";
            return;
        }

        if (TB_CostFee.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_CostFee.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[成本费用]输入有误，请输入数字再试！";
            return ;
        }

        //string month = ShareClass.GetYearMonthString(DDL_YearList, DDL_MonthList);
        //if(true == IfExistsMonthWork(0, Convert.ToInt32( DDL_CostFee.SelectedValue), Convert.ToInt32(DDL_CostSubFee.SelectedValue),  month, true))
        //{
        //    lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
        //    lb_ShowMessage.Text = "消息提示：该成本费项月份已经输入实际发生值，请直接修改！";
        //    return;
        //}

        try
        {
            RCJProjectMonthCostFeeBLL mcfBll = new RCJProjectMonthCostFeeBLL();
            RCJProjectMonthCostFee mcfData = new RCJProjectMonthCostFee();

            //mcfData.ID = Convert.ToInt32(tbID.Text);
            mcfData.ProjectID = ProjectId;
            mcfData.CostFeeID = Convert.ToInt32( DDL_CostFee.SelectedValue);
            mcfData.CostFeeSubID = Convert.ToInt32(DDL_CostSubFee.SelectedValue);
            mcfData.FeeMoney = Convert.ToDouble(TB_CostFee.Text);
            mcfData.WorkYear = Convert.ToInt32(DDL_YearList.Text);
            mcfData.WorkMonth = Convert.ToInt32(DDL_MonthList.Text);
            mcfData.InputUser = UserCode;
            mcfData.LastTime = DateTime.Now.ToString();
            mcfData.Memo = TB_Memo.Text.Length > 50 ? TB_Memo.Text.Substring(0, 50) : TB_Memo.Text;

            mcfBll.AddRCJProjectMonthCostFee(mcfData);

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：增加实际发生成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：增加实际发生成本失败！" + exp.Message;
        }
    }
    protected void btnEditItem_Click(object sender, EventArgs e)
    {
        if (DDL_CostSubFee.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[成本费项子类]没有选择项，请先输入该大类的子项后再试！";
            return;
        } 
        
        if (TB_CostFee.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_CostFee.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：[成本费用]输入有误，请输入数字再试！";
            return;
        }

        //string month = ShareClass.GetYearMonthString(DDL_YearList, DDL_MonthList);
        //if (true == IfExistsMonthWork(Convert.ToInt32(tbID.Text), Convert.ToInt32(DDL_CostFee.SelectedValue), Convert.ToInt32(DDL_CostSubFee.SelectedValue), month, false))
        //{
        //    lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
        //    lb_ShowMessage.Text = "消息提示：该成本费项对应的月份已经存在发生值，请仔细确认后再进行修改！";
        //    return;
        //} 
        
        try
        {
            RCJProjectMonthCostFeeBLL mcfBll = new RCJProjectMonthCostFeeBLL();
            RCJProjectMonthCostFee mcfData = new RCJProjectMonthCostFee();

            mcfData.ID = Convert.ToInt32(tbID.Text);
            mcfData.ProjectID = ProjectId;
            mcfData.CostFeeID = Convert.ToInt32(DDL_CostFee.SelectedValue);
            mcfData.CostFeeSubID = Convert.ToInt32(DDL_CostSubFee.SelectedValue);
            mcfData.FeeMoney = Convert.ToDouble(TB_CostFee.Text);
            mcfData.WorkYear = Convert.ToInt32(DDL_YearList.Text);
            mcfData.WorkMonth = Convert.ToInt32(DDL_MonthList.Text);
            mcfData.InputUser = UserCode;
            mcfData.LastTime = DateTime.Now.ToString();
            mcfData.Memo = TB_Memo.Text.Length > 50 ? TB_Memo.Text.Substring(0, 50) : TB_Memo.Text;

            mcfBll.UpdateRCJProjectMonthCostFee(mcfData , mcfData.ID);

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：修改实际发生成本成功！";

            InitDataList();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：修改实际发生成本失败！" + exp.Message;
        }
    }

    private bool IfExistsMonthWork(int id, int costFeeId, int costFeeSubid, string month, bool bAdd)
    {
        try
        {
            //获取成本费项大类的信息列表 
            StringBuilder sql = new StringBuilder("From RCJProjectMonthCostFee as rCJProjectMonthCostFee where projectid=");
            sql.Append(ProjectId.ToString());
            sql.Append(" and WorkMonth='");
            sql.Append(month);
            sql.Append("' and CostFeeID=");
            sql.Append(costFeeId.ToString());
            sql.Append(" and CostFeeSubID=");
            sql.Append(costFeeSubid.ToString());

            if (bAdd == false) //是修改的话，还要判断是否id
            {
                sql.Append(" and ID !=");
                sql.Append(id.ToString());
            }

            RCJProjectMonthCostFeeBLL mcfBll = new RCJProjectMonthCostFeeBLL();
            IList list;
            list = mcfBll.GetAllRCJProjectMonthCostFee(sql.ToString());

            if (list.Count > 0)
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


    protected void BT_QueryRecord_Click(object sender, EventArgs e)
    {
        try
        {
            //string month = ShareClass.GetYearMonthString(DDL_YearList, DDL_MonthList);
            StringBuilder sql = new StringBuilder(" select * from V_RCJProjectMonthWork where ProjectID =");
            sql.Append(ProjectId.ToString());
            if (CB_CheckMonth.Checked == true)
            {
                sql.Append(" and WorkYear=");
                sql.Append(DDL_YearList.Text);
                sql.Append(" and WorkMonth=");
                sql.Append(DDL_MonthList.Text);
            }
            if (CB_CheckType.Checked == true)
            {
                sql.Append(" and CostFeeID=");
                sql.Append(DDL_CostFee.SelectedValue);
                sql.Append(" and CostFeeSubID=");
                sql.Append(DDL_CostSubFee.SelectedValue);
            }

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectMonthWork");

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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.SelectedIndex = -1;
        InitDataList();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(ViewState["UrlReferrer"].ToString());
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
}
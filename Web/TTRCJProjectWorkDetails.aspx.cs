using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Text;

public partial class T_RCJProjectWorkDetails : System.Web.UI.Page
{
    private string UserCode = "";
    private int ProjectId = 0;
    private int ItemType = 0;
    private int itemno = 0;
    private int AdjustId = 0;
    private double TotalBudget = 0;
    private double itemnum = 0;
    private string ItemName = string.Empty;
    private string ItemContent = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        UserCode = Convert.ToString(Session["UserCode"]);
        ItemType = Convert.ToInt32(Request.QueryString["itemtype"]);
        itemno = Convert.ToInt32(Request.QueryString["itemno"]);
        AdjustId = Convert.ToInt32(Request.QueryString["adjustid"]);
        TotalBudget = Convert.ToDouble(Request.QueryString["Budget"]);
        itemnum = Convert.ToDouble(Request.QueryString["itemnum"]);
        ItemName = Convert.ToString(Request.QueryString["itemname"]);
        ItemContent = Convert.ToString(Request.QueryString["itemContent"]);

        if (!IsPostBack)
        {
            try
            {
                Session["UrlReferrer_Details"] = Request.Url.ToString();

                //获得基准信息类型列表
                RCJShareClass.InitPerformanceType(DDL_PerformanceType,this.lb_ShowMessage);                
                DDL_PerformanceType.Items.FindByValue(ItemType.ToString()).Selected = true;

                //初始化子项Id列表
                TB_ItemNo.Text = itemno.ToString();

                TB_ItemName.Text = ItemName;
                TB_ItemContent.Text = ItemContent;


                //初始化年跟月
                GetAllYearsList(ProjectId, DDL_PerformanceType.SelectedValue, itemno);
                DDL_YearList.SelectedIndex = 0;
                GetAllMonthsList(ProjectId, DDL_PerformanceType.SelectedValue, itemno, DDL_YearList.SelectedValue);

                InitAllDataList(sender , e ,0,0);

            }
            catch (Exception exp)
            {
                lb_ShowMessage.Text = "错误提示：操作出现异常： " + exp.Message;
            }
        }
    }

    private void GetAllYearsList(int pid, string tid, int iid)
    {
        try
        {
            StringBuilder sql = new StringBuilder(" select distinct ProjectYear from T_RCJProjectCostPerformanceBenchmar where ProjectID =");
            sql.Append(pid.ToString());
            sql.Append(" and itemtype=");
            sql.Append(tid);
            sql.Append(" and itemno=");
            sql.Append(iid);

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostPerformanceBenchmar");

            DDL_YearList.DataSource = ds;
            DDL_YearList.DataBind();

            DDL_YearListConfirm.DataSource = ds;
            DDL_YearListConfirm.DataBind();

            DDL_YearListMoney.DataSource = ds;
            DDL_YearListMoney.DataBind();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.Text = "错误提示：获取年列表操作出现异常： " + exp.Message;
        }
    }

    private void GetAllMonthsList(int pid, string tid, int iid, string year)
    {
        try
        {
            StringBuilder sql = new StringBuilder(" select ProjectMonth from T_RCJProjectCostPerformanceBenchmar where ProjectID =");
            sql.Append(pid.ToString());
            sql.Append(" and itemtype=");
            sql.Append(tid);
            sql.Append(" and itemno=");
            sql.Append(iid);
            sql.Append(" and ProjectYear=");
            sql.Append(year);

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostPerformanceBenchmar");

            DDL_MonthList.DataSource = ds;
            DDL_MonthList.DataBind();

            DDL_MonthListConfirm.DataSource = ds;
            DDL_MonthListConfirm.DataBind();

            DDL_MonthListMoney.DataSource = ds;
            DDL_MonthListMoney.DataBind();
         }
        catch (Exception exp)
        {
            lb_ShowMessage.Text = "错误提示：获取月列表操作出现异常： " + exp.Message;
        }   
    }

    private void InitAllDataList(object sender, EventArgs e, int detailsSelectedid, int confirmSelectedid)
    {
        ClearInputText();

        InitDataDetailsList();

        gvWorkDetails.SelectedIndex = -1;
        if (gvWorkDetails.Rows.Count > 0)
        {
            gvWorkDetails.SelectedIndex = detailsSelectedid;
            //detailsSelectedID = 0;
            gvWorkDetails_SelectedIndexChanged(sender, e);
            int confirmID = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            InitDataConfirmList(itemno, confirmID);

            gvWorkConfirm.SelectedIndex = -1;
            if (gvWorkConfirm.Rows.Count > 0)
            {
                gvWorkConfirm.SelectedIndex = confirmSelectedid;
                //confirmSelectedID = 0;
                int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
                InitDataListMoney(itemno, confirmID, iid);
            }
            else
            {
                InitDataListMoney(itemno, -1, -1);
            }
        }
        else
        {
            //清除GridView的数据显示
            InitDataListMoney(itemno, -1, -1);

            InitDataListMoney(itemno, -1, -1);
        }
    }

    private void InitDataDetailsList()
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkDetails where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(DDL_PerformanceType.SelectedValue);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and AdjustId=");
        sql.Append(AdjustId.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkDetails");

        gvWorkDetails.DataSource = ds;
        gvWorkDetails.DataBind();

    }

    private void InitDataConfirmList(int itemno, int confirmID)
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkConfirm where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(DDL_PerformanceType.SelectedValue);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and WorkConfirmID=");
        sql.Append(confirmID.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkConfirm");

        gvWorkConfirm.DataSource = ds;
        gvWorkConfirm.DataBind();

    }

    protected void gvWorkDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearInputText();

            TB_ID.Text = gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[1].Text;
            TB_ItemNo.Text = gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[3].Text;

            DDL_YearList.SelectedValue = gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[5].Text;

            DDL_MonthList.SelectedValue = gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[6].Text;
            TB_WorkNumDetails.Text = gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[7].Text;

            int confirmID = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            InitDataConfirmList(itemno, confirmID);
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：操作失败！" + exp.Message;
        }
    }


    private bool IfExistsMonthWork(int id, int itemno, string month, bool bAdd)
    {
        try
        {
            //获取成本费项大类的信息列表 
            StringBuilder sql = new StringBuilder("From RCJProjectWorkDetails as rCJProjectWorkDetails where projectid=");
            sql.Append(ProjectId.ToString());
            sql.Append(" and WorkMonth='");
            sql.Append(month);
            sql.Append("' and itemno=");
            sql.Append(itemno.ToString());
            sql.Append(" and itemtype=");
            sql.Append(DDL_PerformanceType.SelectedValue);

            if (bAdd == false) //是修改的话，还要判断是否id
            {
                sql.Append(" and ID !=");
                sql.Append(id.ToString());
            }

            RCJProjectWorkDetailsBLL pwdBll = new RCJProjectWorkDetailsBLL();
            IList list;
            list = pwdBll.GetAllRCJProjectWorkDetails(sql.ToString());

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

    private bool SaveDataDetailsList(int bAdd, int selectId, int confirmID,string demo)
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_WorkDetailsOperation ");
            sql.Append(selectId.ToString());
            sql.Append(",");
            sql.Append(bAdd.ToString());
            sql.Append(",");
            sql.Append(confirmID.ToString());
            sql.Append(",");
            sql.Append(ProjectId.ToString());
            sql.Append(",");
            sql.Append(DDL_PerformanceType.SelectedValue);
            sql.Append(",");
            sql.Append(itemno.ToString());
            sql.Append(",");
            sql.Append(AdjustId.ToString());
            sql.Append(",");
            sql.Append(DDL_YearList.Text);
            sql.Append(",");
            sql.Append(DDL_MonthList.Text);
            sql.Append(",");
            sql.Append(TB_WorkNumDetails.Text);
            sql.Append(",'");
            sql.Append(UserCode);
            sql.Append("','");
            sql.Append(DateTime.Now.ToString());
            sql.Append("','");
            sql.Append(demo);
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

    private int getMaxid()
    {
        int maxid = 0;
        StringBuilder strSql = new StringBuilder("select max(COALESCE(WorkConfirmID,0)) as maxid from T_RCJProjectWorkDetails where projectid=");
        strSql.Append(ProjectId.ToString());
        strSql.Append(" and itemtype=");
        strSql.Append(DDL_PerformanceType.SelectedValue);
        strSql.Append(" and itemno=");
        strSql.Append(itemno.ToString());
        DataSet ds = ShareClass.GetDataSetFromSql(strSql.ToString(), "T_RCJProjectWorkDetails");
        if (ds.Tables[0] != null && ds.Tables[0].Rows != null && ds.Tables[0].Rows.Count > 0 && !Convert.IsDBNull(ds.Tables[0].Rows[0]["maxid"]))
            maxid = Convert.ToInt32(ds.Tables[0].Rows[0]["maxid"]);

        return maxid;
    }

    //获得新的ConfirmID，格式：类型+绩效编号+01
    private int getNewConfirmID()
    {
        int maxid = getMaxid();

        string str = string.Format("{0}{1:00}{2:000}", int.Parse(DDL_PerformanceType.SelectedValue), int.Parse(itemno.ToString()), 1);

        int newid = int.Parse(str);

        if (newid <= maxid)
            newid = maxid + 1;

        return newid;
    }

    public double getHasInputDetailsWorkNum(GridView gv,int np , int IID)
    {
        double maxWorkNum = 0;

        for (int i = 0; i < gv.Rows.Count ; i++)
        {
            int index = Convert.ToInt32(gv.Rows[i].Cells[1].Text);
            if (IID > 0 && IID == index)
                continue;

            maxWorkNum += Convert.ToDouble(gv.Rows[i].Cells[np].Text);
        }

        return maxWorkNum;
    }

    //新增实际工作记录
    protected void BT_SaveWorkDetails_Click(object sender, EventArgs e)
    {
        if (TB_WorkNumDetails.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumDetails.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：请正确输入实际工作量再试！";
            return;
        }

        //判断目前输入的工作量是否在实际工作的工作量范围
        double maxHasInputWorkNum = getHasInputDetailsWorkNum(gvWorkDetails,7,1);
        double currentInputWorkNum = Convert.ToDouble(TB_WorkNumDetails.Text);
        double theRestWorkNum = 0;
        if (RCJShareClass.FloatIsEqual(itemnum, maxHasInputWorkNum) == false)
        {
            theRestWorkNum =  itemnum - maxHasInputWorkNum;
        }

        if (RCJShareClass.FloatGT( currentInputWorkNum , theRestWorkNum) )
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = string.Format("消息提示：请正确输入工作量再试！目前最多可确认的工作量为：{0:f4}", theRestWorkNum);
            return;
        }

        try
        {
            int confirmId = getNewConfirmID();
            if (false == SaveDataDetailsList(0, 0, confirmId, "增加实际工作记录"))
                return;

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：新增实际工作量成功！";

            InitAllDataList(sender, e, gvWorkDetails.Rows.Count , 0);

        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：新增实际工作量失败！" + exp.Message;
        }
    }

    //修改实际工作量
    protected void BT_EditWorkDetails_Click(object sender, EventArgs e)
    {
        if (gvWorkDetails.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：请选择需要修改的实际工作量再试！";
            return;
        }

        if (TB_WorkNumDetails.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumDetails.Text))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：请正确输入实际工作量再试！";
            return;
        }

        //判断目前输入的工作量是否在实际工作的工作量范围
        int si = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[1].Text);
        double maxHasInputWorkNum = getHasInputDetailsWorkNum(gvWorkDetails,7,si);
        double currentInputWorkNum = Convert.ToDouble(TB_WorkNumDetails.Text);
        double theRestWorkNum = 0;
        if (RCJShareClass.FloatIsEqual(itemnum, maxHasInputWorkNum) == false)
        {
            theRestWorkNum = itemnum - maxHasInputWorkNum;
        }

        if (RCJShareClass.FloatGT(currentInputWorkNum, theRestWorkNum))
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = string.Format("消息提示：请正确输入工作量再试！目前最多可确认的工作量为：{0:f4}", theRestWorkNum);
            return;
        }

        try
        {
            int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            if (false == SaveDataDetailsList(1, Convert.ToInt32(TB_ID.Text), confirmId, "修改实际工作记录"))
                return;

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：修改实际工作量成功！";

            InitAllDataList(sender, e, gvWorkDetails.SelectedIndex , 0);

        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：修改实际工作量失败！" + exp.Message;
        }
    }

    //删除实际工作量
    protected void BT_DelWorkDetails_Click(object sender, EventArgs e)
    {
        if (gvWorkDetails.SelectedIndex == -1)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：请选择一行进行删除操作！";
            return;
        }

        try
        {
            int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            if (false == SaveDataDetailsList(2, Convert.ToInt32(TB_ID.Text), confirmId, "删除实际工作记录"))
                return; 

            lb_ShowMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage.Text = "消息提示：删除实际工作量成功！";

            InitAllDataList(sender, e,0,0);
        }
        
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：删除实际工作量失败！" + exp.Message;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        StringBuilder url = new StringBuilder("TTRCJProjectCost.aspx?ProjectID=");
        url.Append(ProjectId.ToString());
        Response.Redirect(url.ToString());
    }

    protected void gvConfirmWork_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvWorkDetails.PageIndex = e.NewPageIndex;
        gvWorkDetails.SelectedIndex = -1;
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        InitDataConfirmList(itemno, confirmId);
    }

    protected void DDL_PerformanceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        InitAllDataList(sender, e , 0 , 0);

    }

    private void ClearInputText()
    {
        TB_ID.Text = "";
        TB_WorkNumDetails.Text = "";
        TB_WorkNumConfirm.Text = "";
        TB_WorkNumMoney.Text = "";

        lb_ShowMessage.Text = "消息提示：无";
        lb_ShowMessage.ForeColor = System.Drawing.Color.Red;

        lb_ShowConfirmMessage.Text = "消息提示：无";
        lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;

        lb_ShowMoneyMessage.Text = "消息提示：无";
        lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
    }

    private void ClearInputText2()
    {
        TB_ID.Text = "";
        TB_WorkNumConfirm.Text = "";
        TB_WorkNumMoney.Text = "";

        lb_ShowConfirmMessage.Text = "消息提示：无";
        lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;

        lb_ShowMoneyMessage.Text = "消息提示：无";
        lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
    }

    private void ClearInputText3()
    {
        TB_ID.Text = "";
        TB_WorkNumMoney.Text = "";

        lb_ShowMoneyMessage.Text = "消息提示：无";
        lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
    }

    protected void gvWorkDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    protected void gvWorkConfirm_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearInputText2();

            TB_ID.Text = gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text;
            TB_ItemName.Text = ItemName;
            TB_ItemContent.Text = ItemContent;
            DDL_YearListConfirm.SelectedValue = gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[4].Text;
            DDL_MonthListConfirm.SelectedValue = gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[5].Text;
            TB_WorkNumConfirm.Text = gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[6].Text;

            int confirmID = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
            InitDataListMoney(itemno, confirmID,iid);
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "消息提示：操作失败！" + exp.Message;
        }
    }

    protected void gvWorkConfirm_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (gvWorkConfirm.Rows.Count <= 0)
            return;

        gvWorkConfirm.PageIndex = e.NewPageIndex;
        gvWorkConfirm.SelectedIndex = -1;
        int confirmID = Convert.ToInt32( gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);

        InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, 0);
    }

    protected void gvWorkConfirm_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    protected void BT_SaveWorkConfirm_Click(object sender, EventArgs e)
    {
        if (TB_WorkNumConfirm.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumConfirm.Text))
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：请正确输入工作确认记录再试！";
            return;
        }
        //判断目前输入的工作量是否在实际工作的工作量范围
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        double maxHasInputWorkNum = getHasInputDetailsWorkNum(gvWorkConfirm, 6, 1);
        //(0, confirmId);
        double currentInputWorkNum = Convert.ToDouble(TB_WorkNumConfirm.Text);
        double workNumConfirm = Convert.ToDouble(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[7].Text);
        double theRestWorkNum = 0;
        if (RCJShareClass.Equals(workNumConfirm, maxHasInputWorkNum) == false)
        {
            theRestWorkNum = workNumConfirm - maxHasInputWorkNum;
        }

        if (RCJShareClass.FloatGT(currentInputWorkNum , theRestWorkNum))
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = string.Format("消息提示：请正确输入工作确认记录再试！目前最多可确认的工作量为：{0:f4}", theRestWorkNum);
            return;
        }

        try
        {
            if (false == SaveDataConfirmList(0, 0, confirmId))
                return;

            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowConfirmMessage.Text = "消息提示：新增工作确认记录成功！";

            InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, gvWorkConfirm.Rows.Count);

        }
        catch (Exception exp)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：新增工作确认记录失败！" + exp.Message;
        }
    }

    protected void BT_EditWorkConfirm_Click(object sender, EventArgs e)
    {
        if (gvWorkConfirm.SelectedIndex == -1)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：请选择需要修改的工作确认记录再试！";
            return;
        }

        if (TB_WorkNumConfirm.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumConfirm.Text))
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：请正确输入工作确认记录再试！";
            return;
        }

        //判断目前输入的工作量是否在实际工作的工作量范围
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        int si = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
        double maxHasInputWorkNum = getHasInputDetailsWorkNum(gvWorkConfirm, 6, si);
        double currentInputWorkNum = Convert.ToDouble(TB_WorkNumConfirm.Text);
        double workNumConfirm = Convert.ToDouble(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[7].Text);
        double theRestWorkNum = 0;
        if (RCJShareClass.Equals(workNumConfirm, maxHasInputWorkNum) == false)
        {
            theRestWorkNum = workNumConfirm - maxHasInputWorkNum;
        }

        if (RCJShareClass.FloatGT(currentInputWorkNum , theRestWorkNum))
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = string.Format("消息提示：请正确输入工作确认记录再试！目前最多可确认的工作量为：{0:f4}", theRestWorkNum);
            return;
        }

        try
        {
            if (false == SaveDataConfirmList(1, Convert.ToInt32(TB_ID.Text),confirmId))
                return;

            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowConfirmMessage.Text = "消息提示：修改工作确认记录成功！";

            InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, gvWorkConfirm.SelectedIndex);
        }
        catch (Exception exp)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：修改工作确认记录失败！" + exp.Message;
        }
    }
    protected void BT_DelWorkConfirm_Click(object sender, EventArgs e)
    {
        if (gvWorkConfirm.SelectedIndex == -1)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：请选择一行进行删除操作！";
            return;
        }

        try
        {
            int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            SaveDataConfirmList(2, Convert.ToInt32(TB_ID.Text), confirmId);

            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowConfirmMessage.Text = "消息提示：删除工作确认记录成功！";

            InitAllDataList(sender, e , 0,0);

        }
        catch (Exception exp)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：删除工作确认记录失败！" + exp.Message;
        }
    }

    private bool SaveDataConfirmList(int bAdd, int selectId, int confirmID)
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_WorkConfirmOperation ");
            sql.Append(selectId.ToString());
            sql.Append(",");
            sql.Append(bAdd.ToString());
            sql.Append(",");
            sql.Append(confirmID.ToString());
            sql.Append(",");
            sql.Append(ProjectId.ToString());
            sql.Append(",");
            sql.Append(DDL_PerformanceType.SelectedValue);
            sql.Append(",");
            sql.Append(itemno.ToString());
            sql.Append(",");
            sql.Append(AdjustId.ToString());
            sql.Append(",");
            sql.Append(DDL_YearListConfirm.Text);
            sql.Append(",");
            sql.Append(DDL_MonthListConfirm.Text);
            sql.Append(",");
            sql.Append(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[7].Text); 
            sql.Append(",");
            sql.Append(TB_WorkNumConfirm.Text);
            sql.Append(",'");
            sql.Append(UserCode);
            sql.Append("','");
            sql.Append(DateTime.Now.ToString());
            sql.Append("'");

            ShareClass.RunSqlCommand(sql.ToString());

        }
        catch (Exception exp)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "消息提示：" + exp.Message;
            return false;
        }

        return true;
    }

    protected void gvWorkDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (gvWorkDetails.Rows.Count <= 0)
            return;
        gvWorkDetails.PageIndex = e.NewPageIndex;
        gvWorkDetails.SelectedIndex = -1;

        InitAllDataList(sender, e,0,0);
    }

    private void InitDataListMoney(int itemno, int confirmID,int iid)
    {
        StringBuilder sql = new StringBuilder(" select * from V_RCJProjectWorkMoney where ProjectID =");
        sql.Append(ProjectId.ToString());
        sql.Append(" and itemtype=");
        sql.Append(DDL_PerformanceType.SelectedValue);
        sql.Append(" and itemno=");
        sql.Append(itemno.ToString());
        sql.Append(" and WorkConfirmID=");
        sql.Append(confirmID.ToString());
        sql.Append(" and ApproveID=");
        sql.Append(iid.ToString());

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectWorkMoney");

        gvMoneyConfirm.DataSource = ds;
        gvMoneyConfirm.DataBind();

        gvMoneyConfirm.SelectedIndex = 0;
    }

    private bool SaveDataMoneyList(int bAdd, int selectId, int confirmID, int idd, string demo)
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_WorkMoneyOperation ");
            sql.Append(selectId.ToString());
            sql.Append(",");
            sql.Append(bAdd.ToString());
            sql.Append(",");
            sql.Append(confirmID.ToString());
            sql.Append(",");
            sql.Append(ProjectId.ToString());
            sql.Append(",");
            sql.Append(DDL_PerformanceType.SelectedValue);
            sql.Append(",");
            sql.Append(itemno.ToString());
            sql.Append(",");
            sql.Append(DDL_YearListMoney.Text);
            sql.Append(",");
            sql.Append(DDL_MonthListMoney.Text);
            sql.Append(",");
            sql.Append(TB_WorkNumMoney.Text);
            sql.Append(",");
            sql.Append(idd); //TODO:此处为Confirm对应的ID，不是confirmID
            sql.Append(",");
            sql.Append(AdjustId.ToString());
            sql.Append(",'");
            sql.Append(UserCode);
            sql.Append("','");
            sql.Append(DateTime.Now.ToString());
            sql.Append("','");
            sql.Append(demo);
            sql.Append("'");

            ShareClass.RunSqlCommand(sql.ToString());

        }
        catch (Exception exp)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：" + exp.Message;
            return false;
        }

        return true;
    }

    protected void BT_SaveWorkMoney_Click(object sender, EventArgs e)
    {
        if (TB_WorkNumMoney.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumMoney.Text))
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：请正确输入收款确认记录再试！";
            return;
        }
        //判断目前输入的收款额是否在实际工作的范围
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        double hasInputMoney = getHasInputDetailsWorkNum(gvMoneyConfirm, 6, 0);
        double currentInputMoney = Convert.ToDouble(TB_WorkNumMoney.Text);
        double workNum = Convert.ToDouble(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[6].Text);
        double totalMoney = Convert.ToDouble(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[14].Text);
        double theRestMoney = 0;
        if(RCJShareClass.Equals(totalMoney,hasInputMoney) == false)
            theRestMoney = totalMoney - hasInputMoney;

        if (RCJShareClass.FloatGT(currentInputMoney , theRestMoney))
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = string.Format("消息提示：请正确输入收款额再试！目前最多可确认的收款额为：{0}", theRestMoney);
            return;
        }

        try
        {
            int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
            if (false == SaveDataMoneyList(0, 0, confirmId, iid,"增加收款确认记录"))
                return;

            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMoneyMessage.Text = "消息提示：新增收款确认记录成功！";

            InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, gvWorkConfirm.SelectedIndex);
        }
        catch (Exception exp)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：新增收款确认记录失败！" + exp.Message;
        }
    }
    protected void BT_EditWorkMoney_Click(object sender, EventArgs e)
    {
        if (gvMoneyConfirm.SelectedIndex == -1)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：请选择需要修改的收款确认记录再试！";
            return;
        }

        if (TB_WorkNumMoney.Text.Trim().Length == 0 || false == ShareClass.CheckIsNumber(TB_WorkNumMoney.Text))
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：请正确输入收款确认记录再试！";
            return;
        }
        //判断目前输入的工作量是否在实际工作的工作量范围
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        int si = Convert.ToInt32(gvMoneyConfirm.Rows[gvMoneyConfirm.SelectedIndex].Cells[1].Text);
        double hasInputMoney = getHasInputDetailsWorkNum(gvMoneyConfirm, 6, si);
        double currentInputMoney = Convert.ToDouble(TB_WorkNumMoney.Text);
        double workNum = Convert.ToDouble(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[6].Text);
        double totalMoney = Convert.ToDouble(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[14].Text);
        double theRestMoney = 0;
        if (RCJShareClass.Equals(totalMoney, hasInputMoney) == false)
            theRestMoney = totalMoney - hasInputMoney;

        if (RCJShareClass.FloatGT(currentInputMoney, theRestMoney))
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = string.Format("消息提示：请正确输入工作确认记录再试！目前最多可确认的收款额为：{0}", theRestMoney);
            return;
        }

        try
        {
            int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
            if (false == SaveDataMoneyList(1, Convert.ToInt32(TB_ID.Text), confirmId,iid, "修改收款确认记录"))
                return;

            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMoneyMessage.Text = "消息提示：修改收款确认记录成功！";

            InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, gvWorkConfirm.SelectedIndex);
        }
        catch (Exception exp)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：修改收款确认记录失败！" + exp.Message;
        }
    }
    protected void BT_DelWorkMoney_Click(object sender, EventArgs e)
    {
        if (gvMoneyConfirm.SelectedIndex == -1)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：请选择一行进行删除操作！";
            return;
        }

        try
        {
            int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);
            int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
            if (false == SaveDataMoneyList(2, Convert.ToInt32(TB_ID.Text), confirmId,iid, "删除收款确认记录"))
                return;

            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Green;
            lb_ShowMoneyMessage.Text = "消息提示：删除收款确认记录成功！";

            InitAllDataList(sender, e, 0 ,0);
        }
        catch (Exception exp)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：删除收款确认记录失败！" + exp.Message;
        }
    }

    protected void gvMoneyConfirm_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearInputText3();

            TB_ID.Text = gvMoneyConfirm.Rows[gvMoneyConfirm.SelectedIndex].Cells[1].Text;
            DDL_YearListMoney.SelectedValue = gvMoneyConfirm.Rows[gvMoneyConfirm.SelectedIndex].Cells[4].Text;
            DDL_MonthListMoney.SelectedValue = gvMoneyConfirm.Rows[gvMoneyConfirm.SelectedIndex].Cells[5].Text;
            TB_WorkNumMoney.Text = Convert.ToDouble( gvMoneyConfirm.Rows[gvMoneyConfirm.SelectedIndex].Cells[6].Text ).ToString();
        }
        catch (Exception exp)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "消息提示：操作失败！" + exp.Message;
        }
    }

    protected void gvMoneyConfirm_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (gvMoneyConfirm.Rows.Count <= 0)
            return;
        gvMoneyConfirm.PageIndex = e.NewPageIndex;
        gvMoneyConfirm.SelectedIndex = -1;
        int confirmId = Convert.ToInt32(gvWorkDetails.Rows[gvWorkDetails.SelectedIndex].Cells[2].Text);
        int iid = Convert.ToInt32(gvWorkConfirm.Rows[gvWorkConfirm.SelectedIndex].Cells[1].Text);

        InitAllDataList(sender, e, gvWorkDetails.SelectedIndex, gvWorkConfirm.SelectedIndex);
    }


    protected void gvMoneyConfirm_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }

    protected void LB_QueryWorkMoneyLog_Click(object sender, EventArgs e)
    {
        if (gvWorkConfirm.SelectedIndex < 0)
        {
            lb_ShowMoneyMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMoneyMessage.Text = "为选择对应的确认工作量再试。";
            return;
        }

        StringBuilder sb = new StringBuilder("TTRCJProjectWorkMoney.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        sb.Append("&itemtype=");
        sb.Append(DDL_PerformanceType.SelectedValue);
        sb.Append("&itemno=");
        sb.Append(itemno);
        sb.Append("&adjustid=");
        sb.Append(AdjustId);

        Response.Redirect(sb.ToString());
    }
    protected void LB_WorkConfirmLog_Click(object sender, EventArgs e)
    {
        if (gvWorkDetails.SelectedIndex < 0)
        {
            lb_ShowConfirmMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowConfirmMessage.Text = "为选择对应的确认工作量再试。";
            return;
        } 
        
        StringBuilder sb = new StringBuilder("TTRCJProjectWorkConfirm.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        sb.Append("&itemtype=");
        sb.Append(DDL_PerformanceType.SelectedValue);
        sb.Append("&itemno=");
        sb.Append(itemno);
        sb.Append("&adjustid=");
        sb.Append(AdjustId);

        Response.Redirect(sb.ToString());
    }
    protected void LB_WorkDetailsLog_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder("TTRCJProjectWorkDetailsLog.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        sb.Append("&itemtype=");
        sb.Append(DDL_PerformanceType.SelectedValue);
        sb.Append("&itemno=");
        sb.Append(itemno);
        sb.Append("&adjustid=");
        sb.Append(AdjustId);

        Response.Redirect(sb.ToString());
    }
    protected void DDL_YearList_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetAllMonthsList(ProjectId, DDL_PerformanceType.SelectedValue, itemno, DDL_YearList.SelectedValue);
    }
}
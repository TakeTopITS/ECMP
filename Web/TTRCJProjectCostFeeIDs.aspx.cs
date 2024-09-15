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

public partial class TTRCJProjectCostFeeIDs : System.Web.UI.Page
{
    private string UserCode = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        UserCode = Convert.ToString(Session["UserCode"]);

        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();

            //大类排序初始化
            ViewState["SortOrder"] = "ID";
            ViewState["OrderDire"] = "ASC";

            ViewState["SortOrderSub"] = "ID";
            ViewState["OrderDireSub"] = "ASC";

            try
            {
                InitDataListForIDs();

                lb_ShowMessageID.Text = "";
                lb_ShowMessageSubID.Text = "";

            }
            catch (Exception exp)
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageID.Text = "消息提示：读取成本费项大类信息列表失败！" + exp.Message;
            }
        }
    }

    private void InitDataListForIDs()
    {
        //获取成本费项大类的信息列表 
        StringBuilder sql = new StringBuilder(" select * from T_RCJProjectCostFeeIDs");

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostFeeIDs");

        //通过自定义视图来实现排序  
        DataView view = new DataView(ds.Tables[0]);
        string strSort = (string)ViewState["SortOrder"] + " " + (string)ViewState["OrderDire"];
        view.Sort = strSort;  

        GV_CostFeeID.DataSource = view;
        GV_CostFeeID.DataBind();
    }

    private void InitDataListForSubIDs()
    {
        if (GV_CostFeeID.SelectedIndex == -1)
            return;
        //获取成本费项大类的信息列表 
        StringBuilder sql = new StringBuilder("select * From T_RCJProjectCostFeeSubIDs as rCJProjectCostFeeSubIDs where CostFeeID=");
        sql.Append(GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[0].Text);

        DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostFeeSubIDs");

        //通过自定义视图来实现排序  
        DataView view = new DataView(ds.Tables[0]);
        string strSort = (string)ViewState["SortOrderSub"] + " " + (string)ViewState["OrderDireSub"];
        view.Sort = strSort;

        GV_CostFeeSubID.DataSource = view;
        GV_CostFeeSubID.DataBind();
    }

    protected void GV_CostFeeID_SelectedIndexChanged(object sender, EventArgs e)
    {
        lb_ShowMessageID.Text = "";

        tbID.Text = GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[0].Text;
        tbTitle.Text = GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[1].Text;
        Label lbl1 = (Label)GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].FindControl("Label1");
        if ("直接费项项目" == lbl1.Text)
            DDL_FeeType.SelectedIndex = 0;
        else
            DDL_FeeType.SelectedIndex = 1;

        //显示此大类下面的子类费项列表
        TB_FeeType.Text = GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[1].Text;
        InitDataListForSubIDs();
    }

    private bool IsInputOk()
    {
        if (tbTitle.Text.Trim().Length == 0 || tbTitle.Text.Trim().Length > 50)
        {
            lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageID.Text = "消息提示：[中文标题]不能为空，应在50个字符（25个汉字）,请重新输入再试！";
            return false;
        }

        return true;
    }

    //增加费项大类数据
    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        lb_ShowMessageID.Text = "";

        if (IsInputOk() == false)
            return;

        try
        {
            if (true == IsExistSameItem(0, tbTitle.Text, true))
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                StringBuilder sb = new StringBuilder("消息提示：新增操作失败，成本费项名【");
                sb.Append(tbTitle.Text);
                sb.Append("】已经存在，不能重复添加！");
                lb_ShowMessageID.Text = sb.ToString() ;
                return;
            } 

            RCJProjectCostFeeIDsBLL cfiBll = new RCJProjectCostFeeIDsBLL();
            RCJProjectCostFeeIDs cfi = new RCJProjectCostFeeIDs();
            cfi.FeeType = Convert.ToInt32( DDL_FeeType.SelectedValue );
            cfi.Title = tbTitle.Text;

            cfiBll.AddRCJProjectCostFeeIDs(cfi);

            lb_ShowMessageID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageID.Text = "消息提示：新增操作成功！";

            InitDataListForIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageID.Text = "消息提示：新增操作失败，请检查成本费项大类编号是否重复：" + exp.Message;
        }
    }

    //修改费项大类数据
    protected void btnEditItem_Click(object sender, EventArgs e)
    {
        lb_ShowMessageID.Text = "";

        if (IsInputOk() == false)
            return; 
        
        try
        {
            if (GV_CostFeeID.SelectedIndex == -1)
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageID.Text = "消息提示：请选择一行进行修改操作！";
                return;
            }

            if (true == IsExistSameItem(Convert.ToInt32(tbID.Text), tbTitle.Text, false))
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                StringBuilder sb = new StringBuilder("消息提示：修改操作失败，要修改的成本费项名【");
                sb.Append(tbTitle.Text);
                sb.Append("】已经存在，不能重复添加！");
                lb_ShowMessageID.Text = sb.ToString();
                return;
            } 
            
            RCJProjectCostFeeIDsBLL cfiBll = new RCJProjectCostFeeIDsBLL();
            RCJProjectCostFeeIDs cfi = new RCJProjectCostFeeIDs();
            cfi.ID = Convert.ToInt32(tbID.Text);
            cfi.FeeType = Convert.ToInt32(DDL_FeeType.SelectedValue); ;
            cfi.Title = tbTitle.Text;

            cfiBll.UpdateRCJProjectCostFeeIDs(cfi,cfi.ID);

            lb_ShowMessageID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageID.Text = "消息提示：修改操作成功！";

            InitDataListForIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageID.Text = "消息提示：修改操作失败，请检查成本费项大类编号是否重复：" + exp.Message;
        }       
    }

    private bool IfExistsSubIds()
    {
        //获取成本费项大类的信息列表 
        StringBuilder sql = new StringBuilder("From RCJProjectCostFeeSubIDs as rCJProjectCostFeeSubIDs where CostFeeID=");
        sql.Append(GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[0].Text);

        RCJProjectCostFeeSubIDsBLL cfsBll = new RCJProjectCostFeeSubIDsBLL();
        IList list;
        list = cfsBll.GetAllRCJProjectCostFeeSubIDs(sql.ToString());

        return list.Count > 0;
    }
    //删除费项大类数据
    protected void btnDeleteItem_Click(object sender, EventArgs e)
    {
        lb_ShowMessageID.Text = "";
        try
        {
            if (GV_CostFeeID.SelectedIndex == -1)
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageID.Text = "消息提示：请选择一行进行删除操作！";
                return;
            }

            //如果有子类费项则不可以删除
            if(IfExistsSubIds() == true)
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageID.Text = "消息提示：请先删除该成本费项下的子类项目后再进行删除操作！";
                return;
            }

            //正式删除数据 
            RCJProjectCostFeeIDsBLL cfiBll = new RCJProjectCostFeeIDsBLL();
            RCJProjectCostFeeIDs cfi = new RCJProjectCostFeeIDs();
            cfi.ID = Convert.ToInt32(GV_CostFeeID.Rows[GV_CostFeeID.SelectedIndex].Cells[0].Text);

            cfiBll.DeleteRCJProjectCostFeeIDs(cfi);

            lb_ShowMessageID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageID.Text = "消息提示：删除操作成功！";

            InitDataListForIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageID.Text = "消息提示：删除操作失败：" + exp.Message;
        }

    }
    protected void GV_CostFeeID_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_CostFeeID.PageIndex = e.NewPageIndex;
        GV_CostFeeID.SelectedIndex = -1;
        InitDataListForIDs();
    }


    protected void GV_CostFeeSubID_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_CostFeeSubID.PageIndex = e.NewPageIndex;
        InitDataListForSubIDs();
    }

    protected void GV_CostFeeSubID_SelectedIndexChanged(object sender, EventArgs e)
    {
        lb_ShowMessageSubID.Text = "";

        TB_SubID.Text = GV_CostFeeSubID.Rows[GV_CostFeeSubID.SelectedIndex].Cells[0].Text;
        TB_FeeType.Text = GV_CostFeeSubID.Rows[GV_CostFeeSubID.SelectedIndex].Cells[1].Text;
        TB_SubFeeTitle.Text = GV_CostFeeSubID.Rows[GV_CostFeeSubID.SelectedIndex].Cells[2].Text;
        Label lbl1 = (Label)GV_CostFeeSubID.Rows[GV_CostFeeSubID.SelectedIndex].FindControl("Label1");
        if ("否" == lbl1.Text)
            DDL_IsFixed.SelectedIndex = 1;
        else
            DDL_IsFixed.SelectedIndex = 0;
    }

    private bool IsInputOkSub()
    {
        if (TB_SubFeeTitle.Text.Trim().Length == 0 || tbTitle.Text.Trim().Length > 50)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：[中文标题]不能为空，应在50个字符（25个汉字），请重新输入再试！";
            return false;
        }

        return true;
    }

    //增加子类费项
    protected void BT_AddNewSubFee_Click(object sender, EventArgs e)
    {
        lb_ShowMessageSubID.Text = "";

        if (IsInputOkSub() == false)
            return;

        if (GV_CostFeeID.SelectedIndex == -1)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：请选择一行大类费项再进行修改操作！";
            return;
        }

        try
        {
            if (true == IsExistSameSubItem(0, TB_SubFeeTitle.Text, true))
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                StringBuilder sb = new StringBuilder("消息提示：新增操作失败，要新增的成本费子项名【");
                sb.Append(TB_SubFeeTitle.Text);
                sb.Append("】已经存在，不能重复添加！");
                lb_ShowMessageSubID.Text = sb.ToString();
                return;
            } 

            RCJProjectCostFeeSubIDsBLL cfsiBll = new RCJProjectCostFeeSubIDsBLL();
            RCJProjectCostFeeSubIDs cfsi = new RCJProjectCostFeeSubIDs();
            cfsi.IsFixed = Convert.ToInt32(DDL_IsFixed.SelectedValue);
            cfsi.CostFeeID = Convert.ToInt32(tbID.Text);
            cfsi.SubTitle = TB_SubFeeTitle.Text;

            cfsiBll.AddRCJProjectCostFeeSubIDs(cfsi);

            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageSubID.Text = "消息提示：新增操作成功！";

            InitDataListForSubIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：新增操作失败，请检查成本费项子类编号是否重复：" + exp.Message;
        }
    }

    //修改费用子项
    protected void BT_EditSubFee_Click(object sender, EventArgs e)
    {
        lb_ShowMessageSubID.Text = "";

        if (IsInputOkSub() == false)
            return;

        try
        {
            if (GV_CostFeeSubID.SelectedIndex == -1)
            {
                lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageSubID.Text = "消息提示：请选择一行进行修改操作！";
                return;
            }

            if (true == IsExistSameSubItem(Convert.ToInt32(TB_SubID.Text) , TB_SubFeeTitle.Text, false))
            {
                lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
                StringBuilder sb = new StringBuilder("消息提示：修改操作失败，要修改的成本费子项名【");
                sb.Append(TB_SubFeeTitle.Text);
                sb.Append("】已经存在，不能重复添加！");
                lb_ShowMessageSubID.Text = sb.ToString();
                return;
            }

            RCJProjectCostFeeSubIDsBLL cfsiBll = new RCJProjectCostFeeSubIDsBLL();
            RCJProjectCostFeeSubIDs cfsi = new RCJProjectCostFeeSubIDs();
            cfsi.ID = Convert.ToInt32(TB_SubID.Text);
            cfsi.IsFixed = Convert.ToInt32(DDL_IsFixed.SelectedValue);
            cfsi.CostFeeID = Convert.ToInt32(tbID.Text);
            cfsi.SubTitle = TB_SubFeeTitle.Text;

            cfsiBll.UpdateRCJProjectCostFeeSubIDs(cfsi, cfsi.ID);

            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageSubID.Text = "消息提示：修改操作成功！";

            InitDataListForSubIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：修改操作失败，请检查成本费项大类编号是否重复：" + exp.Message;
        } 
    }

    //删除费用子项
    protected void BT_DelSubFee_Click(object sender, EventArgs e)
    {
        lb_ShowMessageSubID.Text = "";
        try
        {
            if (GV_CostFeeSubID.SelectedIndex == -1)
            {
                lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageSubID.Text = "消息提示：请选择一行进行删除操作！";
                return;
            }

            //如果是固定子类费项则不可以删除
            Label lbl1 = (Label)GV_CostFeeSubID.Rows[GV_CostFeeSubID.SelectedIndex].FindControl("Label1");
            if ("是" == lbl1.Text)
            {
                lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
                lb_ShowMessageSubID.Text = "消息提示：固定子类费项不可以进行删除操作！";
                return;
            }

            //正式删除数据 
            RCJProjectCostFeeSubIDsBLL cfsiBll = new RCJProjectCostFeeSubIDsBLL();
            RCJProjectCostFeeSubIDs cfsi = new RCJProjectCostFeeSubIDs();
            cfsi.ID = Convert.ToInt32(TB_SubID.Text);

            cfsiBll.DeleteRCJProjectCostFeeSubIDs(cfsi);

            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessageSubID.Text = "消息提示：删除操作成功！";

            InitDataListForSubIDs();
        }
        catch (Exception exp)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：删除操作失败：" + exp.Message;
        }

    }

    //输入的费项名称是否存在
    private bool IsExistSameItem(int id, string itemName, bool bAdd)
    {
        try
        {
            //获取成本费项大类的信息列表 
            StringBuilder sql = new StringBuilder("From RCJProjectCostFeeIDs as rCJProjectCostFeeIDs where title='");
            sql.Append(itemName);
            sql.Append("'");
            if (bAdd == false) //是修改的话，还要判断是否id
            {
                sql.Append(" and ID !=");
                sql.Append(id.ToString());
            }

            RCJProjectCostFeeIDsBLL cfiBll = new RCJProjectCostFeeIDsBLL();
            IList list;
            list = cfiBll.GetAllRCJProjectCostFeeIDs(sql.ToString());

            if (list.Count > 0)
                return true;
        }
        catch (Exception exp)
        {
            lb_ShowMessageID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageID.Text = "消息提示：查询操作失败：" + exp.Message;

            return true;
        }
        return false;
    }

    //输入的子费项名称是否存在
    private bool IsExistSameSubItem(int id , string itemName , bool bAdd)
    {
        try
        {
            //获取成本费项大类的信息列表 
            StringBuilder sql = new StringBuilder("From RCJProjectCostFeeSubIDs as rCJProjectCostFeeSubIDs where subtitle='");
            sql.Append(itemName);
            sql.Append("'");
            if (bAdd == false) //是修改的话，还要判断是否id
            {
                sql.Append(" and ID !=");
                sql.Append(id.ToString());
            }

            RCJProjectCostFeeSubIDsBLL cfsiBll = new RCJProjectCostFeeSubIDsBLL();
            IList list;
            list = cfsiBll.GetAllRCJProjectCostFeeSubIDs(sql.ToString());

            if (list.Count > 0)
                return true;
        }
        catch (Exception exp)
        {
            lb_ShowMessageSubID.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessageSubID.Text = "消息提示：查询操作失败：" + exp.Message;

            return true;
        }
        return false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(ViewState["UrlReferrer"].ToString());
    }

    protected void GV_CostFeeID_Sorting(object sender, GridViewSortEventArgs e)
    {
        string strPage = e.SortExpression;

        if (ViewState["SortOrder"].ToString() == strPage)
        {
            if (ViewState["OrderDire"].ToString() == "Desc")
                ViewState["OrderDire"] = "ASC";
            else
                ViewState["OrderDire"] = "Desc";
        }
        else
        {
            ViewState["SortOrder"] = e.SortExpression;
        }

        InitDataListForIDs();
    }
    protected void GV_CostFeeSubID_Sorting(object sender, GridViewSortEventArgs e)
    {
        string strPage = e.SortExpression;

        if (ViewState["SortOrderSub"].ToString() == strPage)
        {
            if (ViewState["OrderDireSub"].ToString() == "Desc")
                ViewState["OrderDireSub"] = "ASC";
            else
                ViewState["OrderDireSub"] = "Desc";
        }
        else
        {
            ViewState["SortOrderSub"] = e.SortExpression;
        }

        InitDataListForSubIDs();
    }
    protected void GV_CostFeeID_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }
    protected void GV_CostFeeSubID_RowDataBound(object sender, GridViewRowEventArgs e)
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
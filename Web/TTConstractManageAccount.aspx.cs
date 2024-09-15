using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;

public partial class TTConstractManageAccount : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        try
        {
            if (!IsPostBack)
            {
                //加载状态
                LoadAllConstractStatus();
                //加载类型
                LoadAllConstractype();

				//生成合同树
				string strUserCode = Session["UserCode"].ToString();
				//string strUserCode = "C7094";
				InitialConstractTreeByAuthority(TreeView4, strUserCode);

				GetContractData();
            }
        }
        catch
        {
        }        
	}

    protected void LoadAllConstractype()
    {
        try
        {
            string sql = @"select distinct trim(type)  as type from t_constract";
            DataSet ds = ShareClass.GetDataSetFromSql(sql, "T_Constract");

            DDL_Constractype.DataSource = ds;
            DDL_Constractype.DataBind();
            DDL_Constractype.Items.Insert(0, new ListItem(" -- select -- ", " "));
            DDL_Constractype.SelectedIndex = 0;
        }
        catch
        {
        }
    }

    protected void LoadAllConstractStatus()
    {
        try
        {
            string sql = @"select distinct trim(status)  as status from t_constract";
            DataSet ds = ShareClass.GetDataSetFromSql(sql, "T_Constract");

            DDL_ConstractStatus.DataSource = ds;
            DDL_ConstractStatus.DataBind();

            if (DDL_ConstractStatus.Items.Count > 0)
            {
                DDL_ConstractStatus.ClearSelection();
                DDL_ConstractStatus.Items.FindByText("执行中").Selected = true;
            }
        }
        catch
        {
        }
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strConstractCode, strConstractName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        strConstractCode = treeNode.Target.Trim();
        strConstractName = GetConstractName(strConstractCode);

        if (strConstractCode == "")
        {
            strConstractName = "";
        }

        TB_ConstractCode.Text = strConstractCode;
        TB_ConstractName.Text = strConstractName;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected bool GetContractData(string id = "", string name = "", string type = "", string code="", string status="", string sign="")
	{
        try
        {
            StringBuilder sql = new StringBuilder( @"select 
            t_constract.constractid,
            t_constract.status,
            t_constract.constractclass,
            t_constract.type,
            t_constract.constractcode,
            t_constract.partyconstractcode,
            t_constract.constractname,
            t_constract.projectbasis,
            t_constract.Amount,
            t_constract.taxrate,
            t_constract.aftertaxtotalamount,
            t_constract.provisionalamount,
            t_constract.part1,
            t_constract.signdate,
            t_constract.signname,
            t_constract.startdate,
            t_constract.enddate,
            T_Project.BeginDate, 
            T_Project.EndDate as proenddate,
            t_constract.startdate - t_constract.enddate as duration,
            t_constract.warranty,
            CASE WHEN t_constract.type like '%收入%' THEN (case when (select sum(T_ConstractReceivables.ReceivablesAccount) from T_ConstractReceivables where T_ConstractReceivables.ConstractCode=t_constract.constractcode)=0 
            then 0 else  (select T_ConstractReceivables.ReceiverAccount / T_ConstractReceivables.ReceivablesAccount from T_ConstractReceivables where T_ConstractReceivables.ConstractCode=t_constract.constractcode) end) 
            WHEN t_constract.type like '%支出%' THEN (case when (select sum(T_ConstractPayable.PayableAccount) from T_ConstractPayable,T_ConstractPayableRecord 
            where T_ConstractPayableRecord.PayableID=T_ConstractPayable.ID and T_ConstractPayableRecord.ConstractCode=t_constract.constractcode)=0 then 0 
            else (select T_ConstractPayableRecord.OutOfPocketAccount / T_ConstractPayable.PayableAccount from T_ConstractPayable,T_ConstractPayableRecord 
            where T_ConstractPayableRecord.PayableID=T_ConstractPayable.ID and T_ConstractPayableRecord.ConstractCode=t_constract.constractcode) end) END AS prepaypercent,
            0 as monthpaypercent,
            0 as finishpaypercent,
            0 as settlepaypercent,
            0 as realprogress,
            0 as realpvalue,
            0 as sumrecieve,
            0 as sumpayment,
            0 as settleaccount,
            t_constract.departname,
            0 as operator,
            T_Project.pmname,
            ' ' as memo 
            FROM T_ConstractRelatedProject 
            INNER JOIN T_Project ON T_ConstractRelatedProject.ProjectID = T_Project.ProjectID 
            INNER JOIN T_Constract ON T_ConstractRelatedProject.ConstractCode = T_Constract.ConstractCode where 1=1 ");

            if (id.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.constractcode = '%{0}%'", id));
            }

            if (name.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.constractname like '%{0}%'", name));
            }

            if (type.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.type = '{0}'", type));
            }

            if (code.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.constractcode = '{0}'", code));
            }

            if(status.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.status = '{0}'", status));
            }

            if(sign.Trim().Length > 0)
            {
                sql.Append(string.Format(" and t_constract.signdate = '{0}'", sign));
            }

            DataSet dsData = ShareClass.GetDataSetFromSql(sql.ToString(), "T_Constract");

            EmptyGridview.gridViewDataBaind(gvContractData, dsData.Tables[0]);

        }
        catch(Exception exp)
        {
            return false;
        }

        return true;
    }

	protected void BTN_Query_Click(object sender, EventArgs e)
	{
        GetContractData(TB_ConstractID.Text , TB_ConstractName.Text , DDL_Constractype.SelectedValue , TB_ConstractCode.Text , DDL_ConstractStatus.SelectedValue , DLC_signdate.Text);
    }

    //定义合同树（根据权限）
    public void InitialConstractTreeByAuthority(TreeView ConstractTreeView, string strUserCode)
    {
        string strHQL;
        IList lst;

        String strConstractCode, strConstractName;

        //添加根节点
        ConstractTreeView.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>" + Resources.lang.WoDeHeTong + "</B>";
        node1.Target = "";
        node1.Expanded = true;
        ConstractTreeView.Nodes.Add(node1);

        Constract constract = new Constract();

        strHQL = "from Constract as constract where ";
        strHQL += " constract.ParentCode = ''";
        strHQL += " and constract.Status not in ('归档','删除') ";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);


        for (int i = 0; i < lst.Count; i++)
        {
            constract = (Constract)lst[i];

            strConstractCode = constract.ConstractCode.Trim();
            strConstractName = constract.ConstractName.Trim();

            node3 = new TreeNode();

            node3.Text = strConstractCode + " " + strConstractName;
            node3.Target = strConstractCode;
            node3.Expanded = false;

            node1.ChildNodes.Add(node3);
            ConstractTreeShowByAuthority(strConstractCode, node3);
            ConstractTreeView.DataBind();
        }
    }

    public static void ConstractTreeShowByAuthority(string strParentCode, TreeNode treeNode)
    {
        string strHQL;
        IList lst1, lst2;

        String strConstractCode, strConstractName;

        ConstractBLL constractBLL = new ConstractBLL();
        Constract constract = new Constract();

        strHQL = "from Constract as constract where ";
        strHQL += " constract.ParentCode = " + "'" + strParentCode + "'";
        strHQL += " and constract.Status not in ('归档','删除') ";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        lst1 = constractBLL.GetAllConstracts(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            constract = (Constract)lst1[i];

            strConstractCode = constract.ConstractCode.Trim();
            strConstractName = constract.ConstractName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strConstractCode;
            node.Text = strConstractCode + " " + strConstractName;
            treeNode.ChildNodes.Add(node);
            node.Expanded = false;


            strHQL = "from Constract as constract where ";
            strHQL += " constract.ParentCode = " + "'" + strConstractCode + "'";
            strHQL += " and constract.Status not in ('归档','删除') ";
            strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";
            lst2 = constractBLL.GetAllConstracts(strHQL);

            if (lst2.Count > 0)
            {
                ConstractTreeShowByAuthority(strConstractCode, node);
            }
        }
    }

    public string GetConstractName(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Constract as constract Where constract.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractBLL constractBLL = new ConstractBLL();

        try
        {
            lst = constractBLL.GetAllConstracts(strHQL);
            Constract constract = (Constract)lst[0];
            return constract.ConstractName.Trim();
        }
        catch
        {
            return "";
        }
    }

}

public class EmptyGridview
{
    private static string emptyText = "没有查询到相应信息";

    public EmptyGridview()
    {
    }

    public static void resetGridview(GridView gridview)
    {
        if (gridview.Rows.Count == 1 && gridview.Rows[0].Cells[0].Text == emptyText)
        {
            int colcount = gridview.Columns.Count;
            gridview.Rows[0].Cells.Clear();
            gridview.Rows[0].Cells.Add(new TableCell());
            gridview.Rows[0].Cells[0].ColumnSpan = colcount;
            gridview.Rows[0].Cells[0].Text = emptyText;
            gridview.Rows[0].Cells[0].Style.Add("text-align", "center");
        }
    }

    public static void gridViewDataBaind(GridView gridview, DataTable table)
    {
        if (table.Rows.Count == 0)
        {
            table = table.Clone();
            table.Rows.Add(table.NewRow());
            gridview.DataSource = table;
            gridview.DataBind();
            int colcount = gridview.Columns.Count;
            gridview.Rows[0].Cells.Clear();
            gridview.Rows[0].Cells.Add(new TableCell());
            gridview.Rows[0].Cells[0].ColumnSpan = colcount;
            gridview.Rows[0].Cells[0].Text = emptyText;
            gridview.Rows[0].Cells[0].Style.Add("text-align", "center");
        }
        else
        {
            gridview.DataSource = table;
            gridview.DataBind();
        }

        gridview.SelectedIndex = -1;
    }
}
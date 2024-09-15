using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTProjectBudgetReport : System.Web.UI.Page
{
    string strProjectID, strProjectStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName, strProjectName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);
        strProjectStatus = ShareClass.GetProjectStatus(strProjectID);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadProjectBudget(strProjectID);

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            LB_ProjectID.Text = strProjectID;
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;

            LB_ReportName.Text = Resources.lang.Project + strProjectID + " " + ShareClass.GetProjectName(strProjectID);

            LoadProjectExpenseByAccount(strProjectID, "所有");
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strAccount = e.Item.Cells[0].Text.Trim();
            string strUserCode = LB_UserCode.Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LB_Account.Text = strAccount;

            if (e.CommandName == "Select")
            {
                LoadProjectExpenseByAccount(strProjectID, strAccount);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
            }
        }
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        LB_OperatorCode.Text = "所有";
        LB_OperatorName.Text = "";

        LB_Account.Text = "所有";

        LoadProjectExpenseByAccount(strProjectID, "所有");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);

    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode, strUserName;
        string strAccount;
        decimal deExpense = 0, deConfirmExpense = 0;

        strID = TreeView1.SelectedNode.Target.Trim();
        strAccount = LB_Account.Text.Trim();

        try
        {
            strID = int.Parse(strID).ToString();

            strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strID;
            ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
            lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();

                if (strAccount == "所有")
                {
                    strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'";
                    strHQL += " Order by proExpense.ID DESC";
                }
                else
                {
                    strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID + " and proExpense.UserCode = " + "'" + strUserCode + "'";
                    strHQL += " and proExpense.Account = " + "'" + strAccount + "'";
                    strHQL += " Order by proExpense.ID DESC";
                }
                ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
                lst = proExpenseBLL.GetAllProExpenses(strHQL);
                DataList1.DataSource = lst;
                DataList1.DataBind();

                ProExpense proExpense = new ProExpense();
                for (int i = 0; i < lst.Count; i++)
                {
                    proExpense = (ProExpense)lst[i];
                    deExpense += proExpense.Amount;
                }


                LB_Amount.Text = deExpense.ToString();
                LB_ConfirmAmount.Text = deConfirmExpense.ToString();

                LB_OperatorCode.Text = strUserCode;
                LB_OperatorName.Text = strUserName;

                LB_Sql.Text = strHQL;
            }
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popDetailWindow','true') ", true);
    }



    protected void LoadProjectBudget(string strProjectID)
    {
        string strHQL;
        IList lst;

        decimal deBudget = 0;

        strHQL = "From ProjectBudget as projectBudget Where projectBudget.ProjectID = " + strProjectID;
        ProjectBudgetBLL projectBudgetBLL = new ProjectBudgetBLL();
        lst = projectBudgetBLL.GetAllProjectBudgets(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        ProjectBudget projectBudget = new ProjectBudget();

        for (int i = 0; i < lst.Count; i++)
        {
            projectBudget = (ProjectBudget)lst[i];
            deBudget += projectBudget.Amount;
        }

        LB_RealBudget.Text = deBudget.ToString();

        LB_ProExpense.Text = GetProjectExpense(strProjectID);

        LB_ProjectBudget.Text = ShareClass.GetProject(strProjectID).Budget.ToString();

        FinishPercentPicture(strProjectID);
    }

    protected void LoadProjectExpenseByAccount(string strProjectID, string strAccount)
    {
        string strHQL;
        IList lst;

        decimal deExpense = 0, deConfirmExpense = 0;

        if (strAccount == "所有")
        {
            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID;
            strHQL += " Order by proExpense.ID DESC";
        }
        else
        {
            strHQL = "from ProExpense as proExpense where proExpense.ProjectID = " + strProjectID;
            strHQL += " and proExpense.Account = " + "'" + strAccount + "'";
            strHQL += " Order by proExpense.ID DESC";
        }

        ProExpenseBLL proExpenseBLL = new ProExpenseBLL();
        lst = proExpenseBLL.GetAllProExpenses(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProExpense proExpense = new ProExpense();
        for (int i = 0; i < lst.Count; i++)
        {
            proExpense = (ProExpense)lst[i];
            deExpense += proExpense.Amount;
            deConfirmExpense += proExpense.ConfirmAmount;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ConfirmAmount.Text = deConfirmExpense.ToString();

        LB_OperatorCode.Text = "所有";
        LB_OperatorName.Text = "";
    }

    protected void FinishPercentPicture(string strProjectID)
    {
        string strAccount;

        decimal deAccountExpense, deAccountBudget;
        decimal deWidth;

        int intWidth;
        int i;

        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            strAccount = DataGrid1.Items[i].Cells[0].Text.Trim();

            deAccountBudget = decimal.Parse(DataGrid1.Items[i].Cells[1].Text.Trim());
            deAccountExpense = GetProjectAccountTotalAmount(strProjectID, strAccount);

            if (deAccountBudget == 0)
            {
                deAccountBudget = 1;
            }

            deWidth = (deAccountExpense / deAccountBudget) * 100;
            deWidth = System.Decimal.Round(deWidth, 0);

            intWidth = int.Parse(deWidth.ToString());

            if (intWidth > 200)
            {
                intWidth = 200;
            }

            if (intWidth < deAccountExpense.ToString().Length)
            {
                if ((deAccountExpense.ToString().Length + 50) < 200)
                {
                    ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = (Unit)(deAccountExpense.ToString().Length + 50);
                }
                else
                {
                    ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = (Unit)200;
                }
            }
            else
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = (Unit)(intWidth + 50);
            }

            if(decimal.Parse (((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width.ToString().Replace("px","")) > 200)
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = (Unit)200;
            }

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text = deAccountExpense.ToString();

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_DefaultPercent")).Width = (Unit)110;

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_DefaultPercent")).Text = deAccountBudget.ToString();
        }
    }

    protected decimal GetProjectAccountTotalAmount(string strProjectID, string strAccount)
    {
        string strHQL;

        strHQL = "Select Sum(ConfirmAmount) From T_ProExpense Where ProjectID = " + strProjectID + " and Account = " + "'" + strAccount + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
    }

    protected string GetProjectExpense(string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(ConfirmAmount),0) From T_ProExpense Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProExpense");


        try
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch
        {
            return "0";
        }
    }
}

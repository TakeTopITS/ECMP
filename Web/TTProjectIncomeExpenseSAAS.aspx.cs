using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;



using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTProjectIncomeExpenseSAAS : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strChartTitle = "ReportView";

        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
            LB_ProjectIncomeExpenseTitle.Text = "";

            strChartTitle =  Resources.lang.XMFYFBT;
        }
        else
        {
            LB_ProjectIncomeExpenseTitle.Text = strProjectID + " " + ShareClass.GetProjectName(strProjectID);

            strChartTitle = strProjectID + " " + ShareClass.GetProjectName(strProjectID) + " " + Resources.lang.XMFYFBT;
        }

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            strHQL = "Select ProjectID, ConstractAmount,TotalReceivablesAmount,TotalIncome,TotalExpense,ContractReceiverBalance,ReceivableReceiverBalance From V_ProjectIncomeExpenseSum Where ProjectID = " + strProjectID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectIncomeAndExpense");

            DataList1.DataSource = ds;
            DataList1.DataBind();

            decimal deTotalConstractAmount = 0, deTotalIncome = 0, deTotalExpense = 0, deTotalReceivableAmount = 0, deContractReceiverBalance = 0, deReceivableReceiverBalance = 0;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                deTotalConstractAmount += decimal.Parse(ds.Tables[0].Rows[i][1].ToString());
                deTotalReceivableAmount += decimal.Parse(ds.Tables[0].Rows[i][2].ToString());

                deTotalIncome += decimal.Parse(ds.Tables[0].Rows[i][3].ToString());
                deTotalExpense = decimal.Parse(ds.Tables[0].Rows[i][4].ToString());

                deContractReceiverBalance += decimal.Parse(ds.Tables[0].Rows[i][5].ToString());
                deReceivableReceiverBalance += decimal.Parse(ds.Tables[0].Rows[i][6].ToString());
            }

            LB_TotalContractAmount.Text = deTotalConstractAmount.ToString();
            LB_TotalReceivablesAmount.Text = deTotalReceivableAmount.ToString();
            LB_TotalContractExpense.Text = deTotalExpense.ToString();
            LB_TotalContractIncome.Text = deTotalIncome.ToString();
            LB_IncomeExpenseBalance.Text = (deTotalIncome - deTotalExpense).ToString();
            LB_ContractReceiverBalance.Text = deContractReceiverBalance.ToString();
            LB_ReceivableReceiverBalance.Text = deReceivableReceiverBalance.ToString();

            LoadConstractReceivables(strProjectID);

            string strCmdText = "select Account as XName,sum(ConfirmAmount) as YNumber from T_ProExpense ";
            strCmdText += " where ProjectID = " + strProjectID + " Group By Account";
            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        }
    }

    protected void LoadConstractReceivables(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType ='Project' and constractReceivables.RelatedID =  " + strProjectID;
        strHQL += " Order By constractReceivables.ReceiverTime DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }
}

using System; using System.Resources;
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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTReceivablesPayableHandleForBusiness : System.Web.UI.Page
{
    string strRelatedType, strRelatedID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        //Session["UserCode"] = "C7094";

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (strRelatedID == null | strRelatedType == null)
        {
            strRelatedType = "Other";
            strRelatedID = "0";
        }
 
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

            LoadConstractReceivables(strRelatedType, strRelatedID, strUserCode);
            LoadConstractPayable(strRelatedType, strRelatedID, strUserCode);

            CountReceivablesAmount(strRelatedType, strRelatedID, strUserCode);
            CountPayableAmount(strRelatedType, strRelatedID, strUserCode);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        IList lst;
        string strOperatorCode = LB_UserCode.Text.Trim();

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType != " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID != " + strRelatedID;
        strHQL += " and constractReceivables.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By constractReceivables.ID DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        IList lst;
        string strOperatorCode = LB_UserCode.Text.Trim();

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType != " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID != " + strRelatedID;
        strHQL += " and constractPayable.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }
  
    protected string GetAccountName(string strAccountCode)
    {
        string flag = "";
        string strHQL = "Select AccountName From T_Account where AccountCode='" + strAccountCode + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_Account").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            flag = dt.Rows[0]["AccountName"].ToString();
        }
        else
        {
            flag = "";
        }
        return flag;
    }

    protected void LoadConstractReceivables(string strRelatedType, string strRelatedID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType != " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID != " + strRelatedID;
        strHQL += " and constractReceivables.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By constractReceivables.ID DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        CountReceivablesAmount(strRelatedType, strRelatedID, strOperatorCode);
    }

    protected void LoadConstractPayable(string strRelatedType, string strRelatedID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType != " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID != " + strRelatedID;
        strHQL += " and constractPayable.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        CountPayableAmount(strRelatedType, strRelatedID, strOperatorCode);
    }


    protected void CountReceivablesAmount(string strRelatedType, string strRelatedID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        decimal deReceivablesAmount = 0, deReceiverAmount = 0;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType != " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID != " + strRelatedID;
        strHQL += " and constractReceivables.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        ConstractReceivables constractReceivables = new ConstractReceivables();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivables = (ConstractReceivables)lst[i];

            deReceivablesAmount += constractReceivables.ReceivablesAccount;
            deReceiverAmount += constractReceivables.ReceiverAccount;
        }

        LB_ReceivablesAmount.Text = deReceivablesAmount.ToString();
        LB_ReceiverAmount.Text = deReceiverAmount.ToString();
        LB_UNReceiverAmount.Text = (deReceivablesAmount - deReceiverAmount).ToString();
    }

    protected void CountPayableAmount(string strRelatedType, string strRelatedID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        decimal dePayableAmount = 0, dePayAmount = 0;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType != " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID != " + strRelatedID;
        strHQL += " and constractPayable.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        ConstractPayable constractPayable = new ConstractPayable();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayable = (ConstractPayable)lst[i];

            dePayableAmount += constractPayable.PayableAccount;
            dePayAmount += constractPayable.OutOfPocketAccount;
        }

        LB_PayableAmount.Text = dePayableAmount.ToString();
        LB_PayAmount.Text = dePayAmount.ToString();
        LB_UNPayAmount.Text = (dePayableAmount - dePayAmount).ToString();
    }

    
}

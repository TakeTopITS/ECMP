using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTReceivablesPayableDetailView : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strRelatedPlanID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];
        strRelatedPlanID = Request.QueryString["RelatedPlanID"];

        if (strRelatedPlanID == null)
        {
            strRelatedPlanID = "0";
        }
        else
        {
            strRelatedType = "Project";
            strRelatedID = ShareClass.getProjectIDByPlanID(strRelatedPlanID);
        }

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadConstractReceivables(strRelatedType, strRelatedID, strRelatedPlanID);
            LoadConstractPayable(strRelatedType, strRelatedID, strRelatedPlanID);

            CountReceivablesAmount(strRelatedType, strRelatedID, strRelatedPlanID);
            CountPayableAmount(strRelatedType, strRelatedID, strRelatedPlanID);
        }
    }

    protected void CountReceivablesAmount(string strRelatedType, string strRelatedID, string strRelatedPlanID)
    {
        string strHQL;
        IList lst;

        decimal deReceivablesAmount = 0, deReceiverAmount = 0;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType = " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null)
        {
            strHQL += " And constractReceivables.RelatedPlanID =" + strRelatedPlanID;
        }
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

    protected void CountPayableAmount(string strRelatedType, string strRelatedID, string strRelatedPlanID)
    {
        string strHQL;
        IList lst;

        decimal dePayableAmount = 0, dePayAmount = 0;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType = " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null)
        {
            strHQL += " And  constractPayable.RelatedPlanID =" + strRelatedPlanID;
        }
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

    protected void LoadConstractReceivables(string strRelatedType, string strRelatedID, string strRelatedPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType = " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null)
        {
            strHQL += " and constractReceivables.RelatedPlanID = " + strRelatedPlanID;
        }
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        CountReceivablesAmount(strRelatedType, strRelatedID, strRelatedPlanID);
    }

    protected void LoadConstractPayable(string strRelatedType, string strRelatedID, string strRelatedPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType = " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null)
        {
            strHQL += " and constractPayable.RelatedPlanID = " + strRelatedPlanID;
        }
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        CountPayableAmount(strRelatedType, strRelatedID, strRelatedPlanID);
    }
}

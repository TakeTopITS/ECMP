using System;
using System.Resources;
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


public partial class TTConstractPayableVisaView : System.Web.UI.Page
{
    string strVisaID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strVisaID = Request.QueryString["VisaID"];

        if (Page.IsPostBack != true)
        {
            LoadConstractPayableVisa(strVisaID);
            LoadConstractPayableVisaDetail(strVisaID);
        }
    }

    protected void LoadConstractPayableVisa(string strVisaID)
    {
        string strHQL = "Select * from T_ConstractPayableVisa where ID = " + strVisaID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisa");

        DataList35.DataSource = ds;
        DataList35.DataBind();

        string strCPVID = DataList35.DataKeys[0].ToString();
        ConstractPayableVisa constractPayableVisa = GetConstractPayableVisa(strCPVID);
        try
        {
            if (constractPayableVisa.ProjectID != 0)
            {
                ((Label)(DataList35.Items[0].FindControl("LB_ProjectName"))).Text = ShareClass.GetProjectName(constractPayableVisa.ProjectID.ToString());
            }
        }
        catch
        {
        }

        try
        {
            if (constractPayableVisa.ConstractPayableID != 0)
            {
                ((Label)(DataList35.Items[0].FindControl("LB_ConstractPayablePlanName"))).Text = GetConstractPayableAccount(constractPayableVisa.ConstractPayableID.ToString());
            }
        }
        catch
        {
        }
    }

    protected ConstractPayableVisa GetConstractPayableVisa(string strVisaID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ConstractPayableVisa as constractPayableVisa Where constractPayableVisa.ID = " + strVisaID;
        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);
        ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

        return constractPayableVisa;
    }

    protected string GetConstractPayableAccount(string strPayableID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.ID = " + strPayableID;

        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        ConstractPayable constractPayable = (ConstractPayable)lst[0];

        return constractPayable.Account.Trim();
    }

    protected void LoadConstractPayableVisaDetail(string strVisaID)
    {
        string strHQL = "Select * from T_ConstractPayableVisaDetail where VisaID = " + strVisaID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayableVisaDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}



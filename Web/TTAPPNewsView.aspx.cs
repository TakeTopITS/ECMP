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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAPPNewsView : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strID;

        strID = Request.QueryString["ID"];
        strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack != true)
        {
            LB_ID.Text = strID;

            strHQL = "Select ID,Title,Content From T_HeadLine Where ID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

            if (ds.Tables[0].Rows.Count > 0)
            {
                LB_Title.Text = ds.Tables[0].Rows[0][1].ToString();

                DataList1.DataSource = ds;
                DataList1.DataBind();

                UpdateNewsReadLog(strID, strUserCode);
            }
        }
    }

    private void UpdateNewsReadLog(string strNewsID, string strUserCode)
    {
        string strHQL1, strHQL2;

        strHQL1 = "Select ID From T_NewsRelatedUser Where NewsID = " + strNewsID;
        strHQL1 += " and UserCode = " + "'" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_NewsRelatedUser");

        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL2 = "Insert Into T_NewsRelatedUser(NewsID,UserCode,ReadTime) Values (" + strNewsID + "," + "'" + strUserCode + "'" + ",now())";
            ShareClass.RunSqlCommand(strHQL2);
        }
    }
}

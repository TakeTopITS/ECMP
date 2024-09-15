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


public partial class TTProjectRelatedItemReport : System.Web.UI.Page
{
    string strProjectID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        strProjectID = Request.QueryString["ProjectID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectRelatedItem(strProjectID);

            LB_ProjectName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + ShareClass.GetProjectName(strProjectID);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsCode = TB_GoodsCode.Text.Trim();
        string strGoodsName = TB_GoodsName.Text.Trim();
        string strModelNumber = TB_ModelNumber.Text.Trim();
        string strSpec = TB_Spec.Text.Trim();

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select * From T_ProjectRelatedItem A,T_Item B";
        strHQL += " where A.ItemCode = B.ItemCode and A.ProjectID = " + strProjectID;
        strHQL += " and A.ItemCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and A.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and B.ModelNumber Like " + "'" + strModelNumber + "'";
        strHQL += " and B.Specification  Like " + "'" + strSpec + "'";
        strHQL += " Order by A.ID ASC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }


    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_ProjectRelatedItem A,T_Item B";
        strHQL += " where A.ItemCode = B.ItemCode and A.ProjectID = " + strProjectID;
        strHQL += " Order by A.ID ASC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRelatedItem");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }


}

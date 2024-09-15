using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTProjectCostOperationView : System.Web.UI.Page
{
    string strUserCode, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strProjectID = Request.QueryString["ProjectID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            LoadProjectCostManageList(strProjectID);
        }
    }

    protected void LoadProjectCostManageList(string strprojectID)
    {
        string strHQL = "select A.*,COALESCE(B.QuantitiesRea,0) QuantitiesRea,COALESCE(B.PriceRea,0) PriceRea,COALESCE(B.TotalRea,0) TotalRea,COALESCE(B.TotalRea,0)/CASE WHEN A.Total = 0 Then 1 END as TotalBL from " +
            "(select * from T_ProjectCostManage Where Type='基础' and ProjectID='" + strprojectID + "') A left join (select Code,SUM(Quantities) QuantitiesRea,SUM(Total) TotalRea," +
            "SUM(Total)/SUM(Quantities) PriceRea from T_ProjectCostManage where Type='操作' and ProjectID='" + strprojectID + "' group by Code) B on A.Code=B.Code ";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectCostManage");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = lbl_sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectCostManage");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }
}
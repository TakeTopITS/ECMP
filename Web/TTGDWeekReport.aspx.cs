using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDWeekReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {

        string strGDWeldersHQL = @"select w.Area,j.Mold,SUM(cast(COALESCE(j.Size,'0') as float)) as TotalSize from T_GDIsomJoint j
                    left join T_GDLineWeld w on j.Isom_no = w.Isom_no
                    where 1=1 ";

        string strStartTime = TXT_StartTime.Text.Trim();
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strGDWeldersHQL += " and j.InstallationTime >= '"+strStartTime+"'";
        }
        string strEndTime = TXT_EndTime.Text.Trim();
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strGDWeldersHQL += " and j.InstallationTime <= '"+strEndTime+"'";
        }
        strGDWeldersHQL += " group by w.Area,j.Mold";

        DataTable listGDWelders = ShareClass.GetDataSetFromSql(strGDWeldersHQL,"sql").Tables[0];

        DG_List.DataSource = listGDWelders;
        DG_List.DataBind();

        LB_Sql.Text = strGDWeldersHQL;
    }





    protected void DG_List_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_List.CurrentPageIndex = e.NewPageIndex;

        GDWeldersBLL gDWeldersBLL = new GDWeldersBLL();
        string strGDWeldersHQL = LB_Sql.Text;
        IList listGDWelders = gDWeldersBLL.GetAllGDWelderss(strGDWeldersHQL);

        DG_List.DataSource = listGDWelders;
        DG_List.DataBind();
    }

    protected void BT_Search_Click(object sender, EventArgs e)
    {
        DataBinder();
    }
}
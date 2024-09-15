using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDWelderStatusReport : System.Web.UI.Page
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
        string strWelderStatusHQL = @"select w.Welders,w.Status,j.RanderTime,j.Isom_no,j.JointNo,j.Mold,j.Size,j.SF,j.CoveringWelder1 
                        from T_GDIsomJoint j
                        left join T_GDWelders w on j.RanderWelder1 = w.Welders";
        DataTable dtWelder = ShareClass.GetDataSetFromSql(strWelderStatusHQL, "strWelderStatusHQL").Tables[0];

        rptList.DataSource = dtWelder;
        rptList.DataBind();
    }
}
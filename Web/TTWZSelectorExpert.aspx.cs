using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorExpert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        string strWZExpertDatabaseHQL = @"select e.*,m.UserName as CreateCodeName from T_WZExpert e
                    left join T_ProjectMember m on e.ExpertCode = m.UserCode";
        DataTable dtExpertDatabase = ShareClass.GetDataSetFromSql(strWZExpertDatabaseHQL, "ExpertDatabase").Tables[0];

        DG_List.DataSource = dtExpertDatabase;
        DG_List.DataBind();
    }
}
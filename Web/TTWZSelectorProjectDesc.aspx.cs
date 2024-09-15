using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorProjectDesc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["strProjectCode"]))
            {
                string strProjectCode = Request.QueryString["strProjectCode"].ToString();
                HF_ProjectCode.Value = strProjectCode;

                BindProjectData(strProjectCode);
            }
        }
    }


    private void BindProjectData(string strProjectCode)
    {
        string strWZProjectHQL = string.Format(@"select * from T_WZProject 
                    where ProjectCode = '{0}'", strProjectCode);
        DataTable dtProject = ShareClass.GetDataSetFromSql(strWZProjectHQL, "Project").Tables[0];

        if (dtProject != null && dtProject.Rows.Count > 0)
        {
            DataRow drProject = dtProject.Rows[0];

            TXT_ProjectCode.Text = ShareClass.ObjectToString(drProject["ProjectCode"]);
            TXT_ProjectName.Text = ShareClass.ObjectToString(drProject["ProjectName"]);

            TXT_ProjectDesc.Value = ShareClass.ObjectToString(drProject["ProjectDesc"]);


        }
    }
}
using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorProjectPurchase : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";

         if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private void DataBinder()
    {
        //string strProjectHQL = string.Format(@"select p.*,
        //        m.UserName as ProjectManagerName
        //        from T_WZProject p
        //        left join T_ProjectMember m on p.ProjectManager = m.UserCode
        //        where p.Progress = '开工'
        //        and p.PurchaseEngineer = '{0}'", strUserCode);

        string strProjectHQL = string.Format(@"select p.*,
                    pp.UserName as ProjectManagerName,
                    pd.UserName as DelegateAgentName,
                    pm.UserName as PurchaseManagerName,
                    pe.UserName as PurchaseEngineerName,
                    pc.UserName as ContracterName,
                    pk.UserName as CheckerName,
                    ps.UserName as SafekeepName,
                    pa.UserName as MarkerName,
                    pu.UserName as SupplementEditorName
                    from T_WZProject p
                    left join T_ProjectMember pp on p.ProjectManager = pp.UserCode
                    left join T_ProjectMember pd on p.DelegateAgent = pd.UserCode
                    left join T_ProjectMember pm on p.PurchaseManager = pm.UserCode
                    left join T_ProjectMember pe on p.PurchaseEngineer = pe.UserCode
                    left join T_ProjectMember pc on p.Contracter = pc.UserCode
                    left join T_ProjectMember pk on p.Checker = pk.UserCode
                    left join T_ProjectMember ps on p.Safekeep = ps.UserCode
                    left join T_ProjectMember pa on p.Marker = pa.UserCode
                    left join T_ProjectMember pu on p.SupplementEditor = pu.UserCode
                    where p.Progress = '开工'                                     
                
                    and (p.SupplementEditor = '{0}' or p.SupplementEditor = '-')
                    and ProjectCode not in 
                    (
                    select ProjectCode from T_Project
                    where Status in ('删除')
                    )", strUserCode);


        strProjectHQL += " order by p.MarkTime desc";

        DataTable dtProject = ShareClass.GetDataSetFromSql(strProjectHQL, "Project").Tables[0];

        DG_List.DataSource = dtProject;
        DG_List.DataBind();
    }
}
using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorGetUnit : System.Web.UI.Page
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
        string strGetUnitHQL = @"select gu.*,
                    pd.UserName as DelegateAgentName,
                    pf.UserName as FeeManageName,
                    pl.UserName as LeaderName,
                    pm.UserName as MaterialPersonName
                    from T_WZGetUnit gu
                    left join T_ProjectMember pd on gu.DelegateAgent = pd.UserCode
                    left join T_ProjectMember pf on gu.FeeManage = pf.UserCode
                    left join T_ProjectMember pl on gu.Leader = pl.UserCode
                    left join T_ProjectMember pm on gu.MaterialPerson = pm.UserCode";
        DataTable dtGetUnit = ShareClass.GetDataSetFromSql(strGetUnitHQL, "GetUnit").Tables[0];

        DG_List.DataSource = dtGetUnit;
        DG_List.DataBind();
        //WZGetUnitBLL wZGetUnitBLL = new WZGetUnitBLL();
        //string strWZGetUnitHQL = "from WZGetUnit as wZGetUnit";
        //IList listWZGetUnit = wZGetUnitBLL.GetAllWZGetUnits(strWZGetUnitHQL);

        //DG_List.DataSource = listWZGetUnit;
        //DG_List.DataBind();
    }
}
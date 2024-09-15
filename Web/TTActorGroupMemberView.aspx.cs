using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTActorGroupMemberView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strIdentifyString, strUserCode, strGroupName, strGroupType;


        strUserCode = Session["UserCode"].ToString();
        strIdentifyString = Request.QueryString["IdentifyString"].Trim();

        strGroupName = GetActorGroup(strIdentifyString).GroupName.Trim();
        strGroupType = GetActorGroup(strIdentifyString).Type.Trim();

        if (!Page.IsPostBack)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByUserInfor(strUserCode);

            LoadActorGroupDetail(strGroupName, strGroupType, strDepartString);
        }
    }

    protected ActorGroup GetActorGroup(string strIdentifyString)
    {
        string strHQL;
        IList lst;

        strHQL = "from ActorGroup as actorGroup where actorGroup.IdentifyString= " + "'" + strIdentifyString + "'";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);

        ActorGroup actorGroup = (ActorGroup)lst[0];

        return actorGroup;
    }

    protected void LoadActorGroupDetail(string strGroupName, string strGroupType, string strDepartString)
    {
        string strHQL;


        if (strGroupType != "超级")
        {
            strHQL = "Select * From T_ActorGroupDetail Where GroupName  = " + "'" + strGroupName + "'";
        }
        else
        {
            strHQL = "Select * From T_ActorGroupDetail Where GroupName  = " + "'" + strGroupName + "'";
            strHQL += " and UserCode in (Select UserCode From T_ProjectMember Where DepartCode in " + strDepartString + ")";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ActorGroupDetail");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

}

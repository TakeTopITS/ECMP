using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTMeetSystem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            string strMeetingSystemHQL = "select * from T_MeetingSystemURL";
            DataTable dtMeetingSystem = ShareClass.GetDataSetFromSql(strMeetingSystemHQL, "strMeetingSystemHQL").Tables[0];
            if (dtMeetingSystem != null && dtMeetingSystem.Rows.Count > 0)
            {
                IFrameMeet.Attributes.Add("src", ShareClass.ObjectToString(dtMeetingSystem.Rows[0]["MeetingURL"]));
            }
            else {
                IFrameMeet.Attributes.Add("src", "");
            }
        }
    }
}
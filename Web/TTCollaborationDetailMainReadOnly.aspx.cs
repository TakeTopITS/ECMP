using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using System; using System.Resources;

public partial class TTCollaborationDetailMainReadOnly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode;
        string strCoID;

        string strCreatorCode;

        strUserCode = Session["UserCode"].ToString();
        strCoID = Request.QueryString["CoID"];

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);
        Collaboration collaboration = (Collaboration)lst[0];

        strCreatorCode = collaboration.CreatorCode.Trim();

        //this.Title = "协作：" + strCoID + " " + collaboration.CollaborationName.Trim() + " 处理";
    }
}
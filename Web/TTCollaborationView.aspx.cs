using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCollaborationView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCoID;
        string strHQL;
        IList lst;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        strCoID = Request.QueryString["CoID"];

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;

        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        if (lst.Count > 0)
        {
            Collaboration collaboration = (Collaboration)lst[0];
            //this.Title = "协作： " + strCoID + " " + collaboration.CollaborationName.Trim() + " 详细内容!";
        }
        else
        {
            Response.Write("此协作不存在，可能已被删除,请检查!");
        }
    }
}

using System;
using System.Resources;
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

public partial class TTReqView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strReqID;
        string strHQL;
        IList lst;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        strReqID = Request.QueryString["ReqID"];

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack != true)
        {
            strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
            RequirementBLL requirementBLL = new RequirementBLL();
            lst = requirementBLL.GetAllRequirements(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            if (lst.Count > 0)
            {
                Requirement requirement = (Requirement)lst[0];
            }
            else
            {
                Response.Write("此需求不存在，可能已被删除,请检查!");
            }
        }
    }
}

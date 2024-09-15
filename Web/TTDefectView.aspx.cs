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

public partial class TTDefectView : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDefectID;
        string strHQL;
        IList lst;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();
        strDefectID = Request.QueryString["DefectID"];

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack != true)
        {
            strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
            DefectmentBLL defectmentBLL = new DefectmentBLL();
            lst = defectmentBLL.GetAllDefectments(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            if (lst.Count > 0)
            {
                Defectment defectment = (Defectment)lst[0];
            }
            else
            {
                Response.Write("此缺陷不存在，可能已被删除,请检查!");
            }
        }
    }
}

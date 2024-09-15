using System;
using System.Resources;
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

public partial class TTLTCandidateInformationView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserName = Request.QueryString["UserName"];

        string strHQL;
        IList lst;


        //this.Title = "用户：" + strUserCode +" " + strUserName + "  的资料";

        string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack == false)
        {
            strHQL = "from LTCandidateInformation as ltCandidateInformation where ltCandidateInformation.UserName = " + "'" + strUserName + "'";

            LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
            lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);

            LTCandidateInformation ltCandidateInformation = (LTCandidateInformation)lst[0];


            DataList2.DataSource = lst;
            DataList2.DataBind();

            DataList1.DataSource = lst;
            DataList1.DataBind();
        }
    }


    protected string GetUserName(string strUserCode)
    {
        string strHQL = "from LTCandidateInformation as ltCandidateInformation where ltCandidateInformation.UserCode = " + "'" + strUserCode + "'";

        LTCandidateInformationBLL ltCandidateInformationBLL = new LTCandidateInformationBLL();
        IList lst = ltCandidateInformationBLL.GetAllLTCandidateInformations(strHQL);

        LTCandidateInformation ltCandidateInformation = (LTCandidateInformation)lst[0];

        string strUserName = ltCandidateInformation.UserName;

        return strUserName.Trim();

    }
}

using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTQMManagement : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","质量管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            GetHSEManagementList();
        }
    }

    protected void GetHSEManagementList()
    {
        string strHQL = "from QMSatisfactionSurvey as qMSatisfactionSurvey Order By qMSatisfactionSurvey.Code Desc ";
        QMSatisfactionSurveyBLL qMSatisfactionSurveyBLL = new QMSatisfactionSurveyBLL();
        IList lst = qMSatisfactionSurveyBLL.GetAllQMSatisfactionSurveys(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        strHQL = "from QMMatEquInspection as qMMatEquInspection Order By qMMatEquInspection.Code Desc ";
        QMMatEquInspectionBLL qMMatEquInspectionBLL = new QMMatEquInspectionBLL();
        lst = qMMatEquInspectionBLL.GetAllQMMatEquInspections(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        strHQL = "from QMQualityInspection as qMQualityInspection Order By qMQualityInspection.Code Desc ";
        QMQualityInspectionBLL qMQualityInspectionBLL = new QMQualityInspectionBLL();
        lst = qMQualityInspectionBLL.GetAllQMQualityInspections(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }
}
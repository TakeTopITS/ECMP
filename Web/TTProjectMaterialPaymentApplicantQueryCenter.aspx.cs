using System;
using System.Resources;
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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectMaterialPaymentApplicantQueryCenter : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName, strDepartString;
        
        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            //LoadProjectMaterialPaymentApplicant(strUserCode);
        }
    }

    protected void BT_FindAOCode_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAOName;
        string strUserCode;
        decimal deTotalAmount = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strAOName = TB_AOCode.Text.Trim();

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where (projectMaterialPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or projectMaterialPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and projectMaterialPaymentApplicant.AOName Like " + "'%" + strAOName + "%'";
        strHQL += " Order by projectMaterialPaymentApplicant.AOID DESC";
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant;

        for(int i = 0;i<lst.Count;i++)
        {
            projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[i];

            deTotalAmount += projectMaterialPaymentApplicant.CurrentTotalPaymentAmount;
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql5.Text = strHQL;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAOName, strApplicantName, strProjectName, strSupplierName, strStatus;
        string strStartTime, strEndTime;

        string strUserCode;
        decimal deTotalAmount = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strAOName = TB_AOCode.Text.Trim();

        strApplicantName = TB_ApplicantName.Text.Trim();
        strProjectName = TB_ProjectName.Text.Trim();
        strSupplierName = TB_SupplierName.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strStatus = DL_Status.SelectedValue.Trim();

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where (projectMaterialPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or projectMaterialPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and projectMaterialPaymentApplicant.AOName Like " + "'%" + strAOName + "%'";
        strHQL += " and projectMaterialPaymentApplicant.ProjectName Like " + "'%" + strProjectName + "%'";
        strHQL += " and projectMaterialPaymentApplicant.PartA Like " + "'%" + strSupplierName + "%'";
        strHQL += " And to_char(projectMaterialPaymentApplicant.CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(projectMaterialPaymentApplicant.CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and projectMaterialPaymentApplicant.Status Like " + "'%" + strStatus + "%'";
        strHQL += " Order by projectMaterialPaymentApplicant.AOID DESC";
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant;

        for (int i = 0; i < lst.Count; i++)
        {
            projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[i];

            deTotalAmount += projectMaterialPaymentApplicant.CurrentTotalPaymentAmount;
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql5.Text = strHQL;
    }
    
    protected void LoadProjectMaterialPaymentApplicant(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant where (projectMaterialPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or projectMaterialPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " Order by projectMaterialPaymentApplicant.AOID DESC";
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }
}


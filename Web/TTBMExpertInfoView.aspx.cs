using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMExpertInfoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ExpertID"];
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            GetExpertData(strID);
        }
    }

    protected void GetExpertData(string strId)
    {
        string strHQL = "from WZExpert as wZExpert where wZExpert.ID = '" + strId + "' ";
        WZExpertBLL wZExpertBLL = new WZExpertBLL();
        IList lst = wZExpertBLL.GetAllWZExperts(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            WZExpert wZExpert = (WZExpert)lst[0];
            lbl_CreateTime.Text = wZExpert.CreateTime.ToString("yyyy-MM-dd HH:mm:ss");
            lbl_ExpertCode.Text = wZExpert.ExpertCode.Trim();
            lbl_ExpertType.Text = wZExpert.ExpertType.Trim();
            lbl_Job.Text = wZExpert.Job.Trim();
            lbl_JobTitle.Text = wZExpert.JobTitle.Trim();
            lbl_Name.Text = wZExpert.Name.Trim();
            lbl_Phone.Text = wZExpert.Phone.Trim();
            lbl_WorkingPoint.Text = wZExpert.WorkingPoint.ToString();
            lbl_WorkUnit.Text = wZExpert.WorkUnit.Trim();
            lbl_ActionOutstanding.Text = wZExpert.ActionOutstanding.Trim();
            lbl_BadTrackRecord.Text = wZExpert.BadTrackRecord.Trim();
            lbl_EngagedCategory.Text = wZExpert.EngagedCategory.Trim();
            lbl_GoodPerformance.Text = wZExpert.GoodPerformance.Trim();
            lbl_LaborExpertise.Text = wZExpert.LaborExpertise.Trim();
            lbl_LiteratureWorks.Text = wZExpert.LiteratureWorks.Trim();
            lbl_ManagementInnovation.Text = wZExpert.ManagementInnovation.Trim();
            lbl_NotLaborExpertise.Text = wZExpert.NotLaborExpertise.Trim();
            lbl_PatentInvention.Text = wZExpert.PatentInvention.Trim();
            lbl_ProcurementCategory.Text = wZExpert.ProcurementCategory.Trim();
            lbl_ScientificAchieve.Text = wZExpert.ScientificAchieve.Trim();
            lbl_SuccessfulCasePro.Text = wZExpert.SuccessfulCasePro.Trim();
            lbl_Type.Text = wZExpert.Type.Trim();
            lbl_CreateCode.Text = wZExpert.CreateCode.Trim() + " " + ShareClass.GetUserName(wZExpert.CreateCode.Trim());

            ProjectMember projectMember = GetUserName(wZExpert.ExpertCode.Trim());
            if (projectMember != null)
            {
                lbl_Degree.Text = projectMember.Degree.Trim();
                lbl_Email.Text = projectMember.EMail.Trim();
                lbl_Gender.Text = projectMember.Gender.Trim();
                lbl_GraduateSchool.Text = projectMember.GraduateSchool.Trim();
                lbl_IDCard.Text = projectMember.IDCard.Trim();
                lbl_IntroducerDepartment.Text = projectMember.IntroducerDepartment.Trim();
                lbl_JoinDate.Text = projectMember.JoinDate.ToString("yyyy-MM-dd");
                lbl_Major.Text = projectMember.Major.Trim();
                lbl_OfficePhone.Text = projectMember.OfficePhone.Trim();
            }

            strHQL = "from WorkExperience as workExperience where workExperience.UserCode = '" + wZExpert.ExpertCode.Trim() + "' ";
            WorkExperienceBLL workExperienceBLL = new WorkExperienceBLL();
            lst = workExperienceBLL.GetAllWorkExperiences(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            strHQL = "from BMPerformanceEvaluation as bMPerformanceEvaluation where bMPerformanceEvaluation.ExpertID = '" + wZExpert.ID.ToString() + "' ";
            BMPerformanceEvaluationBLL bMPerformanceEvaluationBLL = new BMPerformanceEvaluationBLL();
            lst = bMPerformanceEvaluationBLL.GetAllBMPerformanceEvaluations(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }

    protected string GetExpertName(string strID)
    {
        string strHQL;
        IList lst;
        //绑定招标计划名称
        strHQL = "From WZExpert as wZExpert Where wZExpert.ID='" + strID + "' ";
        WZExpertBLL wZExpertBLL = new WZExpertBLL();
        lst = wZExpertBLL.GetAllWZExperts(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            WZExpert wZExpert = (WZExpert)lst[0];
            return wZExpert.Name.Trim();
        }
        else
            return "";
    }

    protected ProjectMember GetUserName(string strusercode)
    {
        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = '" + strusercode + "' ";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            ProjectMember projectMember = (ProjectMember)lst[0];
            return projectMember;
        }
        else
            return null;
    }
}
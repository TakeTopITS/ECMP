using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMaterialPaymentApplicantBLL
    {
        public void AddProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant)
        {
            ProjectMaterialPaymentApplicantDAL dal = new ProjectMaterialPaymentApplicantDAL();
            dal.AddProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant);
        }

        public void UpdateProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant, int AOID)
        {
            ProjectMaterialPaymentApplicantDAL dal = new ProjectMaterialPaymentApplicantDAL();
            dal.UpdateProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant, AOID);
        }

        public void DeleteProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant)
        {
            ProjectMaterialPaymentApplicantDAL dal = new ProjectMaterialPaymentApplicantDAL();
            dal.DeleteProjectMaterialPaymentApplicant(projectMaterialPaymentApplicant);
        }

        public IList GetAllProjectMaterialPaymentApplicants(string strHQL)
        {
            ProjectMaterialPaymentApplicantDAL dal = new ProjectMaterialPaymentApplicantDAL();
            return dal.GetAllProjectMaterialPaymentApplicants(strHQL);
        }
    }
}
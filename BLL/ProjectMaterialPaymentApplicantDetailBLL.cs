using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMaterialPaymentApplicantDetailBLL
    {
        public void AddProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail)
        {
            ProjectMaterialPaymentApplicantDetailDAL dal = new ProjectMaterialPaymentApplicantDetailDAL();
            dal.AddProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail);
        }

        public void UpdateProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail, int ID)
        {
            ProjectMaterialPaymentApplicantDetailDAL dal = new ProjectMaterialPaymentApplicantDetailDAL();
            dal.UpdateProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail, ID);
        }

        public void DeleteProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail)
        {
            ProjectMaterialPaymentApplicantDetailDAL dal = new ProjectMaterialPaymentApplicantDetailDAL();
            dal.DeleteProjectMaterialPaymentApplicantDetail(projectMaterialPaymentApplicantDetail);
        }

        public IList GetAllProjectMaterialPaymentApplicantDetails(string strHQL)
        {
            ProjectMaterialPaymentApplicantDetailDAL dal = new ProjectMaterialPaymentApplicantDetailDAL();
            return dal.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
        }
    }
}
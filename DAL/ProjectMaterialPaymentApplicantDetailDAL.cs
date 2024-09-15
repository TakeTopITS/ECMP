using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMaterialPaymentApplicantDetailDAL
    {
        private EntityControl control;

        public ProjectMaterialPaymentApplicantDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail)
        {
            control.AddEntity(projectMaterialPaymentApplicantDetail);
        }

        public void UpdateProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail, int ID)
        {
            control.UpdateEntity(projectMaterialPaymentApplicantDetail, ID);
        }

        public void DeleteProjectMaterialPaymentApplicantDetail(ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail)
        {
            control.DeleteEntity(projectMaterialPaymentApplicantDetail);
        }

        public IList GetAllProjectMaterialPaymentApplicantDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
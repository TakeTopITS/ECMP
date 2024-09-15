using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMaterialPaymentApplicantDAL
    {
        private EntityControl control;

        public ProjectMaterialPaymentApplicantDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant)
        {
            control.AddEntity(projectMaterialPaymentApplicant);
        }

        public void UpdateProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant, int AOID)
        {
            control.UpdateEntity(projectMaterialPaymentApplicant, AOID);
        }

        public void DeleteProjectMaterialPaymentApplicant(ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant)
        {
            control.DeleteEntity(projectMaterialPaymentApplicant);
        }

        public IList GetAllProjectMaterialPaymentApplicants(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
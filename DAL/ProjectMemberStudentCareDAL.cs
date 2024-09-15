using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberStudentCareDAL
    {
        private EntityControl control;

        public ProjectMemberStudentCareDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare)
        {
            control.AddEntity(projectMemberStudentCare);
        }

        public void UpdateProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare, int ID)
        {
            control.UpdateEntity(projectMemberStudentCare, ID);
        }

        public void DeleteProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare)
        {
            control.DeleteEntity(projectMemberStudentCare);
        }

        public IList GetAllProjectMemberStudentCares(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
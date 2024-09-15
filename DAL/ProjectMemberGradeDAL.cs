using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberGradeDAL
    {
        private EntityControl control;

        public ProjectMemberGradeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberGrade(ProjectMemberGrade projectMemberGrade)
        {
            control.AddEntity(projectMemberGrade);
        }

        public void UpdateProjectMemberGrade(ProjectMemberGrade projectMemberGrade, int ID)
        {
            control.UpdateEntity(projectMemberGrade, ID);
        }

        public void DeleteProjectMemberGrade(ProjectMemberGrade projectMemberGrade)
        {
            control.DeleteEntity(projectMemberGrade);
        }

        public IList GetAllProjectMemberGrades(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
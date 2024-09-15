using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberStudentDAL
    {
        private EntityControl control;

        public ProjectMemberStudentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberStudent(ProjectMemberStudent projectMemberStudent)
        {
            control.AddEntity(projectMemberStudent);
        }

        public void UpdateProjectMemberStudent(ProjectMemberStudent projectMemberStudent, string UserCode)
        {
            control.UpdateEntity(projectMemberStudent, UserCode);
        }

        public void DeleteProjectMemberStudent(ProjectMemberStudent projectMemberStudent)
        {
            control.DeleteEntity(projectMemberStudent);
        }

        public IList GetAllProjectMemberStudents(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
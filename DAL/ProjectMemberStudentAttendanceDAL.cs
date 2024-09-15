using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberStudentAttendanceDAL
    {
        private EntityControl control;

        public ProjectMemberStudentAttendanceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance)
        {
            control.AddEntity(projectMemberStudentAttendance);
        }

        public void UpdateProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance, int ID)
        {
            control.UpdateEntity(projectMemberStudentAttendance, ID);
        }

        public void DeleteProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance)
        {
            control.DeleteEntity(projectMemberStudentAttendance);
        }

        public IList GetAllProjectMemberStudentAttendances(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
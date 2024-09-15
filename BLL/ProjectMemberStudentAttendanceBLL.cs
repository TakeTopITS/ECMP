using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberStudentAttendanceBLL
    {
        public void AddProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance)
        {
            ProjectMemberStudentAttendanceDAL dal = new ProjectMemberStudentAttendanceDAL();
            dal.AddProjectMemberStudentAttendance(projectMemberStudentAttendance);
        }

        public void UpdateProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance, int ID)
        {
            ProjectMemberStudentAttendanceDAL dal = new ProjectMemberStudentAttendanceDAL();
            dal.UpdateProjectMemberStudentAttendance(projectMemberStudentAttendance, ID);
        }

        public void DeleteProjectMemberStudentAttendance(ProjectMemberStudentAttendance projectMemberStudentAttendance)
        {
            ProjectMemberStudentAttendanceDAL dal = new ProjectMemberStudentAttendanceDAL();
            dal.DeleteProjectMemberStudentAttendance(projectMemberStudentAttendance);
        }

        public IList GetAllProjectMemberStudentAttendances(string strHQL)
        {
            ProjectMemberStudentAttendanceDAL dal = new ProjectMemberStudentAttendanceDAL();
            return dal.GetAllProjectMemberStudentAttendances(strHQL);
        }
    }
}
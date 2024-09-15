using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberStudentBLL
    {
        public void AddProjectMemberStudent(ProjectMemberStudent projectMemberStudent)
        {
            ProjectMemberStudentDAL dal = new ProjectMemberStudentDAL();
            dal.AddProjectMemberStudent(projectMemberStudent);
        }

        public void UpdateProjectMemberStudent(ProjectMemberStudent projectMemberStudent, string UserCode)
        {
            ProjectMemberStudentDAL dal = new ProjectMemberStudentDAL();
            dal.UpdateProjectMemberStudent(projectMemberStudent, UserCode);
        }

        public void DeleteProjectMemberStudent(ProjectMemberStudent projectMemberStudent)
        {
            ProjectMemberStudentDAL dal = new ProjectMemberStudentDAL();
            dal.DeleteProjectMemberStudent(projectMemberStudent);
        }

        public IList GetAllProjectMemberStudents(string strHQL)
        {
            ProjectMemberStudentDAL dal = new ProjectMemberStudentDAL();
            return dal.GetAllProjectMemberStudents(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberGradeBLL
    {
        public void AddProjectMemberGrade(ProjectMemberGrade projectMemberGrade)
        {
            ProjectMemberGradeDAL dal = new ProjectMemberGradeDAL();
            dal.AddProjectMemberGrade(projectMemberGrade);
        }

        public void UpdateProjectMemberGrade(ProjectMemberGrade projectMemberGrade, int ID)
        {
            ProjectMemberGradeDAL dal = new ProjectMemberGradeDAL();
            dal.UpdateProjectMemberGrade(projectMemberGrade, ID);
        }

        public void DeleteProjectMemberGrade(ProjectMemberGrade projectMemberGrade)
        {
            ProjectMemberGradeDAL dal = new ProjectMemberGradeDAL();
            dal.DeleteProjectMemberGrade(projectMemberGrade);
        }

        public IList GetAllProjectMemberGrades(string strHQL)
        {
            ProjectMemberGradeDAL dal = new ProjectMemberGradeDAL();
            return dal.GetAllProjectMemberGrades(strHQL);
        }
    }
}
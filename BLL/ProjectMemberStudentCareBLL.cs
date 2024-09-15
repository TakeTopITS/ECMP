using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberStudentCareBLL
    {
        public void AddProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare)
        {
            ProjectMemberStudentCareDAL dal = new ProjectMemberStudentCareDAL();
            dal.AddProjectMemberStudentCare(projectMemberStudentCare);
        }

        public void UpdateProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare, int ID)
        {
            ProjectMemberStudentCareDAL dal = new ProjectMemberStudentCareDAL();
            dal.UpdateProjectMemberStudentCare(projectMemberStudentCare, ID);
        }

        public void DeleteProjectMemberStudentCare(ProjectMemberStudentCare projectMemberStudentCare)
        {
            ProjectMemberStudentCareDAL dal = new ProjectMemberStudentCareDAL();
            dal.DeleteProjectMemberStudentCare(projectMemberStudentCare);
        }

        public IList GetAllProjectMemberStudentCares(string strHQL)
        {
            ProjectMemberStudentCareDAL dal = new ProjectMemberStudentCareDAL();
            return dal.GetAllProjectMemberStudentCares(strHQL);
        }
    }
}
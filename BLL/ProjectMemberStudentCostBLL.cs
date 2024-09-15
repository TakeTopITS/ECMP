using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberStudentCostBLL
    {
        public void AddProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost)
        {
            ProjectMemberStudentCostDAL dal = new ProjectMemberStudentCostDAL();
            dal.AddProjectMemberStudentCost(projectMemberStudentCost);
        }

        public void UpdateProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost, int ID)
        {
            ProjectMemberStudentCostDAL dal = new ProjectMemberStudentCostDAL();
            dal.UpdateProjectMemberStudentCost(projectMemberStudentCost, ID);
        }

        public void DeleteProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost)
        {
            ProjectMemberStudentCostDAL dal = new ProjectMemberStudentCostDAL();
            dal.DeleteProjectMemberStudentCost(projectMemberStudentCost);
        }

        public IList GetAllProjectMemberStudentCosts(string strHQL)
        {
            ProjectMemberStudentCostDAL dal = new ProjectMemberStudentCostDAL();
            return dal.GetAllProjectMemberStudentCosts(strHQL);
        }
    }
}
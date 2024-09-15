using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectPlanVersionBLL
    {
        public void AddProjectPlanVersion(ProjectPlanVersion projectPlanVersion)
        {
            ProjectPlanVersionDAL dal = new ProjectPlanVersionDAL();
            dal.AddProjectPlanVersion(projectPlanVersion);
        }

        public void UpdateProjectPlanVersion(ProjectPlanVersion projectPlanVersion, int ID)
        {
            ProjectPlanVersionDAL dal = new ProjectPlanVersionDAL();
            dal.UpdateProjectPlanVersion(projectPlanVersion, ID);
        }

        public void DeleteProjectPlanVersion(ProjectPlanVersion projectPlanVersion)
        {
            ProjectPlanVersionDAL dal = new ProjectPlanVersionDAL();
            dal.DeleteProjectPlanVersion(projectPlanVersion);
        }

        public IList GetAllProjectPlanVersions(string strHQL)
        {
            ProjectPlanVersionDAL dal = new ProjectPlanVersionDAL();
            return dal.GetAllProjectPlanVersions(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectItemBomVersionBLL
    {
        public void AddProjectItemBomVersion(ProjectItemBomVersion projectProjectItemBomVersion)
        {
            ProjectItemBomVersionDAL dal = new ProjectItemBomVersionDAL();
            dal.AddProjectItemBomVersion(projectProjectItemBomVersion);
        }

        public void UpdateProjectItemBomVersion(ProjectItemBomVersion projectProjectItemBomVersion, int ID)
        {
            ProjectItemBomVersionDAL dal = new ProjectItemBomVersionDAL();
            dal.UpdateProjectItemBomVersion(projectProjectItemBomVersion, ID);
        }

        public void DeleteProjectItemBomVersion(ProjectItemBomVersion projectProjectItemBomVersion)
        {
            ProjectItemBomVersionDAL dal = new ProjectItemBomVersionDAL();
            dal.DeleteProjectItemBomVersion(projectProjectItemBomVersion);
        }

        public IList GetAllProjectItemBomVersions(string strHQL)
        {
            ProjectItemBomVersionDAL dal = new ProjectItemBomVersionDAL();
            return dal.GetAllProjectItemBomVersions(strHQL);
        }
    }
}
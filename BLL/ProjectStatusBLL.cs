using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectStatusBLL
    {
        public void AddProjectStatus(ProjectStatus projectStatus)
        {
            ProjectStatusDAL dal = new ProjectStatusDAL();
            dal.AddProjectStatus(projectStatus);
        }

        public void UpdateProjectStatus(ProjectStatus projectStatus, int ID)
        {
            ProjectStatusDAL dal = new ProjectStatusDAL();
            dal.UpdateProjectStatus(projectStatus, ID);
        }

        public void DeleteProjectStatus(ProjectStatus projectStatus)
        {
            ProjectStatusDAL dal = new ProjectStatusDAL();
            dal.DeleteProjectStatus(projectStatus);
        }

        public IList GetAllProjectStatuss(string strHQL)
        {
            ProjectStatusDAL dal = new ProjectStatusDAL();
            return dal.GetAllProjectStatuss(strHQL);
        }
    }
}
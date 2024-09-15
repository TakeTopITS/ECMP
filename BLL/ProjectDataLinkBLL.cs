using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectDataLinkBLL
    {
        public void AddProjectDataLink(ProjectDataLink projectDataLink)
        {
            ProjectDataLinkDAL dal = new ProjectDataLinkDAL();
            dal.AddProjectDataLink(projectDataLink);
        }

        public void UpdateProjectDataLink(ProjectDataLink projectDataLink, string Code)
        {
            ProjectDataLinkDAL dal = new ProjectDataLinkDAL();
            dal.UpdateProjectDataLink(projectDataLink, Code);
        }

        public void DeleteProjectDataLink(ProjectDataLink projectDataLink)
        {
            ProjectDataLinkDAL dal = new ProjectDataLinkDAL();
            dal.DeleteProjectDataLink(projectDataLink);
        }

        public IList GetAllProjectDataLinks(string strHQL)
        {
            ProjectDataLinkDAL dal = new ProjectDataLinkDAL();
            return dal.GetAllProjectDataLinks(strHQL);
        }
    }
}
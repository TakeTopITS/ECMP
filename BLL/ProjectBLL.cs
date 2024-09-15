using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectBLL
    {
        public void AddProject(Project project)
        {
            ProjectDAL dal = new ProjectDAL();
            dal.AddProject(project);
        }

        public void UpdateProject(Project project, int ProjectID)
        {
            ProjectDAL dal = new ProjectDAL();
            dal.UpdateProject(project, ProjectID);
        }

        public void DeleteProject(Project project)
        {
            ProjectDAL dal = new ProjectDAL();
            dal.DeleteProject(project);
        }

        public IList GetAllProjects(string strHQL)
        {
            ProjectDAL dal = new ProjectDAL();
            return dal.GetAllProjects(strHQL);
        }
    }
}
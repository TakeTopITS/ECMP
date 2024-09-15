using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectTypeBLL
    {
        public void AddProjectType(ProjectType projectType)
        {
            ProjectTypeDAL dal = new ProjectTypeDAL();
            dal.AddProjectType(projectType);
        }

        public void UpdateProjectType(ProjectType projectType, string Type)
        {
            ProjectTypeDAL dal = new ProjectTypeDAL();
            dal.UpdateProjectType(projectType, Type);
        }

        public void DeleteProjectType(ProjectType projectType)
        {
            ProjectTypeDAL dal = new ProjectTypeDAL();
            dal.DeleteProjectType(projectType);
        }

        public IList GetAllProjectTypes(string strHQL)
        {
            ProjectTypeDAL dal = new ProjectTypeDAL();
            return dal.GetAllProjectTypes(strHQL);
        }
    }
}
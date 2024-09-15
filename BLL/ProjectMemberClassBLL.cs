using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberClassBLL
    {
        public void AddProjectMemberClass(ProjectMemberClass projectMemberClass)
        {
            ProjectMemberClassDAL dal = new ProjectMemberClassDAL();
            dal.AddProjectMemberClass(projectMemberClass);
        }

        public void UpdateProjectMemberClass(ProjectMemberClass projectMemberClass, int ID)
        {
            ProjectMemberClassDAL dal = new ProjectMemberClassDAL();
            dal.UpdateProjectMemberClass(projectMemberClass, ID);
        }

        public void DeleteProjectMemberClass(ProjectMemberClass projectMemberClass)
        {
            ProjectMemberClassDAL dal = new ProjectMemberClassDAL();
            dal.DeleteProjectMemberClass(projectMemberClass);
        }

        public IList GetAllProjectMemberClasss(string strHQL)
        {
            ProjectMemberClassDAL dal = new ProjectMemberClassDAL();
            return dal.GetAllProjectMemberClasss(strHQL);
        }
    }
}
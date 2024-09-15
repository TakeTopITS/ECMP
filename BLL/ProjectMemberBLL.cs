using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectMemberBLL
    {
        public void AddProjectMember(ProjectMember projectMember)
        {
            ProjectMemberDAL dal = new ProjectMemberDAL();
            dal.AddProjectMember(projectMember);
        }

        public void UpdateProjectMember(ProjectMember projectMember, string UserCode)
        {
            ProjectMemberDAL dal = new ProjectMemberDAL();
            dal.UpdateProjectMember(projectMember, UserCode);
        }

        public void DeleteProjectMember(ProjectMember projectMember)
        {
            ProjectMemberDAL dal = new ProjectMemberDAL();
            dal.DeleteProjectMember(projectMember);
        }

        public IList GetAllProjectMembers(string strHQL)
        {
            ProjectMemberDAL dal = new ProjectMemberDAL();
            return dal.GetAllProjectMembers(strHQL);
        }
    }
}
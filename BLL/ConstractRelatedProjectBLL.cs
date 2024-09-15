using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedProjectBLL
    {
        public void AddConstractRelatedProject(ConstractRelatedProject constractRelatedProject)
        {
            ConstractRelatedProjectDAL dal = new ConstractRelatedProjectDAL();
            dal.AddConstractRelatedProject(constractRelatedProject);
        }

        public void UpdateConstractRelatedProject(ConstractRelatedProject constractRelatedProject, int ID)
        {
            ConstractRelatedProjectDAL dal = new ConstractRelatedProjectDAL();
            dal.UpdateConstractRelatedProject(constractRelatedProject, ID);
        }

        public void DeleteConstractRelatedProject(ConstractRelatedProject constractRelatedProject)
        {
            ConstractRelatedProjectDAL dal = new ConstractRelatedProjectDAL();
            dal.DeleteConstractRelatedProject(constractRelatedProject);
        }

        public IList GetAllConstractRelatedProjects(string strHQL)
        {
            ConstractRelatedProjectDAL dal = new ConstractRelatedProjectDAL();
            return dal.GetAllConstractRelatedProjects(strHQL);
        }
    }
}
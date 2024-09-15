using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectRelatedItemBLL
    {
        public void AddProjectRelatedItem(ProjectRelatedItem projectRelatedItem)
        {
            ProjectRelatedItemDAL dal = new ProjectRelatedItemDAL();
            dal.AddProjectRelatedItem(projectRelatedItem);
        }

        public void UpdateProjectRelatedItem(ProjectRelatedItem projectRelatedItem, int ID)
        {
            ProjectRelatedItemDAL dal = new ProjectRelatedItemDAL();
            dal.UpdateProjectRelatedItem(projectRelatedItem, ID);
        }

        public void DeleteProjectRelatedItem(ProjectRelatedItem projectRelatedItem)
        {
            ProjectRelatedItemDAL dal = new ProjectRelatedItemDAL();
            dal.DeleteProjectRelatedItem(projectRelatedItem);
        }

        public IList GetAllProjectRelatedItems(string strHQL)
        {
            ProjectRelatedItemDAL dal = new ProjectRelatedItemDAL();
            return dal.GetAllProjectRelatedItems(strHQL);
        }
    }
}
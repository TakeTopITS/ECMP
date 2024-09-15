using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectRelatedItemBomBLL
    {
        public void AddProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedProjectRelatedItemBom)
        {
            ProjectRelatedItemBomDAL dal = new ProjectRelatedItemBomDAL();
            dal.AddProjectRelatedItemBom(projectRelatedProjectRelatedItemBom);
        }

        public void UpdateProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedProjectRelatedItemBom, int ID)
        {
            ProjectRelatedItemBomDAL dal = new ProjectRelatedItemBomDAL();
            dal.UpdateProjectRelatedItemBom(projectRelatedProjectRelatedItemBom, ID);
        }

        public void DeleteProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedProjectRelatedItemBom)
        {
            ProjectRelatedItemBomDAL dal = new ProjectRelatedItemBomDAL();
            dal.DeleteProjectRelatedItemBom(projectRelatedProjectRelatedItemBom);
        }

        public IList GetAllProjectRelatedItemBoms(string strHQL)
        {
            ProjectRelatedItemBomDAL dal = new ProjectRelatedItemBomDAL();
            return dal.GetAllProjectRelatedItemBoms(strHQL);
        }
    }
}
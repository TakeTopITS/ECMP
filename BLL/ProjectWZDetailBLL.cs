using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectWZDetailBLL
    {
        public void AddProjectWZDetail(ProjectWZDetail projectWZDetail)
        {
            ProjectWZDetailDAL dal = new ProjectWZDetailDAL();
            dal.AddProjectWZDetail(projectWZDetail);
        }

        public void UpdateProjectWZDetail(ProjectWZDetail projectWZDetail, int ID)
        {
            ProjectWZDetailDAL dal = new ProjectWZDetailDAL();
            dal.UpdateProjectWZDetail(projectWZDetail, ID);
        }

        public void DeleteProjectWZDetail(ProjectWZDetail projectWZDetail)
        {
            ProjectWZDetailDAL dal = new ProjectWZDetailDAL();
            dal.DeleteProjectWZDetail(projectWZDetail);
        }

        public IList GetAllProjectWZDetails(string strHQL)
        {
            ProjectWZDetailDAL dal = new ProjectWZDetailDAL();
            return dal.GetAllProjectWZDetails(strHQL);
        }
    }
}
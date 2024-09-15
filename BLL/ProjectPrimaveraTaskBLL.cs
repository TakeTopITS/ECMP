using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectPrimaveraTaskBLL
    {
        public void AddProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask)
        {
            ProjectPrimaveraTaskDAL dal = new ProjectPrimaveraTaskDAL();
            dal.AddProjectPrimaveraTask(projectPrimaveraTask);
        }

        public void UpdateProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask, int ID)
        {
            ProjectPrimaveraTaskDAL dal = new ProjectPrimaveraTaskDAL();
            dal.UpdateProjectPrimaveraTask(projectPrimaveraTask, ID);
        }

        public void DeleteProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask)
        {
            ProjectPrimaveraTaskDAL dal = new ProjectPrimaveraTaskDAL();
            dal.DeleteProjectPrimaveraTask(projectPrimaveraTask);
        }

        public IList GetAllProjectPrimaveraTasks(string strHQL)
        {
            ProjectPrimaveraTaskDAL dal = new ProjectPrimaveraTaskDAL();
            return dal.GetAllProjectPrimaveraTasks(strHQL);
        }
    }
}
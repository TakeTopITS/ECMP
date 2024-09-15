using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectDailyWorkBLL
    {
        public void AddProjectDailyWork(ProjectDailyWork projectDailyWork)
        {
            ProjectDailyWorkDAL dal = new ProjectDailyWorkDAL();
            dal.AddProjectDailyWork(projectDailyWork);
        }

        public void UpdateProjectDailyWork(ProjectDailyWork projectDailyWork, int WorkID)
        {
            ProjectDailyWorkDAL dal = new ProjectDailyWorkDAL();
            dal.UpdateProjectDailyWork(projectDailyWork, WorkID);
        }

        public void DeleteProjectDailyWork(ProjectDailyWork projectDailyWork)
        {
            ProjectDailyWorkDAL dal = new ProjectDailyWorkDAL();
            dal.DeleteProjectDailyWork(projectDailyWork);
        }

        public IList GetAllProjectDailyWorks(string strHQL)
        {
            ProjectDailyWorkDAL dal = new ProjectDailyWorkDAL();
            return dal.GetAllProjectDailyWorks(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectDailyWorkDAL
    {
        private EntityControl control;

        public ProjectDailyWorkDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectDailyWork(ProjectDailyWork projectDailyWork)
        {
            control.AddEntity(projectDailyWork);
        }

        public void UpdateProjectDailyWork(ProjectDailyWork projectDailyWork, int WorkID)
        {
            control.UpdateEntity(projectDailyWork, WorkID);
        }

        public void DeleteProjectDailyWork(ProjectDailyWork projectDailyWork)
        {
            control.DeleteEntity(projectDailyWork);
        }

        public IList GetAllProjectDailyWorks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectTaskDAL
    {
        private EntityControl control;

        public ProjectTaskDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectTask(ProjectTask projectTask)
        {
            control.AddEntity(projectTask);
        }

        public void UpdateProjectTask(ProjectTask projectTask, int TaskID)
        {
            control.UpdateEntity(projectTask, TaskID);
        }

        public void DeleteProjectTask(ProjectTask projectTask)
        {
            control.DeleteEntity(projectTask);
        }

        public IList GetAllProjectTasks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
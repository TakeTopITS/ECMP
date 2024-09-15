using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectPrimaveraTaskDAL
    {
        private EntityControl control;

        public ProjectPrimaveraTaskDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask)
        {
            control.AddEntity(projectPrimaveraTask);
        }

        public void UpdateProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask, int ID)
        {
            control.UpdateEntity(projectPrimaveraTask, ID);
        }

        public void DeleteProjectPrimaveraTask(ProjectPrimaveraTask projectPrimaveraTask)
        {
            control.DeleteEntity(projectPrimaveraTask);
        }

        public IList GetAllProjectPrimaveraTasks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
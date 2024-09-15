using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskStatusDAL
    {
        private EntityControl control;

        public TaskStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskStatus(TaskStatus taskStatus)
        {
            control.AddEntity(taskStatus);
        }

        public void UpdateTaskStatus(TaskStatus taskStatus, string Status)
        {
            control.UpdateEntity(taskStatus, Status);
        }

        public void DeleteTaskStatus(TaskStatus taskStatus)
        {
            control.DeleteEntity(taskStatus);
        }

        public IList GetAllTaskStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
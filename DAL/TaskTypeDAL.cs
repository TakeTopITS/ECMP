using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskTypeDAL
    {
        private EntityControl control;

        public TaskTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskType(TaskType taskType)
        {
            control.AddEntity(taskType);
        }

        public void UpdateTaskType(TaskType taskType, string Type)
        {
            control.UpdateEntity(taskType, Type);
        }

        public void DeleteTaskType(TaskType taskType)
        {
            control.DeleteEntity(taskType);
        }

        public IList GetAllTaskTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
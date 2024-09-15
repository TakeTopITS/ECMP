using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskOperationDAL
    {
        private EntityControl control;

        public TaskOperationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskOperation(TaskOperation taskOperation)
        {
            control.AddEntity(taskOperation);
        }

        public void UpdateTaskOperation(TaskOperation taskOperation, string Operation)
        {
            control.UpdateEntity(taskOperation, Operation);
        }

        public void DeleteTaskOperation(TaskOperation taskOperation)
        {
            control.DeleteEntity(taskOperation);
        }

        public IList GetAllTaskOperations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
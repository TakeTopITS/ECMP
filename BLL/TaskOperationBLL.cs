using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskOperationBLL
    {
        public void AddTaskOperation(TaskOperation taskOperation)
        {
            TaskOperationDAL dal = new TaskOperationDAL();
            dal.AddTaskOperation(taskOperation);
        }

        public void UpdateTaskOperation(TaskOperation taskOperation, string Operation)
        {
            TaskOperationDAL dal = new TaskOperationDAL();
            dal.UpdateTaskOperation(taskOperation, Operation);
        }

        public void DeleteTaskOperation(TaskOperation taskOperation)
        {
            TaskOperationDAL dal = new TaskOperationDAL();
            dal.DeleteTaskOperation(taskOperation);
        }

        public IList GetAllTaskOperations(string strHQL)
        {
            TaskOperationDAL dal = new TaskOperationDAL();
            return dal.GetAllTaskOperations(strHQL);
        }
    }
}
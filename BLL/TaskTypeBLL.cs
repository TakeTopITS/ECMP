using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskTypeBLL
    {
        public void AddTaskType(TaskType taskType)
        {
            TaskTypeDAL dal = new TaskTypeDAL();
            dal.AddTaskType(taskType);
        }

        public void UpdateTaskType(TaskType taskType, string Type)
        {
            TaskTypeDAL dal = new TaskTypeDAL();
            dal.UpdateTaskType(taskType, Type);
        }

        public void DeleteTaskType(TaskType taskType)
        {
            TaskTypeDAL dal = new TaskTypeDAL();
            dal.DeleteTaskType(taskType);
        }

        public IList GetAllTaskTypes(string strHQL)
        {
            TaskTypeDAL dal = new TaskTypeDAL();
            return dal.GetAllTaskTypes(strHQL);
        }
    }
}
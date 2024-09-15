using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskStatusBLL
    {
        public void AddTaskStatus(TaskStatus taskStatus)
        {
            TaskStatusDAL dal = new TaskStatusDAL();
            dal.AddTaskStatus(taskStatus);
        }

        public void UpdateTaskStatus(TaskStatus taskStatus, string Status)
        {
            TaskStatusDAL dal = new TaskStatusDAL();
            dal.UpdateTaskStatus(taskStatus, Status);
        }

        public void DeleteTaskStatus(TaskStatus taskStatus)
        {
            TaskStatusDAL dal = new TaskStatusDAL();
            dal.DeleteTaskStatus(taskStatus);
        }

        public IList GetAllTaskStatuss(string strHQL)
        {
            TaskStatusDAL dal = new TaskStatusDAL();
            return dal.GetAllTaskStatuss(strHQL);
        }
    }
}
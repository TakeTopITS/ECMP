using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskRecordTypeBLL
    {
        public void AddTaskRecordType(TaskRecordType taskRecordType)
        {
            TaskRecordTypeDAL dal = new TaskRecordTypeDAL();
            dal.AddTaskRecordType(taskRecordType);
        }

        public void UpdateTaskRecordType(TaskRecordType taskRecordType, string Type)
        {
            TaskRecordTypeDAL dal = new TaskRecordTypeDAL();
            dal.UpdateTaskRecordType(taskRecordType, Type);
        }

        public void DeleteTaskRecordType(TaskRecordType taskRecordType)
        {
            TaskRecordTypeDAL dal = new TaskRecordTypeDAL();
            dal.DeleteTaskRecordType(taskRecordType);
        }

        public IList GetAllTaskRecordTypes(string strHQL)
        {
            TaskRecordTypeDAL dal = new TaskRecordTypeDAL();
            return dal.GetAllTaskRecordTypes(strHQL);
        }
    }
}
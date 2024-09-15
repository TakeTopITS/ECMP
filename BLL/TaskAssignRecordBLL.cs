using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskAssignRecordBLL
    {
        public void AddTaskAssignRecord(TaskAssignRecord taskAssignRecord)
        {
            TaskAssignRecordDAL dal = new TaskAssignRecordDAL();
            dal.AddTaskAssignRecord(taskAssignRecord);
        }

        public void UpdateTaskAssignRecord(TaskAssignRecord taskAssignRecord, int ID)
        {
            TaskAssignRecordDAL dal = new TaskAssignRecordDAL();
            dal.UpdateTaskAssignRecord(taskAssignRecord, ID);
        }

        public void DeleteTaskAssignRecord(TaskAssignRecord taskAssignRecord)
        {
            TaskAssignRecordDAL dal = new TaskAssignRecordDAL();
            dal.DeleteTaskAssignRecord(taskAssignRecord);
        }

        public IList GetAllTaskAssignRecords(string strHQL)
        {
            TaskAssignRecordDAL dal = new TaskAssignRecordDAL();
            return dal.GetAllTaskAssignRecords(strHQL);
        }
    }
}
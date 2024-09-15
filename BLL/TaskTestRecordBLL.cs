using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskTestRecordBLL
    {
        public void AddTaskTestRecord(TaskTestRecord taskTestRecord)
        {
            TaskTestRecordDAL dal = new TaskTestRecordDAL();
            dal.AddTaskTestRecord(taskTestRecord);
        }

        public void UpdateTaskTestRecord(TaskTestRecord taskTestRecord, int ID)
        {
            TaskTestRecordDAL dal = new TaskTestRecordDAL();
            dal.UpdateTaskTestRecord(taskTestRecord, ID);
        }

        public void DeleteTaskTestRecord(TaskTestRecord taskTestRecord)
        {
            TaskTestRecordDAL dal = new TaskTestRecordDAL();
            dal.DeleteTaskTestRecord(taskTestRecord);
        }

        public IList GetAllTaskTestRecords(string strHQL)
        {
            TaskTestRecordDAL dal = new TaskTestRecordDAL();
            return dal.GetAllTaskTestRecords(strHQL);
        }
    }
}
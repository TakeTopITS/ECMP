using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskTestRecordDAL
    {
        private EntityControl control;

        public TaskTestRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskTestRecord(TaskTestRecord taskTestRecord)
        {
            control.AddEntity(taskTestRecord);
        }

        public void UpdateTaskTestRecord(TaskTestRecord taskTestRecord, int ID)
        {
            control.UpdateEntity(taskTestRecord, ID);
        }

        public void DeleteTaskTestRecord(TaskTestRecord taskTestRecord)
        {
            control.DeleteEntity(taskTestRecord);
        }

        public IList GetAllTaskTestRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskAssignRecordDAL
    {
        private EntityControl control;

        public TaskAssignRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskAssignRecord(TaskAssignRecord taskAssignRecord)
        {
            control.AddEntity(taskAssignRecord);
        }

        public void UpdateTaskAssignRecord(TaskAssignRecord taskAssignRecord, int ID)
        {
            control.UpdateEntity(taskAssignRecord, ID);
        }

        public void DeleteTaskAssignRecord(TaskAssignRecord taskAssignRecord)
        {
            control.DeleteEntity(taskAssignRecord);
        }

        public IList GetAllTaskAssignRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
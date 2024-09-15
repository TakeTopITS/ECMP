using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskRecordTypeDAL
    {
        private EntityControl control;

        public TaskRecordTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskRecordType(TaskRecordType taskRecordType)
        {
            control.AddEntity(taskRecordType);
        }

        public void UpdateTaskRecordType(TaskRecordType taskRecordType, string Type)
        {
            control.UpdateEntity(taskRecordType, Type);
        }

        public void DeleteTaskRecordType(TaskRecordType taskRecordType)
        {
            control.DeleteEntity(taskRecordType);
        }

        public IList GetAllTaskRecordTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TaskTestCaseDAL
    {
        private EntityControl control;

        public TaskTestCaseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTaskTestCase(TaskTestCase taskTestCase)
        {
            control.AddEntity(taskTestCase);
        }

        public void UpdateTaskTestCase(TaskTestCase taskTestCase, int ID)
        {
            control.UpdateEntity(taskTestCase, ID);
        }

        public void DeleteTaskTestCase(TaskTestCase taskTestCase)
        {
            control.DeleteEntity(taskTestCase);
        }

        public IList GetAllTaskTestCases(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
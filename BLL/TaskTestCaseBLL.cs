using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TaskTestCaseBLL
    {
        public void AddTaskTestCase(TaskTestCase taskTestCase)
        {
            TaskTestCaseDAL dal = new TaskTestCaseDAL();
            dal.AddTaskTestCase(taskTestCase);
        }

        public void UpdateTaskTestCase(TaskTestCase taskTestCase, int ID)
        {
            TaskTestCaseDAL dal = new TaskTestCaseDAL();
            dal.UpdateTaskTestCase(taskTestCase, ID);
        }

        public void DeleteTaskTestCase(TaskTestCase taskTestCase)
        {
            TaskTestCaseDAL dal = new TaskTestCaseDAL();
            dal.DeleteTaskTestCase(taskTestCase);
        }

        public IList GetAllTaskTestCases(string strHQL)
        {
            TaskTestCaseDAL dal = new TaskTestCaseDAL();
            return dal.GetAllTaskTestCases(strHQL);
        }
    }
}
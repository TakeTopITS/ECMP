using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TestStatusDAL
    {
        private EntityControl control;

        public TestStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTestStatus(TestStatus testStatus)
        {
            control.AddEntity(testStatus);
        }

        public void UpdateTestStatus(TestStatus testStatus, string Status)
        {
            control.UpdateEntity(testStatus, Status);
        }

        public void DeleteTestStatus(TestStatus testStatus)
        {
            control.DeleteEntity(testStatus);
        }

        public IList GetAllTestStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TestStatusBLL
    {
        public void AddTestStatus(TestStatus testStatus)
        {
            TestStatusDAL dal = new TestStatusDAL();
            dal.AddTestStatus(testStatus);
        }

        public void UpdateTestStatus(TestStatus testStatus, string Status)
        {
            TestStatusDAL dal = new TestStatusDAL();
            dal.UpdateTestStatus(testStatus, Status);
        }

        public void DeleteTestStatus(TestStatus testStatus)
        {
            TestStatusDAL dal = new TestStatusDAL();
            dal.DeleteTestStatus(testStatus);
        }

        public IList GetAllTestStatuss(string strHQL)
        {
            TestStatusDAL dal = new TestStatusDAL();
            return dal.GetAllTestStatuss(strHQL);
        }
    }
}
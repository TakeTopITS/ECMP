using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEHealthCheckBLL
    {
        public void AddHSEHealthCheck(HSEHealthCheck hSEHealthCheck)
        {
            HSEHealthCheckDAL dal = new HSEHealthCheckDAL();
            dal.AddHSEHealthCheck(hSEHealthCheck);
        }

        public void UpdateHSEHealthCheck(HSEHealthCheck hSEHealthCheck, string Code)
        {
            HSEHealthCheckDAL dal = new HSEHealthCheckDAL();
            dal.UpdateHSEHealthCheck(hSEHealthCheck, Code);
        }

        public void DeleteHSEHealthCheck(HSEHealthCheck hSEHealthCheck)
        {
            HSEHealthCheckDAL dal = new HSEHealthCheckDAL();
            dal.DeleteHSEHealthCheck(hSEHealthCheck);
        }

        public IList GetAllHSEHealthChecks(string strHQL)
        {
            HSEHealthCheckDAL dal = new HSEHealthCheckDAL();
            return dal.GetAllHSEHealthChecks(strHQL);
        }
    }
}
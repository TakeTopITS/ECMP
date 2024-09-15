using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SystemAnalystChartManagementBLL
    {
        public void AddSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement)
        {
            SystemAnalystChartManagementDAL dal = new SystemAnalystChartManagementDAL();
            dal.AddSystemAnalystChartManagement(systemAnalystChartManagement);
        }

        public void UpdateSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement, int ID)
        {
            SystemAnalystChartManagementDAL dal = new SystemAnalystChartManagementDAL();
            dal.UpdateSystemAnalystChartManagement(systemAnalystChartManagement, ID);
        }

        public void DeleteSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement)
        {
            SystemAnalystChartManagementDAL dal = new SystemAnalystChartManagementDAL();
            dal.DeleteSystemAnalystChartManagement(systemAnalystChartManagement);
        }

        public IList GetAllSystemAnalystChartManagements(string strHQL)
        {
            SystemAnalystChartManagementDAL dal = new SystemAnalystChartManagementDAL();
            return dal.GetAllSystemAnalystChartManagements(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SystemAnalystChartManagementDAL
    {
        private EntityControl control;

        public SystemAnalystChartManagementDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement)
        {
            control.AddEntity(systemAnalystChartManagement);
        }

        public void UpdateSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement, int ID)
        {
            control.UpdateEntity(systemAnalystChartManagement, ID);
        }

        public void DeleteSystemAnalystChartManagement(SystemAnalystChartManagement systemAnalystChartManagement)
        {
            control.DeleteEntity(systemAnalystChartManagement);
        }

        public IList GetAllSystemAnalystChartManagements(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
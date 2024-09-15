using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostPreformanceTypeDAL
    {
        private EntityControl control;

        public RCJProjectCostPreformanceTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectCostPreformanceType(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
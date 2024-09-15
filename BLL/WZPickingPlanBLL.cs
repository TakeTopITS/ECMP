using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPickingPlanBLL
    {
        public void AddWZPickingPlan(WZPickingPlan wZPickingPlan)
        {
            WZPickingPlanDAL dal = new WZPickingPlanDAL();
            dal.AddWZPickingPlan(wZPickingPlan);
        }

        public void UpdateWZPickingPlan(WZPickingPlan wZPickingPlan, string strPlanCode)
        {
            WZPickingPlanDAL dal = new WZPickingPlanDAL();
            dal.UpdateWZPickingPlan(wZPickingPlan, strPlanCode);
        }

        public void DeleteWZPickingPlan(WZPickingPlan wZPickingPlan)
        {
            WZPickingPlanDAL dal = new WZPickingPlanDAL();
            dal.DeleteWZPickingPlan(wZPickingPlan);
        }

        public IList GetAllWZPickingPlans(string strHQL)
        {
            WZPickingPlanDAL dal = new WZPickingPlanDAL();
            return dal.GetAllWZPickingPlans(strHQL);
        }
    }
}
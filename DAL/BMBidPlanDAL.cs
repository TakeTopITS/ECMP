using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标计划
    /// </summary>
    public class BMBidPlanDAL
    {
        private EntityControl control;

        public BMBidPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMBidPlan(BMBidPlan bMBidPlan)
        {
            control.AddEntity(bMBidPlan);
        }

        public void UpdateBMBidPlan(BMBidPlan bMBidPlan, int ID)
        {
            control.UpdateEntity(bMBidPlan, ID);
        }

        public void DeleteBMBidPlan(BMBidPlan bMBidPlan)
        {
            control.DeleteEntity(bMBidPlan);
        }

        public IList GetAllBMBidPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
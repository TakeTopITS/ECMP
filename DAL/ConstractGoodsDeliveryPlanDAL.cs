using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractGoodsDeliveryPlanDAL
    {
        private EntityControl control;

        public ConstractGoodsDeliveryPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan)
        {
            control.AddEntity(constractGoodsDeliveryPlan);
        }

        public void UpdateConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan, int ID)
        {
            control.UpdateEntity(constractGoodsDeliveryPlan, ID);
        }

        public void DeleteConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan)
        {
            control.DeleteEntity(constractGoodsDeliveryPlan);
        }

        public IList GetAllConstractGoodsDeliveryPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
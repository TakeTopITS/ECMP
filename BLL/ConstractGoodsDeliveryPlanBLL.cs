using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractGoodsDeliveryPlanBLL
    {
        public void AddConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan)
        {
            ConstractGoodsDeliveryPlanDAL dal = new ConstractGoodsDeliveryPlanDAL();
            dal.AddConstractGoodsDeliveryPlan(constractGoodsDeliveryPlan);
        }

        public void UpdateConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan, int ID)
        {
            ConstractGoodsDeliveryPlanDAL dal = new ConstractGoodsDeliveryPlanDAL();
            dal.UpdateConstractGoodsDeliveryPlan(constractGoodsDeliveryPlan, ID);
        }

        public void DeleteConstractGoodsDeliveryPlan(ConstractGoodsDeliveryPlan constractGoodsDeliveryPlan)
        {
            ConstractGoodsDeliveryPlanDAL dal = new ConstractGoodsDeliveryPlanDAL();
            dal.DeleteConstractGoodsDeliveryPlan(constractGoodsDeliveryPlan);
        }

        public IList GetAllConstractGoodsDeliveryPlans(string strHQL)
        {
            ConstractGoodsDeliveryPlanDAL dal = new ConstractGoodsDeliveryPlanDAL();
            return dal.GetAllConstractGoodsDeliveryPlans(strHQL);
        }
    }
}
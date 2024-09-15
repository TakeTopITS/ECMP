using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractGoodsReceiptPlanDAL
    {
        private EntityControl control;

        public ConstractGoodsReceiptPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan)
        {
            control.AddEntity(constractGoodsReceiptPlan);
        }

        public void UpdateConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan, int ID)
        {
            control.UpdateEntity(constractGoodsReceiptPlan, ID);
        }

        public void DeleteConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan)
        {
            control.DeleteEntity(constractGoodsReceiptPlan);
        }

        public IList GetAllConstractGoodsReceiptPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractGoodsReceiptPlanBLL
    {
        public void AddConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan)
        {
            ConstractGoodsReceiptPlanDAL dal = new ConstractGoodsReceiptPlanDAL();
            dal.AddConstractGoodsReceiptPlan(constractGoodsReceiptPlan);
        }

        public void UpdateConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan, int ID)
        {
            ConstractGoodsReceiptPlanDAL dal = new ConstractGoodsReceiptPlanDAL();
            dal.UpdateConstractGoodsReceiptPlan(constractGoodsReceiptPlan, ID);
        }

        public void DeleteConstractGoodsReceiptPlan(ConstractGoodsReceiptPlan constractGoodsReceiptPlan)
        {
            ConstractGoodsReceiptPlanDAL dal = new ConstractGoodsReceiptPlanDAL();
            dal.DeleteConstractGoodsReceiptPlan(constractGoodsReceiptPlan);
        }

        public IList GetAllConstractGoodsReceiptPlans(string strHQL)
        {
            ConstractGoodsReceiptPlanDAL dal = new ConstractGoodsReceiptPlanDAL();
            return dal.GetAllConstractGoodsReceiptPlans(strHQL);
        }
    }
}
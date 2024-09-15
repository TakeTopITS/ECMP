using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemMainPlanBLL
    {
        public void AddItemMainPlan(ItemMainPlan itemMainPlan)
        {
            ItemMainPlanDAL dal = new ItemMainPlanDAL();
            dal.AddItemMainPlan(itemMainPlan);
        }

        public void UpdateItemMainPlan(ItemMainPlan itemMainPlan, int PlanVerID)
        {
            ItemMainPlanDAL dal = new ItemMainPlanDAL();
            dal.UpdateItemMainPlan(itemMainPlan, PlanVerID);
        }

        public void DeleteItemMainPlan(ItemMainPlan itemMainPlan)
        {
            ItemMainPlanDAL dal = new ItemMainPlanDAL();
            dal.DeleteItemMainPlan(itemMainPlan);
        }

        public IList GetAllItemMainPlans(string strHQL)
        {
            ItemMainPlanDAL dal = new ItemMainPlanDAL();
            return dal.GetAllItemMainPlans(strHQL);
        }
    }
}
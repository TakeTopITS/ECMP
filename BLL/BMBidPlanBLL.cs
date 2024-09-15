using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标计划
    /// </summary>
    public class BMBidPlanBLL
    {
        public void AddBMBidPlan(BMBidPlan bMBidPlan)
        {
            BMBidPlanDAL dal = new BMBidPlanDAL();
            dal.AddBMBidPlan(bMBidPlan);
        }

        public void UpdateBMBidPlan(BMBidPlan bMBidPlan, int ID)
        {
            BMBidPlanDAL dal = new BMBidPlanDAL();
            dal.UpdateBMBidPlan(bMBidPlan, ID);
        }

        public void DeleteBMBidPlan(BMBidPlan bMBidPlan)
        {
            BMBidPlanDAL dal = new BMBidPlanDAL();
            dal.DeleteBMBidPlan(bMBidPlan);
        }

        public IList GetAllBMBidPlans(string strHQL)
        {
            BMBidPlanDAL dal = new BMBidPlanDAL();
            return dal.GetAllBMBidPlans(strHQL);
        }
    }
}
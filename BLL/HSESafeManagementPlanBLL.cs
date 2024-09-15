using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 安全管理方案
    /// </summary>
    public class HSESafeManagementPlanBLL
    {
        public void AddHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan)
        {
            HSESafeManagementPlanDAL dal = new HSESafeManagementPlanDAL();
            dal.AddHSESafeManagementPlan(hSESafeManagementPlan);
        }

        public void UpdateHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan, string Code)
        {
            HSESafeManagementPlanDAL dal = new HSESafeManagementPlanDAL();
            dal.UpdateHSESafeManagementPlan(hSESafeManagementPlan, Code);
        }

        public void DeleteHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan)
        {
            HSESafeManagementPlanDAL dal = new HSESafeManagementPlanDAL();
            dal.DeleteHSESafeManagementPlan(hSESafeManagementPlan);
        }

        public IList GetAllHSESafeManagementPlans(string strHQL)
        {
            HSESafeManagementPlanDAL dal = new HSESafeManagementPlanDAL();
            return dal.GetAllHSESafeManagementPlans(strHQL);
        }
    }
}
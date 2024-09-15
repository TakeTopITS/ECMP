using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 安全管理方案
    /// </summary>
    public class HSESafeManagementPlanDAL
    {
        private EntityControl control;

        public HSESafeManagementPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan)
        {
            control.AddEntity(hSESafeManagementPlan);
        }

        public void UpdateHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan, string Code)
        {
            control.UpdateEntity(hSESafeManagementPlan, Code);
        }

        public void DeleteHSESafeManagementPlan(HSESafeManagementPlan hSESafeManagementPlan)
        {
            control.DeleteEntity(hSESafeManagementPlan);
        }

        public IList GetAllHSESafeManagementPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
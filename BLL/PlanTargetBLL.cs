using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanTargetBLL
    {
        public void AddPlanTarget(PlanTarget planTarget)
        {
            PlanTargetDAL dal = new PlanTargetDAL();
            dal.AddPlanTarget(planTarget);
        }

        public void UpdatePlanTarget(PlanTarget planTarget, int ID)
        {
            PlanTargetDAL dal = new PlanTargetDAL();
            dal.UpdatePlanTarget(planTarget, ID);
        }

        public void DeletePlanTarget(PlanTarget planTarget)
        {
            PlanTargetDAL dal = new PlanTargetDAL();
            dal.DeletePlanTarget(planTarget);
        }

        public IList GetAllPlanTargets(string strHQL)
        {
            PlanTargetDAL dal = new PlanTargetDAL();
            return dal.GetAllPlanTargets(strHQL);
        }
    }
}
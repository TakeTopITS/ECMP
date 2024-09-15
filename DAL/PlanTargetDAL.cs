using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanTargetDAL
    {
        private EntityControl control;

        public PlanTargetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanTarget(PlanTarget planTarget)
        {
            control.AddEntity(planTarget);
        }

        public void UpdatePlanTarget(PlanTarget planTarget, int ID)
        {
            control.UpdateEntity(planTarget, ID);
        }

        public void DeletePlanTarget(PlanTarget planTarget)
        {
            control.DeleteEntity(planTarget);
        }

        public IList GetAllPlanTargets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
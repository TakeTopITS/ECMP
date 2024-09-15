using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanWorkLogDAL
    {
        private EntityControl control;

        public PlanWorkLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanWorkLog(PlanWorkLog planWorkLog)
        {
            control.AddEntity(planWorkLog);
        }

        public void UpdatePlanWorkLog(PlanWorkLog planWorkLog, int ID)
        {
            control.UpdateEntity(planWorkLog, ID);
        }

        public void DeletePlanWorkLog(PlanWorkLog planWorkLog)
        {
            control.DeleteEntity(planWorkLog);
        }

        public IList GetAllPlanWorkLogs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
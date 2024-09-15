using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanMemberDAL
    {
        private EntityControl control;

        public PlanMemberDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanMember(PlanMember planMember)
        {
            control.AddEntity(planMember);
        }

        public void UpdatePlanMember(PlanMember planMember, int ID)
        {
            control.UpdateEntity(planMember, ID);
        }

        public void DeletePlanMember(PlanMember planMember)
        {
            control.DeleteEntity(planMember);
        }

        public IList GetAllPlanMembers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
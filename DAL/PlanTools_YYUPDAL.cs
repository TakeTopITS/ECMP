using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanTools_YYUPDAL
    {
        private EntityControl control;

        public PlanTools_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanTools_YYUP(PlanTools_YYUP planTools_YYUP)
        {
            control.AddEntity(planTools_YYUP);
        }

        public void UpdatePlanTools_YYUP(PlanTools_YYUP planTools_YYUP, int ID)
        {
            control.UpdateEntity(planTools_YYUP, ID);
        }

        public void DeletePlanTools_YYUP(PlanTools_YYUP planTools_YYUP)
        {
            control.DeleteEntity(planTools_YYUP);
        }

        public IList GetAllPlanTools_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
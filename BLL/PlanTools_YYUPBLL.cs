using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanTools_YYUPBLL
    {
        public void AddPlanTools_YYUP(PlanTools_YYUP planTools_YYUP)
        {
            PlanTools_YYUPDAL dal = new PlanTools_YYUPDAL();
            dal.AddPlanTools_YYUP(planTools_YYUP);
        }

        public void UpdatePlanTools_YYUP(PlanTools_YYUP planTools_YYUP, int ID)
        {
            PlanTools_YYUPDAL dal = new PlanTools_YYUPDAL();
            dal.UpdatePlanTools_YYUP(planTools_YYUP, ID);
        }

        public void DeletePlanTools_YYUP(PlanTools_YYUP planTools_YYUP)
        {
            PlanTools_YYUPDAL dal = new PlanTools_YYUPDAL();
            dal.DeletePlanTools_YYUP(planTools_YYUP);
        }

        public IList GetAllPlanTools_YYUPs(string strHQL)
        {
            PlanTools_YYUPDAL dal = new PlanTools_YYUPDAL();
            return dal.GetAllPlanTools_YYUPs(strHQL);
        }
    }
}
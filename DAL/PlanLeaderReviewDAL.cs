using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanLeaderReviewDAL
    {
        private EntityControl control;

        public PlanLeaderReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanLeaderReview(PlanLeaderReview planLeaderReview)
        {
            control.AddEntity(planLeaderReview);
        }

        public void UpdatePlanLeaderReview(PlanLeaderReview planLeaderReview, int ID)
        {
            control.UpdateEntity(planLeaderReview, ID);
        }

        public void DeletePlanLeaderReview(PlanLeaderReview planLeaderReview)
        {
            control.DeleteEntity(planLeaderReview);
        }

        public IList GetAllPlanLeaderReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanLeaderReviewBLL
    {
        public void AddPlanLeaderReview(PlanLeaderReview planLeaderReview)
        {
            PlanLeaderReviewDAL dal = new PlanLeaderReviewDAL();
            dal.AddPlanLeaderReview(planLeaderReview);
        }

        public void UpdatePlanLeaderReview(PlanLeaderReview planLeaderReview, int ID)
        {
            PlanLeaderReviewDAL dal = new PlanLeaderReviewDAL();
            dal.UpdatePlanLeaderReview(planLeaderReview, ID);
        }

        public void DeletePlanLeaderReview(PlanLeaderReview planLeaderReview)
        {
            PlanLeaderReviewDAL dal = new PlanLeaderReviewDAL();
            dal.DeletePlanLeaderReview(planLeaderReview);
        }

        public IList GetAllPlanLeaderReviews(string strHQL)
        {
            PlanLeaderReviewDAL dal = new PlanLeaderReviewDAL();
            return dal.GetAllPlanLeaderReviews(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProLeaderReviewBLL
    {
        public void AddProLeaderReview(ProLeaderReview proLeaderReview)
        {
            ProLeaderReviewDAL dal = new ProLeaderReviewDAL();
            dal.AddProLeaderReview(proLeaderReview);
        }

        public void UpdateProLeaderReview(ProLeaderReview proLeaderReview, int ID)
        {
            ProLeaderReviewDAL dal = new ProLeaderReviewDAL();
            dal.UpdateProLeaderReview(proLeaderReview, ID);
        }

        public void DeleteProLeaderReview(ProLeaderReview proLeaderReview)
        {
            ProLeaderReviewDAL dal = new ProLeaderReviewDAL();
            dal.DeleteProLeaderReview(proLeaderReview);
        }

        public IList GetAllProLeaderReviews(string strHQL)
        {
            ProLeaderReviewDAL dal = new ProLeaderReviewDAL();
            return dal.GetAllProLeaderReviews(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPILeaderReviewBLL
    {
        public void AddKPILeaderReview(KPILeaderReview kpiLeaderReview)
        {
            KPILeaderReviewDAL dal = new KPILeaderReviewDAL();
            dal.AddKPILeaderReview(kpiLeaderReview);
        }

        public void UpdateKPILeaderReview(KPILeaderReview kpiLeaderReview, int ID)
        {
            KPILeaderReviewDAL dal = new KPILeaderReviewDAL();
            dal.UpdateKPILeaderReview(kpiLeaderReview, ID);
        }

        public void DeleteKPILeaderReview(KPILeaderReview kpiLeaderReview)
        {
            KPILeaderReviewDAL dal = new KPILeaderReviewDAL();
            dal.DeleteKPILeaderReview(kpiLeaderReview);
        }

        public IList GetAllKPILeaderReviews(string strHQL)
        {
            KPILeaderReviewDAL dal = new KPILeaderReviewDAL();
            return dal.GetAllKPILeaderReviews(strHQL);
        }
    }
}
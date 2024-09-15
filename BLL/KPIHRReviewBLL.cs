using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPIHRReviewBLL
    {
        public void AddKPIHRReview(KPIHRReview kpiHRReview)
        {
            KPIHRReviewDAL dal = new KPIHRReviewDAL();
            dal.AddKPIHRReview(kpiHRReview);
        }

        public void UpdateKPIHRReview(KPIHRReview kpiHRReview, int ID)
        {
            KPIHRReviewDAL dal = new KPIHRReviewDAL();
            dal.UpdateKPIHRReview(kpiHRReview, ID);
        }

        public void DeleteKPIHRReview(KPIHRReview kpiHRReview)
        {
            KPIHRReviewDAL dal = new KPIHRReviewDAL();
            dal.DeleteKPIHRReview(kpiHRReview);
        }

        public IList GetAllKPIHRReviews(string strHQL)
        {
            KPIHRReviewDAL dal = new KPIHRReviewDAL();
            return dal.GetAllKPIHRReviews(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPIThirdPartReviewBLL
    {
        public void AddKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview)
        {
            KPIThirdPartReviewDAL dal = new KPIThirdPartReviewDAL();
            dal.AddKPIThirdPartReview(kpiThirdPartReview);
        }

        public void UpdateKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview, int ID)
        {
            KPIThirdPartReviewDAL dal = new KPIThirdPartReviewDAL();
            dal.UpdateKPIThirdPartReview(kpiThirdPartReview, ID);
        }

        public void DeleteKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview)
        {
            KPIThirdPartReviewDAL dal = new KPIThirdPartReviewDAL();
            dal.DeleteKPIThirdPartReview(kpiThirdPartReview);
        }

        public IList GetAllKPIThirdPartReviews(string strHQL)
        {
            KPIThirdPartReviewDAL dal = new KPIThirdPartReviewDAL();
            return dal.GetAllKPIThirdPartReviews(strHQL);
        }
    }
}
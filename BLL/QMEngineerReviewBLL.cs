using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMEngineerReviewBLL
    {
        public void AddQMEngineerReview(QMEngineerReview qMEngineerReview)
        {
            QMEngineerReviewDAL dal = new QMEngineerReviewDAL();
            dal.AddQMEngineerReview(qMEngineerReview);
        }

        public void UpdateQMEngineerReview(QMEngineerReview qMEngineerReview, string Code)
        {
            QMEngineerReviewDAL dal = new QMEngineerReviewDAL();
            dal.UpdateQMEngineerReview(qMEngineerReview, Code);
        }

        public void DeleteQMEngineerReview(QMEngineerReview qMEngineerReview)
        {
            QMEngineerReviewDAL dal = new QMEngineerReviewDAL();
            dal.DeleteQMEngineerReview(qMEngineerReview);
        }

        public IList GetAllQMEngineerReviews(string strHQL)
        {
            QMEngineerReviewDAL dal = new QMEngineerReviewDAL();
            return dal.GetAllQMEngineerReviews(strHQL);
        }
    }
}
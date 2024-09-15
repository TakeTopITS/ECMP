using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMEngineerReviewDAL
    {
        private EntityControl control;

        public QMEngineerReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMEngineerReview(QMEngineerReview qMEngineerReview)
        {
            control.AddEntity(qMEngineerReview);
        }

        public void UpdateQMEngineerReview(QMEngineerReview qMEngineerReview, string Code)
        {
            control.UpdateEntity(qMEngineerReview, Code);
        }

        public void DeleteQMEngineerReview(QMEngineerReview qMEngineerReview)
        {
            control.DeleteEntity(qMEngineerReview);
        }

        public IList GetAllQMEngineerReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
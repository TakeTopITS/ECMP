using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPIHRReviewDAL
    {
        private EntityControl control;

        public KPIHRReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPIHRReview(KPIHRReview kpiHRReview)
        {
            control.AddEntity(kpiHRReview);
        }

        public void UpdateKPIHRReview(KPIHRReview kpiHRReview, int ID)
        {
            control.UpdateEntity(kpiHRReview, ID);
        }

        public void DeleteKPIHRReview(KPIHRReview kpiHRReview)
        {
            control.DeleteEntity(kpiHRReview);
        }

        public IList GetAllKPIHRReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
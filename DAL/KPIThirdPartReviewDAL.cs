using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPIThirdPartReviewDAL
    {
        private EntityControl control;

        public KPIThirdPartReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview)
        {
            control.AddEntity(kpiThirdPartReview);
        }

        public void UpdateKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview, int ID)
        {
            control.UpdateEntity(kpiThirdPartReview, ID);
        }

        public void DeleteKPIThirdPartReview(KPIThirdPartReview kpiThirdPartReview)
        {
            control.DeleteEntity(kpiThirdPartReview);
        }

        public IList GetAllKPIThirdPartReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
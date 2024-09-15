using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPILeaderReviewDAL
    {
        private EntityControl control;

        public KPILeaderReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPILeaderReview(KPILeaderReview kpiLeaderReview)
        {
            control.AddEntity(kpiLeaderReview);
        }

        public void UpdateKPILeaderReview(KPILeaderReview kpiLeaderReview, int ID)
        {
            control.UpdateEntity(kpiLeaderReview, ID);
        }

        public void DeleteKPILeaderReview(KPILeaderReview kpiLeaderReview)
        {
            control.DeleteEntity(kpiLeaderReview);
        }

        public IList GetAllKPILeaderReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
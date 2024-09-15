using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProLeaderReviewDAL
    {
        private EntityControl control;

        public ProLeaderReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProLeaderReview(ProLeaderReview proLeaderReview)
        {
            control.AddEntity(proLeaderReview);
        }

        public void UpdateProLeaderReview(ProLeaderReview proLeaderReview, int ID)
        {
            control.UpdateEntity(proLeaderReview, ID);
        }

        public void DeleteProLeaderReview(ProLeaderReview proLeaderReview)
        {
            control.DeleteEntity(proLeaderReview);
        }

        public IList GetAllProLeaderReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
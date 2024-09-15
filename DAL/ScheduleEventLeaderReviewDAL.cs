using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ScheduleEventLeaderReviewDAL
    {
        private EntityControl control;

        public ScheduleEventLeaderReviewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview)
        {
            control.AddEntity(scheduleEventLeaderReview);
        }

        public void UpdateScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview, int ReviewID)
        {
            control.UpdateEntity(scheduleEventLeaderReview, ReviewID);
        }

        public void DeleteScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview)
        {
            control.DeleteEntity(scheduleEventLeaderReview);
        }

        public IList GetAllScheduleEventLeaderReviews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
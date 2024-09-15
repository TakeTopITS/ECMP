using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ScheduleEventLeaderReviewBLL
    {
        public void AddScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview)
        {
            ScheduleEventLeaderReviewDAL dal = new ScheduleEventLeaderReviewDAL();
            dal.AddScheduleEventLeaderReview(scheduleEventLeaderReview);
        }

        public void UpdateScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview, int ReviewID)
        {
            ScheduleEventLeaderReviewDAL dal = new ScheduleEventLeaderReviewDAL();
            dal.UpdateScheduleEventLeaderReview(scheduleEventLeaderReview, ReviewID);
        }

        public void DeleteScheduleEventLeaderReview(ScheduleEventLeaderReview scheduleEventLeaderReview)
        {
            ScheduleEventLeaderReviewDAL dal = new ScheduleEventLeaderReviewDAL();
            dal.DeleteScheduleEventLeaderReview(scheduleEventLeaderReview);
        }

        public IList GetAllScheduleEventLeaderReviews(string strHQL)
        {
            ScheduleEventLeaderReviewDAL dal = new ScheduleEventLeaderReviewDAL();
            return dal.GetAllScheduleEventLeaderReviews(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ScheduleBLL
    {
        public void AddSchedule(Schedule schedule)
        {
            ScheduleDAL dal = new ScheduleDAL();
            dal.AddSchedule(schedule);
        }

        public void UpdateSchedule(Schedule schedule, int ID)
        {
            ScheduleDAL dal = new ScheduleDAL();
            dal.UpdateSchedule(schedule, ID);
        }

        public void DeleteSchedule(Schedule schedule)
        {
            ScheduleDAL dal = new ScheduleDAL();
            dal.DeleteSchedule(schedule);
        }

        public IList GetAllSchedules(string strHQL)
        {
            ScheduleDAL dal = new ScheduleDAL();
            return dal.GetAllSchedules(strHQL);
        }
    }
}
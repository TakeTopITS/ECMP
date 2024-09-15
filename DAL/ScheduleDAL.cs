using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ScheduleDAL
    {
        private EntityControl control;

        public ScheduleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSchedule(Schedule schedule)
        {
            control.AddEntity(schedule);
        }

        public void UpdateSchedule(Schedule schedule, int ID)
        {
            control.UpdateEntity(schedule, ID);
        }

        public void DeleteSchedule(Schedule schedule)
        {
            control.DeleteEntity(schedule);
        }

        public IList GetAllSchedules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
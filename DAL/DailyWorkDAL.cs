using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DailyWorkDAL
    {
        private EntityControl control;

        public DailyWorkDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDailyWork(DailyWork dailyWork)
        {
            control.AddEntity(dailyWork);
        }

        public void UpdateDailyWork(DailyWork dailyWork, int WorkID)
        {
            control.UpdateEntity(dailyWork, WorkID);
        }

        public void DeleteDailyWork(DailyWork dailyWork)
        {
            control.DeleteEntity(dailyWork);
        }

        public IList GetAllDailyWorks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
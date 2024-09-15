using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DailyWorkBLL
    {
        public void AddDailyWork(DailyWork dailyWork)
        {
            DailyWorkDAL dal = new DailyWorkDAL();
            dal.AddDailyWork(dailyWork);
        }

        public void UpdateDailyWork(DailyWork dailyWork, int WorkID)
        {
            DailyWorkDAL dal = new DailyWorkDAL();
            dal.UpdateDailyWork(dailyWork, WorkID);
        }

        public void DeleteDailyWork(DailyWork dailyWork)
        {
            DailyWorkDAL dal = new DailyWorkDAL();
            dal.DeleteDailyWork(dailyWork);
        }

        public IList GetAllDailyWorks(string strHQL)
        {
            DailyWorkDAL dal = new DailyWorkDAL();
            return dal.GetAllDailyWorks(strHQL);
        }
    }
}
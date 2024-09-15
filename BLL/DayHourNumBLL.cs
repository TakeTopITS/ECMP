using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DayHourNumBLL
    {
        public void AddDayHourNum(DayHourNum dayHourNum)
        {
            DayHourNumDAL dal = new DayHourNumDAL();
            dal.AddDayHourNum(dayHourNum);
        }

        public void UpdateDayHourNum(DayHourNum dayHourNum, int ID)
        {
            DayHourNumDAL dal = new DayHourNumDAL();
            dal.UpdateDayHourNum(dayHourNum, ID);
        }

        public void DeleteDayHourNum(DayHourNum dayHourNum)
        {
            DayHourNumDAL dal = new DayHourNumDAL();
            dal.DeleteDayHourNum(dayHourNum);
        }

        public IList GetAllDayHourNums(string strHQL)
        {
            DayHourNumDAL dal = new DayHourNumDAL();
            return dal.GetAllDayHourNums(strHQL);
        }
    }
}
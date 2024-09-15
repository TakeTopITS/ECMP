using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarCheckWeekBLL
    {
        public void AddCarCheckWeek(CarCheckWeek carCheckWeek)
        {
            CarCheckWeekDAL dal = new CarCheckWeekDAL();
            dal.AddCarCheckWeek(carCheckWeek);
        }

        public void UpdateCarCheckWeek(CarCheckWeek carCheckWeek, string strWeekCode)
        {
            CarCheckWeekDAL dal = new CarCheckWeekDAL();
            dal.UpdateCarCheckWeek(carCheckWeek, strWeekCode);
        }

        public void DeleteCarCheckWeek(CarCheckWeek carCheckWeek)
        {
            CarCheckWeekDAL dal = new CarCheckWeekDAL();
            dal.DeleteCarCheckWeek(carCheckWeek);
        }

        public IList GetAllCarCheckWeeks(string strHQL)
        {
            CarCheckWeekDAL dal = new CarCheckWeekDAL();
            return dal.GetAllCarCheckWeeks(strHQL);
        }
    }
}
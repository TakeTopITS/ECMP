using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarCheckWeekDAL
    {
        private EntityControl control;

        public CarCheckWeekDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarCheckWeek(CarCheckWeek carCheckWeek)
        {
            control.AddEntity(carCheckWeek);
        }

        public void UpdateCarCheckWeek(CarCheckWeek carCheckWeek, string strWeekCode)
        {
            control.UpdateEntity(carCheckWeek, strWeekCode);
        }

        public void DeleteCarCheckWeek(CarCheckWeek carCheckWeek)
        {
            control.DeleteEntity(carCheckWeek);
        }

        public IList GetAllCarCheckWeeks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
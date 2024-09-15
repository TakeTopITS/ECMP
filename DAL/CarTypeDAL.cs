using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarTypeDAL
    {
        private EntityControl control;

        public CarTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarType(CarType carType)
        {
            control.AddEntity(carType);
        }

        public void UpdateCarType(CarType carType, string Type)
        {
            control.UpdateEntity(carType, Type);
        }

        public void DeleteCarType(CarType carType)
        {
            control.DeleteEntity(carType);
        }

        public IList GetAllCarTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
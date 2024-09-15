using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarInformationDAL
    {
        private EntityControl control;

        public CarInformationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarInformation(CarInformation carInformation)
        {
            control.AddEntity(carInformation);
        }

        public void UpdateCarInformation(CarInformation carInformation, string CarCode)
        {
            control.UpdateEntity(carInformation, CarCode);
        }

        public void DeleteCarInformation(CarInformation carInformation)
        {
            control.DeleteEntity(carInformation);
        }

        public IList GetAllCarInformations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
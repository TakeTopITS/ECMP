using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarOilTypeRecordDAL
    {
        private EntityControl control;

        public CarOilTypeRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord)
        {
            control.AddEntity(CarOilTypeRecord);
        }

        public void UpdateCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord, int ID)
        {
            control.UpdateEntity(CarOilTypeRecord, ID);
        }

        public void DeleteCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord)
        {
            control.DeleteEntity(CarOilTypeRecord);
        }

        public IList GetAllCarOilTypeRecord(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
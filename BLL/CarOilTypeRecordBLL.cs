using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarOilTypeRecordBLL
    {
        public void AddCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord)
        {
            CarOilTypeRecordDAL dal = new CarOilTypeRecordDAL();
            dal.AddCarOilTypeRecord(CarOilTypeRecord);
        }

        public void UpdateCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord, int ID)
        {
            CarOilTypeRecordDAL dal = new CarOilTypeRecordDAL();
            dal.UpdateCarOilTypeRecord(CarOilTypeRecord, ID);
        }

        public void DeleteCarOilTypeRecord(CarOilTypeRecord CarOilTypeRecord)
        {
            CarOilTypeRecordDAL dal = new CarOilTypeRecordDAL();
            dal.DeleteCarOilTypeRecord(CarOilTypeRecord);
        }

        public IList GetAllCarOilTypeRecord(string strHQL)
        {
            CarOilTypeRecordDAL dal = new CarOilTypeRecordDAL();
            return dal.GetAllCarOilTypeRecord(strHQL);
        }
    }
}
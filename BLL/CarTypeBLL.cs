using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarTypeBLL
    {
        public void AddCarType(CarType carType)
        {
            CarTypeDAL dal = new CarTypeDAL();
            dal.AddCarType(carType);
        }

        public void UpdateCarType(CarType carType, string Type)
        {
            CarTypeDAL dal = new CarTypeDAL();
            dal.UpdateCarType(carType, Type);
        }

        public void DeleteCarType(CarType carType)
        {
            CarTypeDAL dal = new CarTypeDAL();
            dal.DeleteCarType(carType);
        }

        public IList GetAllCarTypes(string strHQL)
        {
            CarTypeDAL dal = new CarTypeDAL();
            return dal.GetAllCarTypes(strHQL);
        }
    }
}
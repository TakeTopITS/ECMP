using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarInformationBLL
    {
        public void AddCarInformation(CarInformation carInformation)
        {
            CarInformationDAL dal = new CarInformationDAL();
            dal.AddCarInformation(carInformation);
        }

        public void UpdateCarInformation(CarInformation carInformation, string CarCode)
        {
            CarInformationDAL dal = new CarInformationDAL();
            dal.UpdateCarInformation(carInformation, CarCode);
        }

        public void DeleteCarInformation(CarInformation carInformation)
        {
            CarInformationDAL dal = new CarInformationDAL();
            dal.DeleteCarInformation(carInformation);
        }

        public IList GetAllCarInformations(string strHQL)
        {
            CarInformationDAL dal = new CarInformationDAL();
            return dal.GetAllCarInformations(strHQL);
        }
    }
}
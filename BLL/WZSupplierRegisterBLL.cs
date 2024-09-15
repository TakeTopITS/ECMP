using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierRegisterBLL
    {
        public void AddWZSupplierRegister(WZSupplierRegister wZSupplierRegister)
        {
            WZSupplierRegisterDAL dal = new WZSupplierRegisterDAL();
            dal.AddWZSupplierRegister(wZSupplierRegister);
        }

        public void UpdateWZSupplierRegister(WZSupplierRegister wZSupplierRegister, int ID)
        {
            WZSupplierRegisterDAL dal = new WZSupplierRegisterDAL();
            dal.UpdateWZSupplierRegister(wZSupplierRegister, ID);
        }

        public void DeleteWZSupplierRegister(WZSupplierRegister wZSupplierRegister)
        {
            WZSupplierRegisterDAL dal = new WZSupplierRegisterDAL();
            dal.DeleteWZSupplierRegister(wZSupplierRegister);
        }

        public IList GetAllWZSupplierRegisters(string strHQL)
        {
            WZSupplierRegisterDAL dal = new WZSupplierRegisterDAL();
            return dal.GetAllWZSupplierRegisters(strHQL);
        }
    }
}
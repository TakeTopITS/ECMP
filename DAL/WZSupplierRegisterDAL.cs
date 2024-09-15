using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierRegisterDAL
    {
        private EntityControl control;

        public WZSupplierRegisterDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierRegister(WZSupplierRegister wZSupplierRegister)
        {
            control.AddEntity(wZSupplierRegister);
        }

        public void UpdateWZSupplierRegister(WZSupplierRegister wZSupplierRegister, int ID)
        {
            control.UpdateEntity(wZSupplierRegister, ID);
        }

        public void DeleteWZSupplierRegister(WZSupplierRegister wZSupplierRegister)
        {
            control.DeleteEntity(wZSupplierRegister);
        }

        public IList GetAllWZSupplierRegisters(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
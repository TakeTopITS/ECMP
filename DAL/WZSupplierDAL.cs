using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierDAL
    {
        private EntityControl control;

        public WZSupplierDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplier(WZSupplier wZSupplier)
        {
            control.AddEntity(wZSupplier);
        }

        public void UpdateWZSupplier(WZSupplier wZSupplier, int ID)
        {
            control.UpdateEntity(wZSupplier, ID);
        }

        public void DeleteWZSupplier(WZSupplier wZSupplier)
        {
            control.DeleteEntity(wZSupplier);
        }

        public IList GetAllWZSuppliers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
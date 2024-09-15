using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierApplyDAL
    {
        private EntityControl control;

        public WZSupplierApplyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierApply(WZSupplierApply wZSupplierApply)
        {
            control.AddEntity(wZSupplierApply);
        }

        public void UpdateWZSupplierApply(WZSupplierApply wZSupplierApply, int ID)
        {
            control.UpdateEntity(wZSupplierApply, ID);
        }

        public void DeleteWZSupplierApply(WZSupplierApply wZSupplierApply)
        {
            control.DeleteEntity(wZSupplierApply);
        }

        public IList GetAllWZSupplierApplys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
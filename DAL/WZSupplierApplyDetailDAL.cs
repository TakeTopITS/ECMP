using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierApplyDetailDAL
    {
        private EntityControl control;

        public WZSupplierApplyDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail)
        {
            control.AddEntity(wZSupplierApplyDetail);
        }

        public void UpdateWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail, int ID)
        {
            control.UpdateEntity(wZSupplierApplyDetail, ID);
        }

        public void DeleteWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail)
        {
            control.DeleteEntity(wZSupplierApplyDetail);
        }

        public IList GetAllWZSupplierApplyDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
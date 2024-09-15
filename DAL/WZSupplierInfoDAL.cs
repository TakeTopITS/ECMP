using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSupplierInfoDAL
    {
        private EntityControl control;

        public WZSupplierInfoDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSupplierInfo(WZSupplierInfo wZSupplierInfo)
        {
            control.AddEntity(wZSupplierInfo);
        }

        public void UpdateWZSupplierInfo(WZSupplierInfo wZSupplierInfo, int ID)
        {
            control.UpdateEntity(wZSupplierInfo, ID);
        }

        public void DeleteWZSupplierInfo(WZSupplierInfo wZSupplierInfo)
        {
            control.DeleteEntity(wZSupplierInfo);
        }

        public IList GetAllWZSupplierInfos(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
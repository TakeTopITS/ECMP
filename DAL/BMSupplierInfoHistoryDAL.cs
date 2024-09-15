using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BMSupplierInfoHistoryDAL
    {
        private EntityControl control;

        public BMSupplierInfoHistoryDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory)
        {
            control.AddEntity(bMSupplierInfoHistory);
        }

        public void UpdateBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory, int ID)
        {
            control.UpdateEntity(bMSupplierInfoHistory, ID);
        }

        public void DeleteBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory)
        {
            control.DeleteEntity(bMSupplierInfoHistory);
        }

        public IList GetAllBMSupplierInfoHistorys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
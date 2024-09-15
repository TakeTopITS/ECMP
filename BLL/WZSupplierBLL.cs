using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierBLL
    {
        public void AddWZSupplier(WZSupplier wZSupplier)
        {
            WZSupplierDAL dal = new WZSupplierDAL();
            dal.AddWZSupplier(wZSupplier);
        }

        public void UpdateWZSupplier(WZSupplier wZSupplier, int ID)
        {
            WZSupplierDAL dal = new WZSupplierDAL();
            dal.UpdateWZSupplier(wZSupplier, ID);
        }

        public void DeleteWZSupplier(WZSupplier wZSupplier)
        {
            WZSupplierDAL dal = new WZSupplierDAL();
            dal.DeleteWZSupplier(wZSupplier);
        }

        public IList GetAllWZSuppliers(string strHQL)
        {
            WZSupplierDAL dal = new WZSupplierDAL();
            return dal.GetAllWZSuppliers(strHQL);
        }
    }
}
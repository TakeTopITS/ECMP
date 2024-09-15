using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierApplyBLL
    {
        public void AddCameraList(WZSupplierApply wZSupplierApply)
        {
            WZSupplierApplyDAL dal = new WZSupplierApplyDAL();
            dal.AddWZSupplierApply(wZSupplierApply);
        }

        public void UpdateCameraList(WZSupplierApply wZSupplierApply, int ID)
        {
            WZSupplierApplyDAL dal = new WZSupplierApplyDAL();
            dal.UpdateWZSupplierApply(wZSupplierApply, ID);
        }

        public void DeleteCameraList(WZSupplierApply wZSupplierApply)
        {
            WZSupplierApplyDAL dal = new WZSupplierApplyDAL();
            dal.DeleteWZSupplierApply(wZSupplierApply);
        }

        public IList GetAllWZSupplierApplys(string strHQL)
        {
            WZSupplierApplyDAL dal = new WZSupplierApplyDAL();
            return dal.GetAllWZSupplierApplys(strHQL);
        }
    }
}
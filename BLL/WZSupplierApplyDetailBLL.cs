using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierApplyDetailBLL
    {
        public void AddWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail)
        {
            WZSupplierApplyDetailDAL dal = new WZSupplierApplyDetailDAL();
            dal.AddWZSupplierApplyDetail(wZSupplierApplyDetail);
        }

        public void UpdateWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail, int ID)
        {
            WZSupplierApplyDetailDAL dal = new WZSupplierApplyDetailDAL();
            dal.UpdateWZSupplierApplyDetail(wZSupplierApplyDetail, ID);
        }

        public void DeleteWZSupplierApplyDetail(WZSupplierApplyDetail wZSupplierApplyDetail)
        {
            WZSupplierApplyDetailDAL dal = new WZSupplierApplyDetailDAL();
            dal.DeleteWZSupplierApplyDetail(wZSupplierApplyDetail);
        }

        public IList GetAllWZSupplierApplyDetails(string strHQL)
        {
            WZSupplierApplyDetailDAL dal = new WZSupplierApplyDetailDAL();
            return dal.GetAllWZSupplierApplyDetails(strHQL);
        }
    }
}
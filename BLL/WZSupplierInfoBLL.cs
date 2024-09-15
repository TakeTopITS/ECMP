using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierInfoBLL
    {
        public void AddWZSupplierInfo(WZSupplierInfo wZSupplierInfo)
        {
            WZSupplierInfoDAL dal = new WZSupplierInfoDAL();
            dal.AddWZSupplierInfo(wZSupplierInfo);
        }

        public void UpdateWZSupplierInfo(WZSupplierInfo wZSupplierInfo, int ID)
        {
            WZSupplierInfoDAL dal = new WZSupplierInfoDAL();
            dal.UpdateWZSupplierInfo(wZSupplierInfo, ID);
        }

        public void DeleteWZSupplierInfo(WZSupplierInfo wZSupplierInfo)
        {
            WZSupplierInfoDAL dal = new WZSupplierInfoDAL();
            dal.DeleteWZSupplierInfo(wZSupplierInfo);
        }

        public IList GetAllWZSupplierInfos(string strHQL)
        {
            WZSupplierInfoDAL dal = new WZSupplierInfoDAL();
            return dal.GetAllWZSupplierInfos(strHQL);
        }
    }
}
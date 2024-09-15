using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商信息
    /// </summary>
    public class BMSupplierInfoHistoryBLL
    {
        public void AddBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory)
        {
            BMSupplierInfoHistoryDAL dal = new BMSupplierInfoHistoryDAL();
            dal.AddBMSupplierInfoHistory(bMSupplierInfoHistory);
        }

        public void UpdateBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory, int ID)
        {
            BMSupplierInfoHistoryDAL dal = new BMSupplierInfoHistoryDAL();
            dal.UpdateBMSupplierInfoHistory(bMSupplierInfoHistory, ID);
        }

        public void DeleteBMSupplierInfoHistory(BMSupplierInfoHistory bMSupplierInfoHistory)
        {
            BMSupplierInfoHistoryDAL dal = new BMSupplierInfoHistoryDAL();
            dal.DeleteBMSupplierInfoHistory(bMSupplierInfoHistory);
        }

        public IList GetAllBMSupplierInfoHistorys(string strHQL)
        {
            BMSupplierInfoHistoryDAL dal = new BMSupplierInfoHistoryDAL();
            return dal.GetAllBMSupplierInfoHistorys(strHQL);
        }
    }
}
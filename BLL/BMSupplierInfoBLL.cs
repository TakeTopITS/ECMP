using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商信息
    /// </summary>
    public class BMSupplierInfoBLL
    {
        public void AddBMSupplierInfo(BMSupplierInfo bMSupplierInfo)
        {
            BMSupplierInfoDAL dal = new BMSupplierInfoDAL();
            dal.AddBMSupplierInfo(bMSupplierInfo);
        }

        public void UpdateBMSupplierInfo(BMSupplierInfo bMSupplierInfo, int ID)
        {
            BMSupplierInfoDAL dal = new BMSupplierInfoDAL();
            dal.UpdateBMSupplierInfo(bMSupplierInfo, ID);
        }

        public void DeleteBMSupplierInfo(BMSupplierInfo bMSupplierInfo)
        {
            BMSupplierInfoDAL dal = new BMSupplierInfoDAL();
            dal.DeleteBMSupplierInfo(bMSupplierInfo);
        }

        public IList GetAllBMSupplierInfos(string strHQL)
        {
            BMSupplierInfoDAL dal = new BMSupplierInfoDAL();
            return dal.GetAllBMSupplierInfos(strHQL);
        }
    }
}
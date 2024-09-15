using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商评价分析
    /// </summary>
    public class BMSupplierAnalyBLL
    {
        public void AddBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly)
        {
            BMSupplierAnalyDAL dal = new BMSupplierAnalyDAL();
            dal.AddBMSupplierAnaly(bMSupplierAnaly);
        }

        public void UpdateBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly, int ID)
        {
            BMSupplierAnalyDAL dal = new BMSupplierAnalyDAL();
            dal.UpdateBMSupplierAnaly(bMSupplierAnaly, ID);
        }

        public void DeleteBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly)
        {
            BMSupplierAnalyDAL dal = new BMSupplierAnalyDAL();
            dal.DeleteBMSupplierAnaly(bMSupplierAnaly);
        }

        public IList GetAllBMSupplierAnalys(string strHQL)
        {
            BMSupplierAnalyDAL dal = new BMSupplierAnalyDAL();
            return dal.GetAllBMSupplierAnalys(strHQL);
        }
    }
}
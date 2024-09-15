using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProductProcessBLL
    {
        public void AddProductProcess(ProductProcess productProcess)
        {
            ProductProcessDAL dal = new ProductProcessDAL();
            dal.AddProductProcess(productProcess);
        }

        public void UpdateProductProcess(ProductProcess productProcess, string ProcessName)
        {
            ProductProcessDAL dal = new ProductProcessDAL();
            dal.UpdateProductProcess(productProcess, ProcessName);
        }

        public void DeleteProductProcess(ProductProcess productProcess)
        {
            ProductProcessDAL dal = new ProductProcessDAL();
            dal.DeleteProductProcess(productProcess);
        }

        public IList GetAllProductProcesss(string strHQL)
        {
            ProductProcessDAL dal = new ProductProcessDAL();
            return dal.GetAllProductProcesss(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWProductBLL
    {
        public void AddDWProduct(DWProduct dWProduct)
        {
            DWProductDAL dal = new DWProductDAL();
            dal.AddDWProduct(dWProduct);
        }

        public void UpdateDWProduct(DWProduct dWProduct, int ID)
        {
            DWProductDAL dal = new DWProductDAL();
            dal.UpdateDWProduct(dWProduct, ID);
        }

        public void DeleteDWProduct(DWProduct dWProduct)
        {
            DWProductDAL dal = new DWProductDAL();
            dal.DeleteDWProduct(dWProduct);
        }

        public IList GetAllDWProducts(string strHQL)
        {
            DWProductDAL dal = new DWProductDAL();
            return dal.GetAllDWProducts(strHQL);
        }
    }
}
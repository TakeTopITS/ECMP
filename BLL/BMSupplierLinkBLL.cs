using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商联系人
    /// </summary>
    public class BMSupplierLinkBLL
    {
        public void AddBMSupplierLink(BMSupplierLink bMSupplierLink)
        {
            BMSupplierLinkDAL dal = new BMSupplierLinkDAL();
            dal.AddBMSupplierLink(bMSupplierLink);
        }

        public void UpdateBMSupplierLink(BMSupplierLink bMSupplierLink, int ID)
        {
            BMSupplierLinkDAL dal = new BMSupplierLinkDAL();
            dal.UpdateBMSupplierLink(bMSupplierLink, ID);
        }

        public void DeleteBMSupplierLink(BMSupplierLink bMSupplierLink)
        {
            BMSupplierLinkDAL dal = new BMSupplierLinkDAL();
            dal.DeleteBMSupplierLink(bMSupplierLink);
        }

        public IList GetAllBMSupplierLinks(string strHQL)
        {
            BMSupplierLinkDAL dal = new BMSupplierLinkDAL();
            return dal.GetAllBMSupplierLinks(strHQL);
        }
    }
}
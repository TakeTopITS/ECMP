using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商投标
    /// </summary>
    public class BMSupplierBidBLL
    {
        public void AddBMSupplierBid(BMSupplierBid bMSupplierBid)
        {
            BMSupplierBidDAL dal = new BMSupplierBidDAL();
            dal.AddBMSupplierBid(bMSupplierBid);
        }

        public void UpdateBMSupplierBid(BMSupplierBid bMSupplierBid, int ID)
        {
            BMSupplierBidDAL dal = new BMSupplierBidDAL();
            dal.UpdateBMSupplierBid(bMSupplierBid, ID);
        }

        public void DeleteBMSupplierBid(BMSupplierBid bMSupplierBid)
        {
            BMSupplierBidDAL dal = new BMSupplierBidDAL();
            dal.DeleteBMSupplierBid(bMSupplierBid);
        }

        public IList GetAllBMSupplierBids(string strHQL)
        {
            BMSupplierBidDAL dal = new BMSupplierBidDAL();
            return dal.GetAllBMSupplierBids(strHQL);
        }
    }
}
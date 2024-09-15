using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class VendorRelatedGoodsInforBLL
    {
        public void AddVendorRelatedGoodsInfor(VendorRelatedGoodsInfor vendorRelatedGoodsInfor)
        {
            VendorRelatedGoodsInforDAL dal = new VendorRelatedGoodsInforDAL();
            dal.AddVendorRelatedGoodsInfor(vendorRelatedGoodsInfor);
        }

        public void UpdateVendorRelatedGoodsInfor(VendorRelatedGoodsInfor vendorRelatedGoodsInfor, int ID)
        {
            VendorRelatedGoodsInforDAL dal = new VendorRelatedGoodsInforDAL();
            dal.UpdateVendorRelatedGoodsInfor(vendorRelatedGoodsInfor, ID);
        }

        public void DeleteVendorRelatedGoodsInfor(VendorRelatedGoodsInfor vendorRelatedGoodsInfor)
        {
            VendorRelatedGoodsInforDAL dal = new VendorRelatedGoodsInforDAL();
            dal.DeleteVendorRelatedGoodsInfor(vendorRelatedGoodsInfor);
        }

        public IList GetAllVendorRelatedGoodsInfors(string strHQL)
        {
            VendorRelatedGoodsInforDAL dal = new VendorRelatedGoodsInforDAL();
            return dal.GetAllVendorRelatedGoodsInfors(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class VendorBLL
    {
        public void AddVendor(Vendor vendor)
        {
            VendorDAL dal = new VendorDAL();
            dal.AddVendor(vendor);
        }

        public void UpdateVendor(Vendor vendor, string VendorCode)
        {
            VendorDAL dal = new VendorDAL();
            dal.UpdateVendor(vendor, VendorCode);
        }

        public void DeleteVendor(Vendor vendor)
        {
            VendorDAL dal = new VendorDAL();
            dal.DeleteVendor(vendor);
        }

        public IList GetAllVendors(string strHQL)
        {
            VendorDAL dal = new VendorDAL();
            return dal.GetAllVendors(strHQL);
        }
    }
}
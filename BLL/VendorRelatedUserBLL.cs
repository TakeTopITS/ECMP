using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class VendorRelatedUserBLL
    {
        public void AddVendorRelatedUser(VendorRelatedUser vendorRelatedUser)
        {
            VendorRelatedUserDAL dal = new VendorRelatedUserDAL();
            dal.AddVendorRelatedUser(vendorRelatedUser);
        }

        public void UpdateVendorRelatedUser(VendorRelatedUser vendorRelatedUser, int ID)
        {
            VendorRelatedUserDAL dal = new VendorRelatedUserDAL();
            dal.UpdateVendorRelatedUser(vendorRelatedUser, ID);
        }

        public void DeleteVendorRelatedUser(VendorRelatedUser vendorRelatedUser)
        {
            VendorRelatedUserDAL dal = new VendorRelatedUserDAL();
            dal.DeleteVendorRelatedUser(vendorRelatedUser);
        }

        public IList GetAllVendorRelatedUsers(string strHQL)
        {
            VendorRelatedUserDAL dal = new VendorRelatedUserDAL();
            return dal.GetAllVendorRelatedUsers(strHQL);
        }
    }
}
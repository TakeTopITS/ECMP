using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class VendorRelatedUserDAL
    {
        private EntityControl control;

        public VendorRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddVendorRelatedUser(VendorRelatedUser vendorRelatedUser)
        {
            control.AddEntity(vendorRelatedUser);
        }

        public void UpdateVendorRelatedUser(VendorRelatedUser vendorRelatedUser, int ID)
        {
            control.UpdateEntity(vendorRelatedUser, ID);
        }

        public void DeleteVendorRelatedUser(VendorRelatedUser vendorRelatedUser)
        {
            control.DeleteEntity(vendorRelatedUser);
        }

        public IList GetAllVendorRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
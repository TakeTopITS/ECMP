using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class VendorDAL
    {
        private EntityControl control;

        public VendorDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddVendor(Vendor vendor)
        {
            control.AddEntity(vendor);
        }

        public void UpdateVendor(Vendor vendor, string VendorCode)
        {
            control.UpdateEntity(vendor, VendorCode);
        }

        public void DeleteVendor(Vendor vendor)
        {
            control.DeleteEntity(vendor);
        }

        public IList GetAllVendors(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
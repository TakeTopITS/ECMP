using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class LicenseVerificationDAL
    {
        private EntityControl control;

        public LicenseVerificationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddLicenseVerification(LicenseVerification licenseVerification)
        {
            control.AddEntity(licenseVerification);
        }

        public void UpdateLicenseVerification(LicenseVerification licenseVerification, string ServerName)
        {
            control.UpdateEntity(licenseVerification, ServerName);
        }

        public void DeleteLicenseVerification(LicenseVerification licenseVerification)
        {
            control.DeleteEntity(licenseVerification);
        }

        public IList GetAllLicenseVerifications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
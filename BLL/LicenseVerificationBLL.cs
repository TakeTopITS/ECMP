using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class LicenseVerificationBLL
    {
        public void AddLicenseVerification(LicenseVerification licenseVerification)
        {
            LicenseVerificationDAL dal = new LicenseVerificationDAL();
            dal.AddLicenseVerification(licenseVerification);
        }

        public void UpdateLicenseVerification(LicenseVerification licenseVerification, string ServerName)
        {
            LicenseVerificationDAL dal = new LicenseVerificationDAL();
            dal.UpdateLicenseVerification(licenseVerification, ServerName);
        }

        public void DeleteLicenseVerification(LicenseVerification licenseVerification)
        {
            LicenseVerificationDAL dal = new LicenseVerificationDAL();
            dal.DeleteLicenseVerification(licenseVerification);
        }

        public IList GetAllLicenseVerifications(string strHQL)
        {
            LicenseVerificationDAL dal = new LicenseVerificationDAL();
            return dal.GetAllLicenseVerifications(strHQL);
        }
    }
}
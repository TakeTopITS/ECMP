using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商证书
    /// </summary>
    public class BMSupplierCertificationBLL
    {
        public void AddBMSupplierCertification(BMSupplierCertification bMSupplierCertification)
        {
            BMSupplierCertificationDAL dal = new BMSupplierCertificationDAL();
            dal.AddBMSupplierCertification(bMSupplierCertification);
        }

        public void UpdateBMSupplierCertification(BMSupplierCertification bMSupplierCertification, int ID)
        {
            BMSupplierCertificationDAL dal = new BMSupplierCertificationDAL();
            dal.UpdateBMSupplierCertification(bMSupplierCertification, ID);
        }

        public void DeleteBMSupplierCertification(BMSupplierCertification bMSupplierCertification)
        {
            BMSupplierCertificationDAL dal = new BMSupplierCertificationDAL();
            dal.DeleteBMSupplierCertification(bMSupplierCertification);
        }

        public IList GetAllBMSupplierCertifications(string strHQL)
        {
            BMSupplierCertificationDAL dal = new BMSupplierCertificationDAL();
            return dal.GetAllBMSupplierCertifications(strHQL);
        }
    }
}
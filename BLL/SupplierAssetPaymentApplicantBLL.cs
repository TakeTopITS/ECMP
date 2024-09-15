using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SupplierAssetPaymentApplicantBLL
    {
        public void AddSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant)
        {
            SupplierAssetPaymentApplicantDAL dal = new SupplierAssetPaymentApplicantDAL();
            dal.AddSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant);
        }

        public void UpdateSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant, int AOID)
        {
            SupplierAssetPaymentApplicantDAL dal = new SupplierAssetPaymentApplicantDAL();
            dal.UpdateSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant, AOID);
        }

        public void DeleteSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant)
        {
            SupplierAssetPaymentApplicantDAL dal = new SupplierAssetPaymentApplicantDAL();
            dal.DeleteSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant);
        }

        public IList GetAllSupplierAssetPaymentApplicants(string strHQL)
        {
            SupplierAssetPaymentApplicantDAL dal = new SupplierAssetPaymentApplicantDAL();
            return dal.GetAllSupplierAssetPaymentApplicants(strHQL);
        }
    }
}
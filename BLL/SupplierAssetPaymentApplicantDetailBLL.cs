using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SupplierAssetPaymentApplicantDetailBLL
    {
        public void AddSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail)
        {
            SupplierAssetPaymentApplicantDetailDAL dal = new SupplierAssetPaymentApplicantDetailDAL();
            dal.AddSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail);
        }

        public void UpdateSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail, int ID)
        {
            SupplierAssetPaymentApplicantDetailDAL dal = new SupplierAssetPaymentApplicantDetailDAL();
            dal.UpdateSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail, ID);
        }

        public void DeleteSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail)
        {
            SupplierAssetPaymentApplicantDetailDAL dal = new SupplierAssetPaymentApplicantDetailDAL();
            dal.DeleteSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail);
        }

        public IList GetAllSupplierAssetPaymentApplicantDetails(string strHQL)
        {
            SupplierAssetPaymentApplicantDetailDAL dal = new SupplierAssetPaymentApplicantDetailDAL();
            return dal.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
        }
    }
}
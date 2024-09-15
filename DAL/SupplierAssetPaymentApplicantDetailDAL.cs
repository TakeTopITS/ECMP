using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SupplierAssetPaymentApplicantDetailDAL
    {
        private EntityControl control;

        public SupplierAssetPaymentApplicantDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail)
        {
            control.AddEntity(supplierAssetPaymentApplicantDetail);
        }

        public void UpdateSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail, int ID)
        {
            control.UpdateEntity(supplierAssetPaymentApplicantDetail, ID);
        }

        public void DeleteSupplierAssetPaymentApplicantDetail(SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail)
        {
            control.DeleteEntity(supplierAssetPaymentApplicantDetail);
        }

        public IList GetAllSupplierAssetPaymentApplicantDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
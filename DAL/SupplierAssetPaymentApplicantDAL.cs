using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SupplierAssetPaymentApplicantDAL
    {
        private EntityControl control;

        public SupplierAssetPaymentApplicantDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant)
        {
            control.AddEntity(supplierAssetPaymentApplicant);
        }

        public void UpdateSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant, int AOID)
        {
            control.UpdateEntity(supplierAssetPaymentApplicant, AOID);
        }

        public void DeleteSupplierAssetPaymentApplicant(SupplierAssetPaymentApplicant supplierAssetPaymentApplicant)
        {
            control.DeleteEntity(supplierAssetPaymentApplicant);
        }

        public IList GetAllSupplierAssetPaymentApplicants(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
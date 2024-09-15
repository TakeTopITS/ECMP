using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商证书
    /// </summary>
    public class BMSupplierCertificationDAL
    {
        private EntityControl control;

        public BMSupplierCertificationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierCertification(BMSupplierCertification bMSupplierCertification)
        {
            control.AddEntity(bMSupplierCertification);
        }

        public void UpdateBMSupplierCertification(BMSupplierCertification bMSupplierCertification, int ID)
        {
            control.UpdateEntity(bMSupplierCertification, ID);
        }

        public void DeleteBMSupplierCertification(BMSupplierCertification bMSupplierCertification)
        {
            control.DeleteEntity(bMSupplierCertification);
        }

        public IList GetAllBMSupplierCertifications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
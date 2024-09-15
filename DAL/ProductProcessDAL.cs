using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProductProcessDAL
    {
        private EntityControl control;

        public ProductProcessDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProductProcess(ProductProcess productProcess)
        {
            control.AddEntity(productProcess);
        }

        public void UpdateProductProcess(ProductProcess productProcess, string ProcessName)
        {
            control.UpdateEntity(productProcess, ProcessName);
        }

        public void DeleteProductProcess(ProductProcess productProcess)
        {
            control.DeleteEntity(productProcess);
        }

        public IList GetAllProductProcesss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
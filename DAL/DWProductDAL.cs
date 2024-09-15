using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWProductDAL
    {
        private EntityControl control;

        public DWProductDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWProduct(DWProduct dWProduct)
        {
            control.AddEntity(dWProduct);
        }

        public void UpdateDWProduct(DWProduct dWProduct, int ID)
        {
            control.UpdateEntity(dWProduct, ID);
        }

        public void DeleteDWProduct(DWProduct dWProduct)
        {
            control.DeleteEntity(dWProduct);
        }

        public IList GetAllDWProducts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
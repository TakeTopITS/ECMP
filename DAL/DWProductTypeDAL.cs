using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWProductTypeDAL
    {
        private EntityControl control;

        public DWProductTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWProductType(DWProductType dWProductType)
        {
            control.AddEntity(dWProductType);
        }

        public void UpdateDWProductType(DWProductType dWProductType, int ID)
        {
            control.UpdateEntity(dWProductType, ID);
        }

        public void DeleteDWProductType(DWProductType dWProductType)
        {
            control.DeleteEntity(dWProductType);
        }

        public IList GetAllDWProductTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
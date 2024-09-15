using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWMatchTypeDAL
    {
        private EntityControl control;

        public DWMatchTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWMatchType(DWMatchType dWMatchType)
        {
            control.AddEntity(dWMatchType);
        }

        public void UpdateDWMatchType(DWMatchType dWMatchType, int ID)
        {
            control.UpdateEntity(dWMatchType, ID);
        }

        public void DeleteDWMatchType(DWMatchType dWMatchType)
        {
            control.DeleteEntity(dWMatchType);
        }

        public IList GetAllDWMatchTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
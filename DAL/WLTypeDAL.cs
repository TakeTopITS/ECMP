using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WLTypeDAL
    {
        private EntityControl control;

        public WLTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWLType(WLType wlType)
        {
            control.AddEntity(wlType);
        }

        public void UpdateWLType(WLType wlType, string Type)
        {
            control.UpdateEntity(wlType, Type);
        }

        public void DeleteWLType(WLType wlType)
        {
            control.DeleteEntity(wlType);
        }

        public IList GetAllWLTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
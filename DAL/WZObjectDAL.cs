using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZObjectDAL
    {
        private EntityControl control;

        public WZObjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZObject(WZObject wZObject)
        {
            control.AddEntity(wZObject);
        }

        public void UpdateWZObject(WZObject wZObject, string strObjectCode)
        {
            control.UpdateEntity(wZObject, strObjectCode);
        }

        public void DeleteWZObject(WZObject wZObject)
        {
            control.DeleteEntity(wZObject);
        }

        public IList GetAllWZObjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
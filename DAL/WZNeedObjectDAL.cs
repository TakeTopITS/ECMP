using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZNeedObjectDAL
    {
        private EntityControl control;

        public WZNeedObjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZNeedObject(WZNeedObject wZNeedObject)
        {
            control.AddEntity(wZNeedObject);
        }

        public void UpdateWZNeedObject(WZNeedObject wZNeedObject, int ID)
        {
            control.UpdateEntity(wZNeedObject, ID);
        }

        public void DeleteWZNeedObject(WZNeedObject wZNeedObject)
        {
            control.DeleteEntity(wZNeedObject);
        }

        public IList GetAllWZNeedObjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
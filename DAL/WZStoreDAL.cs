using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZStoreDAL
    {
        private EntityControl control;

        public WZStoreDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZStore(WZStore wZStore)
        {
            control.AddEntity(wZStore);
        }

        public void UpdateWZStore(WZStore wZStore, int ID)
        {
            control.UpdateEntity(wZStore, ID);
        }

        public void DeleteWZStore(WZStore wZStore)
        {
            control.DeleteEntity(wZStore);
        }

        public IList GetAllWZStores(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
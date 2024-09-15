using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemBomVersionDAL
    {
        private EntityControl control;

        public ItemBomVersionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItemBomVersion(ItemBomVersion itemBomVersion)
        {
            control.AddEntity(itemBomVersion);
        }

        public void UpdateItemBomVersion(ItemBomVersion itemBomVersion, int ID)
        {
            control.UpdateEntity(itemBomVersion, ID);
        }

        public void DeleteItemBomVersion(ItemBomVersion itemBomVersion)
        {
            control.DeleteEntity(itemBomVersion);
        }

        public IList GetAllItemBomVersions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
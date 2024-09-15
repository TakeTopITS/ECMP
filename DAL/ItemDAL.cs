using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemDAL
    {
        private EntityControl control;

        public ItemDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItem(Item item)
        {
            control.AddEntity(item);
        }

        public void UpdateItem(Item item, string ItemCode)
        {
            control.UpdateEntity(item, ItemCode);
        }

        public void DeleteItem(Item item)
        {
            control.DeleteEntity(item);
        }

        public IList GetAllItems(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
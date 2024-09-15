using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemBomPartDAL
    {
        private EntityControl control;

        public ItemBomPartDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItemBomPart(ItemBomPart itemBomPart)
        {
            control.AddEntity(itemBomPart);
        }

        public void UpdateItemBomPart(ItemBomPart itemBomPart, int ID)
        {
            control.UpdateEntity(itemBomPart, ID);
        }

        public void DeleteItemBomPart(ItemBomPart itemBomPart)
        {
            control.DeleteEntity(itemBomPart);
        }

        public IList GetAllItemBomParts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemBomDAL
    {
        private EntityControl control;

        public ItemBomDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItemBom(ItemBom itemBom)
        {
            control.AddEntity(itemBom);
        }

        public void UpdateItemBom(ItemBom itemBom, int ID)
        {
            control.UpdateEntity(itemBom, ID);
        }

        public void DeleteItemBom(ItemBom itemBom)
        {
            control.DeleteEntity(itemBom);
        }

        public IList GetAllItemBoms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
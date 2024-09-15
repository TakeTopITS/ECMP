using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemBomPartBLL
    {
        public void AddItemBomPart(ItemBomPart itemBomPart)
        {
            ItemBomPartDAL dal = new ItemBomPartDAL();
            dal.AddItemBomPart(itemBomPart);
        }

        public void UpdateItemBomPart(ItemBomPart itemBomPart, int ID)
        {
            ItemBomPartDAL dal = new ItemBomPartDAL();
            dal.UpdateItemBomPart(itemBomPart, ID);
        }

        public void DeleteItemBomPart(ItemBomPart itemBomPart)
        {
            ItemBomPartDAL dal = new ItemBomPartDAL();
            dal.DeleteItemBomPart(itemBomPart);
        }

        public IList GetAllItemBomParts(string strHQL)
        {
            ItemBomPartDAL dal = new ItemBomPartDAL();
            return dal.GetAllItemBomParts(strHQL);
        }
    }
}
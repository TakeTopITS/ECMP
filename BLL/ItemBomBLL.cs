using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemBomBLL
    {
        public void AddItemBom(ItemBom itemBom)
        {
            ItemBomDAL dal = new ItemBomDAL();
            dal.AddItemBom(itemBom);
        }

        public void UpdateItemBom(ItemBom itemBom, int ID)
        {
            ItemBomDAL dal = new ItemBomDAL();
            dal.UpdateItemBom(itemBom, ID);
        }

        public void DeleteItemBom(ItemBom itemBom)
        {
            ItemBomDAL dal = new ItemBomDAL();
            dal.DeleteItemBom(itemBom);
        }

        public IList GetAllItemBoms(string strHQL)
        {
            ItemBomDAL dal = new ItemBomDAL();
            return dal.GetAllItemBoms(strHQL);
        }
    }
}
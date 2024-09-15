using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemBLL
    {
        public void AddItem(Item item)
        {
            ItemDAL dal = new ItemDAL();
            dal.AddItem(item);
        }

        public void UpdateItem(Item item, string ItemCode)
        {
            ItemDAL dal = new ItemDAL();
            dal.UpdateItem(item, ItemCode);
        }

        public void DeleteItem(Item item)
        {
            ItemDAL dal = new ItemDAL();
            dal.DeleteItem(item);
        }

        public IList GetAllItems(string strHQL)
        {
            ItemDAL dal = new ItemDAL();
            return dal.GetAllItems(strHQL);
        }
    }
}
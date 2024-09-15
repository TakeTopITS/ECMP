using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ItemBomVersionBLL
    {
        public void AddItemBomVersion(ItemBomVersion itemBomVersion)
        {
            ItemBomVersionDAL dal = new ItemBomVersionDAL();
            dal.AddItemBomVersion(itemBomVersion);
        }

        public void UpdateItemBomVersion(ItemBomVersion itemBomVersion, int ID)
        {
            ItemBomVersionDAL dal = new ItemBomVersionDAL();
            dal.UpdateItemBomVersion(itemBomVersion, ID);
        }

        public void DeleteItemBomVersion(ItemBomVersion itemBomVersion)
        {
            ItemBomVersionDAL dal = new ItemBomVersionDAL();
            dal.DeleteItemBomVersion(itemBomVersion);
        }

        public IList GetAllItemBomVersions(string strHQL)
        {
            ItemBomVersionDAL dal = new ItemBomVersionDAL();
            return dal.GetAllItemBomVersions(strHQL);
        }
    }
}
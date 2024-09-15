using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZStoreBLL
    {
        public void AddWZStore(WZStore wZStore)
        {
            WZStoreDAL dal = new WZStoreDAL();
            dal.AddWZStore(wZStore);
        }

        public void UpdateWZStore(WZStore wZStore, int ID)
        {
            WZStoreDAL dal = new WZStoreDAL();
            dal.UpdateWZStore(wZStore, ID);
        }

        public void DeleteWZStore(WZStore wZStore)
        {
            WZStoreDAL dal = new WZStoreDAL();
            dal.DeleteWZStore(wZStore);
        }

        public IList GetAllWZStores(string strHQL)
        {
            WZStoreDAL dal = new WZStoreDAL();
            return dal.GetAllWZStores(strHQL);
        }
    }
}
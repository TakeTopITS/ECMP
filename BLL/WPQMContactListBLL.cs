using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 联络单
    /// </summary>
    public class WPQMContactListBLL
    {
        public void AddWPQMContactList(WPQMContactList wPQMContactList)
        {
            WPQMContactListDAL dal = new WPQMContactListDAL();
            dal.AddWPQMContactList(wPQMContactList);
        }

        public void UpdateWPQMContactList(WPQMContactList wPQMContactList, int ID)
        {
            WPQMContactListDAL dal = new WPQMContactListDAL();
            dal.UpdateWPQMContactList(wPQMContactList, ID);
        }

        public void DeleteWPQMContactList(WPQMContactList wPQMContactList)
        {
            WPQMContactListDAL dal = new WPQMContactListDAL();
            dal.DeleteWPQMContactList(wPQMContactList);
        }

        public IList GetAllWPQMContactLists(string strHQL)
        {
            WPQMContactListDAL dal = new WPQMContactListDAL();
            return dal.GetAllWPQMContactLists(strHQL);
        }
    }
}
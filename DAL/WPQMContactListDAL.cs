using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 联络单
    /// </summary>
    public class WPQMContactListDAL
    {
        private EntityControl control;

        public WPQMContactListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMContactList(WPQMContactList wPQMContactList)
        {
            control.AddEntity(wPQMContactList);
        }

        public void UpdateWPQMContactList(WPQMContactList wPQMContactList, int ID)
        {
            control.UpdateEntity(wPQMContactList, ID);
        }

        public void DeleteWPQMContactList(WPQMContactList wPQMContactList)
        {
            control.DeleteEntity(wPQMContactList);
        }

        public IList GetAllWPQMContactLists(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZNeedObjectBLL
    {
        public void AddWZNeedObject(WZNeedObject wZNeedObject)
        {
            WZNeedObjectDAL dal = new WZNeedObjectDAL();
            dal.AddWZNeedObject(wZNeedObject);
        }

        public void UpdateWZNeedObject(WZNeedObject wZNeedObject, int ID)
        {
            WZNeedObjectDAL dal = new WZNeedObjectDAL();
            dal.UpdateWZNeedObject(wZNeedObject, ID);
        }

        public void DeleteWZNeedObject(WZNeedObject wZNeedObject)
        {
            WZNeedObjectDAL dal = new WZNeedObjectDAL();
            dal.DeleteWZNeedObject(wZNeedObject);
        }

        public IList GetAllWZNeedObjects(string strHQL)
        {
            WZNeedObjectDAL dal = new WZNeedObjectDAL();
            return dal.GetAllWZNeedObjects(strHQL);
        }
    }
}
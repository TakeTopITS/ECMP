using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZObjectReplaceBLL
    {
        public void AddWZObjectReplace(WZObjectReplace wZObjectReplace)
        {
            WZObjectReplaceDAL dal = new WZObjectReplaceDAL();
            dal.AddWZObjectReplace(wZObjectReplace);
        }

        public void UpdateWZObjectReplace(WZObjectReplace wZObjectReplace, int ID)
        {
            WZObjectReplaceDAL dal = new WZObjectReplaceDAL();
            dal.UpdateWZObjectReplace(wZObjectReplace, ID);
        }

        public void DeleteWZObjectReplace(WZObjectReplace wZObjectReplace)
        {
            WZObjectReplaceDAL dal = new WZObjectReplaceDAL();
            dal.DeleteWZObjectReplace(wZObjectReplace);
        }

        public IList GetAllWZObjectReplaces(string strHQL)
        {
            WZObjectReplaceDAL dal = new WZObjectReplaceDAL();
            return dal.GetAllWZObjectReplaces(strHQL);
        }
    }
}
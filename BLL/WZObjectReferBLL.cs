using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZObjectReferBLL
    {
        public void AddWZObjectRefer(WZObjectRefer wZObjectRefer)
        {
            WZObjectReferDAL dal = new WZObjectReferDAL();
            dal.AddWZObjectRefer(wZObjectRefer);
        }

        public void UpdateWZObjectRefer(WZObjectRefer wZObjectRefer, string strObjectCode)
        {
            WZObjectReferDAL dal = new WZObjectReferDAL();
            dal.UpdateWZObjectRefer(wZObjectRefer, strObjectCode);
        }

        public void DeleteWZObjectRefer(WZObjectRefer wZObjectRefer)
        {
            WZObjectReferDAL dal = new WZObjectReferDAL();
            dal.DeleteWZObjectRefer(wZObjectRefer);
        }

        public IList GetAllWZObjectRefers(string strHQL)
        {
            WZObjectReferDAL dal = new WZObjectReferDAL();
            return dal.GetAllWZObjectRefers(strHQL);
        }
    }
}
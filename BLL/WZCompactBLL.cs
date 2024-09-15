using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCompactBLL
    {
        public void AddWZCompact(WZCompact wZCompact)
        {
            WZCompactDAL dal = new WZCompactDAL();
            dal.AddWZCompact(wZCompact);
        }

        public void UpdateWZCompact(WZCompact wZCompact, string CompactCode)
        {
            WZCompactDAL dal = new WZCompactDAL();
            dal.UpdateWZCompact(wZCompact, CompactCode);
        }

        public void DeleteWZCompact(WZCompact wZCompact)
        {
            WZCompactDAL dal = new WZCompactDAL();
            dal.DeleteWZCompact(wZCompact);
        }

        public IList GetAllWZCompacts(string strHQL)
        {
            WZCompactDAL dal = new WZCompactDAL();
            return dal.GetAllWZCompacts(strHQL);
        }
    }
}
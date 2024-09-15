using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSpanBLL
    {
        public void AddWZSpan(WZSpan wZSpan)
        {
            WZSpanDAL dal = new WZSpanDAL();
            dal.AddWZSpan(wZSpan);
        }

        public void UpdateWZSpan(WZSpan wZSpan, int ID)
        {
            WZSpanDAL dal = new WZSpanDAL();
            dal.UpdateWZSpan(wZSpan, ID);
        }

        public void DeleteWZSpan(WZSpan wZSpan)
        {
            WZSpanDAL dal = new WZSpanDAL();
            dal.DeleteWZSpan(wZSpan);
        }

        public IList GetAllWZSpans(string strHQL)
        {
            WZSpanDAL dal = new WZSpanDAL();
            return dal.GetAllWZSpans(strHQL);
        }
    }
}
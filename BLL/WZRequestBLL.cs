using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZRequestBLL
    {
        public void AddWZRequest(WZRequest wZRequest)
        {
            WZRequestDAL dal = new WZRequestDAL();
            dal.AddWZRequest(wZRequest);
        }

        public void UpdateWZRequest(WZRequest wZRequest, string strRequestCode)
        {
            WZRequestDAL dal = new WZRequestDAL();
            dal.UpdateWZRequest(wZRequest, strRequestCode);
        }

        public void DeleteWZRequest(WZRequest wZRequest)
        {
            WZRequestDAL dal = new WZRequestDAL();
            dal.DeleteWZRequest(wZRequest);
        }

        public IList GetAllWZRequests(string strHQL)
        {
            WZRequestDAL dal = new WZRequestDAL();
            return dal.GetAllAccounts(strHQL);
        }
    }
}
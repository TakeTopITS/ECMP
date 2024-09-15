using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WLStatusBLL
    {
        public void AddWLStatus(WLStatus wlStatus)
        {
            WLStatusDAL dal = new WLStatusDAL();
            dal.AddWLStatus(wlStatus);
        }

        public void UpdateWLStatus(WLStatus wlStatus, string Status)
        {
            WLStatusDAL dal = new WLStatusDAL();
            dal.UpdateWLStatus(wlStatus, Status);
        }

        public void DeleteWLStatus(WLStatus wlStatus)
        {
            WLStatusDAL dal = new WLStatusDAL();
            dal.DeleteWLStatus(wlStatus);
        }

        public IList GetAllWLStatuss(string strHQL)
        {
            WLStatusDAL dal = new WLStatusDAL();
            return dal.GetAllWLStatuss(strHQL);
        }
    }
}
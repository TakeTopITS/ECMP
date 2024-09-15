using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCompactCheckBLL
    {
        public void AddWZCompactCheck(WZCompactCheck wZCompactCheck)
        {
            WZCompactCheckDAL dal = new WZCompactCheckDAL();
            dal.AddWZCompactCheck(wZCompactCheck);
        }

        public void UpdateWZCompactCheck(WZCompactCheck wZCompactCheck, int ID)
        {
            WZCompactCheckDAL dal = new WZCompactCheckDAL();
            dal.UpdateWZCompactCheck(wZCompactCheck, ID);
        }

        public void DeleteWZCompactCheck(WZCompactCheck wZCompactCheck)
        {
            WZCompactCheckDAL dal = new WZCompactCheckDAL();
            dal.DeleteWZCompactCheck(wZCompactCheck);
        }

        public IList GetAllWZCompactChecks(string strHQL)
        {
            WZCompactCheckDAL dal = new WZCompactCheckDAL();
            return dal.GetAllWZCompactChecks(strHQL);
        }
    }
}
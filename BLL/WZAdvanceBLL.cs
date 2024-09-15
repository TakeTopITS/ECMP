using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZAdvanceBLL
    {
        public void AddWZAdvance(WZAdvance wZAdvance)
        {
            WZAdvanceDAL dal = new WZAdvanceDAL();
            dal.AddWZAdvance(wZAdvance);
        }

        public void UpdateWZAdvance(WZAdvance wZAdvance, string strAdvanceCode)
        {
            WZAdvanceDAL dal = new WZAdvanceDAL();
            dal.UpdateWZAdvance(wZAdvance, strAdvanceCode);
        }

        public void DeleteWZAdvance(WZAdvance wZAdvance)
        {
            WZAdvanceDAL dal = new WZAdvanceDAL();
            dal.DeleteWZAdvance(wZAdvance);
        }

        public IList GetAllWZAdvances(string strHQL)
        {
            WZAdvanceDAL dal = new WZAdvanceDAL();
            return dal.GetAllWZAdvances(strHQL);
        }
    }
}
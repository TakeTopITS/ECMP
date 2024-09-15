using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZExpertBLL
    {
        public void AddWZExpert(WZExpert wZExpert)
        {
            WZExpertDAL dal = new WZExpertDAL();
            dal.AddWZExpert(wZExpert);
        }

        public void UpdateWZExpert(WZExpert wZExpert, int strID)
        {
            WZExpertDAL dal = new WZExpertDAL();
            dal.UpdateWZExpert(wZExpert, strID);
        }

        public void DeleteWZExpert(WZExpert wZExpert)
        {
            WZExpertDAL dal = new WZExpertDAL();
            dal.DeleteWZExpert(wZExpert);
        }

        public IList GetAllWZExperts(string strHQL)
        {
            WZExpertDAL dal = new WZExpertDAL();
            return dal.GetAllWZExperts(strHQL);
        }
    }
}
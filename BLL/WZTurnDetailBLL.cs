using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZTurnDetailBLL
    {
        public void AddWZTurnDetail(WZTurnDetail wZTurnDetail)
        {
            WZTurnDetailDAL dal = new WZTurnDetailDAL();
            dal.AddWZTurnDetail(wZTurnDetail);
        }

        public void UpdateWZTurnDetail(WZTurnDetail wZTurnDetail, int ID)
        {
            WZTurnDetailDAL dal = new WZTurnDetailDAL();
            dal.UpdateWZTurnDetail(wZTurnDetail, ID);
        }

        public void DeleteWZTurnDetail(WZTurnDetail wZTurnDetail)
        {
            WZTurnDetailDAL dal = new WZTurnDetailDAL();
            dal.DeleteWZTurnDetail(wZTurnDetail);
        }

        public IList GetAllWZTurnDetails(string strHQL)
        {
            WZTurnDetailDAL dal = new WZTurnDetailDAL();
            return dal.GetAllWZTurnDetails(strHQL);
        }
    }
}
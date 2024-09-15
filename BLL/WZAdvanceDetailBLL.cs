using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZAdvanceDetailBLL
    {
        public void AddWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail)
        {
            WZAdvanceDetailDAL dal = new WZAdvanceDetailDAL();
            dal.AddWZAdvanceDetail(wZAdvanceDetail);
        }

        public void UpdateWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail, int ID)
        {
            WZAdvanceDetailDAL dal = new WZAdvanceDetailDAL();
            dal.UpdateWZAdvanceDetail(wZAdvanceDetail, ID);
        }

        public void DeleteWZAdvanceDetail(WZAdvanceDetail wZAdvanceDetail)
        {
            WZAdvanceDetailDAL dal = new WZAdvanceDetailDAL();
            dal.DeleteWZAdvanceDetail(wZAdvanceDetail);
        }

        public IList GetAllWZAdvanceDetails(string strHQL)
        {
            WZAdvanceDetailDAL dal = new WZAdvanceDetailDAL();
            return dal.GetAllWZAdvanceDetails(strHQL);
        }
    }
}
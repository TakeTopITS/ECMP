using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPayDetailBLL
    {
        public void AddWZPayDetail(WZPayDetail wZPayDetail)
        {
            WZPayDetailDAL dal = new WZPayDetailDAL();
            dal.AddWZPayDetail(wZPayDetail);
        }

        public void UpdateWZPayDetail(WZPayDetail wZPayDetail, int ID)
        {
            WZPayDetailDAL dal = new WZPayDetailDAL();
            dal.UpdateWZPayDetail(wZPayDetail, ID);
        }

        public void DeleteWZPayDetail(WZPayDetail wZPayDetail)
        {
            WZPayDetailDAL dal = new WZPayDetailDAL();
            dal.DeleteWZPayDetail(wZPayDetail);
        }

        public IList GetAllWZPayDetails(string strHQL)
        {
            WZPayDetailDAL dal = new WZPayDetailDAL();
            return dal.GetAllWZPayDetails(strHQL);
        }
    }
}
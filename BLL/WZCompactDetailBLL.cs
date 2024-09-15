using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCompactDetailBLL
    {
        public void AddWZCompactDetail(WZCompactDetail wZCompactDetail)
        {
            WZCompactDetailDAL dal = new WZCompactDetailDAL();
            dal.AddWZCompactDetail(wZCompactDetail);
        }

        public void UpdateWZCompactDetail(WZCompactDetail wZCompactDetail, int ID)
        {
            WZCompactDetailDAL dal = new WZCompactDetailDAL();
            dal.UpdateWZCompactDetail(wZCompactDetail, ID);
        }

        public void DeleteWZCompactDetail(WZCompactDetail wZCompactDetail)
        {
            WZCompactDetailDAL dal = new WZCompactDetailDAL();
            dal.DeleteWZCompactDetail(wZCompactDetail);
        }

        public IList GetAllWZCompactDetails(string strHQL)
        {
            WZCompactDetailDAL dal = new WZCompactDetailDAL();
            return dal.GetAllWZCompactDetails(strHQL);
        }
    }
}
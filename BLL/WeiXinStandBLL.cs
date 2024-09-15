using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WeiXinStandBLL
    {
        public void AddWeiXinStand(WeiXinStand weiXinStand)
        {
            WeiXinStandDAL dal = new WeiXinStandDAL();
            dal.AddWeiXinStand(weiXinStand);
        }

        public void UpdateWeiXinStand(WeiXinStand weiXinStand, string WeiXinNo)
        {
            WeiXinStandDAL dal = new WeiXinStandDAL();
            dal.UpdateWeiXinStand(weiXinStand, WeiXinNo);
        }

        public void DeleteWeiXinStand(WeiXinStand weiXinStand)
        {
            WeiXinStandDAL dal = new WeiXinStandDAL();
            dal.DeleteWeiXinStand(weiXinStand);
        }

        public IList GetAllWeiXinStands(string strHQL)
        {
            WeiXinStandDAL dal = new WeiXinStandDAL();
            return dal.GetAllWeiXinStands(strHQL);
        }
    }
}
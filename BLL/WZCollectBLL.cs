using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCollectBLL
    {
        public void AddWZCollect(WZCollect wZCollect)
        {
            WZCollectDAL dal = new WZCollectDAL();
            dal.AddWZCollect(wZCollect);
        }

        public void UpdateWZCollect(WZCollect wZCollect, string strCollectCode)
        {
            WZCollectDAL dal = new WZCollectDAL();
            dal.UpdateWZCollect(wZCollect, strCollectCode);
        }

        public void DeleteWZCollect(WZCollect wZCollect)
        {
            WZCollectDAL dal = new WZCollectDAL();
            dal.DeleteWZCollect(wZCollect);
        }

        public IList GetAllWZCollects(string strHQL)
        {
            WZCollectDAL dal = new WZCollectDAL();
            return dal.GetAllWZCollects(strHQL);
        }
    }
}
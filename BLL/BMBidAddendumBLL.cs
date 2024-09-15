using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标补遗
    /// </summary>
    public class BMBidAddendumBLL
    {
        public void AddBMBidAddendum(BMBidAddendum bMBidAddendum)
        {
            BMBidAddendumDAL dal = new BMBidAddendumDAL();
            dal.AddBMBidAddendum(bMBidAddendum);
        }

        public void UpdateBMBidAddendum(BMBidAddendum bMBidAddendum, int ID)
        {
            BMBidAddendumDAL dal = new BMBidAddendumDAL();
            dal.UpdateBMBidAddendum(bMBidAddendum, ID);
        }

        public void DeleteBMBidAddendum(BMBidAddendum bMBidAddendum)
        {
            BMBidAddendumDAL dal = new BMBidAddendumDAL();
            dal.DeleteBMBidAddendum(bMBidAddendum);
        }

        public IList GetAllBMBidAddendums(string strHQL)
        {
            BMBidAddendumDAL dal = new BMBidAddendumDAL();
            return dal.GetAllBMBidAddendums(strHQL);
        }
    }
}
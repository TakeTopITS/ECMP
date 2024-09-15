using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 专家评标意见
    /// </summary>
    public class BMSupBidByExpBLL
    {
        public void AddBMSupBidByExp(BMSupBidByExp bMSupBidByExp)
        {
            BMSupBidByExpDAL dal = new BMSupBidByExpDAL();
            dal.AddBMSupBidByExp(bMSupBidByExp);
        }

        public void UpdateBMSupBidByExp(BMSupBidByExp bMSupBidByExp, int ID)
        {
            BMSupBidByExpDAL dal = new BMSupBidByExpDAL();
            dal.UpdateBMSupBidByExp(bMSupBidByExp, ID);
        }

        public void DeleteBMSupBidByExp(BMSupBidByExp bMSupBidByExp)
        {
            BMSupBidByExpDAL dal = new BMSupBidByExpDAL();
            dal.DeleteBMSupBidByExp(bMSupBidByExp);
        }

        public IList GetAllBMSupBidByExps(string strHQL)
        {
            BMSupBidByExpDAL dal = new BMSupBidByExpDAL();
            return dal.GetAllBMSupBidByExps(strHQL);
        }
    }
}
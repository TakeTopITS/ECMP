using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 预算数据
    /// </summary>
    public class BDBaseDataBLL
    {
        public void AddBDBaseData(BDBaseData bDBaseData)
        {
            BDBaseDataDAL dal = new BDBaseDataDAL();
            dal.AddBDBaseData(bDBaseData);
        }

        public void UpdateBDBaseData(BDBaseData bDBaseData, int ID)
        {
            BDBaseDataDAL dal = new BDBaseDataDAL();
            dal.UpdateBDBaseData(bDBaseData, ID);
        }

        public void DeleteBDBaseData(BDBaseData bDBaseData)
        {
            BDBaseDataDAL dal = new BDBaseDataDAL();
            dal.DeleteBDBaseData(bDBaseData);
        }

        public IList GetAllBDBaseDatas(string strHQL)
        {
            BDBaseDataDAL dal = new BDBaseDataDAL();
            return dal.GetAllBDBaseDatas(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 合同洽谈
    /// </summary>
    public class BMContractDiscussBLL
    {
        public void AddBMContractDiscuss(BMContractDiscuss bMContractDiscuss)
        {
            BMContractDiscussDAL dal = new BMContractDiscussDAL();
            dal.AddBMContractDiscuss(bMContractDiscuss);
        }

        public void UpdateBMContractDiscuss(BMContractDiscuss bMContractDiscuss, int ID)
        {
            BMContractDiscussDAL dal = new BMContractDiscussDAL();
            dal.UpdateBMContractDiscuss(bMContractDiscuss, ID);
        }

        public void DeleteBMContractDiscuss(BMContractDiscuss bMContractDiscuss)
        {
            BMContractDiscussDAL dal = new BMContractDiscussDAL();
            dal.DeleteBMContractDiscuss(bMContractDiscuss);
        }

        public IList GetAllBMContractDiscusss(string strHQL)
        {
            BMContractDiscussDAL dal = new BMContractDiscussDAL();
            return dal.GetAllBMContractDiscusss(strHQL);
        }
    }
}
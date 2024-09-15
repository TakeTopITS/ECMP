using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TenderRelatedUserBLL
    {
        public void AddTenderRelatedUser(TenderRelatedUser tenderRelatedUser)
        {
            TenderRelatedUserDAL dal = new TenderRelatedUserDAL();
            dal.AddTenderRelatedUser(tenderRelatedUser);
        }

        public void UpdateTenderRelatedUser(TenderRelatedUser tenderRelatedUser, int ID)
        {
            TenderRelatedUserDAL dal = new TenderRelatedUserDAL();
            dal.UpdateTenderRelatedUser(tenderRelatedUser, ID);
        }

        public void DeleteTenderRelatedUser(TenderRelatedUser tenderRelatedUser)
        {
            TenderRelatedUserDAL dal = new TenderRelatedUserDAL();
            dal.DeleteTenderRelatedUser(tenderRelatedUser);
        }

        public IList GetAllTenderRelatedUsers(string strHQL)
        {
            TenderRelatedUserDAL dal = new TenderRelatedUserDAL();
            return dal.GetAllTenderRelatedUsers(strHQL);
        }
    }
}
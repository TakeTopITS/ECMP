using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartNewsNoticeRelatedUserBLL
    {
        public void AddDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser)
        {
            DepartNewsNoticeRelatedUserDAL dal = new DepartNewsNoticeRelatedUserDAL();
            dal.AddDepartNewsNoticeRelatedUser(departNewsNoticeRelatedUser);
        }

        public void UpdateDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser, int ID)
        {
            DepartNewsNoticeRelatedUserDAL dal = new DepartNewsNoticeRelatedUserDAL();
            dal.UpdateDepartNewsNoticeRelatedUser(departNewsNoticeRelatedUser, ID);
        }

        public void DeleteDepartNewsNoticeRelatedUser(DepartNewsNoticeRelatedUser departNewsNoticeRelatedUser)
        {
            DepartNewsNoticeRelatedUserDAL dal = new DepartNewsNoticeRelatedUserDAL();
            dal.DeleteDepartNewsNoticeRelatedUser(departNewsNoticeRelatedUser);
        }

        public IList GetAllDepartNewsNoticeRelatedUsers(string strHQL)
        {
            DepartNewsNoticeRelatedUserDAL dal = new DepartNewsNoticeRelatedUserDAL();
            return dal.GetAllDepartNewsNoticeRelatedUsers(strHQL);
        }
    }
}
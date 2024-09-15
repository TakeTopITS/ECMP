using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedUserBLL
    {
        public void AddConstractRelatedUser(ConstractRelatedUser constractRelatedUser)
        {
            ConstractRelatedUserDAL dal = new ConstractRelatedUserDAL();
            dal.AddConstractRelatedUser(constractRelatedUser);
        }

        public void UpdateConstractRelatedUser(ConstractRelatedUser constractRelatedUser, int ID)
        {
            ConstractRelatedUserDAL dal = new ConstractRelatedUserDAL();
            dal.UpdateConstractRelatedUser(constractRelatedUser, ID);
        }

        public void DeleteConstractRelatedUser(ConstractRelatedUser constractRelatedUser)
        {
            ConstractRelatedUserDAL dal = new ConstractRelatedUserDAL();
            dal.DeleteConstractRelatedUser(constractRelatedUser);
        }

        public IList GetAllConstractRelatedUsers(string strHQL)
        {
            ConstractRelatedUserDAL dal = new ConstractRelatedUserDAL();
            return dal.GetAllConstractRelatedUsers(strHQL);
        }
    }
}
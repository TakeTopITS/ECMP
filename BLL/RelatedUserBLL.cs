using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RelatedUserBLL
    {
        public void AddRelatedUser(RelatedUser relatedUser)
        {
            RelatedUserDAL dal = new RelatedUserDAL();
            dal.AddRelatedUser(relatedUser);
        }

        public void UpdateRelatedUser(RelatedUser relatedUser, int ID)
        {
            RelatedUserDAL dal = new RelatedUserDAL();
            dal.UpdateRelatedUser(relatedUser, ID);
        }

        public void DeleteRelatedUser(RelatedUser relatedUser)
        {
            RelatedUserDAL dal = new RelatedUserDAL();
            dal.DeleteRelatedUser(relatedUser);
        }

        public IList GetAllRelatedUsers(string strHQL)
        {
            RelatedUserDAL dal = new RelatedUserDAL();
            return dal.GetAllRelatedUsers(strHQL);
        }
    }
}
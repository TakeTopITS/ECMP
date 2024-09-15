using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class NewsRelatedUserBLL
    {
        public void AddNewsRelatedUser(NewsRelatedUser newsRelatedUser)
        {
            NewsRelatedUserDAL dal = new NewsRelatedUserDAL();
            dal.AddNewsRelatedUser(newsRelatedUser);
        }

        public void UpdateNewsRelatedUser(NewsRelatedUser newsRelatedUser, int ID)
        {
            NewsRelatedUserDAL dal = new NewsRelatedUserDAL();
            dal.UpdateNewsRelatedUser(newsRelatedUser, ID);
        }

        public void DeleteNewsRelatedUser(NewsRelatedUser newsRelatedUser)
        {
            NewsRelatedUserDAL dal = new NewsRelatedUserDAL();
            dal.DeleteNewsRelatedUser(newsRelatedUser);
        }

        public IList GetAllNewsRelatedUsers(string strHQL)
        {
            NewsRelatedUserDAL dal = new NewsRelatedUserDAL();
            return dal.GetAllNewsRelatedUsers(strHQL);
        }
    }
}
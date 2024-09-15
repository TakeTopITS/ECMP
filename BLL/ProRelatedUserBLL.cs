using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProRelatedUserBLL
    {
        public void AddProRelatedUser(ProRelatedUser proRelatedUser)
        {
            ProRelatedUserDAL dal = new ProRelatedUserDAL();
            dal.AddProRelatedUser(proRelatedUser);
        }

        public void UpdateProRelatedUser(ProRelatedUser proRelatedUser, int ID)
        {
            ProRelatedUserDAL dal = new ProRelatedUserDAL();
            dal.UpdateProRelatedUser(proRelatedUser, ID);
        }

        public void DeleteProRelatedUser(ProRelatedUser proRelatedUser)
        {
            ProRelatedUserDAL dal = new ProRelatedUserDAL();
            dal.DeleteProRelatedUser(proRelatedUser);
        }

        public IList GetAllProRelatedUsers(string strHQL)
        {
            ProRelatedUserDAL dal = new ProRelatedUserDAL();
            return dal.GetAllProRelatedUsers(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocRelatedUserBLL
    {
        public void AddDocRelatedUser(DocRelatedUser docRelatedUser)
        {
            DocRelatedUserDAL dal = new DocRelatedUserDAL();
            dal.AddDocRelatedUser(docRelatedUser);
        }

        public void UpdateDocRelatedUser(DocRelatedUser docRelatedUser, int ID)
        {
            DocRelatedUserDAL dal = new DocRelatedUserDAL();
            dal.UpdateDocRelatedUser(docRelatedUser, ID);
        }

        public void DeleteDocRelatedUser(DocRelatedUser docRelatedUser)
        {
            DocRelatedUserDAL dal = new DocRelatedUserDAL();
            dal.DeleteDocRelatedUser(docRelatedUser);
        }

        public IList GetAllDocRelatedUsers(string strHQL)
        {
            DocRelatedUserDAL dal = new DocRelatedUserDAL();
            return dal.GetAllDocRelatedUsers(strHQL);
        }
    }
}
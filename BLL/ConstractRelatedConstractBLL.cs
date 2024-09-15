using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedConstractBLL
    {
        public void AddConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract)
        {
            ConstractRelatedConstractDAL dal = new ConstractRelatedConstractDAL();
            dal.AddConstractRelatedConstract(constractRelatedConstract);
        }

        public void UpdateConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract, int ID)
        {
            ConstractRelatedConstractDAL dal = new ConstractRelatedConstractDAL();
            dal.UpdateConstractRelatedConstract(constractRelatedConstract, ID);
        }

        public void DeleteConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract)
        {
            ConstractRelatedConstractDAL dal = new ConstractRelatedConstractDAL();
            dal.DeleteConstractRelatedConstract(constractRelatedConstract);
        }

        public IList GetAllConstractRelatedConstracts(string strHQL)
        {
            ConstractRelatedConstractDAL dal = new ConstractRelatedConstractDAL();
            return dal.GetAllConstractRelatedConstracts(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedEntryOrderForInnerBLL
    {
        public void AddConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner)
        {
            ConstractRelatedEntryOrderForInnerDAL dal = new ConstractRelatedEntryOrderForInnerDAL();
            dal.AddConstractRelatedEntryOrderForInner(constractRelatedEntryOrderForInner);
        }

        public void UpdateConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner, int ID)
        {
            ConstractRelatedEntryOrderForInnerDAL dal = new ConstractRelatedEntryOrderForInnerDAL();
            dal.UpdateConstractRelatedEntryOrderForInner(constractRelatedEntryOrderForInner, ID);
        }

        public void DeleteConstractRelatedEntryOrderForInner(ConstractRelatedEntryOrderForInner constractRelatedEntryOrderForInner)
        {
            ConstractRelatedEntryOrderForInnerDAL dal = new ConstractRelatedEntryOrderForInnerDAL();
            dal.DeleteConstractRelatedEntryOrderForInner(constractRelatedEntryOrderForInner);
        }

        public IList GetAllConstractRelatedEntryOrderForInners(string strHQL)
        {
            ConstractRelatedEntryOrderForInnerDAL dal = new ConstractRelatedEntryOrderForInnerDAL();
            return dal.GetAllConstractRelatedEntryOrderForInners(strHQL);
        }
    }
}
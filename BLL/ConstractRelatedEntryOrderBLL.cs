using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedEntryOrderBLL
    {
        public void AddConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder)
        {
            ConstractRelatedEntryOrderDAL dal = new ConstractRelatedEntryOrderDAL();
            dal.AddConstractRelatedEntryOrder(constractRelatedEntryOrder);
        }

        public void UpdateConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder, int ID)
        {
            ConstractRelatedEntryOrderDAL dal = new ConstractRelatedEntryOrderDAL();
            dal.UpdateConstractRelatedEntryOrder(constractRelatedEntryOrder, ID);
        }

        public void DeleteConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder)
        {
            ConstractRelatedEntryOrderDAL dal = new ConstractRelatedEntryOrderDAL();
            dal.DeleteConstractRelatedEntryOrder(constractRelatedEntryOrder);
        }

        public IList GetAllConstractRelatedEntryOrders(string strHQL)
        {
            ConstractRelatedEntryOrderDAL dal = new ConstractRelatedEntryOrderDAL();
            return dal.GetAllConstractRelatedEntryOrders(strHQL);
        }
    }
}
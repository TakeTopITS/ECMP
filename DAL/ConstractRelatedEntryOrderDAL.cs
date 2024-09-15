using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedEntryOrderDAL
    {
        private EntityControl control;

        public ConstractRelatedEntryOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder)
        {
            control.AddEntity(constractRelatedEntryOrder);
        }

        public void UpdateConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder, int ID)
        {
            control.UpdateEntity(constractRelatedEntryOrder, ID);
        }

        public void DeleteConstractRelatedEntryOrder(ConstractRelatedEntryOrder constractRelatedEntryOrder)
        {
            control.DeleteEntity(constractRelatedEntryOrder);
        }

        public IList GetAllConstractRelatedEntryOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
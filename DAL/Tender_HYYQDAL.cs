using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class Tender_HYYQDAL
    {
        private EntityControl control;

        public Tender_HYYQDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTender_HYYQ(Tender_HYYQ tender_HYYQ)
        {
            control.AddEntity(tender_HYYQ);
        }

        public void UpdateTender_HYYQ(Tender_HYYQ tender_HYYQ, int ID)
        {
            control.UpdateEntity(tender_HYYQ, ID);
        }

        public void DeleteTender_HYYQ(Tender_HYYQ tender_HYYQ)
        {
            control.DeleteEntity(tender_HYYQ);
        }

        public IList GetAllTender_HYYQs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
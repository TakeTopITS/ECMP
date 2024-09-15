using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class Tender_HYYQBLL
    {
        public void AddTender_HYYQ(Tender_HYYQ tender_HYYQ)
        {
            Tender_HYYQDAL dal = new Tender_HYYQDAL();
            dal.AddTender_HYYQ(tender_HYYQ);
        }

        public void UpdateTender_HYYQ(Tender_HYYQ tender_HYYQ, int ID)
        {
            Tender_HYYQDAL dal = new Tender_HYYQDAL();
            dal.UpdateTender_HYYQ(tender_HYYQ, ID);
        }

        public void DeleteTender_HYYQ(Tender_HYYQ tender_HYYQ)
        {
            Tender_HYYQDAL dal = new Tender_HYYQDAL();
            dal.DeleteTender_HYYQ(tender_HYYQ);
        }

        public IList GetAllTender_HYYQs(string strHQL)
        {
            Tender_HYYQDAL dal = new Tender_HYYQDAL();
            return dal.GetAllTender_HYYQs(strHQL);
        }
    }
}
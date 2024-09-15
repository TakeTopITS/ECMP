using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProRealChargeBLL
    {
        public void AddProRealCharge(ProRealCharge proRealCharge)
        {
            ProRealChargeDAL dal = new ProRealChargeDAL();
            dal.AddProRealCharge(proRealCharge);
        }

        public void UpdateProRealCharge(ProRealCharge proRealCharge, int ProjectID)
        {
            ProRealChargeDAL dal = new ProRealChargeDAL();
            dal.UpdateProRealCharge(proRealCharge, ProjectID);
        }

        public void DeleteProRealCharge(ProRealCharge proRealCharge)
        {
            ProRealChargeDAL dal = new ProRealChargeDAL();
            dal.DeleteProRealCharge(proRealCharge);
        }

        public IList GetAllProRealCharges(string strHQL)
        {
            ProRealChargeDAL dal = new ProRealChargeDAL();
            return dal.GetAllProRealCharges(strHQL);
        }
    }
}
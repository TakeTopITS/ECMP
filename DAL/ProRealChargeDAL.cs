using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProRealChargeDAL
    {
        private EntityControl control;

        public ProRealChargeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProRealCharge(ProRealCharge proRealCharge)
        {
            control.AddEntity(proRealCharge);
        }

        public void UpdateProRealCharge(ProRealCharge proRealCharge, int ProjectID)
        {
            control.UpdateEntity(proRealCharge, ProjectID);
        }

        public void DeleteProRealCharge(ProRealCharge proRealCharge)
        {
            control.DeleteEntity(proRealCharge);
        }

        public IList GetAllProRealCharges(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
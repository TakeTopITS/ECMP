using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// PQR-2
    /// </summary>
    public class WPQMPQR2DAL
    {
        private EntityControl control;

        public WPQMPQR2DAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPQR2(WPQMPQR2 wPQMPQR2)
        {
            control.AddEntity(wPQMPQR2);
        }

        public void UpdateWPQMPQR2(WPQMPQR2 wPQMPQR2, int ID)
        {
            control.UpdateEntity(wPQMPQR2, ID);
        }

        public void DeleteWPQMPQR2(WPQMPQR2 wPQMPQR2)
        {
            control.DeleteEntity(wPQMPQR2);
        }

        public IList GetAllWPQMPQR2s(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
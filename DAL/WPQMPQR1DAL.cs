using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// PQR-1
    /// </summary>
    public class WPQMPQR1DAL
    {
        private EntityControl control;

        public WPQMPQR1DAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPQR1(WPQMPQR1 wPQMPQR1)
        {
            control.AddEntity(wPQMPQR1);
        }

        public void UpdateWPQMPQR1(WPQMPQR1 wPQMPQR1, int ID)
        {
            control.UpdateEntity(wPQMPQR1, ID);
        }

        public void DeleteWPQMPQR1(WPQMPQR1 wPQMPQR1)
        {
            control.DeleteEntity(wPQMPQR1);
        }

        public IList GetAllWPQMPQR1s(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
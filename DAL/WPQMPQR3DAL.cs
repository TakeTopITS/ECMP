using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// PQR3
    /// </summary>
    public class WPQMPQR3DAL
    {
        private EntityControl control;

        public WPQMPQR3DAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPQR3(WPQMPQR3 wPQMPQR3)
        {
            control.AddEntity(wPQMPQR3);
        }

        public void UpdateWPQMPQR3(WPQMPQR3 wPQMPQR3, int ID)
        {
            control.UpdateEntity(wPQMPQR3, ID);
        }

        public void DeleteWPQMPQR3(WPQMPQR3 wPQMPQR3)
        {
            control.DeleteEntity(wPQMPQR3);
        }

        public IList GetAllWPQMPQR3s(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
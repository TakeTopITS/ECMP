using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// PWPS2
    /// </summary>
    public class WPQMPWPS2DAL
    {
        private EntityControl control;

        public WPQMPWPS2DAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPWPS2(WPQMPWPS2 wPQMPWPS2)
        {
            control.AddEntity(wPQMPWPS2);
        }

        public void UpdateWPQMPWPS2(WPQMPWPS2 wPQMPWPS2, int ID)
        {
            control.UpdateEntity(wPQMPWPS2, ID);
        }

        public void DeleteWPQMPWPS2(WPQMPWPS2 wPQMPWPS2)
        {
            control.DeleteEntity(wPQMPWPS2);
        }

        public IList GetAllWPQMPWPS2s(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
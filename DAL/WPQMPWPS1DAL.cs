using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// PWPS1
    /// </summary>
    public class WPQMPWPS1DAL
    {
        private EntityControl control;

        public WPQMPWPS1DAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPWPS1(WPQMPWPS1 wPQMPWPS1)
        {
            control.AddEntity(wPQMPWPS1);
        }

        public void UpdateWPQMPWPS1(WPQMPWPS1 wPQMPWPS1, int ID)
        {
            control.UpdateEntity(wPQMPWPS1, ID);
        }

        public void DeleteWPQMPWPS1(WPQMPWPS1 wPQMPWPS1)
        {
            control.DeleteEntity(wPQMPWPS1);
        }

        public IList GetAllWPQMPWPS1s(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
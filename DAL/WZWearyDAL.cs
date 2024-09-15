using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZWearyDAL
    {
        private EntityControl control;

        public WZWearyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZWeary(WZWeary wZWeary)
        {
            control.AddEntity(wZWeary);
        }

        public void UpdateWZWeary(WZWeary wZWeary, string strWearyCode)
        {
            control.UpdateEntity(wZWeary, strWearyCode);
        }

        public void DeleteWZWeary(WZWeary wZWeary)
        {
            control.DeleteEntity(wZWeary);
        }

        public IList GetAllWZWearys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZGetUnitDAL
    {
        private EntityControl control;

        public WZGetUnitDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZGetUnit(WZGetUnit wZGetUnit)
        {
            control.AddEntity(wZGetUnit);
        }

        public void UpdateWZGetUnit(WZGetUnit wZGetUnit, string strUnitCode)
        {
            control.UpdateEntity(wZGetUnit, strUnitCode);
        }

        public void DeleteWZGetUnit(WZGetUnit wZGetUnit)
        {
            control.DeleteEntity(wZGetUnit);
        }

        public IList GetAllWZGetUnits(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class JNUnitDAL
    {
        private EntityControl control;

        public JNUnitDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddJNUnit(JNUnit jnUnit)
        {
            control.AddEntity(jnUnit);
        }

        public void UpdateJNUnit(JNUnit jnUnit, string UnitName)
        {
            control.UpdateEntity(jnUnit, UnitName);
        }

        public void DeleteJNUnit(JNUnit jnUnit)
        {
            control.DeleteEntity(jnUnit);
        }

        public IList GetAllJNUnits(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
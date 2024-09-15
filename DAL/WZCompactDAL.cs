using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCompactDAL
    {
        private EntityControl control;

        public WZCompactDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCompact(WZCompact wZCompact)
        {
            control.AddEntity(wZCompact);
        }

        public void UpdateWZCompact(WZCompact wZCompact, string CompactCode)
        {
            control.UpdateEntity(wZCompact, CompactCode);
        }

        public void DeleteWZCompact(WZCompact wZCompact)
        {
            control.DeleteEntity(wZCompact);
        }

        public IList GetAllWZCompacts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
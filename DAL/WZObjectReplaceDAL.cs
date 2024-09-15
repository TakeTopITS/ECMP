using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZObjectReplaceDAL
    {
        private EntityControl control;

        public WZObjectReplaceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZObjectReplace(WZObjectReplace wZObjectReplace)
        {
            control.AddEntity(wZObjectReplace);
        }

        public void UpdateWZObjectReplace(WZObjectReplace wZObjectReplace, int ID)
        {
            control.UpdateEntity(wZObjectReplace, ID);
        }

        public void DeleteWZObjectReplace(WZObjectReplace wZObjectReplace)
        {
            control.DeleteEntity(wZObjectReplace);
        }

        public IList GetAllWZObjectReplaces(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
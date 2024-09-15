using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZObjectReferDAL
    {
        private EntityControl control;

        public WZObjectReferDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZObjectRefer(WZObjectRefer wZObjectRefer)
        {
            control.AddEntity(wZObjectRefer);
        }

        public void UpdateWZObjectRefer(WZObjectRefer wZObjectRefer, string strObjectCode)
        {
            control.UpdateEntity(wZObjectRefer, strObjectCode);
        }

        public void DeleteWZObjectRefer(WZObjectRefer wZObjectRefer)
        {
            control.DeleteEntity(wZObjectRefer);
        }

        public IList GetAllWZObjectRefers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
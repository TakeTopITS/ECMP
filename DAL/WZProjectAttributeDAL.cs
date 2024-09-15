using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZProjectAttributeDAL
    {
        private EntityControl control;

        public WZProjectAttributeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZProjectAttribute(WZProjectAttribute wZProjectAttribute)
        {
            control.AddEntity(wZProjectAttribute);
        }

        public void UpdateWZProjectAttribute(WZProjectAttribute wZProjectAttribute, int ID)
        {
            control.UpdateEntity(wZProjectAttribute, ID);
        }

        public void DeleteWZProjectAttribute(WZProjectAttribute wZProjectAttribute)
        {
            control.DeleteEntity(wZProjectAttribute);
        }

        public IList GetAllWZProjectAttributes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
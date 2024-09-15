using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZAdvanceDAL
    {
        private EntityControl control;

        public WZAdvanceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZAdvance(WZAdvance wZAdvance)
        {
            control.AddEntity(wZAdvance);
        }

        public void UpdateWZAdvance(WZAdvance wZAdvance, string strAdvanceCode)
        {
            control.UpdateEntity(wZAdvance, strAdvanceCode);
        }

        public void DeleteWZAdvance(WZAdvance wZAdvance)
        {
            control.DeleteEntity(wZAdvance);
        }

        public IList GetAllWZAdvances(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
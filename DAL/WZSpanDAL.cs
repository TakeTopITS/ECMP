using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSpanDAL
    {
        private EntityControl control;

        public WZSpanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSpan(WZSpan wZSpan)
        {
            control.AddEntity(wZSpan);
        }

        public void UpdateWZSpan(WZSpan wZSpan, int ID)
        {
            control.UpdateEntity(wZSpan, ID);
        }

        public void DeleteWZSpan(WZSpan wZSpan)
        {
            control.DeleteEntity(wZSpan);
        }

        public IList GetAllWZSpans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
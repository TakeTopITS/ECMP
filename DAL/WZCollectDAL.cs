using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCollectDAL
    {
        private EntityControl control;

        public WZCollectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCollect(WZCollect wZCollect)
        {
            control.AddEntity(wZCollect);
        }

        public void UpdateWZCollect(WZCollect wZCollect, string strCollectCode)
        {
            control.UpdateEntity(wZCollect, strCollectCode);
        }

        public void DeleteWZCollect(WZCollect wZCollect)
        {
            control.DeleteEntity(wZCollect);
        }

        public IList GetAllWZCollects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
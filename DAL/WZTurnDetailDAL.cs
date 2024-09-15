using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZTurnDetailDAL
    {
        private EntityControl control;

        public WZTurnDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZTurnDetail(WZTurnDetail wZTurnDetail)
        {
            control.AddEntity(wZTurnDetail);
        }

        public void UpdateWZTurnDetail(WZTurnDetail wZTurnDetail, int ID)
        {
            control.UpdateEntity(wZTurnDetail, ID);
        }

        public void DeleteWZTurnDetail(WZTurnDetail wZTurnDetail)
        {
            control.DeleteEntity(wZTurnDetail);
        }

        public IList GetAllWZTurnDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
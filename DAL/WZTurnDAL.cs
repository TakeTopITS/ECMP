using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZTurnDAL
    {
        private EntityControl control;

        public WZTurnDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZTurn(WZTurn wZTurn)
        {
            control.AddEntity(wZTurn);
        }

        public void UpdateWZTurn(WZTurn wZTurn, int ID)
        {
            control.UpdateEntity(wZTurn, ID);
        }

        public void DeleteWZTurn(WZTurn wZTurn)
        {
            control.DeleteEntity(wZTurn);
        }

        public IList GetAllWZTurns(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
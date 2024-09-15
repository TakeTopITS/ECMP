using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZTurnBLL
    {
        public void AddWZTurn(WZTurn wZTurn)
        {
            WZTurnDAL dal = new WZTurnDAL();
            dal.AddWZTurn(wZTurn);
        }

        public void UpdateWZTurn(WZTurn wZTurn, int ID)
        {
            WZTurnDAL dal = new WZTurnDAL();
            dal.UpdateWZTurn(wZTurn, ID);
        }

        public void DeleteWZTurn(WZTurn wZTurn)
        {
            WZTurnDAL dal = new WZTurnDAL();
            dal.DeleteWZTurn(wZTurn);
        }

        public IList GetAllWZTurns(string strHQL)
        {
            WZTurnDAL dal = new WZTurnDAL();
            return dal.GetAllWZTurns(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReceivePayWayBLL
    {
        public void AddReceivePayWay(ReceivePayWay receivePayWay)
        {
            ReceivePayWayDAL dal = new ReceivePayWayDAL();
            dal.AddReceivePayWay(receivePayWay);
        }

        public void UpdateReceivePayWay(ReceivePayWay receivePayWay, string Type)
        {
            ReceivePayWayDAL dal = new ReceivePayWayDAL();
            dal.UpdateReceivePayWay(receivePayWay, Type);
        }

        public void DeleteReceivePayWay(ReceivePayWay receivePayWay)
        {
            ReceivePayWayDAL dal = new ReceivePayWayDAL();
            dal.DeleteReceivePayWay(receivePayWay);
        }

        public IList GetAllReceivePayWays(string strHQL)
        {
            ReceivePayWayDAL dal = new ReceivePayWayDAL();
            return dal.GetAllReceivePayWays(strHQL);
        }
    }
}
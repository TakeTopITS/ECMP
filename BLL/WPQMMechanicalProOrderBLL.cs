using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 机械加工委托单
    /// </summary>
    public class WPQMMechanicalProOrderBLL
    {
        public void AddWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder)
        {
            WPQMMechanicalProOrderDAL dal = new WPQMMechanicalProOrderDAL();
            dal.AddWPQMMechanicalProOrder(wPQMMechanicalProOrder);
        }

        public void UpdateWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder, int ID)
        {
            WPQMMechanicalProOrderDAL dal = new WPQMMechanicalProOrderDAL();
            dal.UpdateWPQMMechanicalProOrder(wPQMMechanicalProOrder, ID);
        }

        public void DeleteWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder)
        {
            WPQMMechanicalProOrderDAL dal = new WPQMMechanicalProOrderDAL();
            dal.DeleteWPQMMechanicalProOrder(wPQMMechanicalProOrder);
        }

        public IList GetAllWPQMMechanicalProOrders(string strHQL)
        {
            WPQMMechanicalProOrderDAL dal = new WPQMMechanicalProOrderDAL();
            return dal.GetAllWPQMMechanicalProOrders(strHQL);
        }
    }
}
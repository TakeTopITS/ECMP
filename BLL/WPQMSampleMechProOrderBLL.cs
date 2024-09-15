using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 试样机械加工委托单
    /// </summary>
    public class WPQMSampleMechProOrderBLL
    {
        public void AddWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder)
        {
            WPQMSampleMechProOrderDAL dal = new WPQMSampleMechProOrderDAL();
            dal.AddWPQMSampleMechProOrder(wPQMSampleMechProOrder);
        }

        public void UpdateWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder, int ID)
        {
            WPQMSampleMechProOrderDAL dal = new WPQMSampleMechProOrderDAL();
            dal.UpdateWPQMSampleMechProOrder(wPQMSampleMechProOrder, ID);
        }

        public void DeleteWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder)
        {
            WPQMSampleMechProOrderDAL dal = new WPQMSampleMechProOrderDAL();
            dal.DeleteWPQMSampleMechProOrder(wPQMSampleMechProOrder);
        }

        public IList GetAllWPQMSampleMechProOrders(string strHQL)
        {
            WPQMSampleMechProOrderDAL dal = new WPQMSampleMechProOrderDAL();
            return dal.GetAllWPQMSampleMechProOrders(strHQL);
        }
    }
}
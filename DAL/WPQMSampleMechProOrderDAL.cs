using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 试样机械加工委托单
    /// </summary>
    public class WPQMSampleMechProOrderDAL
    {
        private EntityControl control;

        public WPQMSampleMechProOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder)
        {
            control.AddEntity(wPQMSampleMechProOrder);
        }

        public void UpdateWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder, int ID)
        {
            control.UpdateEntity(wPQMSampleMechProOrder, ID);
        }

        public void DeleteWPQMSampleMechProOrder(WPQMSampleMechProOrder wPQMSampleMechProOrder)
        {
            control.DeleteEntity(wPQMSampleMechProOrder);
        }

        public IList GetAllWPQMSampleMechProOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
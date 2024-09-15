using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 机械加工委托单
    /// </summary>
    public class WPQMMechanicalProOrderDAL
    {
        private EntityControl control;

        public WPQMMechanicalProOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder)
        {
            control.AddEntity(wPQMMechanicalProOrder);
        }

        public void UpdateWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder, int ID)
        {
            control.UpdateEntity(wPQMMechanicalProOrder, ID);
        }

        public void DeleteWPQMMechanicalProOrder(WPQMMechanicalProOrder wPQMMechanicalProOrder)
        {
            control.DeleteEntity(wPQMMechanicalProOrder);
        }

        public IList GetAllWPQMMechanicalProOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
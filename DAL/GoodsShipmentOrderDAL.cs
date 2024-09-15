using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsBorrowOrderDAL
    {
        private EntityControl control;

        public GoodsBorrowOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder)
        {
            control.AddEntity(goodsBorrowOrder);
        }

        public void UpdateGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder, int BorrowNO)
        {
            control.UpdateEntity(goodsBorrowOrder, BorrowNO);
        }

        public void DeleteGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder)
        {
            control.DeleteEntity(goodsBorrowOrder);
        }

        public IList GetAllGoodsBorrowOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
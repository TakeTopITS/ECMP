using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsBorrowOrderDetailDAL
    {
        private EntityControl control;

        public GoodsBorrowOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail)
        {
            control.AddEntity(goodsBorrowOrderDetail);
        }

        public void UpdateGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail, int ID)
        {
            control.UpdateEntity(goodsBorrowOrderDetail, ID);
        }

        public void DeleteGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail)
        {
            control.DeleteEntity(goodsBorrowOrderDetail);
        }

        public IList GetAllGoodsBorrowOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
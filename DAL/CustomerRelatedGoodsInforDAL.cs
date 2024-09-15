using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerRelatedGoodsInforDAL
    {
        private EntityControl control;

        public CustomerRelatedGoodsInforDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor)
        {
            control.AddEntity(customerRelatedGoodsInfor);
        }

        public void UpdateCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor, int ID)
        {
            control.UpdateEntity(customerRelatedGoodsInfor, ID);
        }

        public void DeleteCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor)
        {
            control.DeleteEntity(customerRelatedGoodsInfor);
        }

        public IList GetAllCustomerRelatedGoodsInfors(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
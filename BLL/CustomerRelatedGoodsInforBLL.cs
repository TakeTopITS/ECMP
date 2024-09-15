using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerRelatedGoodsInforBLL
    {
        public void AddCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor)
        {
            CustomerRelatedGoodsInforDAL dal = new CustomerRelatedGoodsInforDAL();
            dal.AddCustomerRelatedGoodsInfor(customerRelatedGoodsInfor);
        }

        public void UpdateCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor, int ID)
        {
            CustomerRelatedGoodsInforDAL dal = new CustomerRelatedGoodsInforDAL();
            dal.UpdateCustomerRelatedGoodsInfor(customerRelatedGoodsInfor, ID);
        }

        public void DeleteCustomerRelatedGoodsInfor(CustomerRelatedGoodsInfor customerRelatedGoodsInfor)
        {
            CustomerRelatedGoodsInforDAL dal = new CustomerRelatedGoodsInforDAL();
            dal.DeleteCustomerRelatedGoodsInfor(customerRelatedGoodsInfor);
        }

        public IList GetAllCustomerRelatedGoodsInfors(string strHQL)
        {
            CustomerRelatedGoodsInforDAL dal = new CustomerRelatedGoodsInforDAL();
            return dal.GetAllCustomerRelatedGoodsInfors(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BusinessFormReAndPayBLL
    {
        public void AddBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay)
        {
            BusinessFormReAndPayDAL dal = new BusinessFormReAndPayDAL();
            dal.AddBusinessFormReAndPay(businessFormReAndPay);
        }

        public void UpdateBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay, string FormCode)
        {
            BusinessFormReAndPayDAL dal = new BusinessFormReAndPayDAL();
            dal.UpdateBusinessFormReAndPay(businessFormReAndPay, FormCode);
        }

        public void DeleteBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay)
        {
            BusinessFormReAndPayDAL dal = new BusinessFormReAndPayDAL();
            dal.DeleteBusinessFormReAndPay(businessFormReAndPay);
        }

        public IList GetAllBusinessFormReAndPays(string strHQL)
        {
            BusinessFormReAndPayDAL dal = new BusinessFormReAndPayDAL();
            return dal.GetAllBusinessFormReAndPays(strHQL);
        }
    }
}
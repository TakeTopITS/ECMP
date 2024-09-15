using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPayBLL
    {
        public void AddWZPay(WZPay wZPay)
        {
            WZPayDAL dal = new WZPayDAL();
            dal.AddWZPay(wZPay);
        }

        public void UpdateWZPay(WZPay wZPay, string strPayID)
        {
            WZPayDAL dal = new WZPayDAL();
            dal.UpdateWZPay(wZPay, strPayID);
        }

        public void DeleteWZPay(WZPay wZPay)
        {
            WZPayDAL dal = new WZPayDAL();
            dal.DeleteWZPay(wZPay);
        }

        public IList GetAllWZPays(string strHQL)
        {
            WZPayDAL dal = new WZPayDAL();
            return dal.GetAllWZPays(strHQL);
        }
    }
}
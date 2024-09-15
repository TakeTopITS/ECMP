using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMPurchasingContractBLL
    {
        public void AddQMPurchasingContract(QMPurchasingContract qMPurchasingContract)
        {
            QMPurchasingContractDAL dal = new QMPurchasingContractDAL();
            dal.AddQMPurchasingContract(qMPurchasingContract);
        }

        public void UpdateQMPurchasingContract(QMPurchasingContract qMPurchasingContract, string Code)
        {
            QMPurchasingContractDAL dal = new QMPurchasingContractDAL();
            dal.UpdateQMPurchasingContract(qMPurchasingContract, Code);
        }

        public void DeleteQMPurchasingContract(QMPurchasingContract qMPurchasingContract)
        {
            QMPurchasingContractDAL dal = new QMPurchasingContractDAL();
            dal.DeleteQMPurchasingContract(qMPurchasingContract);
        }

        public IList GetAllQMPurchasingContracts(string strHQL)
        {
            QMPurchasingContractDAL dal = new QMPurchasingContractDAL();
            return dal.GetAllQMPurchasingContracts(strHQL);
        }
    }
}
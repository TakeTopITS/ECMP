using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMPurchasingContractDAL
    {
        private EntityControl control;

        public QMPurchasingContractDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMPurchasingContract(QMPurchasingContract qMPurchasingContract)
        {
            control.AddEntity(qMPurchasingContract);
        }

        public void UpdateQMPurchasingContract(QMPurchasingContract qMPurchasingContract, string Code)
        {
            control.UpdateEntity(qMPurchasingContract, Code);
        }

        public void DeleteQMPurchasingContract(QMPurchasingContract qMPurchasingContract)
        {
            control.DeleteEntity(qMPurchasingContract);
        }

        public IList GetAllQMPurchasingContracts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
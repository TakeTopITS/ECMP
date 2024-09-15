using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerOperationRecordDAL
    {
        private EntityControl control;

        public CustomerOperationRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerOperationRecord(CustomerOperationRecord customerOperationRecord)
        {
            control.AddEntity(customerOperationRecord);
        }

        public void UpdateCustomerOperationRecord(CustomerOperationRecord customerOperationRecord, int ID)
        {
            control.UpdateEntity(customerOperationRecord, ID);
        }

        public void DeleteCustomerOperationRecord(CustomerOperationRecord customerOperationRecord)
        {
            control.DeleteEntity(customerOperationRecord);
        }

        public IList GetAllCustomerOperationRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
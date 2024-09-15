using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerContactRecordDAL
    {
        private EntityControl control;

        public CustomerContactRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerContactRecord(CustomerContactRecord customerContactRecord)
        {
            control.AddEntity(customerContactRecord);
        }

        public void UpdateCustomerContactRecord(CustomerContactRecord customerContactRecord, int ID)
        {
            control.UpdateEntity(customerContactRecord, ID);
        }

        public void DeleteCustomerContactRecord(CustomerContactRecord customerContactRecord)
        {
            control.DeleteEntity(customerContactRecord);
        }

        public IList GetAllCustomerContactRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
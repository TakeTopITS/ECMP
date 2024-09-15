using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SMSInterfaceBLL
    {
        public void AddSMSInterface(SMSInterface smsInterface)
        {
            SMSInterfaceDAL dal = new SMSInterfaceDAL();
            dal.AddSMSInterface(smsInterface);
        }

        public void UpdateSMSInterface(SMSInterface smsInterface, int ID)
        {
            SMSInterfaceDAL dal = new SMSInterfaceDAL();
            dal.UpdateSMSInterface(smsInterface, ID);
        }

        public void DeleteSMSInterface(SMSInterface smsInterface)
        {
            SMSInterfaceDAL dal = new SMSInterfaceDAL();
            dal.DeleteSMSInterface(smsInterface);
        }

        public IList GetAllSMSInterfaces(string strHQL)
        {
            SMSInterfaceDAL dal = new SMSInterfaceDAL();
            return dal.GetAllSMSInterfaces(strHQL);
        }
    }
}
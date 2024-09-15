using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SMSCodeBLL
    {
        public void AddSMSCode(SMSCode smsCode)
        {
            SMSCodeDAL dal = new SMSCodeDAL();
            dal.AddSMSCode(smsCode);
        }

        public void UpdateSMSCode(SMSCode smsCode, int ID)
        {
            SMSCodeDAL dal = new SMSCodeDAL();
            dal.UpdateSMSCode(smsCode, ID);
        }

        public void DeleteSMSCode(SMSCode smsCode)
        {
            SMSCodeDAL dal = new SMSCodeDAL();
            dal.DeleteSMSCode(smsCode);
        }

        public IList GetAllSMSCodes(string strHQL)
        {
            SMSCodeDAL dal = new SMSCodeDAL();
            return dal.GetAllSMSCodes(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SMSSendDIYBLL
    {
        public void AddSMSSendDIY(SMSSendDIY smsSendDIY)
        {
            SMSSendDIYDAL dal = new SMSSendDIYDAL();
            dal.AddSMSSendDIY(smsSendDIY);
        }

        public void UpdateSMSSendDIY(SMSSendDIY smsSendDIY, int ID)
        {
            SMSSendDIYDAL dal = new SMSSendDIYDAL();
            dal.UpdateSMSSendDIY(smsSendDIY, ID);
        }

        public void DeleteSMSSendDIY(SMSSendDIY smsSendDIY)
        {
            SMSSendDIYDAL dal = new SMSSendDIYDAL();
            dal.DeleteSMSSendDIY(smsSendDIY);
        }

        public IList GetAllSMSSendDIYs(string strHQL)
        {
            SMSSendDIYDAL dal = new SMSSendDIYDAL();
            return dal.GetAllSMSSendDIYs(strHQL);
        }
    }
}
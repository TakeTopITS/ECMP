using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SmsSendBLL
    {
        public void AddSmsSend(SmsSend smsSend)
        {
            SmsSendDAL dal = new SmsSendDAL();
            dal.AddSmsSend(smsSend);
        }

        public void UpdateSmsSend(SmsSend smsSend, int ID)
        {
            SmsSendDAL dal = new SmsSendDAL();
            dal.UpdateSmsSend(smsSend, ID);
        }

        public void DeleteSmsSend(SmsSend smsSend)
        {
            SmsSendDAL dal = new SmsSendDAL();
            dal.DeleteSmsSend(smsSend);
        }

        public IList GetAllSmsSends(string strHQL)
        {
            SmsSendDAL dal = new SmsSendDAL();
            return dal.GetAllSmsSends(strHQL);
        }
    }
}
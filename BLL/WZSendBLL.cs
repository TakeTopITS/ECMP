using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSendBLL
    {
        public void AddWZSend(WZSend wZSend)
        {
            WZSendDAL dal = new WZSendDAL();
            dal.AddWZSend(wZSend);
        }

        public void UpdateWZSend(WZSend wZSend, string strSendCode)
        {
            WZSendDAL dal = new WZSendDAL();
            dal.UpdateWZSend(wZSend, strSendCode);
        }

        public void DeleteWZSend(WZSend wZSend)
        {
            WZSendDAL dal = new WZSendDAL();
            dal.DeleteWZSend(wZSend);
        }

        public IList GetAllWZSends(string strHQL)
        {
            WZSendDAL dal = new WZSendDAL();
            return dal.GetAllWZSends(strHQL);
        }
    }
}
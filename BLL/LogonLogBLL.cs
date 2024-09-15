using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class LogonLogBLL
    {
        public void AddLogonLog(LogonLog logonLog)
        {
            LogonLogDAL dal = new LogonLogDAL();
            dal.AddLogonLog(logonLog);
        }

        public void UpdateLogonLog(LogonLog logonLog, int ID)
        {
            LogonLogDAL dal = new LogonLogDAL();
            dal.UpdateLogonLog(logonLog, ID);
        }

        public void DeleteLogonLog(LogonLog logonLog)
        {
            LogonLogDAL dal = new LogonLogDAL();
            dal.DeleteLogonLog(logonLog);
        }

        public IList GetAllLogonLogs(string strHQL)
        {
            LogonLogDAL dal = new LogonLogDAL();
            return dal.GetAllLogonLogs(strHQL);
        }
    }
}
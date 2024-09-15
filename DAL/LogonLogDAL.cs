using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class LogonLogDAL
    {
        private EntityControl control;

        public LogonLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddLogonLog(LogonLog logonLog)
        {
            control.AddEntity(logonLog);
        }

        public void UpdateLogonLog(LogonLog logonLog, int ID)
        {
            control.UpdateEntity(logonLog, ID);
        }

        public void DeleteLogonLog(LogonLog logonLog)
        {
            control.DeleteEntity(logonLog);
        }

        public IList GetAllLogonLogs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
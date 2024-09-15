using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowBackupBLL
    {
        public void AddWorkFlowBackup(WorkFlowBackup workFlowBackup)
        {
            WorkFlowBackupDAL dal = new WorkFlowBackupDAL();
            dal.AddWorkFlowBackup(workFlowBackup);
        }

        public void UpdateWorkFlowBackup(WorkFlowBackup workFlowBackup, int WLID)
        {
            WorkFlowBackupDAL dal = new WorkFlowBackupDAL();
            dal.UpdateWorkFlowBackup(workFlowBackup, WLID);
        }

        public void DeleteWorkFlowBackup(WorkFlowBackup workFlowBackup)
        {
            WorkFlowBackupDAL dal = new WorkFlowBackupDAL();
            dal.DeleteWorkFlowBackup(workFlowBackup);
        }

        public IList GetAllWorkFlowBackups(string strHQL)
        {
            WorkFlowBackupDAL dal = new WorkFlowBackupDAL();
            return dal.GetAllWorkFlowBackups(strHQL);
        }
    }
}
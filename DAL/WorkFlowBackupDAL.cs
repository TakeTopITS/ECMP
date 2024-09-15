using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowBackupDAL
    {
        private EntityControl control;

        public WorkFlowBackupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowBackup(WorkFlowBackup workFlowBackup)
        {
            control.AddEntity(workFlowBackup);
        }

        public void UpdateWorkFlowBackup(WorkFlowBackup workFlowBackup, int WLID)
        {
            control.UpdateEntity(workFlowBackup, WLID);
        }

        public void DeleteWorkFlowBackup(WorkFlowBackup workFlowBackup)
        {
            control.DeleteEntity(workFlowBackup);
        }

        public IList GetAllWorkFlowBackups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
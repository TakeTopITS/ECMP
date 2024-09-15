using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowDAL
    {
        private EntityControl control;

        public WorkFlowDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlow(WorkFlow workFlow)
        {
            control.AddEntity(workFlow);
        }

        public void UpdateWorkFlow(WorkFlow workFlow, int WLID)
        {
            control.UpdateEntity(workFlow, WLID);
        }

        public void DeleteWorkFlow(WorkFlow workFlow)
        {
            control.DeleteEntity(workFlow);
        }

        public IList GetAllWorkFlows(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
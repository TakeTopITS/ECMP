using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowRelatedModuleDAL
    {
        private EntityControl control;

        public WorkFlowRelatedModuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule)
        {
            control.AddEntity(workFlowRelatedModule);
        }

        public void UpdateWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule, int ID)
        {
            control.UpdateEntity(workFlowRelatedModule, ID);
        }

        public void DeleteWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule)
        {
            control.DeleteEntity(workFlowRelatedModule);
        }

        public IList GetAllWorkFlowRelatedModules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
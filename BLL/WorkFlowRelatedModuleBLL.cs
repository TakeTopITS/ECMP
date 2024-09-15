using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowRelatedModuleBLL
    {
        public void AddWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule)
        {
            WorkFlowRelatedModuleDAL dal = new WorkFlowRelatedModuleDAL();
            dal.AddWorkFlowRelatedModule(workFlowRelatedModule);
        }

        public void UpdateWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule, int ID)
        {
            WorkFlowRelatedModuleDAL dal = new WorkFlowRelatedModuleDAL();
            dal.UpdateWorkFlowRelatedModule(workFlowRelatedModule, ID);
        }

        public void DeleteWorkFlowRelatedModule(WorkFlowRelatedModule workFlowRelatedModule)
        {
            WorkFlowRelatedModuleDAL dal = new WorkFlowRelatedModuleDAL();
            dal.DeleteWorkFlowRelatedModule(workFlowRelatedModule);
        }

        public IList GetAllWorkFlowRelatedModules(string strHQL)
        {
            WorkFlowRelatedModuleDAL dal = new WorkFlowRelatedModuleDAL();
            return dal.GetAllWorkFlowRelatedModules(strHQL);
        }
    }
}
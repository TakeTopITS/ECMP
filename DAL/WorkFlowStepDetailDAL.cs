using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowStepDetailDAL
    {
        private EntityControl control;

        public WorkFlowStepDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail)
        {
            control.AddEntity(workFlowStepDetail);
        }

        public void UpdateWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail, int ID)
        {
            control.UpdateEntity(workFlowStepDetail, ID);
        }

        public void DeleteWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail)
        {
            control.DeleteEntity(workFlowStepDetail);
        }

        public IList GetAllWorkFlowStepDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
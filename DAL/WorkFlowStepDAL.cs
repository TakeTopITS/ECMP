using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowStepDAL
    {
        private EntityControl control;

        public WorkFlowStepDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowStep(WorkFlowStep workFlowStep)
        {
            control.AddEntity(workFlowStep);
        }

        public void UpdateWorkFlowStep(WorkFlowStep workFlowStep, int StepID)
        {
            control.UpdateEntity(workFlowStep, StepID);
        }

        public void DeleteWorkFlowStep(WorkFlowStep workFlowStep)
        {
            control.DeleteEntity(workFlowStep);
        }

        public IList GetAllWorkFlowSteps(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
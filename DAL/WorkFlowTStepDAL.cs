using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowTStepDAL
    {
        private EntityControl control;

        public WorkFlowTStepDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowTStep(WorkFlowTStep workFlowTStep)
        {
            control.AddEntity(workFlowTStep);
        }

        public void UpdateWorkFlowTStep(WorkFlowTStep workFlowTStep, int StepID)
        {
            control.UpdateEntity(workFlowTStep, StepID);
        }

        public void DeleteWorkFlowTStep(WorkFlowTStep workFlowTStep)
        {
            control.DeleteEntity(workFlowTStep);
        }

        public IList GetAllWorkFlowTSteps(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
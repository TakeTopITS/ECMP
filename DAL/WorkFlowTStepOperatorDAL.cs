using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowTStepOperatorDAL
    {
        private EntityControl control;

        public WorkFlowTStepOperatorDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator)
        {
            control.AddEntity(workFlowTStepOperator);
        }

        public void UpdateWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator, int ID)
        {
            control.UpdateEntity(workFlowTStepOperator, ID);
        }

        public void DeleteWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator)
        {
            control.DeleteEntity(workFlowTStepOperator);
        }

        public IList GetAllWorkFlowTStepOperators(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
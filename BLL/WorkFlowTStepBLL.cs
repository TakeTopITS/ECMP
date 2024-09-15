using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowTStepBLL
    {
        public void AddWorkFlowTStep(WorkFlowTStep workFlowTStep)
        {
            WorkFlowTStepDAL dal = new WorkFlowTStepDAL();
            dal.AddWorkFlowTStep(workFlowTStep);
        }

        public void UpdateWorkFlowTStep(WorkFlowTStep workFlowTStep, int StepID)
        {
            WorkFlowTStepDAL dal = new WorkFlowTStepDAL();
            dal.UpdateWorkFlowTStep(workFlowTStep, StepID);
        }

        public void DeleteWorkFlowTStep(WorkFlowTStep workFlowTStep)
        {
            WorkFlowTStepDAL dal = new WorkFlowTStepDAL();
            dal.DeleteWorkFlowTStep(workFlowTStep);
        }

        public IList GetAllWorkFlowTSteps(string strHQL)
        {
            WorkFlowTStepDAL dal = new WorkFlowTStepDAL();
            return dal.GetAllWorkFlowTSteps(strHQL);
        }
    }
}
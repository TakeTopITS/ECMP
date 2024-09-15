using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowStepBLL
    {
        public void AddWorkFlowStep(WorkFlowStep workFlowStep)
        {
            WorkFlowStepDAL dal = new WorkFlowStepDAL();
            dal.AddWorkFlowStep(workFlowStep);
        }

        public void UpdateWorkFlowStep(WorkFlowStep workFlowStep, int StepID)
        {
            WorkFlowStepDAL dal = new WorkFlowStepDAL();
            dal.UpdateWorkFlowStep(workFlowStep, StepID);
        }

        public void DeleteWorkFlowStep(WorkFlowStep workFlowStep)
        {
            WorkFlowStepDAL dal = new WorkFlowStepDAL();
            dal.DeleteWorkFlowStep(workFlowStep);
        }

        public IList GetAllWorkFlowSteps(string strHQL)
        {
            WorkFlowStepDAL dal = new WorkFlowStepDAL();
            return dal.GetAllWorkFlowSteps(strHQL);
        }
    }
}
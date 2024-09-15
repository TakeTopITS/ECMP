using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowTStepOperatorBLL
    {
        public void AddWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator)
        {
            WorkFlowTStepOperatorDAL dal = new WorkFlowTStepOperatorDAL();
            dal.AddWorkFlowTStepOperator(workFlowTStepOperator);
        }

        public void UpdateWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator, int ID)
        {
            WorkFlowTStepOperatorDAL dal = new WorkFlowTStepOperatorDAL();
            dal.UpdateWorkFlowTStepOperator(workFlowTStepOperator, ID);
        }

        public void DeleteWorkFlowTStepOperator(WorkFlowTStepOperator workFlowTStepOperator)
        {
            WorkFlowTStepOperatorDAL dal = new WorkFlowTStepOperatorDAL();
            dal.DeleteWorkFlowTStepOperator(workFlowTStepOperator);
        }

        public IList GetAllWorkFlowTStepOperators(string strHQL)
        {
            WorkFlowTStepOperatorDAL dal = new WorkFlowTStepOperatorDAL();
            return dal.GetAllWorkFlowTStepOperators(strHQL);
        }
    }
}
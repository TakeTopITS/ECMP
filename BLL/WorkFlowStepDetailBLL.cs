using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowStepDetailBLL
    {
        public void AddWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail)
        {
            WorkFlowStepDetailDAL dal = new WorkFlowStepDetailDAL();
            dal.AddWorkFlowStepDetail(workFlowStepDetail);
        }

        public void UpdateWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail, int ID)
        {
            WorkFlowStepDetailDAL dal = new WorkFlowStepDetailDAL();
            dal.UpdateWorkFlowStepDetail(workFlowStepDetail, ID);
        }

        public void DeleteWorkFlowStepDetail(WorkFlowStepDetail workFlowStepDetail)
        {
            WorkFlowStepDetailDAL dal = new WorkFlowStepDetailDAL();
            dal.DeleteWorkFlowStepDetail(workFlowStepDetail);
        }

        public IList GetAllWorkFlowStepDetails(string strHQL)
        {
            WorkFlowStepDetailDAL dal = new WorkFlowStepDetailDAL();
            return dal.GetAllWorkFlowStepDetails(strHQL);
        }
    }
}
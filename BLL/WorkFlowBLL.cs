using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowBLL
    {
        public void AddWorkFlow(WorkFlow workFlow)
        {
            WorkFlowDAL dal = new WorkFlowDAL();
            dal.AddWorkFlow(workFlow);
        }

        public void UpdateWorkFlow(WorkFlow workFlow, int WLID)
        {
            WorkFlowDAL dal = new WorkFlowDAL();
            dal.UpdateWorkFlow(workFlow, WLID);
        }

        public void DeleteWorkFlow(WorkFlow workFlow)
        {
            WorkFlowDAL dal = new WorkFlowDAL();
            dal.DeleteWorkFlow(workFlow);
        }

        public IList GetAllWorkFlows(string strHQL)
        {
            WorkFlowDAL dal = new WorkFlowDAL();
            return dal.GetAllWorkFlows(strHQL);
        }
    }
}
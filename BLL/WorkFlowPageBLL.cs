using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowPageBLL
    {
        public void AddWorkFlowPage(WorkFlowPage workFlowPage)
        {
            WorkFlowPageDAL dal = new WorkFlowPageDAL();
            dal.AddWorkFlowPage(workFlowPage);
        }

        public void UpdateWorkFlowPage(WorkFlowPage workFlowPage, int ID)
        {
            WorkFlowPageDAL dal = new WorkFlowPageDAL();
            dal.UpdateWorkFlowPage(workFlowPage, ID);
        }

        public void DeleteWorkFlowPage(WorkFlowPage workFlowPage)
        {
            WorkFlowPageDAL dal = new WorkFlowPageDAL();
            dal.DeleteWorkFlowPage(workFlowPage);
        }

        public IList GetAllWorkFlowPages(string strHQL)
        {
            WorkFlowPageDAL dal = new WorkFlowPageDAL();
            return dal.GetAllWorkFlowPages(strHQL);
        }
    }
}
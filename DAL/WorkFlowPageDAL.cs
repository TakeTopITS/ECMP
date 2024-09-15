using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowPageDAL
    {
        private EntityControl control;

        public WorkFlowPageDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowPage(WorkFlowPage workFlowPage)
        {
            control.AddEntity(workFlowPage);
        }

        public void UpdateWorkFlowPage(WorkFlowPage workFlowPage, int ID)
        {
            control.UpdateEntity(workFlowPage, ID);
        }

        public void DeleteWorkFlowPage(WorkFlowPage workFlowPage)
        {
            control.DeleteEntity(workFlowPage);
        }

        public IList GetAllWorkFlowPages(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkTypeDAL
    {
        private EntityControl control;

        public WorkTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkType(WorkType workType)
        {
            control.AddEntity(workType);
        }

        public void UpdateWorkType(WorkType workType, string strtypename)
        {
            control.UpdateEntity(workType, strtypename);
        }

        public void DeleteWorkType(WorkType workType)
        {
            control.DeleteEntity(workType);
        }

        public IList GetAllWorkType(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
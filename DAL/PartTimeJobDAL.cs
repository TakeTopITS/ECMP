using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PartTimeJobDAL
    {
        private EntityControl control;

        public PartTimeJobDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPartTimeJob(PartTimeJob partTimeJob)
        {
            control.AddEntity(partTimeJob);
        }

        public void UpdatePartTimeJob(PartTimeJob partTimeJob, int ID)
        {
            control.UpdateEntity(partTimeJob, ID);
        }

        public void DeletePartTimeJob(PartTimeJob partTimeJob)
        {
            control.DeleteEntity(partTimeJob);
        }

        public IList GetAllPartTimeJobs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
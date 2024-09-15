using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PartTimeJobBLL
    {
        public void AddPartTimeJob(PartTimeJob partTimeJob)
        {
            PartTimeJobDAL dal = new PartTimeJobDAL();
            dal.AddPartTimeJob(partTimeJob);
        }

        public void UpdatePartTimeJob(PartTimeJob partTimeJob, int ID)
        {
            PartTimeJobDAL dal = new PartTimeJobDAL();
            dal.UpdatePartTimeJob(partTimeJob, ID);
        }

        public void DeletePartTimeJob(PartTimeJob partTimeJob)
        {
            PartTimeJobDAL dal = new PartTimeJobDAL();
            dal.DeletePartTimeJob(partTimeJob);
        }

        public IList GetAllPartTimeJobs(string strHQL)
        {
            PartTimeJobDAL dal = new PartTimeJobDAL();
            return dal.GetAllPartTimeJobs(strHQL);
        }
    }
}
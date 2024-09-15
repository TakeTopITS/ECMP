using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkTypeBLL
    {
        public void AddWorkType(WorkType workType)
        {
            WorkTypeDAL dal = new WorkTypeDAL();
            dal.AddWorkType(workType);
        }

        public void UpdateWorkType(WorkType workType, string strtypename)
        {
            WorkTypeDAL dal = new WorkTypeDAL();
            dal.UpdateWorkType(workType, strtypename);
        }

        public void DeleteWorkType(WorkType workType)
        {
            WorkTypeDAL dal = new WorkTypeDAL();
            dal.DeleteWorkType(workType);
        }

        public IList GetAllWorkType(string strHQL)
        {
            WorkTypeDAL dal = new WorkTypeDAL();
            return dal.GetAllWorkType(strHQL);
        }
    }
}
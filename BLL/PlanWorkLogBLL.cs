using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanWorkLogBLL
    {
        public void AddPlanWorkLog(PlanWorkLog planWorkLog)
        {
            PlanWorkLogDAL dal = new PlanWorkLogDAL();
            dal.AddPlanWorkLog(planWorkLog);
        }

        public void UpdatePlanWorkLog(PlanWorkLog planWorkLog, int ID)
        {
            PlanWorkLogDAL dal = new PlanWorkLogDAL();
            dal.UpdatePlanWorkLog(planWorkLog, ID);
        }

        public void DeletePlanWorkLog(PlanWorkLog planWorkLog)
        {
            PlanWorkLogDAL dal = new PlanWorkLogDAL();
            dal.DeletePlanWorkLog(planWorkLog);
        }

        public IList GetAllPlanWorkLogs(string strHQL)
        {
            PlanWorkLogDAL dal = new PlanWorkLogDAL();
            return dal.GetAllPlanWorkLogs(strHQL);
        }
    }
}
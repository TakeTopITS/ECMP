using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanTypeBLL
    {
        public void AddPlanType(PlanType planType)
        {
            PlanTypeDAL dal = new PlanTypeDAL();
            dal.AddPlanType(planType);
        }

        public void UpdatePlanType(PlanType planType, string Type)
        {
            PlanTypeDAL dal = new PlanTypeDAL();
            dal.UpdatePlanType(planType, Type);
        }

        public void DeletePlanType(PlanType planType)
        {
            PlanTypeDAL dal = new PlanTypeDAL();
            dal.DeletePlanType(planType);
        }

        public IList GetAllPlanTypes(string strHQL)
        {
            PlanTypeDAL dal = new PlanTypeDAL();
            return dal.GetAllPlanTypes(strHQL);
        }
    }
}
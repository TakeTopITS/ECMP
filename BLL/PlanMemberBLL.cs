using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanMemberBLL
    {
        public void AddPlanMember(PlanMember planMember)
        {
            PlanMemberDAL dal = new PlanMemberDAL();
            dal.AddPlanMember(planMember);
        }

        public void UpdatePlanMember(PlanMember planMember, int ID)
        {
            PlanMemberDAL dal = new PlanMemberDAL();
            dal.UpdatePlanMember(planMember, ID);
        }

        public void DeletePlanMember(PlanMember planMember)
        {
            PlanMemberDAL dal = new PlanMemberDAL();
            dal.DeletePlanMember(planMember);
        }

        public IList GetAllPlanMembers(string strHQL)
        {
            PlanMemberDAL dal = new PlanMemberDAL();
            return dal.GetAllPlanMembers(strHQL);
        }
    }
}
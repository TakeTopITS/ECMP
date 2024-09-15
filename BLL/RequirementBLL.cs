using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RequirementBLL
    {
        public void AddRequirement(Requirement requirement)
        {
            RequirementDAL dal = new RequirementDAL();
            dal.AddRequirement(requirement);
        }

        public void UpdateRequirement(Requirement requirement, int ReqID)
        {
            RequirementDAL dal = new RequirementDAL();
            dal.UpdateRequirement(requirement, ReqID);
        }

        public void DeleteRequirement(Requirement requirement)
        {
            RequirementDAL dal = new RequirementDAL();
            dal.DeleteRequirement(requirement);
        }

        public IList GetAllRequirements(string strHQL)
        {
            RequirementDAL dal = new RequirementDAL();
            return dal.GetAllRequirements(strHQL);
        }
    }
}
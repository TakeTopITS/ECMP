using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RequirementDAL
    {
        private EntityControl control;

        public RequirementDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRequirement(Requirement requirement)
        {
            control.AddEntity(requirement);
        }

        public void UpdateRequirement(Requirement requirement, int ReqID)
        {
            control.UpdateEntity(requirement, ReqID);
        }

        public void DeleteRequirement(Requirement requirement)
        {
            control.DeleteEntity(requirement);
        }

        public IList GetAllRequirements(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
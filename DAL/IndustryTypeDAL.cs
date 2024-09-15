using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class IndustryTypeDAL
    {
        private EntityControl control;

        public IndustryTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddIndustryType(IndustryType industryType)
        {
            control.AddEntity(industryType);
        }

        public void UpdateIndustryType(IndustryType industryType, string Type)
        {
            control.UpdateEntity(industryType, Type);
        }

        public void DeleteIndustryType(IndustryType industryType)
        {
            control.DeleteEntity(industryType);
        }

        public IList GetAllIndustryTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
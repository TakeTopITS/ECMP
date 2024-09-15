using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class IndustryTypeBLL
    {
        public void AddIndustryType(IndustryType industryType)
        {
            IndustryTypeDAL dal = new IndustryTypeDAL();
            dal.AddIndustryType(industryType);
        }

        public void UpdateIndustryType(IndustryType industryType, string Type)
        {
            IndustryTypeDAL dal = new IndustryTypeDAL();
            dal.UpdateIndustryType(industryType, Type);
        }

        public void DeleteIndustryType(IndustryType industryType)
        {
            IndustryTypeDAL dal = new IndustryTypeDAL();
            dal.DeleteIndustryType(industryType);
        }

        public IList GetAllIndustryTypes(string strHQL)
        {
            IndustryTypeDAL dal = new IndustryTypeDAL();
            return dal.GetAllIndustryTypes(strHQL);
        }
    }
}
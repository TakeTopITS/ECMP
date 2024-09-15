using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TableTemplateMappingBLL
    {
        public void AddTableTemplateMapping(TableTemplateMapping tableTemplateMapping)
        {
            TableTemplateMappingDAL dal = new TableTemplateMappingDAL();
            dal.AddTableTemplateMapping(tableTemplateMapping);
        }

        public void UpdateTableTemplateMapping(TableTemplateMapping tableTemplateMapping, int ID)
        {
            TableTemplateMappingDAL dal = new TableTemplateMappingDAL();
            dal.UpdateTableTemplateMapping(tableTemplateMapping, ID);
        }

        public void DeleteTableTemplateMapping(TableTemplateMapping tableTemplateMapping)
        {
            TableTemplateMappingDAL dal = new TableTemplateMappingDAL();
            dal.DeleteTableTemplateMapping(tableTemplateMapping);
        }

        public IList GetAllTableTemplateMappings(string strHQL)
        {
            TableTemplateMappingDAL dal = new TableTemplateMappingDAL();
            return dal.GetAllTableTemplateMappings(strHQL);
        }
    }
}
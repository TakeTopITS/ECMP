using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TableTemplateMappingDAL
    {
        private EntityControl control;

        public TableTemplateMappingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTableTemplateMapping(TableTemplateMapping tableTemplateMapping)
        {
            control.AddEntity(tableTemplateMapping);
        }

        public void UpdateTableTemplateMapping(TableTemplateMapping tableTemplateMapping, int ID)
        {
            control.UpdateEntity(tableTemplateMapping, ID);
        }

        public void DeleteTableTemplateMapping(TableTemplateMapping tableTemplateMapping)
        {
            control.DeleteEntity(tableTemplateMapping);
        }

        public IList GetAllTableTemplateMappings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
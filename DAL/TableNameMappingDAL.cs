using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TableNameMappingDAL
    {
        private EntityControl control;

        public TableNameMappingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTableNameMapping(TableNameMapping tableNameMapping)
        {
            control.AddEntity(tableNameMapping);
        }

        public void UpdateTableNameMapping(TableNameMapping tableNameMapping, int ID)
        {
            control.UpdateEntity(tableNameMapping, ID);
        }

        public void DeleteTableNameMapping(TableNameMapping tableNameMapping)
        {
            control.DeleteEntity(tableNameMapping);
        }

        public IList GetAllTableNameMappings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
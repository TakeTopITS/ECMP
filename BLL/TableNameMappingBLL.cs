using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TableNameMappingBLL
    {
        public void AddTableNameMapping(TableNameMapping tableNameMapping)
        {
            TableNameMappingDAL dal = new TableNameMappingDAL();
            dal.AddTableNameMapping(tableNameMapping);
        }

        public void UpdateTableNameMapping(TableNameMapping tableNameMapping, int ID)
        {
            TableNameMappingDAL dal = new TableNameMappingDAL();
            dal.UpdateTableNameMapping(tableNameMapping, ID);
        }

        public void DeleteTableNameMapping(TableNameMapping tableNameMapping)
        {
            TableNameMappingDAL dal = new TableNameMappingDAL();
            dal.DeleteTableNameMapping(tableNameMapping);
        }

        public IList GetAllTableNameMappings(string strHQL)
        {
            TableNameMappingDAL dal = new TableNameMappingDAL();
            return dal.GetAllTableNameMappings(strHQL);
        }
    }
}
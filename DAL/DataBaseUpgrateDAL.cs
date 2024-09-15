using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DataBaseUpgrateDAL
    {
        private EntityControl control;

        public DataBaseUpgrateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate)
        {
            control.AddEntity(dataBaseUpgrate);
        }

        public void UpdateDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate, int ID)
        {
            control.UpdateEntity(dataBaseUpgrate, ID);
        }

        public void DeleteDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate)
        {
            control.DeleteEntity(dataBaseUpgrate);
        }

        public IList GetAllDataBaseUpgrates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
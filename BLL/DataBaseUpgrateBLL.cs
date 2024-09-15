using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DataBaseUpgrateBLL
    {
        public void AddDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate)
        {
            DataBaseUpgrateDAL dal = new DataBaseUpgrateDAL();
            dal.AddDataBaseUpgrate(dataBaseUpgrate);
        }

        public void UpdateDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate, int ID)
        {
            DataBaseUpgrateDAL dal = new DataBaseUpgrateDAL();
            dal.UpdateDataBaseUpgrate(dataBaseUpgrate, ID);
        }

        public void DeleteDataBaseUpgrate(DataBaseUpgrate dataBaseUpgrate)
        {
            DataBaseUpgrateDAL dal = new DataBaseUpgrateDAL();
            dal.DeleteDataBaseUpgrate(dataBaseUpgrate);
        }

        public IList GetAllDataBaseUpgrates(string strHQL)
        {
            DataBaseUpgrateDAL dal = new DataBaseUpgrateDAL();
            return dal.GetAllDataBaseUpgrates(strHQL);
        }
    }
}
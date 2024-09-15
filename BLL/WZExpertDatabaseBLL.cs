using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZExpertDatabaseBLL
    {
        public void AddWZExpertDatabase(WZExpertDatabase wZExpertDatabase)
        {
            WZExpertDatabaseDAL dal = new WZExpertDatabaseDAL();
            dal.AddWZExpertDatabase(wZExpertDatabase);
        }

        public void UpdateWZExpertDatabase(WZExpertDatabase wZExpertDatabase, string strExpertCode)
        {
            WZExpertDatabaseDAL dal = new WZExpertDatabaseDAL();
            dal.UpdateWZExpertDatabase(wZExpertDatabase, strExpertCode);
        }

        public void DeleteWZExpertDatabase(WZExpertDatabase wZExpertDatabase)
        {
            WZExpertDatabaseDAL dal = new WZExpertDatabaseDAL();
            dal.DeleteWZExpertDatabase(wZExpertDatabase);
        }

        public IList GetAllWZExpertDatabases(string strHQL)
        {
            WZExpertDatabaseDAL dal = new WZExpertDatabaseDAL();
            return dal.GetAllWZExpertDatabases(strHQL);
        }
    }
}
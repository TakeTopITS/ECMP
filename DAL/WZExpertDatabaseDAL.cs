using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZExpertDatabaseDAL
    {
        private EntityControl control;

        public WZExpertDatabaseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZExpertDatabase(WZExpertDatabase wZExpertDatabase)
        {
            control.AddEntity(wZExpertDatabase);
        }

        public void UpdateWZExpertDatabase(WZExpertDatabase wZExpertDatabase, string strExpertCode)
        {
            control.UpdateEntity(wZExpertDatabase, strExpertCode);
        }

        public void DeleteWZExpertDatabase(WZExpertDatabase wZExpertDatabase)
        {
            control.DeleteEntity(wZExpertDatabase);
        }

        public IList GetAllWZExpertDatabases(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
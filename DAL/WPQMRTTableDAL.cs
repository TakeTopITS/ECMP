using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// RT
    /// </summary>
    public class WPQMRTTableDAL
    {
        private EntityControl control;

        public WPQMRTTableDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMRTTable(WPQMRTTable wPQMRTTable)
        {
            control.AddEntity(wPQMRTTable);
        }

        public void UpdateWPQMRTTable(WPQMRTTable wPQMRTTable, int ID)
        {
            control.UpdateEntity(wPQMRTTable, ID);
        }

        public void DeleteWPQMRTTable(WPQMRTTable wPQMRTTable)
        {
            control.DeleteEntity(wPQMRTTable);
        }

        public IList GetAllWPQMRTTables(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
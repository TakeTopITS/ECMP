using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// RT
    /// </summary>
    public class WPQMRTTableBLL
    {
        public void AddWPQMRTTable(WPQMRTTable wPQMRTTable)
        {
            WPQMRTTableDAL dal = new WPQMRTTableDAL();
            dal.AddWPQMRTTable(wPQMRTTable);
        }

        public void UpdateWPQMRTTable(WPQMRTTable wPQMRTTable, int ID)
        {
            WPQMRTTableDAL dal = new WPQMRTTableDAL();
            dal.UpdateWPQMRTTable(wPQMRTTable, ID);
        }

        public void DeleteWPQMRTTable(WPQMRTTable wPQMRTTable)
        {
            WPQMRTTableDAL dal = new WPQMRTTableDAL();
            dal.DeleteWPQMRTTable(wPQMRTTable);
        }

        public IList GetAllWPQMRTTables(string strHQL)
        {
            WPQMRTTableDAL dal = new WPQMRTTableDAL();
            return dal.GetAllWPQMRTTables(strHQL);
        }
    }
}
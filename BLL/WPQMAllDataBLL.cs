using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 焊接工艺评定管理-基础数据
    /// </summary>
    public class WPQMAllDataBLL
    {
        public void AddWPQMAllData(WPQMAllData wPQMAllData)
        {
            WPQMAllDataDAL dal = new WPQMAllDataDAL();
            dal.AddWPQMAllData(wPQMAllData);
        }

        public void UpdateWPQMAllData(WPQMAllData wPQMAllData, int ID)
        {
            WPQMAllDataDAL dal = new WPQMAllDataDAL();
            dal.UpdateWPQMAllData(wPQMAllData, ID);
        }

        public void DeleteWPQMAllData(WPQMAllData wPQMAllData)
        {
            WPQMAllDataDAL dal = new WPQMAllDataDAL();
            dal.DeleteWPQMAllData(wPQMAllData);
        }

        public IList GetAllWPQMAllDatas(string strHQL)
        {
            WPQMAllDataDAL dal = new WPQMAllDataDAL();
            return dal.GetAllWPQMAllDatas(strHQL);
        }
    }
}
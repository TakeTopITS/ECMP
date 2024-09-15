using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 焊接工艺评定管理-基础数据
    /// </summary>
    public class WPQMAllDataDAL
    {
        private EntityControl control;

        public WPQMAllDataDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMAllData(WPQMAllData wPQMAllData)
        {
            control.AddEntity(wPQMAllData);
        }

        public void UpdateWPQMAllData(WPQMAllData wPQMAllData, int ID)
        {
            control.UpdateEntity(wPQMAllData, ID);
        }

        public void DeleteWPQMAllData(WPQMAllData wPQMAllData)
        {
            control.DeleteEntity(wPQMAllData);
        }

        public IList GetAllWPQMAllDatas(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
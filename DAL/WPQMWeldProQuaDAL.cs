using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 焊接工艺评定管理-焊接工艺评定数据
    /// </summary>
    public class WPQMWeldProQuaDAL
    {
        private EntityControl control;

        public WPQMWeldProQuaDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua)
        {
            control.AddEntity(wPQMWeldProQua);
        }

        public void UpdateWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua, string Code)
        {
            control.UpdateEntity(wPQMWeldProQua, Code);
        }

        public void DeleteWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua)
        {
            control.DeleteEntity(wPQMWeldProQua);
        }

        public IList GetAllWPQMWeldProQuas(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
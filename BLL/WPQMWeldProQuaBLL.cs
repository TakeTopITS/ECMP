using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 焊接工艺评定管理-焊接工艺评定数据
    /// </summary>
    public class WPQMWeldProQuaBLL
    {
        public void AddWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua)
        {
            WPQMWeldProQuaDAL dal = new WPQMWeldProQuaDAL();
            dal.AddWPQMWeldProQua(wPQMWeldProQua);
        }

        public void UpdateWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua, string Code)
        {
            WPQMWeldProQuaDAL dal = new WPQMWeldProQuaDAL();
            dal.UpdateWPQMWeldProQua(wPQMWeldProQua, Code);
        }

        public void DeleteWPQMWeldProQua(WPQMWeldProQua wPQMWeldProQua)
        {
            WPQMWeldProQuaDAL dal = new WPQMWeldProQuaDAL();
            dal.DeleteWPQMWeldProQua(wPQMWeldProQua);
        }

        public IList GetAllWPQMWeldProQuas(string strHQL)
        {
            WPQMWeldProQuaDAL dal = new WPQMWeldProQuaDAL();
            return dal.GetAllWPQMWeldProQuas(strHQL);
        }
    }
}
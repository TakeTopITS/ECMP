using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 安全隐患整改通知
    /// </summary>
    public class HSERectificationNoticeBLL
    {
        public void AddHSERectificationNotice(HSERectificationNotice hSERectificationNotice)
        {
            HSERectificationNoticeDAL dal = new HSERectificationNoticeDAL();
            dal.AddHSERectificationNotice(hSERectificationNotice);
        }

        public void UpdateHSERectificationNotice(HSERectificationNotice hSERectificationNotice, string Code)
        {
            HSERectificationNoticeDAL dal = new HSERectificationNoticeDAL();
            dal.UpdateHSERectificationNotice(hSERectificationNotice, Code);
        }

        public void DeleteHSERectificationNotice(HSERectificationNotice hSERectificationNotice)
        {
            HSERectificationNoticeDAL dal = new HSERectificationNoticeDAL();
            dal.DeleteHSERectificationNotice(hSERectificationNotice);
        }

        public IList GetAllHSERectificationNotices(string strHQL)
        {
            HSERectificationNoticeDAL dal = new HSERectificationNoticeDAL();
            return dal.GetAllHSERectificationNotices(strHQL);
        }
    }
}
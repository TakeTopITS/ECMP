using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 处罚通知
    /// </summary>
    public class HSEPenaltyNoticeBLL
    {
        public void AddHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice)
        {
            HSEPenaltyNoticeDAL dal = new HSEPenaltyNoticeDAL();
            dal.AddHSEPenaltyNotice(hSEPenaltyNotice);
        }

        public void UpdateHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice, string Code)
        {
            HSEPenaltyNoticeDAL dal = new HSEPenaltyNoticeDAL();
            dal.UpdateHSEPenaltyNotice(hSEPenaltyNotice, Code);
        }

        public void DeleteHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice)
        {
            HSEPenaltyNoticeDAL dal = new HSEPenaltyNoticeDAL();
            dal.DeleteHSEPenaltyNotice(hSEPenaltyNotice);
        }

        public IList GetAllHSEPenaltyNotices(string strHQL)
        {
            HSEPenaltyNoticeDAL dal = new HSEPenaltyNoticeDAL();
            return dal.GetAllHSEPenaltyNotices(strHQL);
        }
    }
}
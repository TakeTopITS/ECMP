using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 中标/未中标通知书
    /// </summary>
    public class BMBidNoticeContentBLL
    {
        public void AddBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent)
        {
            BMBidNoticeContentDAL dal = new BMBidNoticeContentDAL();
            dal.AddBMBidNoticeContent(bMBidNoticeContent);
        }

        public void UpdateBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent, int ID)
        {
            BMBidNoticeContentDAL dal = new BMBidNoticeContentDAL();
            dal.UpdateBMBidNoticeContent(bMBidNoticeContent, ID);
        }

        public void DeleteBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent)
        {
            BMBidNoticeContentDAL dal = new BMBidNoticeContentDAL();
            dal.DeleteBMBidNoticeContent(bMBidNoticeContent);
        }

        public IList GetAllBMBidNoticeContents(string strHQL)
        {
            BMBidNoticeContentDAL dal = new BMBidNoticeContentDAL();
            return dal.GetAllBMBidNoticeContents(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 中标/未中标通知书
    /// </summary>
    public class BMBidNoticeContentDAL
    {
        private EntityControl control;

        public BMBidNoticeContentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent)
        {
            control.AddEntity(bMBidNoticeContent);
        }

        public void UpdateBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent, int ID)
        {
            control.UpdateEntity(bMBidNoticeContent, ID);
        }

        public void DeleteBMBidNoticeContent(BMBidNoticeContent bMBidNoticeContent)
        {
            control.DeleteEntity(bMBidNoticeContent);
        }

        public IList GetAllBMBidNoticeContents(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
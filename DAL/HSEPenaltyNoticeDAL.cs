using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 处罚通知
    /// </summary>
    public class HSEPenaltyNoticeDAL
    {
        private EntityControl control;

        public HSEPenaltyNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice)
        {
            control.AddEntity(hSEPenaltyNotice);
        }

        public void UpdateHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice, string Code)
        {
            control.UpdateEntity(hSEPenaltyNotice, Code);
        }

        public void DeleteHSEPenaltyNotice(HSEPenaltyNotice hSEPenaltyNotice)
        {
            control.DeleteEntity(hSEPenaltyNotice);
        }

        public IList GetAllHSEPenaltyNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 合格工评通知单
    /// </summary>
    public class WPQMQuaAssessNoticeDAL
    {
        private EntityControl control;

        public WPQMQuaAssessNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice)
        {
            control.AddEntity(wPQMQuaAssessNotice);
        }

        public void UpdateWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice, int ID)
        {
            control.UpdateEntity(wPQMQuaAssessNotice, ID);
        }

        public void DeleteWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice)
        {
            control.DeleteEntity(wPQMQuaAssessNotice);
        }

        public IList GetAllWPQMQuaAssessNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
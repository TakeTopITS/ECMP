using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 安全隐患整改通知
    /// </summary>
    public class HSERectificationNoticeDAL
    {
        private EntityControl control;

        public HSERectificationNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSERectificationNotice(HSERectificationNotice hSERectificationNotice)
        {
            control.AddEntity(hSERectificationNotice);
        }

        public void UpdateHSERectificationNotice(HSERectificationNotice hSERectificationNotice, string Code)
        {
            control.UpdateEntity(hSERectificationNotice, Code);
        }

        public void DeleteHSERectificationNotice(HSERectificationNotice hSERectificationNotice)
        {
            control.DeleteEntity(hSERectificationNotice);
        }

        public IList GetAllHSERectificationNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
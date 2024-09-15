using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 封面
    /// </summary>
    public class WPQMCoverDAL
    {
        private EntityControl control;

        public WPQMCoverDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMCover(WPQMCover wPQMCover)
        {
            control.AddEntity(wPQMCover);
        }

        public void UpdateWPQMCover(WPQMCover wPQMCover, int ID)
        {
            control.UpdateEntity(wPQMCover, ID);
        }

        public void DeleteWPQMCover(WPQMCover wPQMCover)
        {
            control.DeleteEntity(wPQMCover);
        }

        public IList GetAllWPQMCovers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
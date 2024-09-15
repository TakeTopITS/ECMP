using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 封面
    /// </summary>
    public class WPQMCoverBLL
    {
        public void AddWPQMCover(WPQMCover wPQMCover)
        {
            WPQMCoverDAL dal = new WPQMCoverDAL();
            dal.AddWPQMCover(wPQMCover);
        }

        public void UpdateWPQMCover(WPQMCover wPQMCover, int ID)
        {
            WPQMCoverDAL dal = new WPQMCoverDAL();
            dal.UpdateWPQMCover(wPQMCover, ID);
        }

        public void DeleteWPQMCover(WPQMCover wPQMCover)
        {
            WPQMCoverDAL dal = new WPQMCoverDAL();
            dal.DeleteWPQMCover(wPQMCover);
        }

        public IList GetAllWPQMCovers(string strHQL)
        {
            WPQMCoverDAL dal = new WPQMCoverDAL();
            return dal.GetAllWPQMCovers(strHQL);
        }
    }
}
using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 热处理工艺卡
    /// </summary>
    public class WPQMHeatTreatProCardBLL
    {
        public void AddWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard)
        {
            WPQMHeatTreatProCardDAL dal = new WPQMHeatTreatProCardDAL();
            dal.AddWPQMHeatTreatProCard(wPQMHeatTreatProCard);
        }

        public void UpdateWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard, int ID)
        {
            WPQMHeatTreatProCardDAL dal = new WPQMHeatTreatProCardDAL();
            dal.UpdateWPQMHeatTreatProCard(wPQMHeatTreatProCard, ID);
        }

        public void DeleteWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard)
        {
            WPQMHeatTreatProCardDAL dal = new WPQMHeatTreatProCardDAL();
            dal.DeleteWPQMHeatTreatProCard(wPQMHeatTreatProCard);
        }

        public IList GetAllWPQMHeatTreatProCards(string strHQL)
        {
            WPQMHeatTreatProCardDAL dal = new WPQMHeatTreatProCardDAL();
            return dal.GetAllWPQMHeatTreatProCards(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 热处理工艺卡
    /// </summary>
    public class WPQMHeatTreatProCardDAL
    {
        private EntityControl control;

        public WPQMHeatTreatProCardDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard)
        {
            control.AddEntity(wPQMHeatTreatProCard);
        }

        public void UpdateWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard, int ID)
        {
            control.UpdateEntity(wPQMHeatTreatProCard, ID);
        }

        public void DeleteWPQMHeatTreatProCard(WPQMHeatTreatProCard wPQMHeatTreatProCard)
        {
            control.DeleteEntity(wPQMHeatTreatProCard);
        }

        public IList GetAllWPQMHeatTreatProCards(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
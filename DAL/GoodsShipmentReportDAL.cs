using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsShipmentReportDAL
    {
        private EntityControl control;

        public GoodsShipmentReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport)
        {
            control.AddEntity(goodsShipmentReport);
        }

        public void UpdateGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport, int ID)
        {
            control.UpdateEntity(goodsShipmentReport, ID);
        }

        public void DeleteGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport)
        {
            control.DeleteEntity(goodsShipmentReport);
        }

        public IList GetAllGoodsShipmentReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}
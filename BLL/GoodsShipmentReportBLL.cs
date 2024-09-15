using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsShipmentReportBLL
    {
        public void AddGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport)
        {
            GoodsShipmentReportDAL dal = new GoodsShipmentReportDAL();
            dal.AddGoodsShipmentReport(goodsShipmentReport);
        }

        public void UpdateGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport, int ID)
        {
            GoodsShipmentReportDAL dal = new GoodsShipmentReportDAL();
            dal.UpdateGoodsShipmentReport(goodsShipmentReport, ID);
        }

        public void DeleteGoodsShipmentReport(GoodsShipmentReport goodsShipmentReport)
        {
            GoodsShipmentReportDAL dal = new GoodsShipmentReportDAL();
            dal.DeleteGoodsShipmentReport(goodsShipmentReport);
        }

        public IList GetAllGoodsShipmentReports(string strHQL)
        {
            GoodsShipmentReportDAL dal = new GoodsShipmentReportDAL();
            return dal.GetAllGoodsShipmentReports(strHQL);
        }
    }
}
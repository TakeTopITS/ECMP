using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetShipmentReportBLL
    {
        public void AddAssetShipmentReport(AssetShipmentReport assetShipmentReport)
        {
            AssetShipmentReportDAL dal = new AssetShipmentReportDAL();
            dal.AddAssetShipmentReport(assetShipmentReport);
        }

        public void UpdateAssetShipmentReport(AssetShipmentReport assetShipmentReport, int ID)
        {
            AssetShipmentReportDAL dal = new AssetShipmentReportDAL();
            dal.UpdateAssetShipmentReport(assetShipmentReport, ID);
        }

        public void DeleteAssetShipmentReport(AssetShipmentReport assetShipmentReport)
        {
            AssetShipmentReportDAL dal = new AssetShipmentReportDAL();
            dal.DeleteAssetShipmentReport(assetShipmentReport);
        }

        public IList GetAllAssetShipmentReports(string strHQL)
        {
            AssetShipmentReportDAL dal = new AssetShipmentReportDAL();
            return dal.GetAllAssetShipmentReports(strHQL);
        }
    }
}
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetShipmentReportDAL
    {
        private EntityControl control;

        public AssetShipmentReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetShipmentReport(AssetShipmentReport assetShipmentReport)
        {
            control.AddEntity(assetShipmentReport);
        }

        public void UpdateAssetShipmentReport(AssetShipmentReport assetShipmentReport, int ID)
        {
            control.UpdateEntity(assetShipmentReport, ID);
        }

        public void DeleteAssetShipmentReport(AssetShipmentReport assetShipmentReport)
        {
            control.DeleteEntity(assetShipmentReport);
        }

        public IList GetAllAssetShipmentReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}